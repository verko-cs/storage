-- Applies and saves color palettes; it only changes Library colors and registered UI colors.
local ThemeManager = {}
local HttpService = game:GetService("HttpService")

local Library
local Folder = "MsFine/themes"
local ColorNames = {
	"FontColor",
	"MainColor",
	"BackgroundColor",
	"AccentColor",
	"OutlineColor",
	"RiskColor",
}

ThemeManager.Themes = {
	Default = {
		FontColor = { 255, 255, 255 },
		MainColor = { 24, 24, 24 },
		AccentColor = { 71, 119, 182 },
		BackgroundColor = { 20, 20, 20 },
		OutlineColor = { 31, 31, 31 },
	},
	Primordial = {
		FontColor = { 255, 255, 255 },
		MainColor = { 24, 24, 24 },
		AccentColor = { 215, 166, 176 },
		BackgroundColor = { 31, 31, 31 },
		OutlineColor = { 42, 42, 42 },
	},
	BBot = {
		FontColor = { 255, 255, 255 },
		MainColor = { 30, 30, 30 },
		AccentColor = { 126, 72, 163 },
		BackgroundColor = { 35, 35, 35 },
		OutlineColor = { 20, 20, 20 },
	},
	Fatality = {
		FontColor = { 255, 255, 255 },
		MainColor = { 30, 24, 66 },
		AccentColor = { 197, 7, 84 },
		BackgroundColor = { 25, 19, 53 },
		OutlineColor = { 60, 53, 93 },
	},
	Jester = {
		FontColor = { 255, 255, 255 },
		MainColor = { 36, 36, 36 },
		AccentColor = { 219, 68, 103 },
		BackgroundColor = { 28, 28, 28 },
		OutlineColor = { 55, 55, 55 },
	},
	Mint = {
		FontColor = { 255, 255, 255 },
		MainColor = { 36, 36, 36 },
		AccentColor = { 61, 180, 136 },
		BackgroundColor = { 28, 28, 28 },
		OutlineColor = { 55, 55, 55 },
	},
	["Tokyo Night"] = {
		FontColor = { 255, 255, 255 },
		MainColor = { 25, 25, 37 },
		AccentColor = { 103, 89, 179 },
		BackgroundColor = { 22, 22, 31 },
		OutlineColor = { 50, 50, 50 },
	},
	Ubuntu = {
		FontColor = { 255, 255, 255 },
		MainColor = { 62, 62, 62 },
		AccentColor = { 226, 88, 30 },
		BackgroundColor = { 50, 50, 50 },
		OutlineColor = { 25, 25, 25 },
	},
	Quartz = {
		FontColor = { 255, 255, 255 },
		MainColor = { 35, 35, 48 },
		AccentColor = { 66, 110, 135 },
		BackgroundColor = { 29, 27, 38 },
		OutlineColor = { 39, 35, 47 },
	},
	Dark = {
		FontColor = { 235, 235, 240 },
		MainColor = { 24, 24, 28 },
		BackgroundColor = { 17, 17, 20 },
		AccentColor = { 0, 120, 255 },
		OutlineColor = { 44, 44, 52 },
		RiskColor = { 255, 76, 76 },
	},
	Midnight = {
		FontColor = { 225, 232, 245 },
		MainColor = { 20, 27, 40 },
		BackgroundColor = { 13, 18, 29 },
		AccentColor = { 89, 143, 255 },
		OutlineColor = { 42, 54, 75 },
		RiskColor = { 255, 76, 76 },
	},
}

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

local function themePath(name)
	assert(type(name) == "string" and name:match("^[%w_%-]+$"), "Theme name may only contain letters, numbers, underscores, and hyphens.")
	return Folder .. "/" .. name .. ".json"
end

local function normalizeColor(value, name)
	if typeof(value) == "Color3" then
		return value
	end

	assert(type(value) == "table" and type(value[1]) == "number" and type(value[2]) == "number"
		and type(value[3]) == "number", "Theme color is invalid: " .. name)
	for index = 1, 3 do
		assert(value[index] >= 0 and value[index] <= 255, "Theme color channels must be between 0 and 255: " .. name)
	end
	return Color3.fromRGB(value[1], value[2], value[3])
end

local function encodeColor(color)
	return {
		math.floor(color.R * 255 + 0.5),
		math.floor(color.G * 255 + 0.5),
		math.floor(color.B * 255 + 0.5),
	}
end

local function currentTheme()
	local colors = {}
	for _, name in ipairs(ColorNames) do
		assert(typeof(Library[name]) == "Color3", "Library is missing a theme color: " .. name)
		colors[name] = encodeColor(Library[name])
	end
	return colors
end

function ThemeManager:SetLibrary(library)
	assert(type(library) == "table" and type(library.UpdateColorsUsingRegistry) == "function",
		"Library must support registered color updates.")
	Library = library
end

function ThemeManager:SetFolder(folder)
	Folder = validateFolder(folder)
end

function ThemeManager:ApplyTheme(theme)
	assert(Library, "Call SetLibrary before applying a theme.")

	if type(theme) == "string" then
		assert(type(self.Themes[theme]) == "table", "Unknown built-in theme: " .. theme)
		theme = self.Themes[theme]
	end
	assert(type(theme) == "table", "Theme must be a theme name or color table.")

	local colors = {}
	for _, name in ipairs(ColorNames) do
		if theme[name] ~= nil then
			colors[name] = normalizeColor(theme[name], name)
		end
	end
	for name in pairs(theme) do
		assert(table.find(ColorNames, name), "Unknown theme color: " .. tostring(name))
	end

	for name, color in pairs(colors) do
		Library[name] = color
	end
	if colors.AccentColor and type(Library.GetDarkerColor) == "function" then
		Library.AccentColorDark = Library:GetDarkerColor(Library.AccentColor)
	end
	Library:UpdateColorsUsingRegistry()
end

function ThemeManager:Save(name, theme)
	assert(Library, "Call SetLibrary before saving a theme.")
	assert(type(writefile) == "function", "File writing API is unavailable.")
	local path = themePath(name)
	ensureFolder(Folder)

	local colors = {}
	if theme == nil then
		colors = currentTheme()
	else
		assert(type(theme) == "table", "Theme must be a color table.")
		for _, colorName in ipairs(ColorNames) do
			assert(theme[colorName] ~= nil, "Theme is missing a color: " .. colorName)
			colors[colorName] = encodeColor(normalizeColor(theme[colorName], colorName))
		end
		for colorName in pairs(theme) do
			assert(table.find(ColorNames, colorName), "Unknown theme color: " .. tostring(colorName))
		end
	end

	writefile(path, HttpService:JSONEncode({ Version = 1, Colors = colors }))
	return true
end

function ThemeManager:Load(name)
	assert(Library, "Call SetLibrary before loading a theme.")
	assert(type(isfile) == "function" and type(readfile) == "function", "File APIs are unavailable.")

	local path = themePath(name)
	if not isfile(path) then
		return false, "Theme not found."
	end

	local data = HttpService:JSONDecode(readfile(path))
	assert(type(data) == "table" and data.Version == 1 and type(data.Colors) == "table",
		"Theme has an unsupported or invalid format.")
	self:ApplyTheme(data.Colors)
	return true
end

function ThemeManager:ListThemes()
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

return ThemeManager
