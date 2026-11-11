-- Saves registered Library options as JSON data; loading never executes a config file.
local SaveManager = {}
local HttpService = game:GetService("HttpService")

local Library
local Folder = "MsFine/configs"
local IgnoredIndexes = {}

local function validateFolder(folder)
	assert(type(folder) == "string" and folder ~= "", "Folder must be a non-empty string.")
	assert(not folder:match("^/") and not folder:match("/$"), "Folder must be a relative path.")
	assert(not folder:find("\\", 1, true) and not folder:find(":", 1, true), "Folder contains an invalid character.")
	assert(not folder:find("//", 1, true), "Folder cannot contain empty path segments.")

	for segment in folder:gmatch("[^/]+") do
		assert(segment ~= "." and segment ~= "..", "Folder cannot contain dot path segments.")
		assert(segment:match("^[%w_%-]+$"), "Folder names may only contain letters, numbers, underscores, and hyphens.")
	end

	return folder
end

local function ensureFolder(folder)
	assert(type(isfolder) == "function" and type(makefolder) == "function", "Folder APIs are unavailable.")

	local current = ""
	for segment in folder:gmatch("[^/]+") do
		current = current == "" and segment or current .. "/" .. segment
		if not isfolder(current) then
			makefolder(current)
		end
	end
end

local function configPath(name)
	assert(type(name) == "string" and name:match("^[%w_%-]+$"), "Config name may only contain letters, numbers, underscores, and hyphens.")
	return Folder .. "/" .. name .. ".json"
end

local function encodeValue(value)
	local valueType = typeof(value)
	if valueType == "Color3" then
		return {
			__type = "Color3",
			r = value.R,
			g = value.G,
			b = value.B,
		}
	elseif valueType == "EnumItem" then
		return {
			__type = "EnumItem",
			enumType = tostring(value.EnumType):match("Enum%.(.+)$") or tostring(value.EnumType),
			name = value.Name,
		}
	elseif type(value) == "table" then
		local encoded = {}
		for key, item in pairs(value) do
			encoded[key] = encodeValue(item)
		end
		return encoded
	end

	assert(value == nil or type(value) == "string" or type(value) == "number" or type(value) == "boolean",
		"Config contains an unsupported value type: " .. valueType)
	return value
end

local function decodeValue(value)
	if type(value) ~= "table" then
		return value
	end

	if value.__type == "Color3" then
		assert(type(value.r) == "number" and type(value.g) == "number" and type(value.b) == "number",
			"Config contains an invalid Color3 value.")
		return Color3.new(value.r, value.g, value.b)
	elseif value.__type == "EnumItem" then
		assert(type(value.enumType) == "string" and type(value.name) == "string",
			"Config contains an invalid EnumItem value.")
		local enum = Enum[value.enumType]
		assert(enum and enum[value.name], "Config contains an unknown EnumItem.")
		return enum[value.name]
	end

	local decoded = {}
	for key, item in pairs(value) do
		decoded[key] = decodeValue(item)
	end
	return decoded
end

local function isIgnored(index)
	return IgnoredIndexes[index] == true
end

function SaveManager:SetLibrary(library)
	assert(type(library) == "table" and type(library.Options) == "table", "Library must expose an Options table.")
	Library = library
end

function SaveManager:SetFolder(folder)
	Folder = validateFolder(folder)
end

function SaveManager:SetIgnoreIndexes(indexes)
	assert(type(indexes) == "table", "Ignored indexes must be a table.")
	local ignored = {}
	for _, index in ipairs(indexes) do
		assert(type(index) == "string", "Ignored indexes must be strings.")
		ignored[index] = true
	end
	IgnoredIndexes = ignored
end

function SaveManager:Save(name)
	assert(Library, "Call SetLibrary before saving.")
	assert(type(writefile) == "function", "File writing API is unavailable.")
	local path = configPath(name)
	ensureFolder(Folder)

	local data = { Version = 1, Options = {} }
	for index, option in pairs(Library.Options) do
		if type(index) == "string" and type(option) == "table" and not isIgnored(index) then
			local saved = { Type = option.Type }
			if option.Type == "ColorPicker" then
				assert(typeof(option.Value) == "Color3", "ColorPicker option has an invalid value: " .. index)
				saved.Value = encodeValue(option.Value)
				saved.Transparency = option.Transparency or 0
			elseif option.Type == "KeyPicker" then
				saved.Value = encodeValue(option.Value)
				saved.Mode = option.Mode
			else
				saved.Value = encodeValue(option.Value)
			end
			data.Options[index] = saved
		end
	end

	writefile(path, HttpService:JSONEncode(data))
	return true
end

function SaveManager:Load(name)
	assert(Library, "Call SetLibrary before loading.")
	assert(type(isfile) == "function" and type(readfile) == "function", "File APIs are unavailable.")

	local path = configPath(name)
	if not isfile(path) then
		return false, "Config not found."
	end

	local data = HttpService:JSONDecode(readfile(path))
	assert(type(data) == "table" and data.Version == 1 and type(data.Options) == "table",
		"Config has an unsupported or invalid format.")

	for index, saved in pairs(data.Options) do
		local option = Library.Options[index]
		if type(index) == "string" and type(saved) == "table" and type(option) == "table"
			and option.Type == saved.Type and type(option.SetValue) == "function" and not isIgnored(index) then
			if saved.Type == "ColorPicker" then
				local color = decodeValue(saved.Value)
				assert(typeof(color) == "Color3", "Config contains an invalid ColorPicker value: " .. index)
				option:SetValueRGB(color, saved.Transparency)
			elseif saved.Type == "KeyPicker" then
				option:SetValue({ decodeValue(saved.Value), saved.Mode or option.Mode })
			else
				option:SetValue(decodeValue(saved.Value))
			end
		end
	end

	return true
end

function SaveManager:ListConfigs()
	assert(type(listfiles) == "function", "File listing API is unavailable.")
	ensureFolder(Folder)

	local names = {}
	for _, path in ipairs(listfiles(Folder)) do
		local name = path:match("([^/\\]+)%.json$")
		if name then
			table.insert(names, name)
		end
	end
	table.sort(names)
	return names
end

return SaveManager
