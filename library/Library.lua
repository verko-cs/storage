local a = cloneref or function(a)
	return a
end
local b: UserInputService, c: TextService, d: CoreGui, e: GuiService, f: Teams, g: Players, h: RunService, i: TweenService =
	a(game:GetService("UserInputService")),
	a(game:GetService("TextService")),
	a(game:GetService("CoreGui")),
	a(game:GetService("GuiService")),
	a(game:GetService("Teams")),
	a(game:GetService("Players")),
	a(game:GetService("RunService")),
	a(game:GetService("TweenService"))
local j, k = h.RenderStepped, g.LocalPlayer
local function l()
	local m, n = b:GetMouseLocation(), e:GetGuiInset()
	return Vector2.new(m.X - n.X, m.Y - n.Y)
end
local m = {}
local function n(o, p, q)
	return o:GetPropertyChangedSignal(p):Connect(function()
		if not pcall(q) then
			m[q] = true
		end
	end)
end
local o, p, q = protectgui or (syn and syn.protect_gui) or function() end, gethui or function()
	return d
end, "Unknown"
pcall(function()
	local r = (identifyexecutor or getexecutorname or function()
		return nil
	end)()
	if type(r) == "string" and r ~= "" then
		q = r
	end
end)
local r = ((identifyexecutor or function()
	return ""
end)():lower() == "krampus")
do
	local s = getgenv()
	local t = rawget(s, "\0MSFINE_ATU")
	rawset(s, "\0MSFINE_ATU", nil)
	if type(s.MsFineUnload) == "function" then
		pcall(s.MsFineUnload)
	end
	s.MsFineUnload = nil
	local u = s.Library
	if type(u) == "table" and type(u.Unload) == "function" then
		pcall(u.Unload, u)
	end
	s.Library = nil
	if rawget(s, "\0MSFINE_ATU") == nil then
		rawset(s, "\0MSFINE_ATU", t)
	end
end
local s = Instance.new("ScreenGui")
s.Name = "Core"
o(s)
s.ZIndexBehavior = Enum.ZIndexBehavior.Global
s.Parent = p()
local t, u = {}, {}
getgenv().Linoria = { Toggles = t, Options = u }
getgenv().Toggles = t
getgenv().Options = u
local v, w =
	nil,
	{
		Registry = {},
		RegistryMap = {},
		HudRegistry = {},
		FontColor = Color3.fromRGB(235, 235, 240),
		MainColor = Color3.fromRGB(24, 24, 28),
		BackgroundColor = Color3.fromRGB(17, 17, 20),
		AccentColor = Color3.fromRGB(0, 120, 255),
		OutlineColor = Color3.fromRGB(44, 44, 52),
		RiskColor = Color3.fromRGB(255, 76, 76),
		Black = Color3.new(0, 0, 0),
		Font = Enum.Font.Code,
		FontBold = Enum.Font.Code,
		FontMedium = Enum.Font.Code,
		OpenedFrames = {},
		DependencyBoxes = {},
		Signals = {},
		ScreenGui = s,
		ActiveTab = nil,
		Toggled = false,
		MinSize = Vector2.new(520, 320),
		IsMobile = false,
		DevicePlatform = Enum.Platform.None,
		CanDrag = true,
		CantDragForced = false,
		ShowCustomCursor = false,
		VideoLink = "",
		TotalTabs = 0,
	}
pcall(function()
	w.DevicePlatform = b:GetPlatform()
end)
w.IsMobile = (w.DevicePlatform == Enum.Platform.Android or w.DevicePlatform == Enum.Platform.IOS)
pcall(function()
	if getgenv().MsFineForceMobile then
		w.IsMobile = true
	end
end)
if w.IsMobile then
	w.MinSize = Vector2.new(400, 240)
end
local x = w.IsMobile
local y, z, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q =
	x and 21 or 19,
	x and 24 or 22,
	x and 18 or 17,
	x and 23 or 21,
	x and 3 or 3,
	x and 23 or 22,
	x and 28 or 26,
	x and 40 or 29,
	x and 92 or 140,
	x and 14 or 13,
	x and 34 or 30,
	x and 16 or 14,
	x and 7 or 7,
	13,
	14,
	3,
	2,
	0,
	0
table.insert(
	w.Signals,
	j:Connect(function()
		if next(m) then
			for R in next, m do
				m[R] = nil
				pcall(R)
			end
		end
	end)
)
table.insert(
	w.Signals,
	j:Connect(function(R)
		P = P + R
		if P >= 1.6666666666666665E-2 then
			P = 0
			Q = Q + 2.5E-3
			if Q > 1 then
				Q = 0
			end
			w.CurrentRainbowHue = Q
			w.CurrentRainbowColor = Color3.fromHSV(Q, 0.8, 1)
		end
	end)
)
local function R()
	local S = g:GetPlayers()
	for T = 1, #S do
		S[T] = S[T].Name
	end
	table.sort(S, function(T, U)
		return T < U
	end)
	return S
end
local function S()
	local T = f:GetTeams()
	for U = 1, #T do
		T[U] = T[U].Name
	end
	table.sort(T, function(U, V)
		return U < V
	end)
	return T
end
function w:Create(T, U)
	local V = T
	if type(T) == "string" then
		V = Instance.new(T)
	end
	for W, X in next, U do
		V[W] = X
	end
	return V
end
function w:GetTextBounds(T, U, V, W)
	local X = c:GetTextSize(T, V, U, W or Vector2.new(1920, 1080))
	return X.X, X.Y
end
w.OutlineBrightness = 1.9
function w:GetOutlineColor()
	local T, U, V = Color3.toHSV(w.OutlineColor)
	local W, X, Y = Color3.toHSV(w.BackgroundColor)
	V = math.max(V * w.OutlineBrightness, Y + 0.09)
	return Color3.fromHSV(T, U * 0.85, math.clamp(V, 0, 1))
end
function w:GetDarkerColor(T)
	local U, V, X = Color3.toHSV(T)
	return Color3.fromHSV(U, V, X / 1.5)
end
w.AccentColorDark = w:GetDarkerColor(w.AccentColor)
function w:MapValue(T, U, V, X, Y)
	return (1 - ((T - U) / (V - U))) * X + ((T - U) / (V - U)) * Y
end
function w:AddToRegistry(T, U, V)
	local X = #w.Registry + 1
	local Y = { Instance = T, Properties = U, Idx = X }
	table.insert(w.Registry, Y)
	w.RegistryMap[T] = Y
	if V then
		table.insert(w.HudRegistry, Y)
	end
end
function w:SetRegistry(T, U, V)
	local X = w.RegistryMap[T]
	if X and X.Properties then
		X.Properties[U] = V
	end
end
function w:RemoveFromRegistry(T)
	local U = w.RegistryMap[T]
	if U then
		for V = #w.Registry, 1, -1 do
			if w.Registry[V] == U then
				table.remove(w.Registry, V)
			end
		end
		for V = #w.HudRegistry, 1, -1 do
			if w.HudRegistry[V] == U then
				table.remove(w.HudRegistry, V)
			end
		end
		w.RegistryMap[T] = nil
	end
end
function w:UpdateColorsUsingRegistry()
	for T, U in next, w.Registry do
		for V, X in next, U.Properties do
			if type(X) == "string" then
				U.Instance[V] = w[X]
			elseif type(X) == "function" then
				U.Instance[V] = X()
			end
		end
	end
end
function w:GiveSignal(T)
	table.insert(w.Signals, T)
end
local function T(U, V)
	return w:Create("UICorner", { CornerRadius = UDim.new(0, math.clamp(V or N, 0, N)), Parent = U })
end
local function U(V, X, Y)
	X = X or "OutlineColor"
	local Z = X == "OutlineColor"
	local _ = w:Create(
		"UIStroke",
		{ Color = Z and w:GetOutlineColor() or w[X], Thickness = Y or 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Parent = V }
	)
	w:AddToRegistry(_, { Color = Z and function()
		return w:GetOutlineColor()
	end or X })
	return _
end
local function V(X, Y, Z, _, aa)
	return w:Create(
		"UIPadding",
		{
			PaddingLeft = UDim.new(0, Y or 0),
			PaddingRight = UDim.new(0, Z or Y or 0),
			PaddingTop = UDim.new(0, _ or 0),
			PaddingBottom = UDim.new(0, aa or _ or 0),
			Parent = X,
		}
	)
end
local function aa(X, Y, Z, _)
	return w:Create(
		"UIListLayout",
		{
			FillDirection = Y or Enum.FillDirection.Vertical,
			Padding = UDim.new(0, Z or 0),
			SortOrder = _ or Enum.SortOrder.LayoutOrder,
			Parent = X,
		}
	)
end
local function X(Y, Z, _, ab, ac)
	local ad = TweenInfo.new(Z, ab or Enum.EasingStyle.Quint, ac or Enum.EasingDirection.Out)
	local ae = i:Create(Y, ad, _)
	ae:Play()
	return ae
end
local function ab(ac)
	return Vector2.new(ac.X, ac.Y)
end
local function ac(ad)
	return ad.UserInputType == Enum.UserInputType.MouseButton1 or ad.UserInputType == Enum.UserInputType.Touch
end
local function ad(ae)
	return ae.UserInputType == Enum.UserInputType.Touch
end
local function ae(Y, Z)
	local _, af = Z.AbsolutePosition, Z.AbsoluteSize
	return Y.X >= _.X and Y.X <= _.X + af.X and Y.Y >= _.Y and Y.Y <= _.Y + af.Y
end
local af, Y, Z = x and 14 or 6, 0.75, setmetatable({}, { __mode = "k" })
local function _(ag)
	local ah = Z[ag]
	if ah then
		return ah
	end
	ah = { Origin = ab(ag.Position), Drift = 0, Start = os.clock(), Taps = nil }
	Z[ag] = ah
	return ah
end
w:GiveSignal(b.InputBegan:Connect(function(ag)
	if ac(ag) then
		_(ag)
	end
end))
w:GiveSignal(b.InputChanged:Connect(function(ag)
	local ah = Z[ag]
	if not ah then
		if ag.UserInputType ~= Enum.UserInputType.MouseMovement then
			return
		end
		local ai = ab(ag.Position)
		for aj, ak in next, Z do
			if aj.UserInputType == Enum.UserInputType.MouseButton1 then
				local al = (ai - ak.Origin).Magnitude
				if al > ak.Drift then
					ak.Drift = al
				end
			end
		end
		return
	end
	local ai = (ab(ag.Position) - ah.Origin).Magnitude
	if ai > ah.Drift then
		ah.Drift = ai
	end
end))
w:GiveSignal(b.InputEnded:Connect(function(ag)
	local ah = Z[ag]
	if not ah then
		return
	end
	task.defer(function()
		Z[ag] = nil
	end)
	local ai = ah.Taps
	if not ai then
		return
	end
	if ah.Drift > af then
		return
	end
	if (os.clock() - ah.Start) > Y then
		return
	end
	local aj = ab(ag.Position)
	for ak = 1, #ai do
		local al = ai[ak]
		local am = al.Region
		if am.Parent and am.Visible and ae(aj, am) then
			task.spawn(al.Callback, ag)
		end
	end
end))
local function ag(ah, ai, aj)
	return ah.InputBegan:Connect(function(ak)
		if not ac(ak) then
			return
		end
		if aj and (not aj(ak)) then
			return
		end
		if not ad(ak) then
			ai(ak)
			return
		end
		local al = _(ak)
		if not al.Taps then
			al.Taps = {}
		end
		table.insert(al.Taps, { Region = ah, Callback = ai })
	end)
end
local function ah(ai, aj, ak)
	if x then
		return
	end
	ai.MouseEnter:Connect(aj)
	ai.MouseLeave:Connect(ak)
end
local function ai(aj)
	aj.Active = true
	aj.AutoButtonColor = false
	aj.Selectable = false
	aj.Text = ""
	return w:Create("TextButton", aj)
end
function w:ApplyTextStroke(aj)
	aj.TextStrokeColor3 = Color3.new(0, 0, 0)
	aj.TextStrokeTransparency = 0.55
end
w.ImageCache = {}
w.AssetFolder = "MsFine/assets"
w.AssetBase = "https://zekehub.com/assets/UI/"
w.AssetMap = nil
local function aj()
	local ak, al = "0123456789abcdef", table.create(24)
	for am = 1, 24 do
		local an = math.random(1, #ak)
		al[am] = ak:sub(an, an)
	end
	return table.concat(al)
end
local function ak()
	local al = w.AssetFolder:match("^(.-)/") or w.AssetFolder
	if not isfolder(al) then
		makefolder(al)
	end
	if not isfolder(w.AssetFolder) then
		makefolder(w.AssetFolder)
	end
	if w.AssetMap then
		return w.AssetMap
	end
	local am = {}
	pcall(function()
		local an = w.AssetFolder .. "/index.json"
		if isfile(an) then
			am = game:GetService("HttpService"):JSONDecode(readfile(an))
		end
	end)
	w.AssetMap = am
	return am
end
local function al(am)
	if type(am) ~= "string" or #am < 12 then
		return false
	end
	if am:sub(1, 8) == "\137PNG\r\n\26\n" then
		return true
	end
	if am:sub(1, 4) == "RIFF" and am:sub(9, 12) == "WEBP" then
		return true
	end
	if am:sub(1, 3) == "\255\216\255" then
		return true
	end
	return false
end
local function am()
	pcall(function()
		local an = w.AssetFolder .. "/index.json"
		writefile(an, game:GetService("HttpService"):JSONEncode(w.AssetMap))
	end)
end
function w:Icon(an)
	return w:LoadImage(w.AssetBase .. an .. ".png")
end
function w:LoadImage(an)
	if type(an) ~= "string" or an == "" then
		return nil
	end
	if w.ImageCache[an] then
		return w.ImageCache[an]
	end
	if an:match("^rbxassetid://") or an:match("^rbxasset://") then
		w.ImageCache[an] = an
		return an
	end
	if tonumber(an) then
		local ao = "rbxassetid://" .. an
		w.ImageCache[an] = ao
		return ao
	end
	if an == "game" then
		local ao
		pcall(function()
			local ap = w:GetProductInfo()
			if ap and ap.IconImageAssetId and ap.IconImageAssetId ~= 0 then
				ao = "rbxassetid://" .. tostring(ap.IconImageAssetId)
			end
		end)
		if ao then
			w.ImageCache[an] = ao
		end
		return ao
	end
	if not an:match("^https?://") then
		return nil
	end
	local ao
	pcall(function()
		local ap, aq = an:match("%.(%w+)$") or "png", ak()
		local ar = aq[an]
		if type(ar) ~= "string" or not isfile(ar) then
			local as = game:HttpGet(an)
			if not al(as) then
				return
			end
			ar = w.AssetFolder .. "/" .. aj() .. "." .. ap
			writefile(ar, as .. aj())
			aq[an] = ar
			am()
		end
		local as = getcustomasset or getsynasset
		if as then
			ao = as(ar)
		end
	end)
	if ao then
		w.ImageCache[an] = ao
	end
	return ao
end
w.Language = "en"
w.TextRegistry = {}
w.Translator = nil
w.AutoTranslate = true
w.Translations = {}
w.Languages = {
	"en",
	"ar",
	"cs",
	"de",
	"es",
	"fi",
	"fr",
	"hi",
	"id",
	"it",
	"ja",
	"ko",
	"nl",
	"no",
	"pl",
	"pt",
	"ro",
	"ru",
	"sv",
	"th",
	"tr",
	"uk",
	"vi",
	"zh",
}
function w:Translate(an)
	if type(an) ~= "string" or an == "" then
		return an
	end
	if w.Language == "en" then
		return an
	end
	local ao = w.Translations[w.Language]
	if ao and ao[an] then
		return ao[an]
	end
	if type(w.Translator) == "function" then
		local ap, aq = pcall(w.Translator, an, w.Language)
		if ap and type(aq) == "string" and aq ~= "" then
			if not w.Translations[w.Language] then
				w.Translations[w.Language] = {}
			end
			w.Translations[w.Language][an] = aq
			return aq
		end
	end
	return an
end
function w:RegisterText(an)
	local ao = an.Text
	if type(ao) ~= "string" or ao == "" then
		return
	end
	local ap = { Original = ao, Applied = ao }
	w.TextRegistry[an] = ap
	if w.Language ~= "en" then
		local aq = w:Translate(ao)
		an.Text = aq
		ap.Applied = aq
	end
end
w.FontRegistry = {}
w.FontFamilies = {
	Code = { Enum.Font.Code, Enum.Font.Code, Enum.Font.Code },
	Gotham = { Enum.Font.Gotham, Enum.Font.GothamMedium, Enum.Font.GothamBold },
	Ubuntu = { Enum.Font.Ubuntu, Enum.Font.Ubuntu, Enum.Font.Ubuntu },
	["Source Sans"] = { Enum.Font.SourceSans, Enum.Font.SourceSansSemibold, Enum.Font.SourceSansBold },
	Arimo = { Enum.Font.Arimo, Enum.Font.ArimoBold, Enum.Font.ArimoBold },
}
w.FontFamily = "Code"
function w:GetFontFamilies()
	local an = {}
	for ao in next, w.FontFamilies do
		table.insert(an, ao)
	end
	table.sort(an)
	return an
end
function w:SetFontFamily(an)
	local ao = w.FontFamilies[an]
	if not ao then
		return false
	end
	w.FontFamily = an
	w.Font, w.FontMedium, w.FontBold = ao[1], ao[2], ao[3]
	for ap, aq in next, w.FontRegistry do
		if typeof(ap) == "Instance" and ap.Parent then
			ap.Font = w[aq]
		else
			w.FontRegistry[ap] = nil
		end
	end
	return true
end
function w:SkipTranslate(an)
	if typeof(an) == "Instance" then
		w.TextRegistry[an] = nil
	end
	return an
end
function w:GetLanguages()
	local an = {}
	for ao, ap in ipairs(w.Languages) do
		table.insert(an, ap)
	end
	return an
end
local function an(ao)
	return "MsFine/lang/" .. ao .. ".json"
end
function w:LoadTranslationCache(ao)
	pcall(function()
		if not isfile(an(ao)) then
			return
		end
		local ap = game:GetService("HttpService"):JSONDecode(readfile(an(ao)))
		if type(ap) ~= "table" then
			return
		end
		w.Translations[ao] = w.Translations[ao] or {}
		for aq, ar in next, ap do
			if w.Translations[ao][aq] == nil then
				w.Translations[ao][aq] = ar
			end
		end
	end)
end
function w:SaveTranslationCache(ao)
	pcall(function()
		if not w.Translations[ao] then
			return
		end
		if not isfolder("MsFine") then
			makefolder("MsFine")
		end
		if not isfolder("MsFine/lang") then
			makefolder("MsFine/lang")
		end
		writefile(an(ao), game:GetService("HttpService"):JSONEncode(w.Translations[ao]))
	end)
end
function w:FetchTranslations(ao, ap)
	if ao == "en" or #ap == 0 then
		return 0
	end
	local aq, ar = game:GetService("HttpService"), 0
	w.Translations[ao] = w.Translations[ao] or {}
	local as = 1
	while as <= #ap do
		local at = {}
		for au = 0, 24 do
			local av = ap[as + au]
			if not av then
				break
			end
			table.insert(at, (av:gsub("\n", " ")))
		end
		as = as + #at
		local au = table.concat(at, "\n")
		local av, aw = pcall(function()
			return game:HttpGet(
				string.format(
					[[https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=%s&dt=t&q=%s]],
					ao,
					aq:UrlEncode(au)
				)
			)
		end)
		if av and type(aw) == "string" then
			local ax
			pcall(function()
				ax = aq:JSONDecode(aw)
			end)
			if ax and ax[1] then
				local ay = {}
				for az, aA in ipairs(ax[1]) do
					if type(aA[1]) == "string" then
						table.insert(ay, aA[1])
					end
				end
				local az = table.concat(ay, "")
				local aA = string.split(az, "\n")
				if #aA == #at then
					for aB, aC in ipairs(aA) do
						local aD, aE = at[aB], (aC:gsub("^%s+", ""):gsub("%s+$", ""))
						if aE ~= "" then
							w.Translations[ao][aD] = aE
							ar = ar + 1
						end
					end
				end
			end
		end
		task.wait(0.06)
	end
	if ar > 0 then
		w:SaveTranslationCache(ao)
	end
	return ar
end
function w:ApplyTranslations()
	for ao, ap in next, w.TextRegistry do
		if typeof(ao) == "Instance" and ao.Parent then
			if ao.Text == ap.Applied then
				local aq = w:Translate(ap.Original)
				ao.Text = aq
				ap.Applied = aq
			end
		else
			w.TextRegistry[ao] = nil
		end
	end
end
function w:SetLanguage(ao, ap)
	w.Language = ao or "en"
	if w.Language ~= "en" then
		w:LoadTranslationCache(w.Language)
	end
	w:ApplyTranslations()
	if w.Language == "en" then
		return
	end
	if ap == nil then
		ap = w.AutoTranslate
	end
	if not ap then
		return
	end
	local aq, ar, as = w.Language, {}, {}
	local at = w.Translations[aq] or {}
	for au, av in next, w.TextRegistry do
		local aw = av.Original
		if type(aw) == "string" and aw ~= "" and not at[aw] and not as[aw] then
			as[aw] = true
			table.insert(ar, aw)
		end
	end
	if #ar == 0 then
		return
	end
	task.spawn(function()
		local au = w:FetchTranslations(aq, ar)
		if w.Language == aq and au > 0 then
			w:ApplyTranslations()
		end
	end)
end
function w:GetProductInfo()
	if w.CachedProductInfo ~= nil then
		return w.CachedProductInfo or nil
	end
	local ao
	pcall(function()
		ao = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
	end)
	w.CachedProductInfo = ao or false
	return ao
end
function w:GetGameName()
	if w.CachedGameName then
		return w.CachedGameName
	end
	local ao = "Unknown Game"
	pcall(function()
		local ap = w:GetProductInfo()
		if ap and type(ap.Name) == "string" and ap.Name ~= "" then
			ao = ap.Name
		end
	end)
	w.CachedGameName = ao
	return ao
end
function w:GetTabStyle()
	local ao = "Top"
	pcall(function()
		if isfile("MsFine/tabstyle.txt") then
			local ap = readfile("MsFine/tabstyle.txt")
			if ap == "Side" or ap == "Top" then
				ao = ap
			end
		end
	end)
	return ao
end
function w:SetTabStyle(ao)
	if ao ~= "Side" and ao ~= "Top" then
		return false
	end
	pcall(function()
		if not isfolder("MsFine") then
			makefolder("MsFine")
		end
		writefile("MsFine/tabstyle.txt", ao)
	end)
	return true
end
function w:CreateLayoutSection(ao)
	assert(ao, "CreateLayoutSection: missing groupbox.")
	ao:AddDropdown("MsFine_TabStyle", {
		Text = "Menu layout",
		Values = { "Top", "Side" },
		Default = w:GetTabStyle() == "Side" and 2 or 1,
		Tooltip = "Where the tabs sit. Applies the next time the hub loads.",
		Callback = function(ap)
			local aq = w.Window
			if aq and aq.SetTabStyle then
				if aq:GetTabStyle() == ap then
					return
				end
				aq:SetTabStyle(ap)
			else
				w:SetTabStyle(ap)
			end
		end,
	})
	ao:AddDropdown("MsFine_Font", {
		Text = "Font",
		Values = w:GetFontFamilies(),
		Default = table.find(w:GetFontFamilies(), w.FontFamily) or 1,
		Tooltip = "Code is the classic Linoria look.",
		Callback = function(ap)
			w:SetFontFamily(ap)
		end,
	})
	ao:AddDropdown("MsFine_Language", {
		Text = "Language",
		Values = w:GetLanguages(),
		Default = 1,
		Callback = function(ap)
			w:SetLanguage(ap)
		end,
	})
	ao:AddToggle("MsFine_AutoTranslate", {
		Text = "Auto-translate everything",
		Default = w.AutoTranslate == true,
		Tooltip = [[Translates every feature name online, then caches it so it only downloads once per language.]],
		Callback = function(ap)
			w.AutoTranslate = ap
			if ap and w.Language ~= "en" then
				w:SetLanguage(w.Language, true)
			end
		end,
	})
	return ao
end
function w:CreateLabel(ao, ap)
	local aq = w:Create(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Font = w.Font,
			TextColor3 = w.FontColor,
			TextSize = M,
			TextStrokeColor3 = Color3.new(0, 0, 0),
			TextStrokeTransparency = 0.55,
			RichText = false,
		}
	)
	w:ApplyTextStroke(aq)
	w:AddToRegistry(aq, { TextColor3 = "FontColor" }, ap)
	w:Create(aq, ao)
	w:RegisterText(aq)
	local ar = "Font"
	if aq.Font == w.FontBold then
		ar = "FontBold"
	elseif aq.Font == w.FontMedium then
		ar = "FontMedium"
	end
	w.FontRegistry[aq] = ar
	return aq
end
local ao = {}
function w:SafeCallback(ap, ...)
	if not ap then
		return
	end
	if not w.NotifyOnError then
		return ap(...)
	end
	local aq, ar = pcall(ap, ...)
	if not aq then
		local as, at = ar:find(":%d+: ")
		local au, av = at and ar:sub(at + 1) or ar, os.clock()
		if ao[au] and (av - ao[au]) < 2 then
			return
		end
		ao[au] = av
		return w:Notify(au, 3)
	end
end
function w:AttemptSave()
	if w.SaveManager then
		w.SaveManager:Save()
	end
end
function w:MouseIsOverOpenedFrame(ap)
	local aq = l()
	if ap and ap.Position then
		aq = ab(ap.Position)
	end
	for ar, as in next, w.OpenedFrames do
		local at, au = ar.AbsolutePosition, ar.AbsoluteSize
		if aq.X >= at.X and aq.X <= at.X + au.X and aq.Y >= at.Y and aq.Y <= at.Y + au.Y then
			return true
		end
	end
end
function w:MouseIsOverFrame(ap, aq)
	local ar = l()
	if aq and aq.Position then
		ar = ab(aq.Position)
	end
	local as, at = ap.AbsolutePosition, ap.AbsoluteSize
	if ar.X >= as.X and ar.X <= as.X + at.X and ar.Y >= as.Y and ar.Y <= as.Y + at.Y then
		return true
	end
end
function w:UpdateDependencyBoxes()
	for ap, aq in next, w.DependencyBoxes do
		aq:Update()
	end
end
local ap, aq, ar, as = nil, nil, {}, {}
local function at(au)
	local av = au
	while av and not av:IsA("ScreenGui") do
		if av:IsA("GuiObject") and not av.Visible then
			return false
		end
		av = av.Parent
	end
	return av ~= nil and av.Enabled and au.AbsoluteSize.X > 0
end
local function au()
	local av = ap
	if not av then
		return
	end
	ap = nil
	w.CanDrag = true
	if av.OnRelease then
		av.OnRelease()
	end
end
local function av(aw, ax, ay)
	if ax.Guard and (not ax.Guard(aw)) then
		return false
	end
	ap = { Input = aw, OnMove = ax.OnMove, OnRelease = ax.OnRelease }
	w.CanDrag = false
	ax.OnMove(ay)
	return true
end
local function aw(ax, ay, az, aA, aB)
	local aC = { OnMove = ay, OnRelease = az, Guard = aA }
	table.insert(as, ax)
	ax.InputBegan:Connect(function(aD)
		if ap or aq then
			return
		end
		if not ac(aD) then
			return
		end
		local aE = ab(aD.Position)
		if aB and ad(aD) then
			aq = { Input = aD, Entry = aC, Origin = aE }
			return
		end
		av(aD, aC, aE)
	end)
end
w:GiveSignal(b.InputChanged:Connect(function(ax)
	local ay = aq
	if ay then
		local az = ax.UserInputType == Enum.UserInputType.MouseMovement
			and ay.Input.UserInputType == Enum.UserInputType.MouseButton1
		if ax ~= ay.Input and not az then
			return
		end
		local aA = ab(ax.Position)
		local aB = aA - ay.Origin
		local aC, aD = math.abs(aB.X), math.abs(aB.Y)
		if aD > af and aD > aC then
			aq = nil
		elseif aC > af then
			aq = nil
			av(ay.Input, ay.Entry, aA)
		end
		return
	end
	local az = ap
	if not az then
		return
	end
	if az.Input.UserInputState == Enum.UserInputState.End then
		au()
		return
	end
	local aA = ax.UserInputType == Enum.UserInputType.MouseMovement
		and az.Input.UserInputType == Enum.UserInputType.MouseButton1
	if ax == az.Input or aA then
		az.OnMove(ab(ax.Position))
	end
end))
w:GiveSignal(b.InputEnded:Connect(function(ax)
	local ay = aq
	if ay and ax == ay.Input then
		aq = nil
		local az = Z[ax]
		if (not az) or az.Drift <= af then
			if av(ax, ay.Entry, ab(ax.Position)) then
				au()
			end
		end
		return
	end
	local az = ap
	if not az then
		return
	end
	local aA = ax == az.Input
		or (
			ax.UserInputType == Enum.UserInputType.MouseButton1
			and az.Input.UserInputType == Enum.UserInputType.MouseButton1
		)
	if aA then
		au()
	end
end))
local function ax(ay, az)
	if not x then
		return
	end
	local aA = 0
	ay.InputBegan:Connect(function(aB)
		if aB.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		aA = aA + 1
		local aC, aD = aA, ab(aB.Position)
		task.delay(0.35, function()
			if aA ~= aC then
				return
			end
			if (ab(aB.Position) - aD).Magnitude > 12 then
				return
			end
			az()
		end)
	end)
	ay.InputEnded:Connect(function(aB)
		if aB.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		aA = aA + 1
	end)
end
function w:MakeDraggable(ay, az)
	ay.Active = true
	local aA, aB, aC, aD
	local function aE(aF, aG)
		if w.CantDragForced then
			return
		end
		if not w.CanDrag then
			return
		end
		local aH = ab(aF.Position)
		if (not aG) and (aH.Y - ay.AbsolutePosition.Y) > (az or 40) then
			return
		end
		aA = true
		aB = aF
		aC = aH
		aD = ay.Position
	end
	ay.InputBegan:Connect(function(aF)
		if not ac(aF) then
			return
		end
		if ad(aF) then
			return
		end
		local aG = ab(aF.Position)
		for aH, aI in ipairs(as) do
			if aI:IsDescendantOf(ay) and ae(aG, aI) and at(aI) then
				return
			end
		end
		aE(aF, false)
	end)
	if x then
		table.insert(ar, ay)
		w:GiveSignal(b.InputBegan:Connect(function(aF)
			if aA then
				return
			end
			if not ad(aF) then
				return
			end
			if not ay.Visible then
				return
			end
			if w:MouseIsOverOpenedFrame(aF) then
				return
			end
			local aG = ab(aF.Position)
			if not ae(aG, ay) then
				return
			end
			for aH, aI in ipairs(ar) do
				if aI ~= ay and aI.Visible and aI.ZIndex > ay.ZIndex and ae(aG, aI) then
					return
				end
			end
			for aH, aI in ipairs(as) do
				if ae(aG, aI) and at(aI) then
					return
				end
			end
			aE(aF, true)
		end))
	end
	w:GiveSignal(b.InputChanged:Connect(function(aF)
		if not aA then
			return
		end
		if w.CantDragForced then
			aA = false
			return
		end
		if ad(aB) and not w.CanDrag then
			aA = false
			return
		end
		local aG = aF.UserInputType == Enum.UserInputType.MouseMovement
			and aB.UserInputType == Enum.UserInputType.MouseButton1
		if aF ~= aB and not aG then
			return
		end
		local aH, aI = ab(aF.Position) - aC, ay.Parent
		if not aI then
			return
		end
		local aJ, aK, aL = aI.AbsoluteSize, ay.AbsoluteSize, ay.AnchorPoint
		local aM, aN = (aD.X.Scale * aJ.X) - (aL.X * aK.X), (aD.Y.Scale * aJ.Y) - (aL.Y * aK.Y)
		local aO, aP =
			math.clamp(aD.X.Offset + aH.X, -aM - (aK.X - 70), -aM + aJ.X - 70),
			math.clamp(aD.Y.Offset + aH.Y, -aN, -aN + aJ.Y - 32)
		ay.Position = UDim2.new(aD.X.Scale, aO, aD.Y.Scale, aP)
	end))
	w:GiveSignal(b.InputEnded:Connect(function(aF)
		if not aA then
			return
		end
		if
			aF == aB
			or (
				aF.UserInputType == Enum.UserInputType.MouseButton1
				and aB.UserInputType == Enum.UserInputType.MouseButton1
			)
		then
			aA = false
		end
	end))
end
w.MobileButtons = {}
w.MobileButtonsHidden = false
local ay, az = "MsFine/mobilebuttons.json", nil
local function aA()
	if az then
		return az
	end
	az = {}
	pcall(function()
		if not isfile(ay) then
			return
		end
		local aB = game:GetService("HttpService"):JSONDecode(readfile(ay))
		if type(aB) == "table" then
			az = aB
		end
	end)
	return az
end
local function aB()
	pcall(function()
		if not isfolder("MsFine") then
			makefolder("MsFine")
		end
		writefile(ay, game:GetService("HttpService"):JSONEncode(aA()))
	end)
end
function w:GetMobileButtonEnabled(aC)
	local aD = aA()[aC]
	return type(aD) == "table" and aD.Enabled == true
end
function w:SetMobileButtonEnabled(aC, aD)
	local aE = aA()
	aE[aC] = aE[aC] or {}
	aE[aC].Enabled = not not aD
	aB()
end
local aC = 0
function w:AddMobileButton(aD)
	local aE = {
		Text = aD.Text or "Button",
		Key = aD.Key or aD.Text or "Button",
		OnHold = aD.OnHold,
		OnTap = aD.OnTap,
		Held = false,
		Active = false,
	}
	local aF, aG = aA()[aE.Key] or {}, aC
	aC = aC + 1
	local aH = math.clamp(w:GetTextBounds(aE.Text, w.FontMedium, L) + 26, 76, 150)
	local aI = w:Create(
		"TextButton",
		{
			Active = true,
			AutoButtonColor = false,
			BackgroundColor3 = w.MainColor,
			BorderSizePixel = 0,
			Font = w.FontMedium,
			Position = aF.XO and UDim2.new(aF.XS or 0, aF.XO, aF.YS or 0, aF.YO)
				or UDim2.new(1, -(aH + 16), 0, 110 + (aG * 42)),
			Selectable = false,
			Size = UDim2.fromOffset(aH, 34),
			Text = aE.Text,
			TextColor3 = w.FontColor,
			TextSize = L,
			TextTruncate = Enum.TextTruncate.AtEnd,
			Visible = not w.MobileButtonsHidden,
			ZIndex = 210,
			Parent = s,
		}
	)
	T(aI, O)
	local aJ = U(aI, "OutlineColor")
	w:AddToRegistry(aI, { BackgroundColor3 = "MainColor", TextColor3 = "FontColor" })
	w:MakeDraggable(aI, math.huge)
	function aE:SetActive(aK)
		aK = not not aK
		if aE.Active == aK then
			return
		end
		aE.Active = aK
		X(
			aI,
			0.14,
			{ BackgroundColor3 = aK and w.AccentColor or w.MainColor, TextColor3 = aK and w.MainColor or w.FontColor }
		)
		X(aJ, 0.14, { Color = aK and w.AccentColor or w:GetOutlineColor() })
		w:SetRegistry(aI, "BackgroundColor3", aK and "AccentColor" or "MainColor")
		w:SetRegistry(aI, "TextColor3", aK and "MainColor" or "FontColor")
	end
	function aE:SetVisible(aK)
		aI.Visible = (not not aK) and not w.MobileButtonsHidden
	end
	function aE:Destroy()
		w.MobileButtons[aE] = nil
		w:RemoveFromRegistry(aI)
		aI:Destroy()
	end
	local aK = false
	n(aI, "Position", function()
		if aK then
			return
		end
		aK = true
		task.delay(0.4, function()
			aK = false
			if not aI.Parent then
				return
			end
			local aL = aA()
			aL[aE.Key] = aL[aE.Key] or {}
			aL[aE.Key].XS = aI.Position.X.Scale
			aL[aE.Key].XO = aI.Position.X.Offset
			aL[aE.Key].YS = aI.Position.Y.Scale
			aL[aE.Key].YO = aI.Position.Y.Offset
			aB()
		end)
	end)
	local aL
	local function aM()
		if not aE.Held then
			return
		end
		aE.Held = false
		w:SafeCallback(aE.OnHold, false)
	end
	aI.InputBegan:Connect(function(aN)
		if aL then
			return
		end
		if not ac(aN) then
			return
		end
		aL = { Input = aN, Origin = ab(aN.Position), Start = os.clock(), Drift = 0 }
		aE.Held = true
		w:SafeCallback(aE.OnHold, true)
	end)
	w:GiveSignal(b.InputChanged:Connect(function(aN)
		if not aL then
			return
		end
		if aN ~= aL.Input and aN.UserInputType ~= Enum.UserInputType.MouseMovement then
			return
		end
		aL.Drift = math.max(aL.Drift, (ab(aN.Position) - aL.Origin).Magnitude)
		if aL.Drift > af then
			aM()
		end
	end))
	w:GiveSignal(b.InputEnded:Connect(function(aN)
		if not aL then
			return
		end
		local aO = aN == aL.Input
			or (
				aN.UserInputType == Enum.UserInputType.MouseButton1
				and aL.Input.UserInputType == Enum.UserInputType.MouseButton1
			)
		if not aO then
			return
		end
		local aP = aL.Drift <= af and (os.clock() - aL.Start) <= Y
		aL = nil
		aM()
		if aP then
			w:SafeCallback(aE.OnTap)
		end
	end))
	aE.Frame = aI
	w.MobileButtons[aE] = true
	return aE
end
function w:SetMobileButtonsHidden(aD)
	w.MobileButtonsHidden = not not aD
	for aE in next, w.MobileButtons do
		if aE.Frame.Parent then
			aE.Frame.Visible = not w.MobileButtonsHidden
		end
	end
end
function w:MakeResizable(aD, aE, aF)
	aD.Active = true
	aE = aE or w.MinSize
	local aG, aH =
		w:Create(
			"TextButton",
			{
				Active = true,
				AnchorPoint = Vector2.new(1, 1),
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Position = UDim2.new(1, -3, 1, -3),
				Size = UDim2.fromOffset(x and 34 or 22, x and 34 or 22),
				Text = "",
				ZIndex = 60,
				Parent = aD,
			}
		),
		{}
	for aI = 0, 2 do
		local aJ = w:Create(
			"Frame",
			{
				AnchorPoint = Vector2.new(1, 1),
				BackgroundColor3 = w.OutlineColor,
				BorderSizePixel = 0,
				Position = UDim2.new(1, -4 - aI * 5, 1, -4),
				Rotation = 45,
				Size = UDim2.fromOffset(2, 7 + aI * 5),
				ZIndex = 61,
				Parent = aG,
			}
		)
		T(aJ, 1)
		w:AddToRegistry(aJ, { BackgroundColor3 = "OutlineColor" })
		table.insert(aH, aJ)
	end
	local function aI(aJ)
		for aK, aL in ipairs(aH) do
			aL.BackgroundColor3 = w[aJ]
			w:SetRegistry(aL, "BackgroundColor3", aJ)
		end
	end
	aG.MouseEnter:Connect(function()
		aI("AccentColor")
	end)
	aG.MouseLeave:Connect(function()
		aI("OutlineColor")
	end)
	aw(aG, function(aJ)
		local aK, aL = aD.AbsolutePosition, w.ScreenGui.AbsoluteSize
		local aM, aN =
			math.clamp(aJ.X - aK.X + 6, aE.X, math.max(aE.X, aL.X - aK.X)),
			math.clamp(aJ.Y - aK.Y + 6, aE.Y, math.max(aE.Y, aL.Y - aK.Y))
		aD.Size = UDim2.fromOffset(aM, aN)
		if aF then
			aF(aM, aN)
		end
	end, function()
		aI("OutlineColor")
	end)
	return aG
end
function w:CreateCursor()
	if w.IsMobile then
		return
	end
	if w.Cursor then
		return
	end
	if not w.ShowCustomCursor then
		return
	end
	w.CursorGui =
		w:Create("ScreenGui", { Name = "CursorGui", DisplayOrder = 999999, IgnoreGuiInset = true, Parent = p() })
	o(w.CursorGui)
	w.CursorImage = w:Create(
		"ImageLabel",
		{
			Name = "Cursor",
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(46, 46),
			Image = [[rbxasset://textures/Cursors/KeyboardMouse/ArrowFarCursor.png]],
			ImageColor3 = w.AccentColor,
			AnchorPoint = Vector2.new(0, 0),
			ZIndex = 999999,
			Visible = false,
			Parent = w.CursorGui,
		}
	)
	w.Cursor = w.CursorImage
	w.CursorConnection = j:Connect(function()
		local aD = w.ShowCustomCursor and w.Toggled and w.Cursor
		if aD then
			local aE = b:GetMouseLocation()
			w.CursorImage.ImageColor3 = w.AccentColor
			w.CursorImage.Position = UDim2.fromOffset(aE.X - 17, aE.Y - 20)
			w.CursorImage.Visible = true
			w.CursorGui.Enabled = true
		else
			if w.CursorImage then
				w.CursorImage.Visible = false
			end
			if w.CursorGui then
				w.CursorGui.Enabled = false
			end
		end
	end)
end
function w:DestroyCursor()
	if w.CursorConnection then
		w.CursorConnection:Disconnect()
		w.CursorConnection = nil
	end
	if w.CursorGui then
		w.CursorGui:Destroy()
		w.CursorGui = nil
	end
	w.Cursor = nil
	w.CursorImage = nil
end
function w:Unload()
	if w.Destroyed then
		return
	end
	w.Destroyed = true
	for aD = #w.Signals, 1, -1 do
		local aE = table.remove(w.Signals, aD)
		aE:Disconnect()
	end
	w:DestroyCursor()
	if w.OnUnload then
		w.OnUnload()
	end
	pcall(function()
		local aD = type(getgenv) == "function" and getgenv() or nil
		local aE = aD and aD["\0MSFINE_ATU"]
		if type(aE) == "function" then
			aE()
		end
	end)
	for aD, aE in ipairs(w.WidgetLayers or {}) do
		pcall(aE.Destroy, aE)
	end
	s:Destroy()
end
function w:OnUnload(aD)
	w.OnUnload = aD
end
w:GiveSignal(s.DescendantRemoving:Connect(function(aD)
	if w.RegistryMap[aD] then
		w:RemoveFromRegistry(aD)
	end
end))
function w:OnHighlight(aD, aE, aF, aG, aH)
	local function aI()
		local aJ = w.RegistryMap[aE]
		for aK, aL in next, aG do
			aE[aK] = w[aL] or aL
			if aJ and aJ.Properties[aK] then
				aJ.Properties[aK] = aL
			end
		end
	end
	local function aJ()
		if aH and not aH() then
			aI()
			return
		end
		local aK = w.RegistryMap[aE]
		for aL, aM in next, aF do
			aE[aL] = w[aM] or aM
			if aK and aK.Properties[aL] then
				aK.Properties[aL] = aM
			end
		end
	end
	if x then
		return
	end
	aD.MouseEnter:Connect(aJ)
	aD.MouseLeave:Connect(aI)
end
function w:AddToolTip(aD, aE)
	if w.IsMobile then
		return
	end
	local aF, aG = w:GetTextBounds(aD, w.Font, L)
	local aH = w:Create(
		"Frame",
		{
			BackgroundColor3 = w.MainColor,
			BorderSizePixel = 0,
			Size = UDim2.fromOffset(aF + 14, aG + 10),
			ZIndex = 300,
			Parent = w.ScreenGui,
			Visible = false,
		}
	)
	T(aH, 5)
	U(aH, "OutlineColor")
	local aI = w:CreateLabel({
		Position = UDim2.fromOffset(7, 5),
		Size = UDim2.fromOffset(aF, aG),
		TextSize = L,
		Text = aD,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 301,
		Parent = aH,
	})
	w:AddToRegistry(aH, { BackgroundColor3 = "MainColor" })
	local aJ = false
	aE.MouseEnter:Connect(function()
		if w:MouseIsOverOpenedFrame() then
			return
		end
		aJ = true
		local aK = l()
		aH.Position = UDim2.fromOffset(aK.X + 16, aK.Y + 14)
		aH.Visible = true
		while aJ do
			h.Heartbeat:Wait()
			local aL = l()
			aH.Position = UDim2.fromOffset(aL.X + 16, aL.Y + 14)
		end
	end)
	aE.MouseLeave:Connect(function()
		aJ = false
		aH.Visible = false
	end)
	if v then
		v:GetPropertyChangedSignal("Visible"):Connect(function()
			if v.Visible == false then
				aJ = false
				aH.Visible = false
			end
		end)
	end
end
function w:CreateLoadingScreen(aD)
	aD = aD or {}
	local aE = w:Create(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = w.MainColor,
			BorderSizePixel = 0,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.fromOffset(340, 148),
			ZIndex = 1000,
			Parent = s,
		}
	)
	T(aE, 8)
	U(aE, "OutlineColor")
	w:AddToRegistry(aE, { BackgroundColor3 = "MainColor" })
	local aF = w:Create(
		"Frame",
		{
			BackgroundColor3 = w.AccentColor,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 3, 0, 26),
			Position = UDim2.fromOffset(20, 24),
			ZIndex = 1002,
			Parent = aE,
		}
	)
	T(aF, 2)
	w:AddToRegistry(aF, { BackgroundColor3 = "AccentColor" })
	w:CreateLabel({
		Position = UDim2.fromOffset(32, 22),
		Size = UDim2.new(1, -52, 0, 18),
		Text = aD.Title or "Loading",
		TextSize = 15,
		Font = w.FontBold,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 1002,
		Parent = aE,
	})
	w:CreateLabel({
		Position = UDim2.fromOffset(32, 40),
		Size = UDim2.new(1, -52, 0, 16),
		Text = aD.Subtitle or "",
		TextSize = L,
		TextTransparency = 0.35,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 1002,
		Parent = aE,
	})
	local aG = w:Create(
		"Frame",
		{
			BackgroundColor3 = w.BackgroundColor,
			BorderSizePixel = 0,
			Position = UDim2.fromOffset(20, 84),
			Size = UDim2.new(1, -40, 0, 6),
			ZIndex = 1002,
			Parent = aE,
		}
	)
	T(aG, 3)
	w:AddToRegistry(aG, { BackgroundColor3 = "BackgroundColor" })
	local aH = w:Create(
		"Frame",
		{ BackgroundColor3 = w.AccentColor, BorderSizePixel = 0, Size = UDim2.new(0, 0, 1, 0), ZIndex = 1003, Parent = aG }
	)
	T(aH, 3)
	w:AddToRegistry(aH, { BackgroundColor3 = "AccentColor" })
	local aI, aJ =
		w:CreateLabel({
			Position = UDim2.fromOffset(20, 100),
			Size = UDim2.new(1, -40, 0, 18),
			Text = aD.Status or "",
			TextSize = L,
			TextTransparency = 0.25,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 1002,
			Parent = aE,
		}),
		i:Create(
			aH,
			TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1),
			{ Size = UDim2.new(1, 0, 1, 0) }
		)
	aJ:Play()
	w.LoadingScreen = {
		Outer = aE,
		Bar = aH,
		StatusText = aI,
		Destroy = function()
			aJ:Cancel()
			aE:Destroy()
			w.LoadingScreen = nil
		end,
		SetStatus = function(aK)
			aI.Text = aK
		end,
		SetProgress = function(aK)
			aJ:Cancel()
			X(aH, 0.2, { Size = UDim2.new(aK, 0, 1, 0) })
		end,
	}
	return w.LoadingScreen
end
local aD, aE, aF, aG, aH, aI =
	{},
	{},
	{
		[Enum.UserInputType.MouseButton1] = "MB1",
		[Enum.UserInputType.MouseButton2] = "MB2",
		[Enum.UserInputType.MouseButton3] = "MB3",
	},
	{ MB1 = Enum.UserInputType.MouseButton1, MB2 = Enum.UserInputType.MouseButton2, MB3 = Enum.UserInputType.MouseButton3 },
	{ MouseBackButton = "MB4", MouseForwardButton = "MB5" },
	{ MB4 = "MouseBackButton", MB5 = "MouseForwardButton" }
local function aJ(aK)
	local aL = aF[aK.UserInputType]
	if aL then
		return aL
	end
	local aM = aK.KeyCode
	if aM == Enum.KeyCode.Unknown then
		return nil
	end
	return aH[aM.Name] or aM.Name
end
local function aK(aL)
	local aM = aG[aL]
	if aM then
		return b:IsMouseButtonPressed(aM)
	end
	local aN = aI[aL] or aL
	if aE[aN] then
		return true
	end
	local aO, aP = pcall(function()
		return b:IsKeyDown(Enum.KeyCode[aN])
	end)
	return aO and aP == true
end
w:GiveSignal(b.InputBegan:Connect(function(aL)
	local aM = b:GetFocusedTextBox()
	if aL.KeyCode ~= Enum.KeyCode.Unknown then
		aE[aL.KeyCode.Name] = true
	end
	for aN, aO in next, aD do
		if aO.Alive() then
			aO.OnBegan(aL, aM)
		else
			aD[aN] = nil
		end
	end
end))
w:GiveSignal(b.InputEnded:Connect(function(aL)
	if aL.KeyCode ~= Enum.KeyCode.Unknown then
		aE[aL.KeyCode.Name] = nil
	end
	for aM, aN in next, aD do
		if aN.Alive() then
			aN.OnEnded(aL)
		else
			aD[aM] = nil
		end
	end
end))
local aL = {}
do
	local aM = {}
	function aM:AddColorPicker(aN, aO)
		local aP, aQ = self, self.TextLabel
		local aR = self.AddonHolder or aQ
		assert(aO.Default, "AddColorPicker: Missing default value.")
		local aS = (aQ and type(aQ.Text) == "string" and aQ.Text ~= "") and aQ.Text or nil
		local aT = {
			Value = aO.Default,
			Transparency = aO.Transparency or 0,
			Type = "ColorPicker",
			Title = type(aO.Title) == "string" and aO.Title or aS or "Color picker",
			Text = type(aO.Title) == "string" and aO.Title or aS or "Color picker",
			Callback = aO.Callback or function(aT) end,
		}
		function aT:SetHSVFromRGB(aU)
			local aV, aW, aX = Color3.toHSV(aU)
			aT.Hue = aV
			aT.Sat = aW
			aT.Vib = aX
		end
		aT:SetHSVFromRGB(aT.Value)
		local aU = w:Create(
			"Frame",
			{
				BackgroundColor3 = aT.Value,
				BorderSizePixel = 0,
				Size = UDim2.fromOffset(x and 40 or 32, x and 20 or 15),
				ZIndex = 10,
				Parent = aR,
			}
		)
		T(aU, 4)
		local aV, aW, aX, aY, aZ =
			w:Create(
				"UIStroke",
				{ Color = w:GetDarkerColor(aT.Value), Thickness = 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Parent = aU }
			),
			x and 262 or 226,
			x and 160 or 132,
			x and 18 or 12,
			x and 26 or 22
		local a_ = 34 + aX + 8 + aY + 8 + aZ + 10 + (aO.Transparency and (aY + 8) or 0)
		local a0 = w:Create(
			"Frame",
			{
				Name = "Color",
				BackgroundColor3 = w.MainColor,
				BorderSizePixel = 0,
				Size = UDim2.fromOffset(aW, a_),
				Visible = false,
				ZIndex = 220,
				Parent = s,
			}
		)
		T(a0, 7)
		U(a0, "OutlineColor")
		w:AddToRegistry(a0, { BackgroundColor3 = "MainColor" })
		local function a1()
			local a2 = s.AbsoluteSize
			local a3, a4 =
				math.clamp(aU.AbsolutePosition.X + aU.AbsoluteSize.X - aW, 8, math.max(8, a2.X - aW - 8)),
				aU.AbsolutePosition.Y + aU.AbsoluteSize.Y + 6
			if a4 + a_ > a2.Y - 8 then
				a4 = math.max(8, aU.AbsolutePosition.Y - a_ - 6)
			end
			a0.Position = UDim2.fromOffset(a3, a4)
		end
		n(aU, "AbsolutePosition", a1)
		w:CreateLabel({
			Position = UDim2.fromOffset(12, 9),
			Size = UDim2.new(1, -70, 0, 16),
			TextSize = L,
			Font = w.FontMedium,
			Text = aT.Title,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 222,
			Parent = a0,
		})
		local a2 = w:Create(
			"TextButton",
			{
				AnchorPoint = Vector2.new(1, 0),
				BackgroundColor3 = w.BackgroundColor,
				BorderSizePixel = 0,
				Position = UDim2.new(1, -12, 0, 7),
				Size = UDim2.fromOffset(44, 19),
				Font = w.FontMedium,
				Text = "AUTO",
				TextColor3 = w.FontColor,
				TextSize = 11,
				AutoButtonColor = false,
				ZIndex = 222,
				Parent = a0,
			}
		)
		T(a2, 4)
		U(a2, "OutlineColor")
		w:AddToRegistry(a2, { BackgroundColor3 = "BackgroundColor", TextColor3 = "FontColor" })
		local a3 = w:Create(
			"Frame",
			{
				BackgroundColor3 = Color3.fromRGB(255, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.fromOffset(12, 34),
				Size = UDim2.new(1, -24, 0, aX),
				ClipsDescendants = true,
				ZIndex = 222,
				Parent = a0,
			}
		)
		T(a3, 5)
		local a4, a5 =
			w:Create(
				"UIGradient",
				{
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)),
					}),
					Parent = a3,
				}
			),
			w:Create(
				"Frame",
				{ BackgroundColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(1, 0, 1, 0), ZIndex = 223, Parent = a3 }
			)
		w:Create(
			"UIGradient",
			{
				Rotation = 90,
				Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) }),
				Parent = a5,
			}
		)
		local a6 = w:Create(
			"Frame",
			{
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(x and 16 or 12, x and 16 or 12),
				ZIndex = 226,
				Parent = a3,
			}
		)
		T(a6, 8)
		w:Create("UIStroke", { Color = Color3.new(1, 1, 1), Thickness = 2, Parent = a6 })
		local a7 = w:Create(
			"Frame",
			{
				BackgroundColor3 = Color3.new(1, 1, 1),
				BorderSizePixel = 0,
				Position = UDim2.fromOffset(12, 34 + aX + 8),
				Size = UDim2.new(1, -24, 0, aY),
				ZIndex = 222,
				Parent = a0,
			}
		)
		T(a7, math.floor(aY / 2))
		local a8 = {}
		for a9 = 0, 1, 0.1 do
			table.insert(a8, ColorSequenceKeypoint.new(a9, Color3.fromHSV(a9, 1, 1)))
		end
		w:Create("UIGradient", { Color = ColorSequence.new(a8), Parent = a7 })
		local a9 = w:Create(
			"Frame",
			{
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.new(1, 1, 1),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0.5, 0),
				Size = UDim2.fromOffset(x and 8 or 6, aY + 6),
				ZIndex = 224,
				Parent = a7,
			}
		)
		T(a9, 3)
		w:Create("UIStroke", { Color = Color3.fromRGB(20, 20, 20), Thickness = 1, Parent = a9 })
		local ba, bb, bc = nil, nil, 34 + aX + 8 + aY + 8
		if aO.Transparency then
			ba = w:Create(
				"Frame",
				{
					BackgroundColor3 = aT.Value,
					BorderSizePixel = 0,
					Position = UDim2.fromOffset(12, bc),
					Size = UDim2.new(1, -24, 0, aY),
					ZIndex = 222,
					Parent = a0,
				}
			)
			T(ba, math.floor(aY / 2))
			bb = w:Create(
				"Frame",
				{
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0,
					Position = UDim2.new(1, 0, 0.5, 0),
					Size = UDim2.fromOffset(x and 8 or 6, aY + 6),
					ZIndex = 224,
					Parent = ba,
				}
			)
			T(bb, 3)
			w:Create("UIStroke", { Color = Color3.fromRGB(20, 20, 20), Thickness = 1, Parent = bb })
			bc = bc + aY + 8
		end
		local function bd(be, bf, bg)
			local bh = w:Create(
				"Frame",
				{
					BackgroundColor3 = w.BackgroundColor,
					BorderSizePixel = 0,
					Position = UDim2.fromOffset(be, bc),
					Size = UDim2.fromOffset(bf, aZ),
					ZIndex = 222,
					Parent = a0,
				}
			)
			T(bh, 4)
			U(bh, "OutlineColor")
			w:AddToRegistry(bh, { BackgroundColor3 = "BackgroundColor" })
			local bi = w:Create(
				"TextBox",
				{
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(7, 0),
					Size = UDim2.new(1, -10, 1, 0),
					Font = w.Font,
					PlaceholderColor3 = Color3.fromRGB(140, 140, 148),
					PlaceholderText = bg,
					Text = "",
					TextColor3 = w.FontColor,
					TextSize = L,
					TextXAlignment = Enum.TextXAlignment.Left,
					ClearTextOnFocus = false,
					ZIndex = 223,
					Parent = bh,
				}
			)
			w:ApplyTextStroke(bi)
			w:AddToRegistry(bi, { TextColor3 = "FontColor" })
			return bi
		end
		local be = math.floor((aW - 24 - 8) / 2)
		local bf, bg, bh = bd(12, be, "Hex"), bd(12 + be + 8, aW - 24 - be - 8, "R, G, B"), {}
		do
			bh.Options = {}
			bh.Container = w:Create(
				"Frame",
				{ BackgroundColor3 = w.MainColor, BorderSizePixel = 0, ZIndex = 230, Visible = false, Parent = s }
			)
			T(bh.Container, 6)
			U(bh.Container, "OutlineColor")
			w:AddToRegistry(bh.Container, { BackgroundColor3 = "MainColor" })
			bh.Inner = w:Create(
				"Frame",
				{ BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), ZIndex = 231, Parent = bh.Container }
			)
			local bi = aa(bh.Inner, Enum.FillDirection.Vertical, 2)
			V(bh.Inner, 8, 8, 6, 6)
			local function bj()
				bh.Container.Position =
					UDim2.fromOffset(aU.AbsolutePosition.X + aU.AbsoluteSize.X + 6, aU.AbsolutePosition.Y)
			end
			local function bk()
				local bl = 90
				for bm, bn in next, bh.Inner:GetChildren() do
					if bn:IsA("TextLabel") then
						bl = math.max(bl, bn.TextBounds.X)
					end
				end
				bh.Container.Size = UDim2.fromOffset(bl + 20, bi.AbsoluteContentSize.Y + 12)
			end
			n(aU, "AbsolutePosition", bj)
			n(bi, "AbsoluteContentSize", bk)
			task.spawn(bj)
			task.spawn(bk)
			function bh:Show()
				bj()
				self.Container.Visible = true
				w.OpenedFrames[self.Container] = true
			end
			function bh:Hide()
				self.Container.Visible = false
				w.OpenedFrames[self.Container] = nil
			end
			function bh:AddOption(bl, bm)
				if type(bm) ~= "function" then
					bm = function() end
				end
				local bn = w:CreateLabel({
					Active = true,
					Size = UDim2.new(1, 0, 0, x and 24 or 18),
					TextSize = L,
					Text = bl,
					ZIndex = 232,
					Parent = self.Inner,
					TextXAlignment = Enum.TextXAlignment.Left,
				})
				w:OnHighlight(bn, bn, { TextColor3 = "AccentColor" }, { TextColor3 = "FontColor" })
				ag(bn, function()
					bm()
					bh:Hide()
				end)
			end
			bh:AddOption("Copy color", function()
				w.ColorClipboard = aT.Value
				w:Notify("Copied color!", 2)
			end)
			bh:AddOption("Paste color", function()
				if not w.ColorClipboard then
					return w:Notify("You have not copied a color!", 2)
				end
				aT:SetValueRGB(w.ColorClipboard)
			end)
			bh:AddOption("Copy HEX", function()
				pcall(setclipboard, aT.Value:ToHex())
				w:Notify("Copied hex code to clipboard!", 2)
			end)
			bh:AddOption("Copy RGB", function()
				pcall(
					setclipboard,
					table.concat(
						{ math.floor(aT.Value.R * 255), math.floor(aT.Value.G * 255), math.floor(aT.Value.B * 255) },
						", "
					)
				)
				w:Notify("Copied RGB values to clipboard!", 2)
			end)
		end
		local bi, bj = false, nil
		function aT:Display()
			aT.Value = Color3.fromHSV(aT.Hue, aT.Sat, aT.Vib)
			local bk = Color3.fromHSV(aT.Hue, 1, 1)
			a3.BackgroundColor3 = bk
			a4.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
				ColorSequenceKeypoint.new(1, bk),
			})
			aU.BackgroundColor3 = aT.Value
			aU.BackgroundTransparency = aT.Transparency
			if not bi then
				aV.Color = w:GetDarkerColor(aT.Value)
			end
			a6.Position = UDim2.new(aT.Sat, 0, 1 - aT.Vib, 0)
			a9.Position = UDim2.new(aT.Hue, 0, 0.5, 0)
			if ba then
				ba.BackgroundColor3 = aT.Value
				bb.Position = UDim2.new(1 - aT.Transparency, 0, 0.5, 0)
			end
			if not bf:IsFocused() then
				bf.Text = "#" .. aT.Value:ToHex()
			end
			if not bg:IsFocused() then
				bg.Text = table.concat(
					{ math.floor(aT.Value.R * 255), math.floor(aT.Value.G * 255), math.floor(aT.Value.B * 255) },
					", "
				)
			end
			w:SafeCallback(aT.Callback, aT.Value)
			w:SafeCallback(aT.Changed, aT.Value)
		end
		function aT:OnChanged(bk)
			aT.Changed = bk
			bk(aT.Value)
		end
		function aT:Show()
			for bk, bl in next, w.OpenedFrames do
				if bk.Name == "Color" then
					bk.Visible = false
					w.OpenedFrames[bk] = nil
				end
			end
			a1()
			a0.Visible = true
			w.OpenedFrames[a0] = true
		end
		function aT:Hide()
			a0.Visible = false
			w.OpenedFrames[a0] = nil
		end
		function aT:SetValue(bk, bl)
			local bm = Color3.fromHSV(bk[1], bk[2], bk[3])
			aT.Transparency = bl or 0
			aT:SetHSVFromRGB(bm)
			aT:Display()
		end
		function aT:SetValueRGB(bk, bl)
			aT.Transparency = bl or 0
			aT:SetHSVFromRGB(bk)
			aT:Display()
		end
		function aT:SetRainbow(bk)
			bi = not not bk
			aT.Rainbow = bi
			a2.Text = bi and "STOP" or "AUTO"
			a2.BackgroundColor3 = bi and w.AccentColor or w.BackgroundColor
			w:SetRegistry(a2, "BackgroundColor3", bi and "AccentColor" or "BackgroundColor")
			if bj then
				bj:Disconnect()
				for bl = #w.Signals, 1, -1 do
					if w.Signals[bl] == bj then
						table.remove(w.Signals, bl)
					end
				end
				bj = nil
			end
			if bi then
				aV.Color = Color3.new(1, 1, 1)
				aV.Thickness = 2
				bj = j:Connect(function()
					local bl = w.CurrentRainbowHue or 0
					if bl ~= aT.Hue then
						aT.Hue = bl
						aT:Display()
					end
				end)
				w:GiveSignal(bj)
			else
				aV.Thickness = 1
				aV.Color = w:GetDarkerColor(aT.Value)
			end
		end
		a2.MouseButton1Click:Connect(function()
			aT:SetRainbow(not bi)
		end)
		aw(a3, function(bk)
			local bl, bm = a3.AbsolutePosition.X, a3.AbsolutePosition.Y
			aT.Sat = math.clamp((bk.X - bl) / a3.AbsoluteSize.X, 0, 1)
			aT.Vib = 1 - math.clamp((bk.Y - bm) / a3.AbsoluteSize.Y, 0, 1)
			aT:Display()
		end, function()
			w:AttemptSave()
		end)
		aw(a7, function(bk)
			local bl = a7.AbsolutePosition.X
			aT.Hue = math.clamp((bk.X - bl) / a7.AbsoluteSize.X, 0, 1)
			aT:Display()
		end, function()
			w:AttemptSave()
		end)
		if ba then
			aw(ba, function(bk)
				local bl = ba.AbsolutePosition.X
				aT.Transparency = 1 - math.clamp((bk.X - bl) / ba.AbsoluteSize.X, 0, 1)
				aT:Display()
			end, function()
				w:AttemptSave()
			end)
		end
		bf.FocusLost:Connect(function(bk)
			if bk then
				local bl, bm = pcall(Color3.fromHex, bf.Text)
				if bl and typeof(bm) == "Color3" then
					aT.Hue, aT.Sat, aT.Vib = Color3.toHSV(bm)
				end
			end
			aT:Display()
			w:AttemptSave()
		end)
		bg.FocusLost:Connect(function(bk)
			if bk then
				local bl, bm, bn = bg.Text:match("(%d+),%s*(%d+),%s*(%d+)")
				if bl and bm and bn then
					aT.Hue, aT.Sat, aT.Vib = Color3.toHSV(Color3.fromRGB(bl, bm, bn))
				end
			end
			aT:Display()
			w:AttemptSave()
		end)
		ag(aU, function()
			if a0.Visible then
				aT:Hide()
			else
				bh:Hide()
				aT:Show()
			end
		end, function(bk)
			return not w:MouseIsOverOpenedFrame(bk)
		end)
		aU.InputBegan:Connect(function(bk)
			if bk.UserInputType ~= Enum.UserInputType.MouseButton2 then
				return
			end
			if w:MouseIsOverOpenedFrame(bk) then
				return
			end
			bh:Show()
			aT:Hide()
		end)
		ax(aU, function()
			aT:Hide()
			bh:Show()
		end)
		w:GiveSignal(b.InputBegan:Connect(function(bk)
			if ac(bk) then
				if a0.Visible and not w:MouseIsOverFrame(a0, bk) and not w:MouseIsOverFrame(aU, bk) then
					aT:Hide()
				end
				if bh.Container.Visible and not w:MouseIsOverFrame(bh.Container, bk) then
					bh:Hide()
				end
			end
			if bk.UserInputType == Enum.UserInputType.MouseButton2 and bh.Container.Visible then
				if not w:MouseIsOverFrame(bh.Container, bk) and not w:MouseIsOverFrame(aU, bk) then
					bh:Hide()
				end
			end
		end))
		if aP.Addons then
			table.insert(aP.Addons, aT)
		end
		aT:Display()
		aT.DisplayFrame = aU
		u[aN] = aT
		return self
	end
	function aM:AddKeyPicker(aN, aO)
		local aP, aQ = self, self.TextLabel
		local aR = self.AddonHolder or aQ
		assert(aO.Default, "AddKeyPicker: Missing default value.")
		local aS = {
			Value = aO.Default,
			Toggled = false,
			Mode = aO.Mode or "Toggle",
			Type = "KeyPicker",
			Text = aO.Text or ((aQ and type(aQ.Text) == "string" and aQ.Text ~= "") and aQ.Text) or "Keybind",
			Callback = aO.Callback or function(aS) end,
			ChangedCallback = aO.ChangedCallback or function(aS) end,
			SyncToggleState = aO.SyncToggleState or false,
		}
		if aS.SyncToggleState then
			aO.Modes = { "Toggle", "Unbind" }
			aO.Mode = "Toggle"
		end
		local aT = w:Create(
			"Frame",
			{ BackgroundColor3 = w.BackgroundColor, BorderSizePixel = 0, Size = UDim2.fromOffset(I, J), ZIndex = 10, Parent = aR }
		)
		T(aT, 4)
		local aU = U(aT, "OutlineColor")
		w:AddToRegistry(aT, { BackgroundColor3 = "BackgroundColor" })
		w:OnHighlight(aT, aU, { Color = "AccentColor" }, { Color = "OutlineColor" })
		local aV = w:CreateLabel({
			Size = UDim2.new(1, -4, 1, 0),
			Position = UDim2.fromOffset(2, 0),
			TextSize = 12,
			Font = w.FontMedium,
			Text = aO.Default,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 12,
			Parent = aT,
		})
		local function aW()
			local aX = w:GetTextBounds(aV.Text, w.FontMedium, 12)
			aT.Size = UDim2.fromOffset(math.clamp(aX + 14, I, 90), J)
		end
		aV:GetPropertyChangedSignal("Text"):Connect(aW)
		aW()
		local aX, aY = aO.Modes or { "Always", "Toggle", "Hold", "Unbind" }, x and 26 or 20
		local aZ = #aX + (x and 1 or 0)
		local a_ = w:Create(
			"Frame",
			{
				Name = "ModeSelect",
				BackgroundColor3 = w.MainColor,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				Size = UDim2.fromOffset(x and 96 or 78, (aZ * aY) + 10),
				Visible = false,
				ZIndex = 230,
				Parent = s,
			}
		)
		T(a_, 6)
		U(a_, "OutlineColor")
		w:AddToRegistry(a_, { BackgroundColor3 = "MainColor" })
		aa(a_, Enum.FillDirection.Vertical, 0)
		V(a_, 6, 6, 5, 5)
		local function a0()
			local a1 = s.AbsoluteSize
			local a2, a3 =
				math.clamp(aT.AbsolutePosition.X + aT.AbsoluteSize.X + 6, 8, math.max(8, a1.X - a_.AbsoluteSize.X - 8)),
				math.clamp(aT.AbsolutePosition.Y, 8, math.max(8, a1.Y - a_.AbsoluteSize.Y - 8))
			a_.Position = UDim2.fromOffset(a2, a3)
		end
		n(aT, "AbsolutePosition", a0)
		local a1, a2, a3 =
			nil,
			nil,
			w:Create(
				"Frame",
				{ BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), Visible = false, ZIndex = 110, Parent = w.KeybindContainer }
			)
		local a4 = w:Create(
			"Frame",
			{
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = w.AccentColor,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0.5, 0),
				Size = UDim2.new(0, 2, 0, 0),
				ZIndex = 111,
				Parent = a3,
			}
		)
		T(a4, 1)
		w:AddToRegistry(a4, { BackgroundColor3 = "AccentColor" }, true)
		local a5, a6 =
			w:CreateLabel(
				{
					TextXAlignment = Enum.TextXAlignment.Left,
					Position = UDim2.fromOffset(9, 0),
					Size = UDim2.new(0, 40, 1, 0),
					TextSize = L,
					Font = w.FontMedium,
					TextTruncate = Enum.TextTruncate.AtEnd,
					ZIndex = 112,
					Parent = a3,
				},
				true
			),
			w:CreateLabel(
				{
					TextXAlignment = Enum.TextXAlignment.Left,
					Position = UDim2.fromOffset(55, 0),
					Size = UDim2.new(1, -55, 1, 0),
					TextSize = L,
					TextTruncate = Enum.TextTruncate.AtEnd,
					ZIndex = 112,
					Parent = a3,
				},
				true
			)
		a3:SetAttribute("Keybind", true)
		local a7 = {}
		for a8, a9 in next, aX do
			local ba, bb =
				{},
				ai({
					BackgroundColor3 = w.AccentColor,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, aY),
					ZIndex = 231,
					Parent = a_,
				})
			T(bb, O)
			w:AddToRegistry(bb, { BackgroundColor3 = "AccentColor" })
			local bc = w:CreateLabel({
				Active = false,
				Position = UDim2.fromOffset(5, 0),
				Size = UDim2.new(1, -8, 1, 0),
				TextSize = L,
				Text = a9,
				TextXAlignment = Enum.TextXAlignment.Left,
				ZIndex = 232,
				Parent = bb,
			})
			ah(bb, function()
				X(bb, 0.13, { BackgroundTransparency = 0.88 })
			end, function()
				X(bb, 0.13, { BackgroundTransparency = 1 })
			end)
			if a9 == "Unbind" then
				w:RemoveFromRegistry(bc)
				bc.TextColor3 = w.RiskColor
				w:AddToRegistry(bc, { TextColor3 = "RiskColor" })
			end
			function ba:Select()
				for bd, be in next, a7 do
					be:Deselect()
				end
				aS.Mode = a9
				bc.TextColor3 = w.AccentColor
				w:SetRegistry(bc, "TextColor3", "AccentColor")
				if a1 then
					a1()
				end
			end
			function ba:Deselect()
				aS.Mode = nil
				bc.TextColor3 = w.FontColor
				w:SetRegistry(bc, "TextColor3", "FontColor")
			end
			ag(bb, function()
				if a9 == "Unbind" then
					aS.Value = "None"
					aV.Text = "None"
					aS.Toggled = false
					a1()
					aS:Update()
					w:SafeCallback(aS.ChangedCallback, "None")
					w:SafeCallback(aS.Changed, "None")
					w:AttemptSave()
				else
					ba:Select()
					w:AttemptSave()
				end
			end)
			if a9 == aS.Mode then
				ba:Select()
			end
			if a9 ~= "Unbind" then
				a7[a9] = ba
			end
		end
		local a8
		function aS:SetMobileButton(a9)
			a9 = not not a9
			if a9 and not aS.MobileButton then
				aS.MobileButton = w:AddMobileButton({
					Text = aS.Text,
					Key = tostring(aN),
					OnHold = function(ba)
						if aS.Mode ~= "Hold" then
							return
						end
						aS.MobileHeld = ba
						aS:Update()
					end,
					OnTap = function()
						if aS.Mode == "Hold" then
							return
						end
						aS.Toggled = not aS.Toggled
						aS:DoClick()
						aS:Update()
					end,
				})
			elseif (not a9) and aS.MobileButton then
				aS.MobileButton:Destroy()
				aS.MobileButton = nil
				aS.MobileHeld = false
			end
			if a8 then
				a8.Text = aS.MobileButton and "Remove Button" or "Add Button"
				a8.TextColor3 = aS.MobileButton and w.AccentColor or w.FontColor
				w:SetRegistry(a8, "TextColor3", aS.MobileButton and "AccentColor" or "FontColor")
			end
			w:SetMobileButtonEnabled(tostring(aN), aS.MobileButton ~= nil)
			aS:Update()
		end
		if x then
			local a9 = ai({
				BackgroundColor3 = w.AccentColor,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 99,
				Size = UDim2.new(1, 0, 0, aY),
				ZIndex = 231,
				Parent = a_,
			})
			T(a9, O)
			w:AddToRegistry(a9, { BackgroundColor3 = "AccentColor" })
			a8 = w:CreateLabel({
				Active = false,
				Position = UDim2.fromOffset(5, 0),
				Size = UDim2.new(1, -8, 1, 0),
				TextSize = L,
				Text = "Add Button",
				TextXAlignment = Enum.TextXAlignment.Left,
				ZIndex = 232,
				Parent = a9,
			})
			ag(a9, function()
				aS:SetMobileButton(not aS.MobileButton)
				a1()
			end)
			if w:GetMobileButtonEnabled(tostring(aN)) then
				task.defer(function()
					aS:SetMobileButton(true)
				end)
			end
		end
		function aS:Update()
			if aS.MobileButton then
				aS.MobileButton:SetActive(aS:GetState())
			end
			if aO.NoUI then
				return
			end
			if (not a3.Parent) or not w.KeybindContainer or not w.KeybindContainer.Parent then
				aD[aS] = nil
				return
			end
			local a9, ba = aS:GetState(), x and 22 or 18
			if aS.Value == "None" and not aS.MobileButton then
				if a3.Visible then
					X(a3, 0.18, { Size = UDim2.new(1, 0, 0, 0) })
					X(a6, 0.14, { TextTransparency = 1 })
					X(a4, 0.14, { Size = UDim2.new(0, 2, 0, 0) })
					task.delay(0.2, function()
						if aS.Value == "None" and a3.Visible then
							a3.Visible = false
							aS:Update()
						end
					end)
				end
			else
				a5.Text = string.format("[%s]", aS.Value ~= "None" and aS.Value or "BTN")
				a6.Text = string.format("%s (%s)", aO.Text, aS.Mode)
				if not a3.Visible then
					a3.Size = UDim2.new(1, 0, 0, 0)
					a6.TextTransparency = 1
					a3.Visible = true
					X(a3, 0.22, { Size = UDim2.new(1, 0, 0, ba) })
					X(a6, 0.26, { TextTransparency = 0 })
				end
				if aS._lastState ~= a9 then
					aS._lastState = a9
					X(a4, 0.22, { Size = UDim2.new(0, 2, 0, a9 and (ba - 7) or 0) })
					X(a6, 0.22, { TextColor3 = a9 and w.AccentColor or w.FontColor })
					X(a5, 0.22, { TextColor3 = a9 and w.AccentColor or w.FontColor })
					w:SetRegistry(a6, "TextColor3", a9 and "AccentColor" or "FontColor")
					w:SetRegistry(a5, "TextColor3", a9 and "AccentColor" or "FontColor")
				end
			end
			w:RefreshKeybindList()
		end
		function aS:GetState()
			if aS.MobileHeld then
				return true
			end
			if aS.Value == "None" then
				if aS.MobileButton and aS.Mode ~= "Hold" then
					return aS.Mode == "Always" or aS.Toggled
				end
				return false
			end
			if aS.Mode == "Always" then
				return true
			elseif aS.Mode == "Hold" then
				return aK(aS.Value)
			else
				return aS.Toggled
			end
		end
		function aS:SetValue(a9)
			local ba, bb = a9[1], a9[2]
			aV.Text = ba
			aS.Value = ba
			if a7[bb] then
				a7[bb]:Select()
			end
			aS:Update()
		end
		function aS:OnClick(a9)
			aS.Clicked = a9
		end
		function aS:OnChanged(a9)
			aS.Changed = a9
			a9(aS.Value)
		end
		if aP.Addons then
			table.insert(aP.Addons, aS)
		end
		local a9 = aP.Type == "Toggle" and aO.SyncToggleState ~= false and w.SyncKeybindToggles ~= false
		function aS:DoClick()
			if aP.Type == "Toggle" and (aS.SyncToggleState or (a9 and aS.Mode == "Toggle")) then
				aP:SetValue(not aP.Value)
			end
			w:SafeCallback(aS.Callback, aS.Toggled)
			w:SafeCallback(aS.Clicked, aS.Toggled)
		end
		local ba = (aZ * aY) + 10
		function a1()
			if not a_.Visible then
				return
			end
			w.OpenedFrames[a_] = nil
			X(a_, 0.12, { Size = UDim2.fromOffset(a_.AbsoluteSize.X, 0) })
			task.delay(0.13, function()
				if not w.OpenedFrames[a_] then
					a_.Visible = false
				end
			end)
		end
		function a2()
			for bb in next, w.OpenedFrames do
				if bb.Name == "ModeSelect" and bb ~= a_ then
					bb.Visible = false
					w.OpenedFrames[bb] = nil
				end
			end
			a0()
			a_.Size = UDim2.fromOffset(x and 96 or 78, 0)
			a_.Visible = true
			w.OpenedFrames[a_] = true
			X(a_, 0.16, { Size = UDim2.fromOffset(x and 96 or 78, ba) })
		end
		local bb = false
		local function bc()
			if bb then
				return
			end
			bb = true
			aV.Text = ""
			local bd, be = nil, ""
			task.spawn(function()
				while not bd do
					if be == "..." then
						be = ""
					end
					be = be .. "."
					aV.Text = be
					task.wait(0.4)
				end
			end)
			task.wait(0.2)
			local bf
			bf = b.InputBegan:Connect(function(bg)
				local bh = aJ(bg)
				if not bh then
					return
				end
				bd = true
				bb = false
				aV.Text = bh
				aS.Value = bh
				w:SafeCallback(aS.ChangedCallback, bg.KeyCode or bg.UserInputType)
				w:SafeCallback(aS.Changed, bg.KeyCode or bg.UserInputType)
				w:AttemptSave()
				aS:Update()
				bf:Disconnect()
			end)
		end
		aT.InputBegan:Connect(function(bd)
			if w:MouseIsOverOpenedFrame(bd) then
				return
			end
			if bd.UserInputType == Enum.UserInputType.MouseButton1 then
				task.spawn(bc)
			elseif bd.UserInputType == Enum.UserInputType.MouseButton2 then
				a2()
			end
		end)
		if x then
			ag(aT, a2)
		end
		ax(aT, a2)
		aD[aS] = {
			Alive = function()
				return aT.Parent ~= nil and a3.Parent ~= nil
			end,
			OnBegan = function(bd, be)
				if ac(bd) and a_.Visible then
					if not w:MouseIsOverFrame(a_, bd) and not w:MouseIsOverFrame(aT, bd) then
						a1()
					end
				end
				if aS.Value == "Unknown" or aS.Value == "None" then
					return
				end
				if (not bb) and not be then
					if aS.Mode == "Toggle" then
						if aJ(bd) == aS.Value then
							aS.Toggled = not aS.Toggled
							aS:DoClick()
						end
					end
					aS:Update()
				end
			end,
			OnEnded = function(bd)
				if not bb then
					aS:Update()
				end
			end,
		}
		aS:Update()
		aS.DisplayFrame = aT
		u[aN] = aS
		return self
	end
	aL.__index = aM
	aL.__namecall = function(aN, aO, ...)
		return aM[aO](...)
	end
end
local aM = {}
do
	local aN = {}
	local function aO(aP, aQ, aR, aS)
		aS = aS or 0
		local aT = w:Create(
			"Frame",
			{ BackgroundTransparency = 1, Position = UDim2.fromOffset(aS, 0), Size = UDim2.new(1, -aS, 1, 0), ZIndex = 9, Parent = aQ }
		)
		local aU = w:Create(
			"UIListLayout",
			{
				Padding = UDim.new(0, 4),
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = aT,
			}
		)
		aR.TextTruncate = Enum.TextTruncate.AtEnd
		local function aV()
			local aW = aU.AbsoluteContentSize.X
			aR.Size = UDim2.new(1, -(aS + (aW > 0 and aW + 10 or 4)), 1, 0)
		end
		n(aU, "AbsoluteContentSize", aV)
		task.defer(aV)
		return aT
	end
	local function aP(aQ, aR)
		local aS = w:Create(
			"Frame",
			{ BackgroundColor3 = w.MainColor, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, aQ), ZIndex = aR or 5 }
		)
		T(aS, 5)
		local aT = U(aS, "OutlineColor")
		w:AddToRegistry(aS, { BackgroundColor3 = "MainColor" })
		return aS, aT
	end
	function aN:AddBlank(aQ)
		local aR = self
		w:Create(
			"Frame",
			{ BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, aQ), ZIndex = 1, Parent = aR.Container }
		)
	end
	function aN:AddLabel(aQ, aR)
		local aS, aT = {}, self
		local aU = aT.Container
		local aV = w:Create(
			"Frame",
			{ BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, x and 22 or 18), ZIndex = 5, Parent = aU }
		)
		local aW = w:Create(
			"Frame",
			{
				BackgroundColor3 = w.AccentColor,
				BackgroundTransparency = 0.9,
				BorderSizePixel = 0,
				Position = UDim2.fromOffset(-4, 0),
				Size = UDim2.new(0, 0, 1, 0),
				ZIndex = 4,
				Parent = aV,
			}
		)
		T(aW, 4)
		w:AddToRegistry(aW, { BackgroundColor3 = "AccentColor" })
		local aX = w:CreateLabel({
			Size = UDim2.new(1, 0, 1, 0),
			TextSize = M,
			Text = aQ,
			TextWrapped = aR or false,
			TextYAlignment = aR and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 5,
			Parent = aV,
		})
		aV.MouseEnter:Connect(function()
			X(aW, 0.22, { Size = UDim2.new(1, 8, 1, 0), BackgroundTransparency = 0.93 })
		end)
		aV.MouseLeave:Connect(function()
			X(aW, 0.22, { Size = UDim2.new(0, 0, 1, 0), BackgroundTransparency = 0.9 })
		end)
		local function aY()
			if not aR then
				return
			end
			local aZ = aX.AbsoluteSize.X
			if aZ <= 0 then
				return
			end
			local a_ = select(2, w:GetTextBounds(aX.Text, w.Font, M, Vector2.new(aZ, math.huge)))
			aV.Size = UDim2.new(1, 0, 0, math.max(a_ + 4, x and 22 or 18))
			aT:Resize()
		end
		if aR then
			n(aX, "AbsoluteSize", aY)
			task.defer(aY)
		else
			aS.AddonHolder = aO(aT, aV, aX, 0)
		end
		aS.TextLabel = aX
		aS.Container = aU
		function aS:SetText(aZ)
			aX.Text = w:Translate(aZ)
			w.TextRegistry[aX] = { Original = aZ, Applied = aX.Text }
			aY()
			aT:Resize()
		end
		if not aR then
			setmetatable(aS, aL)
		end
		aT:AddBlank(C)
		aT:Resize()
		return aS
	end
	function aN:AddButton(...)
		local aQ = {}
		local function aR(aS, aT, ...)
			local aU = select(1, ...)
			if type(aU) == "table" then
				aT.Text = aU.Text
				aT.Func = aU.Func
				aT.DoubleClick = aU.DoubleClick
				aT.Tooltip = aU.Tooltip
			else
				aT.Text = select(1, ...)
				aT.Func = select(2, ...)
			end
			assert(type(aT.Func) == "function", "AddButton: `Func` callback is missing.")
		end
		aR("Button", aQ, ...)
		local aS = self
		local aT = aS.Container
		local function aU(aV)
			local aW, aX = aP(z, 5)
			local aY = w:Create(
				"Frame",
				{
					BackgroundColor3 = w.AccentColor,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					ZIndex = 6,
					Parent = aW,
				}
			)
			T(aY, 5)
			w:AddToRegistry(aY, { BackgroundColor3 = "AccentColor" })
			local aZ = w:CreateLabel({
				Size = UDim2.new(1, -8, 1, 0),
				Position = UDim2.fromOffset(4, 0),
				TextSize = L,
				Font = w.FontMedium,
				Text = aV.Text,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ZIndex = 8,
				Parent = aW,
			})
			ah(aW, function()
				aX.Color = w.AccentColor
				w:SetRegistry(aX, "Color", "AccentColor")
				X(aY, 0.14, { BackgroundTransparency = 0.88 })
			end, function()
				aX.Color = w.OutlineColor
				w:SetRegistry(aX, "Color", "OutlineColor")
				X(aY, 0.14, { BackgroundTransparency = 1 })
			end)
			aW.InputBegan:Connect(function(a_)
				if ac(a_) then
					X(aY, 0.06, { BackgroundTransparency = 0.78 })
				end
			end)
			aW.InputEnded:Connect(function(a_)
				if ac(a_) then
					X(aY, 0.16, { BackgroundTransparency = 1 })
				end
			end)
			return aW, aY, aZ
		end
		local function aV(aW)
			local function aX(aY, aZ, a_)
				local a0 = Instance.new("BindableEvent")
				local a1 = aY:Once(function(...)
					if type(a_) == "function" and a_(...) then
						a0:Fire(true)
					else
						a0:Fire(false)
					end
				end)
				task.delay(aZ, function()
					a1:disconnect()
					a0:Fire(false)
				end)
				return a0.Event:Wait()
			end
			local function aY(aZ)
				if w:MouseIsOverOpenedFrame(aZ) then
					return false
				end
				return ac(aZ)
			end
			ag(aW.Outer, function(aZ)
				if aW.Locked then
					return
				end
				if aW.DoubleClick then
					w:RemoveFromRegistry(aW.Label)
					w:AddToRegistry(aW.Label, { TextColor3 = "AccentColor" })
					aW.Label.TextColor3 = w.AccentColor
					aW.Label.Text = "Are you sure?"
					aW.Locked = true
					local a_ = aX(aW.Outer.InputBegan, 0.5, aY)
					w:RemoveFromRegistry(aW.Label)
					w:AddToRegistry(aW.Label, { TextColor3 = "FontColor" })
					aW.Label.TextColor3 = w.FontColor
					aW.Label.Text = aW.Text
					task.defer(rawset, aW, "Locked", false)
					if a_ then
						w:SafeCallback(aW.Func)
					end
					return
				end
				w:SafeCallback(aW.Func)
			end, aY)
		end
		aQ.Outer, aQ.Inner, aQ.Label = aU(aQ)
		aQ.Outer.Parent = aT
		aV(aQ)
		function aQ:AddTooltip(aW)
			if type(aW) == "string" then
				w:AddToolTip(aW, self.Outer)
			end
			return self
		end
		function aQ:AddButton(...)
			local aW = {}
			aR("SubButton", aW, ...)
			self.Outer.Size = UDim2.new(0.5, -3, 0, z)
			aW.Outer, aW.Inner, aW.Label = aU(aW)
			aW.Outer.Position = UDim2.new(1, 6, 0, 0)
			aW.Outer.Size = UDim2.new(1, 0, 1, 0)
			aW.Outer.Parent = self.Outer
			function aW:AddTooltip(aX)
				if type(aX) == "string" then
					w:AddToolTip(aX, self.Outer)
				end
				return aW
			end
			if type(aW.Tooltip) == "string" then
				aW:AddTooltip(aW.Tooltip)
			end
			aV(aW)
			return aW
		end
		if type(aQ.Tooltip) == "string" then
			aQ:AddTooltip(aQ.Tooltip)
		end
		aS:AddBlank(C)
		aS:Resize()
		return aQ
	end
	function aN:AddDivider()
		local aQ, aR = self, self.Container
		aQ:AddBlank(C)
		local aS =
			w:Create("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 1), ZIndex = 5, Parent = aR })
		local aT = w:Create(
			"Frame",
			{ BackgroundColor3 = w.OutlineColor, BorderSizePixel = 0, Size = UDim2.new(1, 0, 1, 0), ZIndex = 5, Parent = aS }
		)
		w:AddToRegistry(aT, { BackgroundColor3 = "OutlineColor" })
		aQ:AddBlank(C + 2)
		aQ:Resize()
	end
	function aN:AddInput(aQ, aR)
		assert(aR.Text, "AddInput: Missing `Text` string.")
		local aS, aT =
			{
				Value = aR.Default or "",
				Numeric = aR.Numeric or false,
				Finished = aR.Finished or false,
				Type = "Input",
				Text = aR.Text,
				Callback = aR.Callback or function(aS) end,
			},
			self
		local aU = aT.Container
		w:CreateLabel({
			Size = UDim2.new(1, 0, 0, 16),
			TextSize = L,
			Text = aR.Text,
			TextTransparency = 0.2,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 5,
			Parent = aU,
		})
		aT:AddBlank(3)
		local aV, aW = aP(z, 5)
		aV.Parent = aU
		w:OnHighlight(aV, aW, { Color = "AccentColor" }, { Color = "OutlineColor" })
		if type(aR.Tooltip) == "string" then
			w:AddToolTip(aR.Tooltip, aV)
		end
		local aX = w:Create(
			"Frame",
			{
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Position = UDim2.fromOffset(8, 0),
				Size = UDim2.new(1, -14, 1, 0),
				ZIndex = 7,
				Parent = aV,
			}
		)
		local aY = w:Create(
			"TextBox",
			{
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(0, 0),
				Size = UDim2.fromScale(5, 1),
				Font = w.Font,
				PlaceholderColor3 = Color3.fromRGB(140, 140, 148),
				PlaceholderText = aR.Placeholder or "",
				Text = aR.Default or "",
				TextColor3 = w.FontColor,
				TextSize = M,
				TextXAlignment = Enum.TextXAlignment.Left,
				ClearTextOnFocus = (typeof(aR.ClearTextOnFocus) ~= "boolean" and true or aR.ClearTextOnFocus),
				ZIndex = 7,
				Parent = aX,
			}
		)
		w:ApplyTextStroke(aY)
		aY.Focused:Connect(function()
			aW.Color = w.AccentColor
			w:SetRegistry(aW, "Color", "AccentColor")
		end)
		aY.FocusLost:Connect(function()
			aW.Color = w.OutlineColor
			w:SetRegistry(aW, "Color", "OutlineColor")
		end)
		function aS:SetValue(aZ)
			if aR.MaxLength and #aZ > aR.MaxLength then
				aZ = aZ:sub(1, aR.MaxLength)
			end
			if aS.Numeric then
				if (not tonumber(aZ)) and aZ:len() > 0 then
					aZ = aS.Value
				end
			end
			aS.Value = aZ
			aY.Text = aZ
			w:SafeCallback(aS.Callback, aS.Value)
			w:SafeCallback(aS.Changed, aS.Value)
		end
		if aS.Finished then
			aY.FocusLost:Connect(function(aZ)
				if not aZ then
					return
				end
				aS:SetValue(aY.Text)
				w:AttemptSave()
			end)
		else
			aY:GetPropertyChangedSignal("Text"):Connect(function()
				aS:SetValue(aY.Text)
				w:AttemptSave()
			end)
		end
		local function aZ()
			local a_, a0 = 2, aX.AbsoluteSize.X
			if not aY:IsFocused() or aY.TextBounds.X <= a0 - 2 * a_ then
				aY.Position = UDim2.new(0, a_, 0, 0)
			else
				local a1 = aY.CursorPosition
				if a1 ~= -1 then
					local a2 = string.sub(aY.Text, 1, a1 - 1)
					local a3 = c:GetTextSize(a2, aY.TextSize, aY.Font, Vector2.new(math.huge, math.huge)).X
					local a4 = aY.Position.X.Offset + a3
					if a4 < a_ then
						aY.Position = UDim2.fromOffset(a_ - a3, 0)
					elseif a4 > a0 - a_ - 1 then
						aY.Position = UDim2.fromOffset(a0 - a3 - a_ - 1, 0)
					end
				end
			end
		end
		task.spawn(aZ)
		aY:GetPropertyChangedSignal("Text"):Connect(aZ)
		aY:GetPropertyChangedSignal("CursorPosition"):Connect(aZ)
		aY.FocusLost:Connect(aZ)
		aY.Focused:Connect(aZ)
		w:AddToRegistry(aY, { TextColor3 = "FontColor" })
		function aS:OnChanged(a_)
			aS.Changed = a_
			a_(aS.Value)
		end
		aT:AddBlank(C)
		aT:Resize()
		aS.DisplayFrame = aV
		u[aQ] = aS
		return aS
	end
	function aN:AddToggle(aQ, aR)
		assert(aR.Text, "AddToggle: Missing `Text` string.")
		local aS, aT =
			{
				Value = aR.Default or false,
				Type = "Toggle",
				Text = aR.Text,
				Callback = aR.Callback or function(aS) end,
				Addons = {},
				Risky = aR.Risky,
			},
			self
		local aU = aT.Container
		local aV = ai({
			BackgroundColor3 = w.AccentColor,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, y),
			ZIndex = 5,
			Parent = aU,
		})
		T(aV, 4)
		w:AddToRegistry(aV, { BackgroundColor3 = "AccentColor" })
		local aW = w:Create(
			"Frame",
			{
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = w.MainColor,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0.5, 0),
				Size = UDim2.fromOffset(H, H),
				ZIndex = 7,
				Parent = aV,
			}
		)
		T(aW, O)
		local aX = U(aW, "OutlineColor")
		w:AddToRegistry(aW, { BackgroundColor3 = "MainColor" })
		local aY = w:Create(
			"Frame",
			{
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = w.AccentColor,
				BorderSizePixel = 0,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.fromOffset(0, 0),
				ZIndex = 8,
				Parent = aW,
			}
		)
		T(aY, 1)
		w:AddToRegistry(aY, { BackgroundColor3 = "AccentColor" })
		local aZ = w:CreateLabel({
			Size = UDim2.new(1, -(H + 8), 1, 0),
			Position = UDim2.fromOffset(H + 6, 0),
			TextSize = M,
			Text = aR.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 6,
			Parent = aV,
		})
		aS.AddonHolder = aO(aT, aV, aZ, H + 6)
		if type(aR.Tooltip) == "string" then
			w:AddToolTip(aR.Tooltip, aV)
		end
		ah(aV, function()
			X(aV, 0.14, { BackgroundTransparency = 0.9 })
			X(aZ, 0.14, { TextColor3 = w.AccentColor })
		end, function()
			X(aV, 0.14, { BackgroundTransparency = 1 })
			X(aZ, 0.14, { TextColor3 = aS.Risky and w.RiskColor or w.FontColor })
		end)
		function aS:UpdateColors()
			aS:Display()
		end
		function aS:Display()
			if r then
				setthreadcaps(8)
			end
			local a_ = aS.Value
			aX.Color = a_ and w.AccentColorDark or w.OutlineColor
			w:SetRegistry(aX, "Color", a_ and "AccentColorDark" or "OutlineColor")
			if aS._fillTween then
				aS._fillTween:Cancel()
			end
			aS._fillTween = X(aY, 0.13, { Size = a_ and UDim2.fromOffset(H - 4, H - 4) or UDim2.fromOffset(0, 0) })
		end
		function aS:OnChanged(a_)
			aS.Changed = a_
			a_(aS.Value)
		end
		function aS:SetValue(a_)
			a_ = not not a_
			aS.Value = a_
			aS:Display()
			for a0, a1 in next, aS.Addons do
				if a1.Type == "KeyPicker" and a1.SyncToggleState then
					a1.Toggled = a_
					a1:Update()
				end
			end
			w:SafeCallback(aS.Callback, aS.Value)
			w:SafeCallback(aS.Changed, aS.Value)
			w:UpdateDependencyBoxes()
		end
		ag(aV, function()
			aS:SetValue(not aS.Value)
			w:AttemptSave()
		end, function(a_)
			if w:MouseIsOverOpenedFrame(a_) then
				return false
			end
			for a0, a1 in next, aS.Addons do
				if w:MouseIsOverFrame(a1.DisplayFrame, a_) then
					return false
				end
			end
			return true
		end)
		if aS.Risky then
			w:RemoveFromRegistry(aZ)
			aZ.TextColor3 = w.RiskColor
			w:AddToRegistry(aZ, { TextColor3 = "RiskColor" })
		end
		aS:Display()
		aT:AddBlank(aR.BlankSize or C - 2)
		aT:Resize()
		aS.TextLabel = aZ
		aS.Container = aU
		aS.DisplayFrame = aV
		setmetatable(aS, aL)
		t[aQ] = aS
		w:UpdateDependencyBoxes()
		return aS
	end
	function aN:AddSlider(aQ, aR)
		assert(aR.Default, "AddSlider: Missing default value.")
		assert(aR.Text, "AddSlider: Missing slider text.")
		assert(aR.Min, "AddSlider: Missing minimum value.")
		assert(aR.Max, "AddSlider: Missing maximum value.")
		assert(aR.Rounding, "AddSlider: Missing rounding value.")
		local aS, aT =
			{
				Value = aR.Default,
				Min = aR.Min,
				Max = aR.Max,
				Rounding = aR.Rounding,
				MaxSize = 232,
				Type = "Slider",
				Text = aR.Text,
				Callback = aR.Callback or function(aS) end,
			},
			self
		local aU = aT.Container
		if not aR.Compact then
			local aV = w:CreateLabel({
				Size = UDim2.new(1, 0, 0, 16),
				TextSize = L,
				Text = aR.Text,
				TextTransparency = 0.35,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ZIndex = 5,
				Parent = aU,
			})
			if aR.Risky then
				w:RemoveFromRegistry(aV)
				aV.TextColor3 = w.RiskColor
				aV.TextTransparency = 0
				w:AddToRegistry(aV, { TextColor3 = "RiskColor" })
			end
			aT:AddBlank(3)
		end
		local aV = w:Create(
			"Frame",
			{ BackgroundColor3 = w.BackgroundColor, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, A), ZIndex = 5, Parent = aU }
		)
		T(aV, math.floor(A / 2))
		local aW = U(aV, "OutlineColor")
		w:AddToRegistry(aV, { BackgroundColor3 = "BackgroundColor" })
		n(aV, "AbsoluteSize", function()
			aS.MaxSize = aV.AbsoluteSize.X
		end)
		local aX = w:Create(
			"Frame",
			{ BackgroundColor3 = w.AccentColor, BorderSizePixel = 0, Size = UDim2.new(0, 0, 1, 0), ZIndex = 6, Parent = aV }
		)
		T(aX, math.floor(A / 2))
		w:AddToRegistry(aX, { BackgroundColor3 = "AccentColor" })
		local aY = w:Create(
			"Frame",
			{
				BackgroundColor3 = w.AccentColor,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 7,
				Parent = aV,
			}
		)
		T(aY, math.floor(A / 2))
		w:AddToRegistry(aY, { BackgroundColor3 = "AccentColor" })
		aV.MouseEnter:Connect(function()
			X(aY, 0.14, { BackgroundTransparency = 0.9 })
		end)
		aV.MouseLeave:Connect(function()
			X(aY, 0.14, { BackgroundTransparency = 1 })
		end)
		local aZ = w:CreateLabel({
			Size = UDim2.new(1, -10, 1, 0),
			Position = UDim2.fromOffset(5, 0),
			TextSize = L,
			Font = w.FontMedium,
			Text = "",
			TextTransparency = 0.2,
			ZIndex = 9,
			Parent = aV,
		})
		w:OnHighlight(aV, aW, { Color = "AccentColor" }, { Color = "OutlineColor" })
		if type(aR.Tooltip) == "string" then
			w:AddToolTip(aR.Tooltip, aV)
		end
		function aS:UpdateColors()
			aX.BackgroundColor3 = w.AccentColor
		end
		function aS:Display()
			local a_, a0 = aR.Suffix or "", nil
			if aR.HideMax then
				a0 = string.format("%s", aS.Value .. a_)
			else
				a0 = string.format("%s / %s", aS.Value .. a_, aS.Max .. a_)
			end
			if aR.Compact then
				aZ.Text = aR.Text .. ": " .. aS.Value .. a_
			else
				aZ.Text = a0
			end
			local a1 = w:MapValue(aS.Value, aS.Min, aS.Max, 0, 1)
			if aS._fillTween then
				aS._fillTween:Cancel()
			end
			aS._fillTween = X(aX, 0.12, { Size = UDim2.new(a1, 0, 1, 0) })
		end
		function aS:OnChanged(a_)
			aS.Changed = a_
			a_(aS.Value)
		end
		local function a_(a0)
			if aS.Rounding == 0 then
				return math.floor(a0)
			end
			return tonumber(string.format("%." .. aS.Rounding .. "f", a0))
		end
		function aS:GetValueFromXScale(a0)
			return a_(w:MapValue(a0, 0, 1, aS.Min, aS.Max))
		end
		function aS:SetMax(a0)
			assert(a0 > aS.Min, "Max value cannot be less than the current min value.")
			aS.Value = math.clamp(aS.Value, aS.Min, a0)
			aS.Max = a0
			aS:Display()
		end
		function aS:SetMin(a0)
			assert(a0 < aS.Max, "Min value cannot be greater than the current max value.")
			aS.Value = math.clamp(aS.Value, a0, aS.Max)
			aS.Min = a0
			aS:Display()
		end
		function aS:SetValue(a0)
			local a1 = tonumber(a0)
			if not a1 then
				return
			end
			a1 = math.clamp(a1, aS.Min, aS.Max)
			aS.Value = a1
			aS:Display()
			w:SafeCallback(aS.Callback, aS.Value)
			w:SafeCallback(aS.Changed, aS.Value)
		end
		local a0 = {}
		aw(aV, function(a1)
			local a2 = math.clamp((a1.X - aV.AbsolutePosition.X) / math.max(aV.AbsoluteSize.X, 1), 0, 1)
			local a3, a4 = aS:GetValueFromXScale(a2), aS.Value
			aS.Value = a3
			aS:Display()
			if a3 ~= a4 then
				w:SafeCallback(aS.Callback, aS.Value)
				w:SafeCallback(aS.Changed, aS.Value)
			end
		end, function()
			for a1, a2 in pairs(a0) do
				if typeof(a2) == "Instance" and a2:IsA("ScrollingFrame") then
					a2.ScrollingEnabled = true
				end
			end
			a0 = {}
			w:AttemptSave()
		end, function(a1)
			if w:MouseIsOverOpenedFrame(a1) then
				return false
			end
			if w.Window and w.ActiveTab and w.Window.Tabs[w.ActiveTab] then
				a0 = w.Window.Tabs[w.ActiveTab]:GetSides()
			end
			for a2, a3 in pairs(a0) do
				if typeof(a3) == "Instance" and a3:IsA("ScrollingFrame") then
					a3.ScrollingEnabled = false
				end
			end
			return true
		end, "X")
		aS:Display()
		aT:AddBlank(aR.BlankSize or C)
		aT:Resize()
		aS.DisplayFrame = aV
		u[aQ] = aS
		return aS
	end
	function aN:AddDropdown(aQ, aR)
		if aR.SpecialType == "Player" then
			aR.Values = R()
			aR.AllowNull = true
		elseif aR.SpecialType == "Team" then
			aR.Values = S()
			aR.AllowNull = true
		end
		assert(aR.Values, "AddDropdown: Missing dropdown value list.")
		assert(
			aR.AllowNull or aR.Default,
			[[AddDropdown: Missing default value. Pass `AllowNull` as true if this was intentional.]]
		)
		if not aR.Text then
			aR.Compact = true
		end
		local aS, aT =
			{
				Values = aR.Values,
				Value = aR.Multi and {},
				Multi = aR.Multi,
				Type = "Dropdown",
				Text = aR.Text,
				SpecialType = aR.SpecialType,
				Callback = aR.Callback or function(aS) end,
				isOpen = false,
				isAnimating = false,
				SearchBox = nil,
				LastSearchText = "",
				LastScrollPosition = Vector2.new(0, 0),
			},
			self
		local aU = aT.Container
		if not aR.Compact then
			w:CreateLabel({
				Size = UDim2.new(1, 0, 0, 16),
				TextSize = L,
				Text = aR.Text,
				TextTransparency = 0.2,
				TextXAlignment = Enum.TextXAlignment.Left,
				ZIndex = 5,
				Parent = aU,
			})
			aT:AddBlank(3)
		end
		local aV = w:Create(
			"Frame",
			{ BackgroundColor3 = w.MainColor, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, z), ZIndex = 5, Parent = aU }
		)
		T(aV, 5)
		local aW = U(aV, "OutlineColor")
		w:AddToRegistry(aV, { BackgroundColor3 = "MainColor" })
		w:OnHighlight(aV, aW, { Color = "AccentColor" }, { Color = "OutlineColor" })
		local aX = w:Create(
			"Frame",
			{
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundTransparency = 1,
				Position = UDim2.new(1, -10, 0.5, 0),
				Size = UDim2.fromOffset(12, 12),
				ZIndex = 8,
				Parent = aV,
			}
		)
		for aY = 0, 1 do
			local aZ = w:Create(
				"Frame",
				{
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundColor3 = w.FontColor,
					BorderSizePixel = 0,
					Position = UDim2.new(0.5, aY == 0 and -3 or 3, 0.5, 0),
					Rotation = aY == 0 and -45 or 45,
					Size = UDim2.fromOffset(2, 9),
					ZIndex = 9,
					Parent = aX,
				}
			)
			T(aZ, 1)
			w:AddToRegistry(aZ, { BackgroundColor3 = "FontColor" })
		end
		local aY = w:CreateLabel({
			Position = UDim2.fromOffset(8, 0),
			Size = UDim2.new(1, -32, 1, 0),
			TextSize = M,
			Text = "--",
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 7,
			Parent = aV,
		})
		if type(aR.Tooltip) == "string" then
			w:AddToolTip(aR.Tooltip, aV)
		end
		local aZ, a_, a0 =
			x and 6 or 8,
			x and 32 or 26,
			w:Create(
				"Frame",
				{
					BackgroundColor3 = w.MainColor,
					BorderSizePixel = 0,
					Size = UDim2.new(0, 0, 0, 0),
					ClipsDescendants = true,
					ZIndex = 210,
					Visible = false,
					Parent = s,
				}
			)
		T(a0, 6)
		U(a0, "OutlineColor")
		w:AddToRegistry(a0, { BackgroundColor3 = "MainColor" })
		local function a1(a2)
			local a3 = math.clamp((a2 or #aS.Values) * B, B, aZ * B) + 8
			if aS.SearchBox then
				a3 = a3 + a_ + 4
			end
			return a3
		end
		local function a2()
			local a3, a4, a5 = s.AbsoluteSize, aV.AbsolutePosition, a1()
			local a6 = a4.Y + aV.AbsoluteSize.Y + 4
			if a6 + a5 > a3.Y - 10 then
				a6 = math.max(10, a4.Y - a5 - 4)
			end
			a0.Position = UDim2.fromOffset(a4.X, a6)
		end
		local function a3(a4)
			a0.Size = UDim2.fromOffset(aV.AbsoluteSize.X, a4 or a1())
		end
		n(aV, "AbsolutePosition", a2)
		local a4 = w:Create(
			"ScrollingFrame",
			{
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, -8, 1, -8),
				Position = UDim2.fromOffset(4, 4),
				ZIndex = 211,
				Parent = a0,
				ScrollBarThickness = 3,
				VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ElasticBehavior = Enum.ElasticBehavior.Never,
				TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
				BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
				ScrollBarImageColor3 = w.AccentColor,
			}
		)
		w:AddToRegistry(a4, { ScrollBarImageColor3 = "AccentColor" })
		aa(a4, Enum.FillDirection.Vertical, 2)
		function aS:CreateSearchBox()
			if aS.SearchBox then
				return
			end
			local a5 = w:Create(
				"Frame",
				{
					BackgroundColor3 = w.BackgroundColor,
					BorderSizePixel = 0,
					Size = UDim2.new(1, -8, 0, a_),
					Position = UDim2.fromOffset(4, 4),
					ZIndex = 213,
					Parent = a0,
				}
			)
			T(a5, 4)
			U(a5, "OutlineColor")
			w:AddToRegistry(a5, { BackgroundColor3 = "BackgroundColor" })
			aS.SearchHolder = a5
			aS.SearchBox = w:Create(
				"TextBox",
				{
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -14, 1, 0),
					Position = UDim2.fromOffset(8, 0),
					Font = w.Font,
					PlaceholderText = "Search...",
					PlaceholderColor3 = Color3.fromRGB(140, 140, 148),
					Text = aS.LastSearchText or "",
					TextColor3 = w.FontColor,
					TextSize = L,
					TextXAlignment = Enum.TextXAlignment.Left,
					ClearTextOnFocus = false,
					ZIndex = 214,
					Parent = a5,
				}
			)
			w:AddToRegistry(aS.SearchBox, { TextColor3 = "FontColor" })
			aS.SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
				aS.LastSearchText = aS.SearchBox.Text
				aS:BuildDropdownList(aS.SearchBox.Text)
			end)
			a4.Position = UDim2.fromOffset(4, a_ + 8)
			a4.Size = UDim2.new(1, -8, 1, -(a_ + 12))
		end
		function aS:RemoveSearchBox()
			if aS.SearchBox then
				aS.SearchBox:Destroy()
				aS.SearchBox = nil
				if aS.SearchHolder then
					aS.SearchHolder:Destroy()
					aS.SearchHolder = nil
				end
				a4.Position = UDim2.fromOffset(4, 4)
				a4.Size = UDim2.new(1, -8, 1, -8)
			end
		end
		function aS:Display()
			local a5, a6 = aS.Values, ""
			if aR.Multi then
				for a7, a8 in next, a5 do
					if aS.Value[a8] then
						a6 = a6 .. a8 .. ", "
					end
				end
				a6 = a6:sub(1, #a6 - 2)
			else
				a6 = aS.Value or ""
			end
			aY.Text = (a6 == "" and "--" or a6)
		end
		function aS:GetActiveValues()
			if aR.Multi then
				local a5 = {}
				for a6, a7 in next, aS.Value do
					table.insert(a5, a6)
				end
				return a5
			else
				return aS.Value and 1 or 0
			end
		end
		function aS:BuildDropdownList(a5)
			if not aS.isOpen then
				aS.ListDirty = true
				aS:Display()
				return
			end
			aS.ListDirty = false
			aS.LastScrollPosition = a4.CanvasPosition
			local a6, a7 = aS.Values, {}
			for a8, a9 in next, a4:GetChildren() do
				if not a9:IsA("UIListLayout") then
					a9:Destroy()
				end
			end
			local a8 = 0
			for a9, ba in next, a6 do
				if a5 and a5 ~= "" then
					if not string.find(string.lower(ba), string.lower(a5), 1, true) then
						continue
					end
				end
				local bb = {}
				a8 = a8 + 1
				local bc = ai({
					BackgroundColor3 = w.AccentColor,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, B - 2),
					ZIndex = 213,
					Parent = a4,
				})
				T(bc, 4)
				w:AddToRegistry(bc, { BackgroundColor3 = "AccentColor" })
				local bd = w:Create(
					"Frame",
					{
						AnchorPoint = Vector2.new(0, 0.5),
						BackgroundColor3 = w.AccentColor,
						BorderSizePixel = 0,
						Position = UDim2.new(0, 3, 0.5, 0),
						Size = UDim2.new(0, 2, 0, 0),
						ZIndex = 215,
						Parent = bc,
					}
				)
				T(bd, 1)
				w:AddToRegistry(bd, { BackgroundColor3 = "AccentColor" })
				local be, bf =
					w:CreateLabel({
						Active = false,
						Size = UDim2.new(1, -16, 1, 0),
						Position = UDim2.fromOffset(11, 0),
						TextSize = M,
						Text = ba,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd,
						ZIndex = 215,
						Parent = bc,
					}),
					nil
				if aR.Multi then
					bf = aS.Value[ba]
				else
					bf = aS.Value == ba
				end
				function bb:UpdateButton()
					if aR.Multi then
						bf = aS.Value[ba]
					else
						bf = aS.Value == ba
					end
					be.TextColor3 = bf and w.AccentColor or w.FontColor
					w:SetRegistry(be, "TextColor3", bf and "AccentColor" or "FontColor")
					bc.BackgroundTransparency = bf and 0.9 or 1
					bd.Size = UDim2.new(0, 2, 0, bf and (B - 12) or 0)
				end
				ah(bc, function()
					if not bf then
						X(bc, 0.12, { BackgroundTransparency = 0.95 })
					end
				end, function()
					X(bc, 0.12, { BackgroundTransparency = bf and 0.9 or 1 })
				end)
				ag(bc, function()
					local bg = not bf
					if aS:GetActiveValues() == 1 and not bg and not aR.AllowNull then
						return
					end
					if aR.Multi then
						bf = bg
						if bf then
							aS.Value[ba] = true
						else
							aS.Value[ba] = nil
						end
					else
						bf = bg
						if bf then
							aS.Value = ba
						else
							aS.Value = nil
						end
						for bh, bi in next, a7 do
							bi:UpdateButton()
						end
					end
					bb:UpdateButton()
					aS:Display()
					w:UpdateDependencyBoxes()
					w:SafeCallback(aS.Callback, aS.Value)
					w:SafeCallback(aS.Changed, aS.Value)
					w:AttemptSave()
					if not aR.Multi then
						task.delay(0.1, function()
							aS:CloseDropdown()
						end)
					end
				end)
				bb:UpdateButton()
				a7[bc] = bb
			end
			a4.CanvasSize = UDim2.fromOffset(0, a8 * B)
			aS:Display()
			if aS.isOpen then
				a3(a1(a8))
			end
			task.defer(function()
				a4.CanvasPosition = aS.LastScrollPosition
			end)
		end
		function aS:SetValues(a5)
			if a5 then
				aS.Values = a5
			end
			if #aS.Values > 10 or aS.SpecialType == "Player" then
				aS:CreateSearchBox()
			else
				aS:RemoveSearchBox()
			end
			aS:BuildDropdownList(aS.LastSearchText)
		end
		function aS:OpenDropdown()
			if aS.isAnimating or aS.isOpen then
				return
			end
			for a5, a6 in pairs(u) do
				if a6.Type == "Dropdown" and a6 ~= aS then
					a6:CloseDropdown()
				end
			end
			aS.isOpen = true
			aS.isAnimating = true
			if (#aS.Values > 10 or aS.SpecialType == "Player") and not aS.SearchBox then
				aS:CreateSearchBox()
			end
			if aS.ListDirty then
				aS:BuildDropdownList(aS.LastSearchText)
			end
			a2()
			if aS._sizeTween then
				aS._sizeTween:Cancel()
			end
			if aS._arrowTween then
				aS._arrowTween:Cancel()
			end
			a0.Size = UDim2.fromOffset(aV.AbsoluteSize.X, 0)
			a0.Visible = true
			if aS.SearchBox then
				aS.SearchBox.Text = aS.LastSearchText or ""
			end
			aS._sizeTween = X(a0, 0.18, { Size = UDim2.fromOffset(aV.AbsoluteSize.X, a1()) }, Enum.EasingStyle.Quint)
			aS._arrowTween = X(aX, 0.18, { Rotation = 180 }, Enum.EasingStyle.Quint)
			if aS._openConnection then
				aS._openConnection:Disconnect()
			end
			aS._openConnection = aS._sizeTween.Completed:Connect(function()
				aS.isAnimating = false
				if aS._openConnection then
					aS._openConnection:Disconnect()
					aS._openConnection = nil
				end
			end)
			w.OpenedFrames[a0] = true
		end
		function aS:CloseDropdown()
			if aS.isAnimating or not aS.isOpen then
				return
			end
			if aS.SearchBox then
				aS.SearchBox:ReleaseFocus()
			end
			aS.isOpen = false
			aS.isAnimating = true
			if aS._sizeTween then
				aS._sizeTween:Cancel()
			end
			if aS._arrowTween then
				aS._arrowTween:Cancel()
			end
			aS._sizeTween = X(
				a0,
				0.14,
				{ Size = UDim2.fromOffset(aV.AbsoluteSize.X, 0) },
				Enum.EasingStyle.Quint,
				Enum.EasingDirection.In
			)
			aS._arrowTween = X(aX, 0.14, { Rotation = 0 }, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
			if aS._closeConnection then
				aS._closeConnection:Disconnect()
			end
			aS._closeConnection = aS._sizeTween.Completed:Connect(function()
				a0.Visible = false
				w.OpenedFrames[a0] = nil
				aS.isAnimating = false
				if aS._closeConnection then
					aS._closeConnection:Disconnect()
					aS._closeConnection = nil
				end
			end)
		end
		function aS:OnChanged(a5)
			aS.Changed = a5
			a5(aS.Value)
		end
		function aS:SetValue(a5)
			if aS.Multi then
				local a6 = {}
				for a7, a8 in next, a5 do
					if table.find(aS.Values, a7) then
						a6[a7] = true
					end
				end
				aS.Value = a6
			else
				if not a5 then
					aS.Value = nil
				elseif table.find(aS.Values, a5) then
					aS.Value = a5
				end
			end
			aS:BuildDropdownList()
			w:SafeCallback(aS.Callback, aS.Value)
			w:SafeCallback(aS.Changed, aS.Value)
		end
		ag(aV, function()
			if aS.isOpen then
				aS:CloseDropdown()
			else
				aS:OpenDropdown()
			end
		end, function(a5)
			return aS.isOpen or (not w:MouseIsOverOpenedFrame(a5))
		end)
		w:GiveSignal(b.InputBegan:Connect(function(a5)
			if not ac(a5) then
				return
			end
			if not aS.isOpen then
				return
			end
			if not w:MouseIsOverFrame(a0, a5) and not w:MouseIsOverFrame(aV, a5) then
				aS:CloseDropdown()
			end
		end))
		aS:BuildDropdownList()
		aS:Display()
		local a5 = {}
		if type(aR.Default) == "string" then
			local a6 = table.find(aS.Values, aR.Default)
			if a6 then
				table.insert(a5, a6)
			end
		elseif type(aR.Default) == "table" then
			for a6, a7 in next, aR.Default do
				local a8 = table.find(aS.Values, a7)
				if a8 then
					table.insert(a5, a8)
				end
			end
		elseif type(aR.Default) == "number" and aS.Values[aR.Default] ~= nil then
			table.insert(a5, aR.Default)
		end
		if next(a5) then
			for a6 = 1, #a5 do
				local a7 = a5[a6]
				if aR.Multi then
					aS.Value[aS.Values[a7]] = true
				else
					aS.Value = aS.Values[a7]
				end
				if not aR.Multi then
					break
				end
			end
			if aR.Multi or #aS.Values > 10 or aS.SpecialType == "Player" then
				aS:CreateSearchBox()
			end
			aS:BuildDropdownList()
			aS:Display()
		end
		aS.DisplayFrame = aV
		aT:AddBlank(aR.BlankSize or C)
		aT:Resize()
		u[aQ] = aS
		return aS
	end
	function aN:AddDependencyBox()
		local aQ, aR = { Dependencies = {} }, self
		local aS = aR.Container
		local aT = w:Create(
			"Frame",
			{ BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), Visible = false, Parent = aS }
		)
		local aU =
			w:Create("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Visible = true, Parent = aT })
		local aV = aa(aU, Enum.FillDirection.Vertical, 0)
		function aQ:Resize()
			aT.Size = UDim2.new(1, 0, 0, aV.AbsoluteContentSize.Y)
			aR:Resize()
		end
		n(aV, "AbsoluteContentSize", function()
			aQ:Resize()
		end)
		aT:GetPropertyChangedSignal("Visible"):Connect(function()
			aQ:Resize()
		end)
		function aQ:Update()
			for aW, aX in next, aQ.Dependencies do
				local aY, aZ = aX[1], aX[2]
				if if aY.Multi then not table.find(aY:GetActiveValues(), aZ) else aY.Value ~= aZ then
					aT.Visible = false
					aQ:Resize()
					return
				end
			end
			aT.Visible = true
			aQ:Resize()
		end
		function aQ:SetupDependencies(aW)
			for aX, aY in next, aW do
				assert(type(aY) == "table", "SetupDependencies: Dependency is not of type `table`.")
				assert(aY[1], "SetupDependencies: Dependency is missing element argument.")
				assert(aY[2] ~= nil, "SetupDependencies: Dependency is missing value argument.")
			end
			aQ.Dependencies = aW
			aQ:Update()
		end
		aQ.Container = aU
		setmetatable(aQ, aM)
		table.insert(w.DependencyBoxes, aQ)
		return aQ
	end
	aM.__index = aN
	aM.__namecall = function(aQ, aR, ...)
		return aN[aR](...)
	end
end
do
	w.NotificationArea = w:Create(
		"Frame",
		{ BackgroundTransparency = 1, Position = UDim2.new(0, 12, 0, 48), Size = UDim2.new(0, 340, 0, 400), ZIndex = 100, Parent = s }
	)
	aa(w.NotificationArea, Enum.FillDirection.Vertical, 6)
	local aN = w:Create(
		"Frame",
		{
			BackgroundColor3 = w.MainColor,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 12, 0, 12),
			Size = UDim2.new(0, 213, 0, 26),
			ZIndex = 200,
			Visible = false,
			Parent = s,
		}
	)
	T(aN, 6)
	U(aN, "OutlineColor")
	w:AddToRegistry(aN, { BackgroundColor3 = "MainColor" }, true)
	local aO = w:Create(
		"Frame",
		{
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = w.AccentColor,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 9, 0.5, 0),
			Size = UDim2.fromOffset(4, 4),
			ZIndex = 202,
			Parent = aN,
		}
	)
	T(aO, 4)
	w:AddToRegistry(aO, { BackgroundColor3 = "AccentColor" }, true)
	local aP = w:CreateLabel(
		{
			Position = UDim2.new(0, 19, 0, 0),
			Size = UDim2.new(1, -24, 1, 0),
			TextSize = L,
			Font = w.FontMedium,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 203,
			Parent = aN,
		},
		true
	)
	w.Watermark = aN
	w.WatermarkText = aP
	w:MakeDraggable(w.Watermark)
	local aQ = w:Create(
		"Frame",
		{
			AnchorPoint = Vector2.new(0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 12, 0.5, -30),
			Size = UDim2.new(0, 190, 0, 40),
			Visible = false,
			ZIndex = 98,
			Parent = s,
		}
	)
	local aR = w:Create(
		"Frame",
		{
			BackgroundColor3 = w.MainColor,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = 100,
			Parent = aQ,
		}
	)
	T(aR, 6)
	U(aR, "OutlineColor")
	w:AddToRegistry(aR, { BackgroundColor3 = "MainColor" }, true)
	local aS = w:Create(
		"Frame",
		{
			BackgroundColor3 = w.BackgroundColor,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 0, x and 28 or 24),
			ZIndex = 101,
			Parent = aR,
		}
	)
	w:AddToRegistry(aS, { BackgroundColor3 = "BackgroundColor" }, true)
	local aT = w:Create(
		"Frame",
		{
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = w.AccentColor,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 10, 0.5, 0),
			Size = UDim2.fromOffset(2, 11),
			ZIndex = 103,
			Parent = aS,
		}
	)
	T(aT, 1)
	w:AddToRegistry(aT, { BackgroundColor3 = "AccentColor" }, true)
	w:CreateLabel(
		{
			Size = UDim2.new(1, -26, 1, 0),
			Position = UDim2.fromOffset(18, 0),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextSize = L,
			Font = w.FontMedium,
			Text = "Keybinds",
			ZIndex = 104,
			Parent = aS,
		},
		true
	)
	local aU = w:Create(
		"Frame",
		{
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = w.OutlineColor,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 1, 0),
			Size = UDim2.new(1, 0, 0, 1),
			ZIndex = 103,
			Parent = aS,
		}
	)
	w:AddToRegistry(aU, { BackgroundColor3 = "OutlineColor" }, true)
	local aV = w:Create(
		"TextButton",
		{
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -8, 0.5, 0),
			Size = UDim2.fromOffset(18, 18),
			Text = "",
			ZIndex = 105,
			Parent = aS,
		}
	)
	local aW = w:Create(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.fromOffset(10, 10),
			ZIndex = 105,
			Parent = aV,
		}
	)
	for aX = 0, 1 do
		local aY = w:Create(
			"Frame",
			{
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = w.FontColor,
				BorderSizePixel = 0,
				Position = UDim2.new(0.5, aX == 0 and -2 or 2, 0.5, 0),
				Rotation = aX == 0 and -45 or 45,
				Size = UDim2.fromOffset(2, 7),
				ZIndex = 106,
				Parent = aW,
			}
		)
		T(aY, 1)
		w:AddToRegistry(aY, { BackgroundColor3 = "FontColor" }, true)
	end
	local aX = w:Create(
		"Frame",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -20, 1, -(x and 34 or 30)),
			Position = UDim2.new(0, 10, 0, x and 32 or 28),
			ZIndex = 101,
			Parent = aR,
		}
	)
	aa(aX, Enum.FillDirection.Vertical, 0)
	w.KeybindFrame = aQ
	w.KeybindContainer = aX
	w.KeybindCollapsed = false
	w.KeybindGrowth = "Down"
	local aY = false
	function w:RefreshKeybindList()
		if aY then
			return
		end
		aY = true
		task.defer(function()
			aY = false
			local aZ, a_, a0, a1, a2 = x and 22 or 18, 0, 0, 0, {}
			for a3, a4 in next, aX:GetChildren() do
				if a4:IsA("Frame") and a4.Visible then
					a_ = a_ + aZ
					local a5, a6
					for a7, a8 in next, a4:GetChildren() do
						if a8:IsA("TextLabel") then
							if a8.Position.X.Offset < 20 then
								a5 = a8
							else
								a6 = a8
							end
						end
					end
					if a5 and a6 then
						table.insert(a2, { Key = a5, Name = a6 })
						local a7, a8 =
							a5:GetAttribute("MeasuredFor") == a5.Text and a5:GetAttribute("Measured"),
							a6:GetAttribute("MeasuredFor") == a6.Text and a6:GetAttribute("Measured")
						if not a7 then
							a7 = w:GetTextBounds(a5.Text, a5.Font, a5.TextSize)
							a5:SetAttribute("Measured", a7)
							a5:SetAttribute("MeasuredFor", a5.Text)
						end
						if not a8 then
							a8 = w:GetTextBounds(a6.Text, a6.Font, a6.TextSize)
							a6:SetAttribute("Measured", a8)
							a6:SetAttribute("MeasuredFor", a6.Text)
						end
						if a7 > a0 then
							a0 = a7
						end
						if a8 > a1 then
							a1 = a8
						end
					end
				end
			end
			local a3 = math.clamp(a0 + 18, 44, 110)
			for a4, a5 in ipairs(a2) do
				a5.Key.Size = UDim2.new(0, a3 - 14, 1, 0)
				a5.Name.Position = UDim2.fromOffset(a3, 0)
				a5.Name.Size = UDim2.new(1, -a3, 1, 0)
			end
			local a4, a5, a6 =
				math.clamp(a3 + a1 + 24, 200, 340),
				w.KeybindCollapsed and (x and 28 or 24) or (a_ + (x and 44 or 38)),
				w.KeybindGrowth == "Up" and 1 or 0
			if aQ.AnchorPoint.Y ~= a6 then
				local a7, a8 = aQ.AbsolutePosition.Y + (a6 * aQ.AbsoluteSize.Y), aQ.Parent
				aQ.AnchorPoint = Vector2.new(0, a6)
				aQ.Position = UDim2.new(0, aQ.Position.X.Offset, 0, a7 - (a8 and a8.AbsolutePosition.Y or 0))
			end
			X(aQ, 0.22, { Size = UDim2.fromOffset(a4, a5) })
		end)
	end
	function w:SetKeybindCollapsed(aZ)
		w.KeybindCollapsed = not not aZ
		aX.Visible = not w.KeybindCollapsed
		X(aW, 0.18, { Rotation = w.KeybindCollapsed and 180 or 0 }, Enum.EasingStyle.Quint)
		for a_, a0 in pairs(u) do
			if a0.Type == "KeyPicker" and a0.Update then
				a0:Update()
				break
			end
		end
		if w.KeybindCollapsed then
			X(w.KeybindFrame, 0.22, { Size = UDim2.fromOffset(w.KeybindFrame.AbsoluteSize.X, x and 28 or 24) })
		end
	end
	aV.MouseButton1Click:Connect(function()
		w:SetKeybindCollapsed(not w.KeybindCollapsed)
	end)
	w:MakeDraggable(aQ)
end
w.Widgets = {}
w.WidgetLayers = {}
w.WidgetLayerTop = 1
w.WidgetGap = 8
local aN, aO, aP = x and 28 or 24, "MsFine/widgets.json", a(game:GetService("HttpService"))
w.WidgetLayout = {}
pcall(function()
	if isfile(aO) then
		local aQ = aP:JSONDecode(readfile(aO))
		if type(aQ) == "table" then
			w.WidgetLayout = aQ
		end
	end
end)
local function aQ()
	for aR, aS in ipairs(w.Widgets) do
		w.WidgetLayout[aS.Key] = {
			Docked = aS.Docked,
			Side = aS.Side,
			Order = aR,
			X = aS.Outer.Position.X.Offset,
			Y = aS.Outer.Position.Y.Offset,
			Collapsed = aS.Collapsed,
		}
	end
	pcall(function()
		if not isfolder("MsFine") then
			makefolder("MsFine")
		end
		writefile(aO, aP:JSONEncode(w.WidgetLayout))
	end)
end
local function aR(aS)
	local aT = w.Window
	local aU = aT and aT.Holder
	if not aU then
		return
	end
	local aV = workspace.CurrentCamera
	local aW, aX, aY, aZ =
		aV and aV.ViewportSize or Vector2.new(1920, 1080),
		w.WidgetGap,
		math.floor(aU.AbsolutePosition.X + 0.5),
		math.floor(aU.AbsolutePosition.Y + 0.5)
	local a_, a0, a1 =
		aY + math.floor(aU.AbsoluteSize.X + 0.5), math.floor(aU.AbsoluteSize.Y + 0.5), { Right = {}, Left = {} }
	for a2, a3 in ipairs(w.Widgets) do
		if a3.Shown and a3.Docked then
			local a4, a5 = a3.Outer.Size.X.Offset, a3.Side == "Left" and "Left" or "Right"
			local a6, a7 = a_ + aX + a4 <= aW.X - 4, aY - aX - a4 >= 4
			if a5 == "Right" and not a6 and a7 then
				a5 = "Left"
			elseif a5 == "Left" and not a7 then
				a5 = "Right"
			end
			if w.IsMobile and not a6 and not a7 and not a3.Cramped then
				a3.Cramped = true
				if not a3.Collapsed then
					task.defer(a3.SetCollapsed, a3, true)
				end
			end
			table.insert(a1[a5], a3)
		end
	end
	for a2, a3 in next, a1 do
		local a4, a5 = 0, 0
		for a6, a7 in ipairs(a3) do
			if a7.Collapsed then
				a4 = a4 + aN
			elseif a7.Flex then
				a5 = a5 + 1
			else
				a4 = a4 + a7.Height
			end
		end
		local a6, a7, a8 = a5 > 0 and math.floor((a0 - a4 - aX * (#a3 - 1)) / a5) or 0, -a0 - aX, 0
		for a9, ba in ipairs(a3) do
			if ba.Flex and not ba.Collapsed then
				ba.Height = math.max(ba.MinHeight, a6)
			end
			a7 = a7 + (ba.Collapsed and aN or ba.Height) + aX
		end
		local a9
		if a7 < 0 then
			for ba = #a3, 1, -1 do
				local bb = a3[ba]
				if bb.Stretch and not bb.Collapsed then
					a9 = bb
					break
				end
			end
		end
		for ba, bb in ipairs(a3) do
			local bc, bd = bb.Outer.Size.X.Offset, bb.Collapsed and aN or bb.Height
			if bb == a9 then
				bd = bd - a7
			end
			if bb.Shrink and not bb.Collapsed and a7 > 0 then
				local be = math.min(a7, math.max(0, bd - bb.MinHeight))
				bd = bd - be
				a7 = a7 - be
			end
			local be = a2 == "Right" and a_ + aX or aY - bc - aX
			if be < 4 or be + bc > aW.X - 4 then
				be = math.max(4, aW.X - bc - 4)
			end
			bb:PlaceAt(UDim2.fromOffset(math.floor(be), aZ + a8), UDim2.fromOffset(bc, bd), aS)
			a8 = a8 + bd + aX
		end
	end
end
function w:RefreshWidgets()
	for aS, aT in ipairs(w.Widgets) do
		aT:Refresh()
	end
	aR()
end
local aS = false
local function aT()
	if aS then
		return
	end
	local aU = w.Window and w.Window.Holder
	if not aU then
		return
	end
	aS = true
	n(aU, "AbsolutePosition", aR)
	n(aU, "AbsoluteSize", aR)
end
function w:CreateWidget(aU)
	aU = aU or {}
	local aV, aW =
		{
			Title = aU.Title or "Widget",
			Key = aU.Key or aU.Title or "Widget",
			Tab = aU.Tab,
			MenuOnly = aU.MenuOnly ~= false,
			Enabled = aU.Visible ~= false,
			Docked = aU.Docked ~= false,
			Collapsed = false,
			Shown = false,
			Height = aU.Height or 200,
			Flex = aU.Flex == true,
			Shrink = aU.Shrink == true,
			MinHeight = aU.MinHeight or 120,
			Side = aU.Side,
			Signals = {},
		},
		aU.Width or 220
	local aX, aY = w.WidgetLayout[aV.Key], aU.Position or UDim2.fromOffset(12, 12)
	if type(aX) == "table" then
		aV.Docked = aX.Docked ~= false
		aV.Side = aX.Side or aV.Side
		if not aV.Docked and tonumber(aX.X) and tonumber(aX.Y) then
			local aZ = workspace.CurrentCamera
			local a_ = aZ and aZ.ViewportSize or Vector2.new(1920, 1080)
			aY = UDim2.fromOffset(
				math.clamp(aX.X, 0, math.max(0, a_.X - 80)),
				math.clamp(aX.Y, 0, math.max(0, a_.Y - aV.Height - 100))
			)
		end
	end
	local aZ = w:Create(
		"ScreenGui",
		{ Name = "Core", DisplayOrder = 1, ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Global }
	)
	o(aZ)
	aZ.Parent = p()
	table.insert(w.WidgetLayers, aZ)
	local a_ = w:Create(
		"Frame",
		{
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = aY,
			Size = UDim2.fromOffset(aW, aV.Height),
			Visible = false,
			ZIndex = 70,
			Parent = aZ,
		}
	)
	aV.Layer = aZ
	function aV:BringToFront()
		w.WidgetLayerTop = w.WidgetLayerTop + 1
		aZ.DisplayOrder = w.WidgetLayerTop
	end
	a_.InputBegan:Connect(function(a0)
		if ac(a0) then
			aV:BringToFront()
		end
	end)
	local a0 = w:Create(
		"Frame",
		{
			BackgroundColor3 = w.MainColor,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = 71,
			Parent = a_,
		}
	)
	T(a0, 6)
	U(a0, "OutlineColor")
	w:AddToRegistry(a0, { BackgroundColor3 = "MainColor" }, true)
	local a1 = w:Create(
		"Frame",
		{ BackgroundColor3 = w.BackgroundColor, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, aN), ZIndex = 72, Parent = a0 }
	)
	w:AddToRegistry(a1, { BackgroundColor3 = "BackgroundColor" }, true)
	local a2 = w:Create(
		"Frame",
		{
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = w.AccentColor,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 10, 0.5, 0),
			Size = UDim2.fromOffset(2, 11),
			ZIndex = 74,
			Parent = a1,
		}
	)
	T(a2, 1)
	w:AddToRegistry(a2, { BackgroundColor3 = "AccentColor" }, true)
	local a3 = w:CreateLabel(
		{
			Position = UDim2.fromOffset(18, 0),
			Size = UDim2.new(1, -46, 1, 0),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextSize = L,
			Font = w.FontMedium,
			Text = aV.Title,
			ZIndex = 75,
			Parent = a1,
		},
		true
	)
	w:Create(
		"Frame",
		{
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = w.OutlineColor,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 1, 0),
			Size = UDim2.new(1, 0, 0, 1),
			ZIndex = 74,
			Parent = a1,
		}
	)
	local a4 = w:Create(
		"TextButton",
		{
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -8, 0.5, 0),
			Size = UDim2.fromOffset(18, 18),
			Text = "",
			ZIndex = 76,
			Parent = a1,
		}
	)
	local a5 = w:Create(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.fromOffset(10, 10),
			ZIndex = 76,
			Parent = a4,
		}
	)
	for a6 = 0, 1 do
		local a7 = w:Create(
			"Frame",
			{
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = w.FontColor,
				BorderSizePixel = 0,
				Position = UDim2.new(0.5, a6 == 0 and -2 or 2, 0.5, 0),
				Rotation = a6 == 0 and -45 or 45,
				Size = UDim2.fromOffset(2, 7),
				ZIndex = 77,
				Parent = a5,
			}
		)
		T(a7, 1)
		w:AddToRegistry(a7, { BackgroundColor3 = "FontColor" }, true)
	end
	local a6 = w:Create(
		"Frame",
		{
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Position = UDim2.fromOffset(6, aN + 6),
			Size = UDim2.new(1, -12, 1, -(aN + 12)),
			ZIndex = 72,
			Parent = a0,
		}
	)
	aV.Outer = a_
	aV.Body = a0
	aV.Header = a1
	aV.Tick = a2
	aV.TitleLabel = a3
	aV.Content = a6
	aV.Condition = aU.Condition
	if aU.Headerless then
		a1.Visible = false
		a6.Position = UDim2.new()
		a6.Size = UDim2.new(1, 0, 1, 0)
	end
	local a7, a8, a9 = nil, nil, 0
	function aV:PlaceAt(ba, bb, bc)
		a7 = ba
		if a8 then
			a8:Cancel()
			a8 = nil
		end
		if bc then
			a9 = os.clock() + 0.3
			a8 = X(a_, 0.24, { Position = ba, Size = bb or a_.Size }, Enum.EasingStyle.Quint)
			return
		end
		a_.Position = ba
		if bb then
			a_.Size = bb
		end
	end
	local ba = false
	a_:GetPropertyChangedSignal("Position"):Connect(function()
		if os.clock() < a9 then
			return
		end
		if a7 and a_.Position == a7 then
			return
		end
		if aV.Docked and a7 then
			local bb, bc = a_.Position.X.Offset - a7.X.Offset, a_.Position.Y.Offset - a7.Y.Offset
			if math.abs(bb) < 8 and math.abs(bc) < 8 then
				return
			end
		end
		ba = true
		if aV.Docked then
			aV.Docked = false
			a7 = nil
			aR(true)
		end
	end)
	w:GiveSignal(b.InputEnded:Connect(function(bb)
		if bb.UserInputType ~= Enum.UserInputType.MouseButton1 and bb.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		if aV.Docked then
			if a7 and a_.Position ~= a7 and os.clock() >= a9 then
				aR(true)
			end
			return
		end
		if not ba then
			return
		end
		ba = false
		local bc = w.Window and w.Window.Holder
		if not bc then
			return
		end
		local bd, be, bf = w.WidgetGap, a_.AbsolutePosition.X, a_.AbsolutePosition.Y
		local bg, bh, bi, bj =
			be + a_.AbsoluteSize.X, bf + a_.AbsoluteSize.Y, bc.AbsolutePosition.X, bc.AbsolutePosition.Y
		local bk, bl = bi + bc.AbsoluteSize.X, bj + bc.AbsoluteSize.Y
		local bm, bn = math.abs(be - (bk + bd)) < 56, math.abs(bg - (bi - bd)) < 56
		if (bm or bn) and bf < bl and bh > bj then
			aV.Side = bn and "Left" or "Right"
			local bo = bf + a_.AbsoluteSize.Y * 0.5
			table.remove(w.Widgets, table.find(w.Widgets, aV))
			local bp = #w.Widgets + 1
			for bq, br in ipairs(w.Widgets) do
				if
					br.Docked
					and br.Shown
					and (br.Side or "Right") == aV.Side
					and bo < br.Outer.AbsolutePosition.Y + br.Outer.AbsoluteSize.Y * 0.5
				then
					bp = bq
					break
				end
			end
			table.insert(w.Widgets, bp, aV)
			aV:Dock()
		end
		aQ()
	end))
	function aV:Refresh()
		local bb = aV.Enabled
		if bb and aV.MenuOnly then
			bb = w.Toggled and not w.WindowCollapsed
		end
		if bb and aV.Tab then
			local bc = type(aV.Tab) == "table" and aV.Tab.Name or aV.Tab
			bb = w.ActiveTab == bc
		end
		if bb and aV.Condition then
			local bc, bd = pcall(aV.Condition)
			bb = bc and bd
		end
		aV.Shown = bb and true or false
		a_.Visible = aV.Shown
		if aV.OnVisibility then
			w:SafeCallback(aV.OnVisibility, aV.Shown and not aV.Collapsed)
		end
	end
	function aV:SetVisible(bb)
		aV.Enabled = not not bb
		w:RefreshWidgets()
	end
	function aV:SetTitle(bb)
		aV.Title = bb
		a3.Text = bb
	end
	function aV:SetHeight(bb)
		aV.Height = bb
		if aV.Collapsed then
			return
		end
		if aV.Docked and aV.Shown then
			aR(true)
		else
			X(a_, 0.24, { Size = UDim2.fromOffset(a_.Size.X.Offset, bb) }, Enum.EasingStyle.Quint)
		end
	end
	function aV:SetCollapsed(bb)
		aV.Collapsed = not not bb
		task.defer(aQ)
		local bc = {}
		aV.CollapseToken = bc
		if not aV.Collapsed then
			a6.Visible = true
		end
		X(a5, 0.2, { Rotation = aV.Collapsed and 180 or 0 }, Enum.EasingStyle.Quint)
		if aV.Docked and aV.Shown then
			aR(true)
		else
			X(
				a_,
				0.24,
				{ Size = UDim2.fromOffset(a_.Size.X.Offset, aV.Collapsed and aN or aV.Height) },
				Enum.EasingStyle.Quint
			)
		end
		task.delay(0.26, function()
			if aV.CollapseToken == bc and aV.Collapsed then
				a6.Visible = false
			end
		end)
		if aV.OnVisibility then
			w:SafeCallback(aV.OnVisibility, aV.Shown and not aV.Collapsed)
		end
	end
	function aV:Dock()
		aV.Docked = true
		aR(true)
	end
	function aV:Connect(bb, bc)
		local bd = bb:Connect(bc)
		table.insert(aV.Signals, bd)
		w:GiveSignal(bd)
		return bd
	end
	function aV:Destroy()
		for bb, bc in ipairs(aV.Signals) do
			pcall(bc.Disconnect, bc)
		end
		local bb = table.find(w.Widgets, aV)
		if bb then
			table.remove(w.Widgets, bb)
		end
		aZ:Destroy()
		aR()
	end
	ag(a4, function()
		aV:SetCollapsed(not aV.Collapsed)
	end)
	w:MakeDraggable(a_, aU.Headerless and 10000 or aN)
	local bb, bc = #w.Widgets + 1, type(aX) == "table" and tonumber(aX.Order)
	if bc then
		for bd, be in ipairs(w.Widgets) do
			local bf = w.WidgetLayout[be.Key]
			local bg = type(bf) == "table" and tonumber(bf.Order)
			if bg and bg > bc then
				bb = bd
				break
			end
		end
	end
	table.insert(w.Widgets, bb, aV)
	aT()
	w:RefreshWidgets()
	if type(aX) == "table" and aX.Collapsed then
		aV:SetCollapsed(true)
	end
	return aV
end
w.WidgetBase = "https://zekehub.com/scripts/UILib/Widgets/"
w.WidgetModules = {}
w.Internal = {
	BindDrag = aw,
	BindHover = ah,
	BindTap = ag,
	Corner = T,
	Stroke = U,
	Tween = X,
	ScreenGui = s,
	ScreenPosition = ab,
	RenderStepped = j,
	LocalPlayer = k,
	Options = u,
	Toggles = t,
	Mobile = x,
	SMALL = L,
	NORMAL = M,
	WidgetHead = aN,
}
local aU, aV = {}, true
local aW = coroutine.create(function()
	while true do
		local aW = table.remove(aU, 1)
		if aW then
			pcall(aW)
		else
			aV = true
			coroutine.yield()
		end
	end
end)
local function aX(aY)
	table.insert(aU, aY)
	if aV then
		aV = false
		task.spawn(aW)
	end
end
local function aY(aZ)
	local a_, a0 = pcall(loadstring, aZ)
	if a_ or coroutine.running() == aW then
		return a_ and a0 or nil
	end
	local a1, a2 = false
	aX(function()
		local a3, a4 = pcall(loadstring, aZ)
		a2 = a3 and a4 or nil
		a1 = true
	end)
	while not a1 do
		task.wait()
	end
	return a2
end
function w:LoadWidgetModule(aZ)
	local a_ = w.WidgetModules[aZ]
	if a_ ~= nil then
		return a_
	end
	local a0, a1 = pcall(function()
		local a0 = type(w.WidgetSource) == "function" and w.WidgetSource(aZ)
			or game:HttpGet(w.WidgetBase .. aZ .. ".lua")
		local a1 = aY(a0)
		assert(a1, "could not compile")
		return a1()(w, w.Internal)
	end)
	if not a0 then
		warn("[MsFine] " .. aZ .. " widget failed to load: " .. tostring(a1))
	end
	w.WidgetModules[aZ] = a0 and (a1 or true) or false
	return w.WidgetModules[aZ]
end
function w:CreateESPPreview(aZ)
	local a_ = w.CreateESPPreview
	if not w:LoadWidgetModule("ESPPreview") or w.CreateESPPreview == a_ then
		return nil
	end
	return w:CreateESPPreview(aZ)
end
function w:CreateSpotifyWidget(aZ)
	local a_ = w.CreateSpotifyWidget
	if not w:LoadWidgetModule("Spotify") or w.CreateSpotifyWidget == a_ then
		return nil
	end
	return w:CreateSpotifyWidget(aZ)
end
function w:AddWidgetSettings(aZ)
	local a_, a0, a1 = aZ:AddRightGroupbox("Spotify"), false, false
	pcall(function()
		a0 = a(game:GetService("HttpService")):JSONDecode(readfile("MsFine/spotify.json")).Widget == true
	end)
	local function a2(a3)
		if not a3 and not w.WidgetModules.Spotify then
			return
		end
		if not w:LoadWidgetModule("Spotify") then
			return
		end
		if not a1 then
			a1 = true
			w:BuildSpotifySettings(a_)
		end
		w:SetSpotifyWidget(a3)
	end
	a_:AddToggle("SpotifyWidget", {
		Text = "Show Spotify Widget",
		Default = a0,
		Callback = function(a3)
			aX(function()
				a2(a3)
			end)
		end,
	})
	if a0 then
		aX(function()
			a2(true)
		end)
	end
	return a_
end
function w:SetWatermarkVisibility(aZ)
	w.Watermark.Visible = aZ
end
function w:SetWatermark(aZ)
	w.WatermarkSet = true
	local a_ = w:GetTextBounds(aZ, w.FontMedium, L)
	w.Watermark.Size = UDim2.new(0, a_ + 32, 0, x and 30 or 26)
	w:SetWatermarkVisibility(true)
	w.WatermarkText.Text = aZ
end
w.MaxNotifications = x and 4 or 8
local aZ, a_ = {}, {}
function w:Notify(a0, a1, a2)
	a0 = tostring(a0)
	local a3 = a_[a0]
	if a3 and a3.Outer.Parent then
		a3.Count = a3.Count + 1
		a3.Label.Text = a0 .. " (x" .. a3.Count .. ")"
		a3.Arm(a1)
		return a3.Handle
	end
	while #aZ >= math.max(w.MaxNotifications, 1) do
		aZ[1].Dismiss()
	end
	local a4, a5 = w:GetTextBounds(a0, w.Font, L)
	local a6, a7 = math.clamp(a4 + 32, 120, 320), math.max(a5 + 18, 32)
	local a8 = w:Create(
		"Frame",
		{
			Active = true,
			BackgroundColor3 = w.MainColor,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 0, 0, a7),
			ClipsDescendants = true,
			ZIndex = 100,
			Parent = w.NotificationArea,
		}
	)
	T(a8, 6)
	local a9 = w:Create(
		"UIStroke",
		{ Color = w.OutlineColor, Thickness = 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Parent = a8 }
	)
	w:AddToRegistry(a9, { Color = "OutlineColor" }, true)
	w:AddToRegistry(a8, { BackgroundColor3 = "MainColor" }, true)
	local ba = w:Create(
		"Frame",
		{
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = w.AccentColor,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 8, 0.5, 0),
			Size = UDim2.new(0, 3, 1, -14),
			ZIndex = 104,
			Parent = a8,
		}
	)
	T(ba, 2)
	w:AddToRegistry(ba, { BackgroundColor3 = "AccentColor" }, true)
	local bb = w:CreateLabel(
		{
			Position = UDim2.new(0, 19, 0, 0),
			Size = UDim2.new(1, -26, 1, 0),
			Text = a0,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextWrapped = true,
			TextSize = L,
			ZIndex = 103,
			Parent = a8,
		},
		true
	)
	X(a8, 0.28, { Size = UDim2.new(0, a6, 0, a7) }, Enum.EasingStyle.Quint)
	local bc, bd, be = { Outer = a8, Label = bb, Count = 1 }, false, 0
	local function bf()
		if bd then
			return
		end
		bd = true
		be = be + 1
		if a_[a0] == bc then
			a_[a0] = nil
		end
		local bg = table.find(aZ, bc)
		if bg then
			table.remove(aZ, bg)
		end
		X(a8, 0.22, { Size = UDim2.new(0, 0, 0, a7) }, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
		task.delay(0.25, function()
			a8:Destroy()
		end)
	end
	local function bg(bh)
		be = be + 1
		if typeof(bh) == "Instance" then
			if not bh.Parent then
				return bf()
			end
			bh.Destroying:Connect(bf)
			bh.AncestryChanged:Connect(function(bi, bj)
				if not bj then
					bf()
				end
			end)
			return
		end
		local bi = be
		task.delay(tonumber(bh) or 5, function()
			if be ~= bi then
				return
			end
			bf()
		end)
	end
	ah(a8, function()
		X(a8, 0.12, { BackgroundTransparency = 0.15 })
	end, function()
		X(a8, 0.12, { BackgroundTransparency = 0 })
	end)
	ag(a8, bf)
	bc.Dismiss = bf
	bc.Arm = bg
	bc.Handle = { Dismiss = bf, Frame = a8 }
	a_[a0] = bc
	table.insert(aZ, bc)
	bg(a1)
	return bc.Handle
end
function w:Prompt(a0)
	a0 = a0 or {}
	a0.Title = a0.Title or "Prompt"
	a0.Text = a0.Text or ""
	a0.Buttons = a0.Buttons or { "Yes", "No" }
	local a1, a2, a3 =
		false,
		nil,
		w:Create(
			"ScreenGui",
			{
				Name = "LibraryPrompt",
				DisplayOrder = 999998,
				IgnoreGuiInset = true,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
				Parent = p(),
			}
		)
	o(a3)
	local a4 = w:Create(
		"Frame",
		{
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = 1,
			Parent = a3,
		}
	)
	X(a4, 0.2, { BackgroundTransparency = 0.45 })
	local a5 = x and 320 or 340
	local a6 = w:Create(
		"Frame",
		{
			BackgroundColor3 = w.MainColor,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.fromOffset(a5, 0),
			ZIndex = 2,
			ClipsDescendants = true,
			Parent = a3,
		}
	)
	T(a6, 8)
	w:Create(
		"UIStroke",
		{ Color = w.OutlineColor, Thickness = 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Parent = a6 }
	)
	local a7 = w:Create(
		"Frame",
		{
			BackgroundColor3 = w.AccentColor,
			BorderSizePixel = 0,
			Position = UDim2.fromOffset(18, 20),
			Size = UDim2.fromOffset(3, 15),
			ZIndex = 5,
			Parent = a6,
		}
	)
	T(a7, 2)
	w:CreateLabel({
		Position = UDim2.fromOffset(29, 18),
		Size = UDim2.new(1, -47, 0, 19),
		Text = a0.Title,
		TextSize = 15,
		Font = w.FontBold,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 5,
		Parent = a6,
	})
	local a8 = select(2, w:GetTextBounds(a0.Text, w.Font, M, Vector2.new(a5 - 36, math.huge)))
	w:CreateLabel({
		Position = UDim2.fromOffset(18, 44),
		Size = UDim2.new(1, -36, 0, a8),
		Text = a0.Text,
		TextSize = M,
		TextTransparency = 0.15,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		ZIndex = 5,
		Parent = a6,
	})
	local a9 = x and 36 or 30
	local ba = w:Create(
		"Frame",
		{ BackgroundTransparency = 1, Position = UDim2.new(0, 18, 0, 56 + a8), Size = UDim2.new(1, -36, 0, a9), ZIndex = 5, Parent = a6 }
	)
	w:Create(
		"UIListLayout",
		{
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 8),
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = ba,
		}
	)
	local bb = 56 + a8 + a9 + 18
	for bc, bd in next, a0.Buttons do
		local be = bc == 1
		local bf = w:Create(
			"Frame",
			{
				BackgroundColor3 = be and w.AccentColor or w.BackgroundColor,
				BorderSizePixel = 0,
				Size = UDim2.new(1 / #a0.Buttons, -((#a0.Buttons - 1) * 8 / #a0.Buttons), 1, 0),
				ZIndex = 6,
				Parent = ba,
			}
		)
		T(bf, 5)
		if not be then
			w:Create("UIStroke", { Color = w.OutlineColor, Thickness = 1, Parent = bf })
		end
		w:CreateLabel({ Size = UDim2.new(1, 0, 1, 0), Text = bd, TextSize = M, Font = w.FontMedium, ZIndex = 8, Parent = bf })
		local bg = w:Create(
			"Frame",
			{
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 7,
				Parent = bf,
			}
		)
		T(bg, 5)
		local bh = w:Create(
			"TextButton",
			{ BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Text = "", ZIndex = 9, Parent = bf }
		)
		bh.MouseEnter:Connect(function()
			X(bg, 0.14, { BackgroundTransparency = 0.88 })
		end)
		bh.MouseLeave:Connect(function()
			X(bg, 0.14, { BackgroundTransparency = 1 })
		end)
		bh.MouseButton1Click:Connect(function()
			if a1 then
				return
			end
			a1 = true
			a2 = bd
			X(a6, 0.18, { Size = UDim2.fromOffset(a5, 0) }, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
			X(a4, 0.18, { BackgroundTransparency = 1 })
			task.wait(0.2)
			a3:Destroy()
		end)
	end
	task.wait()
	X(a6, 0.25, { Size = UDim2.fromOffset(a5, bb) }, Enum.EasingStyle.Quint)
	while not a1 do
		task.wait()
	end
	return a2
end
function w:CreateWindow(...)
	pcall(function()
		if getgenv().BootStrap then
			getgenv().BootStrap:SetStatus("Building interface...")
			getgenv().BootStrap:SetProgress(60)
		end
	end)
	local a0, a1 = { ... }, { AnchorPoint = Vector2.zero }
	if type(...) == "table" then
		a1 = ...
	else
		a1.Title = a0[1]
		a1.AutoShow = a0[2] or false
	end
	if type(a1.Title) ~= "string" then
		a1.Title = "No title"
	end
	pcall(function()
		if isfile("MsFine/silent_load.txt") and readfile("MsFine/silent_load.txt") == "true" then
			a1.AutoShow = false
			w.SilentLoad = true
		end
	end)
	if a1.TabStyle == nil then
		a1.TabStyle = w:GetTabStyle()
	end
	if a1.TabStyle ~= "Side" then
		a1.TabStyle = "Top"
	end
	if type(a1.TabPadding) ~= "number" then
		a1.TabPadding = 2
	end
	local a2, a3, a4, a5 = a1.TabStyle == "Side", E, G, F
	if type(a1.MenuFadeTime) ~= "number" then
		a1.MenuFadeTime = 0.2
	end
	if type(a1.ShowCustomCursor) ~= "boolean" then
		w.ShowCustomCursor = true
	else
		w.ShowCustomCursor = a1.ShowCustomCursor
	end
	if typeof(a1.AnchorPoint) ~= "Vector2" then
		a1.AnchorPoint = Vector2.zero
	end
	if typeof(a1.Size) ~= "UDim2" then
		a1.Size = UDim2.fromOffset(748, 566)
		if w.IsMobile then
			local a6 = workspace.CurrentCamera.ViewportSize
			local a7 = a6.Y - e:GetGuiInset().Y
			a1.Size = UDim2.fromOffset(math.clamp(a6.X - 36, 380, 760), math.clamp(a7 - 64, 240, 560))
		end
	end
	if typeof(a1.Position) ~= "UDim2" then
		a1.Position = UDim2.fromOffset(160, 60)
	end
	if a1.TabPadding <= 0 then
		a1.TabPadding = 1
	end
	if w.IsMobile then
		a1.Position = UDim2.new(0.5, -a1.Size.X.Offset / 2, 0, 12)
	elseif a1.Center then
		a1.Position = UDim2.new(0.5, -a1.Size.X.Offset / 2, 0.5, -a1.Size.Y.Offset / 2)
	end
	local a6, a7 =
		{ Tabs = {}, TabOrder = {}, Pages = {} },
		w:Create(
			"Frame",
			{
				AnchorPoint = a1.AnchorPoint,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = a1.Position,
				Size = a1.Size,
				Visible = false,
				ZIndex = 1,
				Parent = s,
			}
		)
	local a8 = w:Create(
		"Frame",
		{
			BackgroundColor3 = w.MainColor,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = 1,
			Parent = a7,
		}
	)
	T(a8, 9)
	U(a8, "AccentColor")
	w:AddToRegistry(a8, { BackgroundColor3 = "MainColor" })
	v = a7
	w:MakeDraggable(a7, F)
	local a9, ba = false, a1.Size
	if a1.Resizable ~= false then
		w:MakeResizable(a7, w.MinSize, function(bb, bc)
			ba = UDim2.fromOffset(bb, bc)
		end)
	end
	local bb = w:Create("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, F), ZIndex = 4, Parent = a8 })
	local bc = w:Create(
		"TextButton",
		{
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 6, 0.5, 0),
			Size = UDim2.fromOffset(22, 22),
			Text = "",
			Visible = a2,
			ZIndex = 6,
			Parent = bb,
		}
	)
	local bd = w:Create(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.fromOffset(12, 12),
			ZIndex = 7,
			Parent = bc,
		}
	)
	for be = 0, 1 do
		local bf = w:Create(
			"Frame",
			{
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = w.FontColor,
				BackgroundTransparency = 0.25,
				BorderSizePixel = 0,
				Position = UDim2.new(0.5, 0, 0.5, be == 0 and -3 or 3),
				Rotation = be == 0 and 45 or -45,
				Size = UDim2.fromOffset(2, 9),
				ZIndex = 8,
				Parent = bd,
			}
		)
		T(bf, 1)
		w:AddToRegistry(bf, { BackgroundColor3 = "FontColor" })
	end
	local be = x and 118 or 156
	local bf = w:Create(
		"Frame",
		{
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundColor3 = w.BackgroundColor,
			BorderSizePixel = 0,
			Position = UDim2.new(1, -8, 0.5, 0),
			Size = UDim2.fromOffset(be, F - 10),
			ZIndex = 6,
			Parent = bb,
		}
	)
	T(bf, O)
	local bg = U(bf, "OutlineColor")
	w:AddToRegistry(bf, { BackgroundColor3 = "BackgroundColor" })
	local bh = w:Create(
		"ImageLabel",
		{
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundTransparency = 1,
			Image = w:Icon("search") or "",
			ImageColor3 = w.FontColor,
			ImageTransparency = 0.35,
			Position = UDim2.new(0, 6, 0.5, 0),
			Size = UDim2.fromOffset(13, 13),
			ZIndex = 8,
			Parent = bf,
		}
	)
	w:AddToRegistry(bh, { ImageColor3 = "FontColor" })
	local bi = w:Create(
		"TextBox",
		{
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(20, 0),
			Size = UDim2.new(1, -24, 1, 0),
			Font = w.Font,
			PlaceholderText = "Search",
			PlaceholderColor3 = Color3.fromRGB(125, 125, 135),
			Text = "",
			TextColor3 = w.FontColor,
			TextSize = L,
			TextXAlignment = Enum.TextXAlignment.Left,
			ClearTextOnFocus = false,
			ZIndex = 8,
			Parent = bf,
		}
	)
	w:ApplyTextStroke(bi)
	w:AddToRegistry(bi, { TextColor3 = "FontColor" })
	bf.MouseEnter:Connect(function()
		if bi:IsFocused() then
			return
		end
		bg.Color = w.AccentColor
		w:SetRegistry(bg, "Color", "AccentColor")
		X(bh, 0.14, { ImageTransparency = 0 })
	end)
	bf.MouseLeave:Connect(function()
		if bi:IsFocused() then
			return
		end
		bg.Color = w.OutlineColor
		w:SetRegistry(bg, "Color", "OutlineColor")
		X(bh, 0.14, { ImageTransparency = 0.35 })
	end)
	local bj = w:Create(
		"TextButton",
		{
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -6, 0.5, 0),
			Size = UDim2.fromOffset(22, 22),
			Text = "",
			Visible = false,
			ZIndex = 6,
			Parent = bb,
		}
	)
	local bk = w:Create(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = w.FontColor,
			BackgroundTransparency = 0.25,
			BorderSizePixel = 0,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.fromOffset(12, 2),
			ZIndex = 7,
			Parent = bj,
		}
	)
	T(bk, 1)
	w:AddToRegistry(bk, { BackgroundColor3 = "FontColor" })
	local bl, bm =
		w:CreateLabel({
			Position = UDim2.new(0, a2 and 34 or 10, 0, 0),
			Size = UDim2.new(1, -(be + (a2 and 60 or 36)), 1, 0),
			Text = a1.Title or "",
			TextSize = M,
			Font = w.FontMedium,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 5,
			Parent = bb,
		}),
		w:Create(
			"Frame",
			{
				BackgroundColor3 = w.OutlineColor,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 1, -1),
				Size = UDim2.new(1, 0, 0, 1),
				ZIndex = 5,
				Parent = bb,
			}
		)
	w:AddToRegistry(bm, { BackgroundColor3 = "OutlineColor" })
	local bn = w:Create(
		"Frame",
		{
			BackgroundColor3 = w.MainColor,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Position = UDim2.new(0, 0, 0, F),
			Size = UDim2.new(0, a4, 1, -F),
			Visible = a2,
			ZIndex = 3,
			Parent = a8,
		}
	)
	w:AddToRegistry(bn, { BackgroundColor3 = "MainColor" })
	w:AddToRegistry(bn, { BackgroundColor3 = "BackgroundColor" })
	local bo = w:Create(
		"Frame",
		{
			BackgroundColor3 = w.OutlineColor,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 0, 0, 0),
			Size = UDim2.new(0, 1, 1, 0),
			ZIndex = 4,
			Parent = bn,
		}
	)
	w:AddToRegistry(bo, { BackgroundColor3 = "OutlineColor" })
	local bp
	do
		bp = w:Create(
			"Frame",
			{
				BackgroundColor3 = w.MainColor,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				Position = UDim2.new(0, 0, 0, F),
				Size = UDim2.new(1, 0, 0, a3),
				Visible = not a2,
				ZIndex = 3,
				Parent = a8,
			}
		)
		w:AddToRegistry(bp, { BackgroundColor3 = "MainColor" })
		local bq = w:Create(
			"Frame",
			{
				AnchorPoint = Vector2.new(0, 1),
				BackgroundColor3 = w.OutlineColor,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, 0, 1),
				ZIndex = 4,
				Parent = bp,
			}
		)
		w:AddToRegistry(bq, { BackgroundColor3 = "OutlineColor" })
	end
	local bq, br =
		w:Create(
			"ScrollingFrame",
			{
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(),
				ElasticBehavior = Enum.ElasticBehavior.Never,
				Position = UDim2.new(0, 0, 0, 6),
				ScrollBarThickness = 0,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				Size = UDim2.new(1, -1, 1, -12),
				ZIndex = 4,
				Parent = bn,
			}
		),
		w:Create(
			"Frame",
			{
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 0, a3 - 1),
				ZIndex = 4,
				Parent = bp,
			}
		)
	local bs = aa(bq, Enum.FillDirection.Vertical, a1.TabPadding)
	bs.VerticalAlignment = Enum.VerticalAlignment.Top
	V(bq, 6, 6, 0, 0)
	local bt = aa(br, Enum.FillDirection.Horizontal, a1.TabPadding)
	bt.VerticalAlignment = Enum.VerticalAlignment.Center
	V(br, 6, 6, 0, 0)
	local bu, bv, bw, bx, by, bz = bs, nil, nil, a1.Logo and w:LoadImage(a1.Logo) or nil, a1.Footer, a1.FooterSub
	if bx and not by and not bz then
		by = "MsFine"
		bz = w:GetGameName()
	end
	if a1.ShowFooter ~= false and (by or bz or bx) then
		local bA, bB = bx and 38 or 0, (by and 15 or 0) + (bz and 14 or 0)
		local bC = 14 + bA + (bx and bB > 0 and 6 or 0) + bB + 10
		bq.Size = UDim2.new(1, -1, 1, -(16 + bC))
		local bD = w:Create(
			"Frame",
			{
				AnchorPoint = Vector2.new(0, 1),
				Visible = a2,
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, -1, 0, bC),
				ZIndex = 4,
				Parent = bn,
			}
		)
		a6.RailFooter = bD
		local bE = w:Create(
			"Frame",
			{
				BackgroundColor3 = w.OutlineColor,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 10, 0, 0),
				Size = UDim2.new(1, -20, 0, 1),
				ZIndex = 5,
				Parent = bD,
			}
		)
		w:AddToRegistry(bE, { BackgroundColor3 = "OutlineColor" })
		local bF = 12
		if bx then
			local bG = w:Create(
				"Frame",
				{
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = w.BackgroundColor,
					BorderSizePixel = 0,
					Position = UDim2.new(0.5, 0, 0, bF),
					Size = UDim2.fromOffset(bA, bA),
					ZIndex = 5,
					Parent = bD,
				}
			)
			T(bG, O)
			U(bG, "OutlineColor")
			w:AddToRegistry(bG, { BackgroundColor3 = "BackgroundColor" })
			local bH = w:Create(
				"ImageLabel",
				{
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					Image = bx,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					ScaleType = Enum.ScaleType.Fit,
					Size = UDim2.new(1, -6, 1, -6),
					ZIndex = 6,
					Parent = bG,
				}
			)
			a6.RailLogoImage = bH
			bF = bF + bA + 6
		end
		if by then
			bv = w:CreateLabel({
				Position = UDim2.new(0, 8, 0, bF),
				Size = UDim2.new(1, -16, 0, 15),
				Text = by,
				TextSize = L,
				Font = w.FontBold,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ZIndex = 5,
				Parent = bD,
			})
			w:SkipTranslate(bv)
			w:RemoveFromRegistry(bv)
			bv.TextColor3 = w.AccentColor
			w:AddToRegistry(bv, { TextColor3 = "AccentColor" })
			bF = bF + 15
		end
		if bz then
			bw = w:CreateLabel({
				Position = UDim2.new(0, 6, 0, bF),
				Size = UDim2.new(1, -12, 0, 14),
				Text = bz,
				TextSize = 12,
				TextTransparency = 0.45,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ZIndex = 5,
				Parent = bD,
			})
			w:SkipTranslate(bw)
		end
	end
	if bx then
		local bA = w:Create(
			"Frame",
			{
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = w.BackgroundColor,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 8, 0.5, 0),
				Size = UDim2.fromOffset(F - 12, F - 12),
				Visible = not a2,
				ZIndex = 6,
				Parent = bb,
			}
		)
		a6.TopLogo = bA
		T(bA, O)
		U(bA, "OutlineColor", 2)
		w:AddToRegistry(bA, { BackgroundColor3 = "BackgroundColor" })
		local bB = w:Create(
			"ImageLabel",
			{
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Image = bx,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.new(1, -5, 1, -5),
				ZIndex = 7,
				Parent = bA,
			}
		)
		if not a2 then
			bl.Position = UDim2.new(0, F + 2, 0, 0)
		end
		a6.LogoImage = bB
	end
	function a6:SetFooter(bA, bB)
		if bv and bA then
			bv.Text = bA
		end
		if bw and bB then
			bw.Text = bB
		end
	end
	local bA = 6
	local bB = w:Create(
		"Frame",
		{
			BackgroundColor3 = w.MainColor,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Position = UDim2.new(0, a4 + bA, 0, a5 + bA),
			Size = UDim2.new(1, -(a4 + bA * 2), 1, -(a5 + bA * 2)),
			ZIndex = 2,
			Parent = a8,
		}
	)
	T(bB, N)
	U(bB, "OutlineColor", 2)
	w:AddToRegistry(bB, { BackgroundColor3 = "MainColor" })
	local bC = w:Create(
		"VideoFrame",
		{
			BackgroundColor3 = w.MainColor,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = 1,
			Visible = false,
			Volume = 0,
			Looped = true,
			Parent = bB,
		}
	)
	w.InnerVideoBackground = bC
	local bD = true
	local function bE(bF)
		if not a2 then
			return
		end
		bD = bF
		local bG = bF and G or 0
		X(bn, 0.22, { Size = UDim2.new(0, bG, 1, -F) }, Enum.EasingStyle.Quint)
		X(
			bB,
			0.22,
			{ Position = UDim2.new(0, bG + bA, 0, a5 + bA), Size = UDim2.new(1, -(bG + bA * 2), 1, -(a5 + bA * 2)) },
			Enum.EasingStyle.Quint
		)
		X(bd, 0.22, { Rotation = bF and 0 or 180 })
	end
	bc.MouseButton1Click:Connect(function()
		bE(not bD)
	end)
	function a6:SetCollapsed(bF)
		bF = not not bF
		if bF == a9 then
			return
		end
		a9 = bF
		w.WindowCollapsed = a9
		w:RefreshWidgets()
		if a9 then
			ba = a7.Size
			bn.Visible = false
			bB.Visible = false
			if bp then
				bp.Visible = false
			end
			if a6.CloseSearch then
				a6:CloseSearch()
			end
			X(a7, 0.22, { Size = UDim2.new(ba.X.Scale, ba.X.Offset, 0, F) }, Enum.EasingStyle.Quint)
			X(bk, 0.22, { Size = UDim2.fromOffset(12, 12) }, Enum.EasingStyle.Quint)
		else
			X(a7, 0.22, { Size = ba }, Enum.EasingStyle.Quint)
			X(bk, 0.22, { Size = UDim2.fromOffset(12, 2) }, Enum.EasingStyle.Quint)
			task.delay(0.12, function()
				if not a9 then
					bn.Visible = a2
					bB.Visible = true
					if bp then
						bp.Visible = true
					end
				end
			end)
		end
	end
	function a6:ToggleCollapsed()
		a6:SetCollapsed(not a9)
	end
	bj.MouseButton1Click:Connect(function()
		a6:ToggleCollapsed()
	end)
	bj.MouseEnter:Connect(function()
		X(bk, 0.12, { BackgroundTransparency = 0 })
	end)
	bj.MouseLeave:Connect(function()
		X(bk, 0.12, { BackgroundTransparency = 0.25 })
	end)
	function a6:SetWindowTitle(bF)
		bl.Text = bF
	end
	function a6:ToggleSidebar()
		bE(not bD)
	end
	function a6:AddTab(bF)
		local bG, bH, bI = { Name = bF, Groupboxes = {}, Tabboxes = {} }, w:GetTextBounds(bF, w.FontMedium, M) + 22, {}
		local function bJ(bK, bL)
			local bM, bN =
				{},
				ai({
					BackgroundColor3 = w.AccentColor,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = bL and UDim2.new(1, -12, 0, E) or UDim2.fromOffset(bH, E - 7),
					ZIndex = 5,
					Parent = bK,
				})
			T(bN, O)
			w:AddToRegistry(bN, { BackgroundColor3 = "AccentColor" })
			local bO = w:Create(
				"Frame",
				{
					AnchorPoint = bL and Vector2.new(0, 0.5) or Vector2.new(0.5, 1),
					BackgroundColor3 = w.AccentColor,
					BorderSizePixel = 0,
					Position = bL and UDim2.new(0, 0, 0.5, 0) or UDim2.new(0.5, 0, 1, 0),
					Size = bL and UDim2.new(0, 2, 0, 0) or UDim2.new(0, 0, 0, 2),
					ZIndex = 7,
					Parent = bN,
				}
			)
			w:AddToRegistry(bO, { BackgroundColor3 = "AccentColor" })
			local bP = w:CreateLabel({
				Position = bL and UDim2.new(0, 10, 0, 0) or UDim2.new(0, 0, 0, 0),
				Size = bL and UDim2.new(1, -16, 1, 0) or UDim2.new(1, 0, 1, 0),
				Text = bF,
				TextSize = M,
				Font = w.FontMedium,
				TextTransparency = 0.45,
				TextXAlignment = bL and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ZIndex = 6,
				Parent = bN,
			})
			bM.Button = bN
			bM.Marker = bO
			bM.Label = bP
			bM.MarkerOn = bL and UDim2.new(0, 2, 0, E - 12) or UDim2.new(1, -8, 0, 2)
			bM.MarkerOff = bL and UDim2.new(0, 2, 0, 0) or UDim2.new(0, 0, 0, 2)
			if not bL then
				bP:GetPropertyChangedSignal("Text"):Connect(function()
					bN.Size = UDim2.fromOffset(w:GetTextBounds(bP.Text, w.FontMedium, M) + 22, E - 7)
				end)
			end
			ah(bN, function()
				if w.ActiveTab == bF then
					return
				end
				X(bN, 0.14, { BackgroundTransparency = 0.95 })
				X(bP, 0.14, { TextTransparency = 0.15 })
			end, function()
				if w.ActiveTab == bF then
					return
				end
				X(bN, 0.14, { BackgroundTransparency = 1 })
				X(bP, 0.14, { TextTransparency = 0.45 })
			end)
			ag(bN, function()
				bG:ShowTab()
			end, function(bQ)
				return not w:MouseIsOverOpenedFrame(bQ)
			end)
			table.insert(bI, bM)
			return bM
		end
		a6:FitRail(bF)
		bJ(bq, true)
		bJ(br, false)
		local bK = w:Create(
			"Frame",
			{
				Name = "TabFrame",
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				Visible = false,
				ZIndex = 2,
				Parent = bB,
			}
		)
		local bL = w:Create(
			"ScrollingFrame",
			{
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(),
				ElasticBehavior = Enum.ElasticBehavior.Never,
				ScrollBarThickness = x and 0 or 3,
				ScrollBarImageColor3 = w.AccentColor,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				Size = UDim2.new(1, 0, 1, 0),
				TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
				BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
				VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
				ZIndex = 2,
				Parent = bK,
			}
		)
		w:AddToRegistry(bL, { ScrollBarImageColor3 = "AccentColor" })
		V(bL, 7, 7, 7, 8)
		local bM = w:Create(
			"Frame",
			{ AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, Size = UDim2.new(1, -14, 0, 0), ZIndex = 2, Parent = bL }
		)
		local bN, bO, bP =
			aa(bM, Enum.FillDirection.Horizontal, 7),
			w:Create(
				"Frame",
				{
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(0.5, -4, 0, 0),
					ZIndex = 2,
					Parent = bM,
				}
			),
			w:Create(
				"Frame",
				{
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(0.5, -5, 0, 0),
					ZIndex = 2,
					Parent = bM,
				}
			)
		aa(bO, Enum.FillDirection.Vertical, 7)
		aa(bP, Enum.FillDirection.Vertical, 7)
		local bQ = false
		local function bR()
			local bS = bL.AbsoluteSize.X < (x and 560 or 430)
			if bS == bQ then
				return
			end
			bQ = bS
			bN.FillDirection = bS and Enum.FillDirection.Vertical or Enum.FillDirection.Horizontal
			bO.Size = bS and UDim2.new(1, 0, 0, 0) or UDim2.new(0.5, -4, 0, 0)
			bP.Size = bS and UDim2.new(1, 0, 0, 0) or UDim2.new(0.5, -4, 0, 0)
		end
		n(bL, "AbsoluteSize", bR)
		task.defer(bR)
		if w.IsMobile then
			local bS, bT = 0, nil
			bL:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				bS = os.clock() + 0.15
				if bT then
					return
				end
				w.CanDrag = false
				bT = h.Heartbeat:Connect(function()
					if os.clock() < bS then
						return
					end
					bT:Disconnect()
					bT = nil
					w.CanDrag = true
				end)
			end)
		end
		function bG:ShowTab()
			if a6.CloseSearch then
				a6:CloseSearch()
			end
			w.ActiveTab = bF
			for bS, bT in next, a6.Tabs do
				bT:HideTab()
			end
			for bS, bT in ipairs(bI) do
				X(bT.Button, 0.16, { BackgroundTransparency = 0.9 })
				X(bT.Marker, 0.16, { Size = bT.MarkerOn })
				X(bT.Label, 0.16, { TextTransparency = 0 })
				bT.Label.TextColor3 = w.AccentColor
				w:SetRegistry(bT.Label, "TextColor3", "AccentColor")
			end
			bK.Visible = true
			w:RefreshWidgets()
		end
		function bG:HideTab()
			for bS, bT in ipairs(bI) do
				X(bT.Button, 0.16, { BackgroundTransparency = 1 })
				X(bT.Marker, 0.16, { Size = bT.MarkerOff })
				X(bT.Label, 0.16, { TextTransparency = 0.45 })
				bT.Label.TextColor3 = w.FontColor
				w:SetRegistry(bT.Label, "TextColor3", "FontColor")
			end
			bK.Visible = false
		end
		function bG:SetLayoutOrder(bS)
			TabButton.LayoutOrder = bS
			bu:ApplyLayout()
		end
		function bG:GetSides()
			return { Left = bL, Right = bL }
		end
		function bG:AddGroupbox(bS)
			local bT, bU =
				{},
				w:Create(
					"Frame",
					{
						BackgroundColor3 = w.BackgroundColor,
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 0, D + 12),
						ZIndex = 2,
						Parent = bS.Side == 1 and bO or bP,
					}
				)
			T(bU, 6)
			U(bU, "OutlineColor")
			w:AddToRegistry(bU, { BackgroundColor3 = "BackgroundColor" })
			local bV = w:Create(
				"Frame",
				{
					BackgroundColor3 = w.MainColor,
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, D),
					ZIndex = 3,
					Parent = bU,
				}
			)
			w:AddToRegistry(bV, { BackgroundColor3 = "MainColor" })
			local bW = w:Create(
				"Frame",
				{
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundColor3 = w.AccentColor,
					BorderSizePixel = 0,
					Position = UDim2.new(0, K, 0.5, 0),
					Size = UDim2.fromOffset(2, 12),
					ZIndex = 5,
					Parent = bV,
				}
			)
			T(bW, 1)
			w:AddToRegistry(bW, { BackgroundColor3 = "AccentColor" })
			w:CreateLabel({
				Size = UDim2.new(1, -(K + 18), 1, 0),
				Position = UDim2.new(0, K + 8, 0, 0),
				TextSize = M,
				Font = w.FontMedium,
				Text = bS.Name,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ZIndex = 5,
				Parent = bV,
			})
			local bX = w:Create(
				"Frame",
				{
					AnchorPoint = Vector2.new(0, 1),
					BackgroundColor3 = w.OutlineColor,
					BorderSizePixel = 0,
					Position = UDim2.new(0, 0, 1, 0),
					Size = UDim2.new(1, 0, 0, 1),
					ZIndex = 5,
					Parent = bV,
				}
			)
			w:AddToRegistry(bX, { BackgroundColor3 = "OutlineColor" })
			local bY = w:Create(
				"Frame",
				{ BackgroundTransparency = 1, Position = UDim2.new(0, K, 0, D), Size = UDim2.new(1, -K * 2, 1, -D), ZIndex = 1, Parent = bU }
			)
			aa(bY, Enum.FillDirection.Vertical, 0)
			local bZ = false
			function bT:Measure()
				local b_ = 0
				for b0, b1 in next, bT.Container:GetChildren() do
					if (not b1:IsA("UIListLayout")) and (not b1:IsA("UIPadding")) and b1.Visible then
						b_ = b_ + b1.Size.Y.Offset
					end
				end
				bU.Size = UDim2.new(1, 0, 0, D + b_ + K)
			end
			function bT:Resize()
				if bZ then
					return
				end
				bZ = true
				task.defer(function()
					bZ = false
					bT:Measure()
				end)
			end
			bT.Container = bY
			bT.Holder = bU
			setmetatable(bT, aM)
			bT:AddBlank(K - 1)
			bT:Resize()
			bG.Groupboxes[bS.Name] = bT
			return bT
		end
		function bG:AddLeftGroupbox(bS)
			return bG:AddGroupbox({ Side = 1, Name = bS })
		end
		function bG:AddRightGroupbox(bS)
			return bG:AddGroupbox({ Side = 2, Name = bS })
		end
		function bG:AddTabbox(bS)
			local bT, bU = { Tabs = {} }, x and 30 or 26
			local bV = bU + 16
			local bW = w:Create(
				"Frame",
				{
					BackgroundColor3 = w.BackgroundColor,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, bV + 12),
					ZIndex = 2,
					Parent = bS.Side == 1 and bO or bP,
				}
			)
			T(bW, 6)
			U(bW, "OutlineColor")
			w:AddToRegistry(bW, { BackgroundColor3 = "BackgroundColor" })
			local bX = w:Create(
				"Frame",
				{ BackgroundTransparency = 1, Position = UDim2.new(0, 8, 0, 8), Size = UDim2.new(1, -16, 0, bU), ZIndex = 5, Parent = bW }
			)
			w:Create(
				"UIListLayout",
				{
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, 4),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = bX,
				}
			)
			local bY = w:Create(
				"Frame",
				{
					BackgroundColor3 = w.OutlineColor,
					BorderSizePixel = 0,
					Position = UDim2.new(0, 10, 0, bV - 1),
					Size = UDim2.new(1, -20, 0, 1),
					ZIndex = 5,
					Parent = bW,
				}
			)
			w:AddToRegistry(bY, { BackgroundColor3 = "OutlineColor" })
			function bT:AddTab(bZ)
				local b_, b0 =
					{},
					ai({ BackgroundColor3 = w.MainColor, BorderSizePixel = 0, Size = UDim2.new(0.5, 0, 1, 0), ZIndex = 6, Parent = bX })
				T(b0, 5)
				w:AddToRegistry(b0, { BackgroundColor3 = "MainColor" })
				local b1, b2 =
					w:CreateLabel({
						Size = UDim2.new(1, -8, 1, 0),
						Position = UDim2.fromOffset(4, 0),
						TextSize = L,
						Font = w.FontMedium,
						Text = bZ,
						TextTransparency = 0.4,
						TextTruncate = Enum.TextTruncate.AtEnd,
						TextXAlignment = Enum.TextXAlignment.Center,
						ZIndex = 7,
						Parent = b0,
					}),
					w:Create(
						"Frame",
						{
							BackgroundTransparency = 1,
							Position = UDim2.new(0, K, 0, bV),
							Size = UDim2.new(1, -K * 2, 1, -bV),
							ZIndex = 1,
							Visible = false,
							Parent = bW,
						}
					)
				aa(b2, Enum.FillDirection.Vertical, 0)
				function b_:Show()
					for b3, b4 in next, bT.Tabs do
						b4:Hide()
					end
					b2.Visible = true
					b1.TextColor3 = w.AccentColor
					w:SetRegistry(b1, "TextColor3", "AccentColor")
					b1.TextTransparency = 0
					b_:Resize()
				end
				function b_:Hide()
					b2.Visible = false
					b1.TextColor3 = w.FontColor
					w:SetRegistry(b1, "TextColor3", "FontColor")
					b1.TextTransparency = 0.4
				end
				local b3 = false
				function b_:Measure()
					local b4 = 0
					for b5, b6 in next, bT.Tabs do
						b4 = b4 + 1
					end
					for b6, b7 in next, bX:GetChildren() do
						if not b7:IsA("UIListLayout") then
							b7.Size = UDim2.new(1 / b4, -(4 * (b4 - 1) / b4), 1, 0)
						end
					end
					if not b2.Visible then
						return
					end
					local b6 = 0
					for b7, b8 in next, b_.Container:GetChildren() do
						if (not b8:IsA("UIListLayout")) and (not b8:IsA("UIPadding")) and b8.Visible then
							b6 = b6 + b8.Size.Y.Offset
						end
					end
					bW.Size = UDim2.new(1, 0, 0, bV + b6 + K)
				end
				function b_:Resize()
					if b3 then
						return
					end
					b3 = true
					task.defer(function()
						b3 = false
						b_:Measure()
					end)
				end
				ag(b0, function()
					b_:Show()
					b_:Resize()
				end, function(b4)
					return not w:MouseIsOverOpenedFrame(b4)
				end)
				b_.Container = b2
				bT.Tabs[bZ] = b_
				setmetatable(b_, aM)
				b_:AddBlank(K - 1)
				b_:Resize()
				if #bX:GetChildren() == 2 then
					b_:Show()
				end
				return b_
			end
			bG.Tabboxes[bS.Name or ""] = bT
			return bT
		end
		function bG:AddLeftTabbox(bS)
			return bG:AddTabbox({ Name = bS, Side = 1 })
		end
		function bG:AddRightTabbox(bS)
			return bG:AddTabbox({ Name = bS, Side = 2 })
		end
		w.TotalTabs = w.TotalTabs + 1
		a6.Tabs[bF] = bG
		a6.Pages[bF] = { Tab = bG, Page = bK, Scroller = bL, Columns = bM }
		table.insert(a6.TabOrder, bG)
		if w.TotalTabs == 1 then
			bG:ShowTab()
		else
			bG:HideTab()
		end
		return bG
	end
	function a6:FitRail(bF)
		local bG = math.ceil(w:GetTextBounds(bF, w.FontMedium, M)) + 48
		if bG <= a4 then
			return
		end
		a4 = math.min(bG, 230)
		if a2 then
			bn.Size = UDim2.new(0, a4, 1, -F)
			bB.Position = UDim2.new(0, a4 + bA, 0, a5 + bA)
			bB.Size = UDim2.new(1, -(a4 + bA * 2), 1, -(a5 + bA * 2))
		end
	end
	function a6:SetTabStyle(bF, bG, bH)
		if bF ~= "Side" and bF ~= "Top" then
			return false
		end
		a2 = bF == "Side"
		local bI, bJ = a2 and a4 or 0, F + (a2 and 0 or a3)
		a5 = bJ
		bD = true
		bn.Visible = a2
		bn.Size = UDim2.new(0, bI, 1, -F)
		bp.Visible = not a2
		bc.Visible = a2
		bl.Position = UDim2.new(0, a2 and 34 or (a6.TopLogo and (F + 2) or 10), 0, 0)
		if a6.TopLogo then
			a6.TopLogo.Visible = not a2
		end
		if a6.RailFooter then
			a6.RailFooter.Visible = a2
		end
		local bK, bL = UDim2.new(0, bI + bA, 0, bJ + bA), UDim2.new(1, -(bI + bA * 2), 1, -(bJ + bA * 2))
		if bH then
			bB.Position = bK
			bB.Size = bL
		else
			X(bB, 0.22, { Position = bK, Size = bL })
		end
		if bG ~= false then
			w:SetTabStyle(bF)
		end
		return true
	end
	function a6:GetTabStyle()
		return a2 and "Side" or "Top"
	end
	function a6:SelectTab(bF)
		local bG = a6.TabOrder[bF]
		if bG then
			bG:ShowTab()
		end
	end
	local bF, bG, bH = false, {}, math.max(be + 96, 210)
	local bI = w:Create(
		"Frame",
		{
			AnchorPoint = Vector2.new(1, 0),
			BackgroundColor3 = w.MainColor,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Position = UDim2.new(1, -8, 0, F - 4),
			Size = UDim2.fromOffset(bH, 0),
			Visible = false,
			ZIndex = 42,
			Parent = a8,
		}
	)
	T(bI, O)
	U(bI, "OutlineColor")
	w:AddToRegistry(bI, { BackgroundColor3 = "MainColor" })
	local bJ = w:Create(
		"ScrollingFrame",
		{
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			CanvasSize = UDim2.new(),
			ElasticBehavior = Enum.ElasticBehavior.Never,
			Position = UDim2.fromOffset(4, 4),
			ScrollBarThickness = 2,
			ScrollBarImageColor3 = w.AccentColor,
			Size = UDim2.new(1, -8, 1, -8),
			ZIndex = 43,
			Parent = bI,
		}
	)
	w:AddToRegistry(bJ, { ScrollBarImageColor3 = "AccentColor" })
	aa(bJ, Enum.FillDirection.Vertical, 2)
	local function bK()
		local bL = {}
		for bM, bN in pairs(a6.Tabs) do
			for bO, bP in pairs(bN.Groupboxes) do
				if bP.Container then
					bL[bP.Container] = { bM, bO }
				end
			end
			for bO, bP in pairs(bN.Tabboxes) do
				for bQ, bR in pairs(bP.Tabs) do
					if bR.Container then
						bL[bR.Container] = { bM, bO .. " / " .. bQ }
					end
				end
			end
		end
		return bL
	end
	local function bL(bM, bN)
		local bO = bN
		for bP = 1, 30 do
			if not bO then
				return nil
			end
			local bQ = bM[bO]
			if bQ then
				return bQ[1], bQ[2]
			end
			bO = bO.Parent
		end
		return nil
	end
	local function bM(bN)
		local bO = bN
		for bP = 1, 40 do
			if not bO or bO == a8 then
				return true
			end
			if bO:IsA("GuiObject") and not bO.Visible and bO.Name ~= "TabFrame" then
				return false
			end
			bO = bO.Parent
		end
		return true
	end
	local function bN(bO)
		local bP = a6.Pages[bO.Tab]
		if not bP then
			return
		end
		local bQ = w:Create(
			"Frame",
			{
				BackgroundColor3 = w.AccentColor,
				BackgroundTransparency = 0.55,
				BorderSizePixel = 0,
				Position = UDim2.fromOffset(
					bO.Frame.AbsolutePosition.X - bP.Page.AbsolutePosition.X - 3,
					bO.Frame.AbsolutePosition.Y - bP.Page.AbsolutePosition.Y - 3
				),
				Size = UDim2.fromOffset(bO.Frame.AbsoluteSize.X + 6, bO.Frame.AbsoluteSize.Y + 6),
				ZIndex = 30,
				Parent = bP.Page,
			}
		)
		T(bQ, 5)
		X(bQ, 0.9, { BackgroundTransparency = 1 })
		task.delay(1, function()
			bQ:Destroy()
		end)
	end
	local bO = {}
	local function bP()
		local bQ, bR = {}, bK()
		local function bS(bT, bU)
			if type(bU) ~= "table" then
				return
			end
			if not bU.Text or bU.Text == "" then
				return
			end
			local bV = bU.DisplayFrame
			if typeof(bV) ~= "Instance" then
				return
			end
			if not bV:IsDescendantOf(a8) then
				return
			end
			if not bM(bV) then
				return
			end
			local bW, bX = bL(bR, bV)
			if not bW then
				return
			end
			table.insert(
				bQ,
				{
					Idx = bT,
					Text = bU.Text,
					Tab = bW,
					Group = bX,
					Frame = bV,
					Haystack = string.lower(bU.Text .. " " .. tostring(bT) .. " " .. bX),
				}
			)
		end
		for bT, bU in pairs(t) do
			bS(bT, bU)
		end
		for bT, bU in pairs(u) do
			bS(bT, bU)
		end
		table.sort(bQ, function(bT, bU)
			return bT.Text:lower() < bU.Text:lower()
		end)
		bO = bQ
		return bQ
	end
	local function bQ(bR)
		for bS, bT in ipairs(bG) do
			bT:Destroy()
		end
		bG = {}
		local bS, bT, bU = bO, string.lower(bR or ""), 0
		if bT == "" then
			local bV = w:CreateLabel({
				Size = UDim2.new(1, -4, 0, x and 34 or 30),
				Text = string.format("Type to search %d settings", #bS),
				TextSize = L,
				TextTransparency = 0.55,
				ZIndex = 46,
				Parent = bJ,
			})
			w:SkipTranslate(bV)
			table.insert(bG, bV)
			bI.Size = UDim2.fromOffset(bH, (x and 38 or 34) + 10)
			return
		end
		for bV, bW in ipairs(bS) do
			if bU >= 60 then
				break
			end
			if string.find(bW.Haystack, bT, 1, true) then
				bU = bU + 1
				local bX = ai({
					BackgroundColor3 = w.BackgroundColor,
					BorderSizePixel = 0,
					Size = UDim2.new(1, -4, 0, x and 38 or 34),
					ZIndex = 44,
					Parent = bJ,
				})
				T(bX, O)
				local bY = U(bX, "OutlineColor")
				w:AddToRegistry(bX, { BackgroundColor3 = "BackgroundColor" })
				w:CreateLabel({
					Position = UDim2.fromOffset(10, x and 5 or 4),
					Size = UDim2.new(1, -20, 0, 15),
					Text = bW.Text,
					TextSize = L,
					Font = w.FontMedium,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.AtEnd,
					ZIndex = 46,
					Parent = bX,
				})
				w:CreateLabel({
					Position = UDim2.fromOffset(10, x and 21 or 19),
					Size = UDim2.new(1, -20, 0, 13),
					Text = bW.Tab .. "  \u{203a}  " .. bW.Group,
					TextSize = 12,
					TextTransparency = 0.5,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.AtEnd,
					ZIndex = 46,
					Parent = bX,
				})
				w:OnHighlight(bX, bY, { Color = "AccentColor" }, { Color = "OutlineColor" })
				ag(bX, function()
					a6:CloseSearch()
					local bZ = a6.Pages[bW.Tab]
					if bZ then
						bZ.Tab:ShowTab()
						task.defer(function()
							local b_ = bW.Frame.AbsolutePosition.Y - bZ.Columns.AbsolutePosition.Y
							bZ.Scroller.CanvasPosition = Vector2.new(0, math.max(0, b_ - 60))
							task.wait(0.05)
							bN(bW)
						end)
					end
				end)
				table.insert(bG, bX)
			end
		end
		if bU == 0 then
			local bV = w:CreateLabel({
				Size = UDim2.new(1, -6, 0, 30),
				Text = "No matches",
				TextSize = L,
				TextTransparency = 0.5,
				ZIndex = 46,
				Parent = bJ,
			})
			table.insert(bG, bV)
		end
		local bV, bW = math.clamp(bU > 0 and bU or 1, 1, x and 4 or 7), (x and 38 or 34) + 2
		bI.Size = UDim2.fromOffset(bH, (bV * bW) + 10)
	end
	function a6:OpenSearch()
		if bF then
			return
		end
		bF = true
		bI.Visible = true
		w.OpenedFrames[bI] = true
		bg.Color = w.AccentColor
		w:SetRegistry(bg, "Color", "AccentColor")
		bP()
		bQ(bi.Text)
	end
	function a6:CloseSearch()
		if not bF then
			return
		end
		bF = false
		bi:ReleaseFocus()
		bi.Text = ""
		bI.Visible = false
		bI.Size = UDim2.fromOffset(bH, 0)
		bg.Color = w.OutlineColor
		w:SetRegistry(bg, "Color", "OutlineColor")
		w.OpenedFrames[bI] = nil
		for bR, bS in ipairs(bG) do
			bS:Destroy()
		end
		bG = {}
	end
	function a6:ToggleSearch()
		if bF then
			a6:CloseSearch()
		else
			a6:OpenSearch()
			bi:CaptureFocus()
		end
	end
	bi.Focused:Connect(function()
		a6:OpenSearch()
	end)
	bi:GetPropertyChangedSignal("Text"):Connect(function()
		if bF then
			bQ(bi.Text)
		end
	end)
	w:GiveSignal(b.InputBegan:Connect(function(bR, bS)
		if ac(bR) and bF then
			if not w:MouseIsOverFrame(bI, bR) and not w:MouseIsOverFrame(bf, bR) then
				a6:CloseSearch()
			end
			return
		end
		if bR.UserInputType ~= Enum.UserInputType.Keyboard then
			return
		end
		if bR.KeyCode == Enum.KeyCode.Escape and bF then
			a6:CloseSearch()
			return
		end
		if b:GetFocusedTextBox() then
			return
		end
		if not w.Toggled then
			return
		end
		local bT = a1.SearchKeybind or Enum.KeyCode.F
		if bR.KeyCode == bT and (b:IsKeyDown(Enum.KeyCode.LeftControl) or b:IsKeyDown(Enum.KeyCode.RightControl)) then
			a6:ToggleSearch()
		end
	end))
	ax(bc, function()
		a6:ToggleSearch()
	end)
	local bR, bS, bT, bU =
		w:Create(
			"TextButton",
			{ BackgroundTransparency = 1, Size = UDim2.new(0, 0, 0, 0), Visible = true, Text = "", Modal = false, Parent = s }
		),
		{},
		false,
		false
	function w:SetBaseTransparency(bV, bW, bX)
		local bY = bS[bV]
		if bY then
			bY[bW] = bX
		end
		if bU and bT then
			i:Create(bV, TweenInfo.new(0), { [bW] = bX }):Play()
		end
		bV[bW] = bX
	end
	function w:Toggle()
		if bU then
			return
		end
		local bV = a1.MenuFadeTime
		bU = true
		bT = not bT
		w.Toggled = bT
		bR.Modal = bT
		w:RefreshWidgets()
		if bT then
			a7.Visible = true
		end
		a6:CloseSearch()
		for bW, bX in pairs(u) do
			if bX.Type == "Dropdown" and bX.CloseDropdown then
				bX:CloseDropdown()
			elseif bX.Type == "ColorPicker" and bX.Hide then
				bX:Hide()
			end
		end
		for bW, bX in next, a7:GetDescendants() do
			local bY = {}
			if bX:IsA("ImageLabel") then
				table.insert(bY, "ImageTransparency")
				table.insert(bY, "BackgroundTransparency")
			elseif bX:IsA("TextLabel") or bX:IsA("TextBox") then
				table.insert(bY, "TextTransparency")
				table.insert(bY, "TextStrokeTransparency")
			elseif bX:IsA("Frame") or bX:IsA("ScrollingFrame") then
				table.insert(bY, "BackgroundTransparency")
			elseif bX:IsA("UIStroke") then
				table.insert(bY, "Transparency")
			end
			local bZ = bS[bX]
			if not bZ then
				bZ = {}
				bS[bX] = bZ
			end
			for b_, b0 in next, bY do
				if not bZ[b0] then
					bZ[b0] = bX[b0]
				end
				if bZ[b0] == 1 then
					continue
				end
				i:Create(bX, TweenInfo.new(bV, Enum.EasingStyle.Linear), { [b0] = bT and bZ[b0] or 1 }):Play()
			end
		end
		task.wait(bV)
		a7.Visible = bT
		bU = false
	end
	w:GiveSignal(b.InputBegan:Connect(function(bV, bW)
		if type(w.ToggleKeybind) == "table" and w.ToggleKeybind.Type == "KeyPicker" then
			if aJ(bV) == w.ToggleKeybind.Value then
				task.spawn(w.Toggle)
			end
		elseif bV.KeyCode == Enum.KeyCode.RightControl or (bV.KeyCode == Enum.KeyCode.RightShift and not bW) then
			task.spawn(w.Toggle)
		end
	end))
	if w.IsMobile then
		local bV = w:Create(
			"Frame",
			{
				AnchorPoint = Vector2.new(0, 1),
				BackgroundColor3 = w.MainColor,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 10, 1, -8),
				Size = UDim2.fromOffset(150, 34),
				ZIndex = 200,
				Visible = true,
				Parent = s,
			}
		)
		T(bV, 8)
		U(bV, "OutlineColor")
		w:AddToRegistry(bV, { BackgroundColor3 = "MainColor" })
		local bW = w:Create(
			"Frame",
			{
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = w.OutlineColor,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 8, 0.5, 0),
				Size = UDim2.fromOffset(3, 16),
				ZIndex = 202,
				Parent = bV,
			}
		)
		T(bW, 2)
		w:AddToRegistry(bW, { BackgroundColor3 = "OutlineColor" })
		local function bX(bY, bZ, b_)
			local b0 = w:Create(
				"TextButton",
				{
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundColor3 = w.BackgroundColor,
					BorderSizePixel = 0,
					Position = UDim2.new(0, bY, 0.5, 0),
					Size = UDim2.fromOffset(bZ, 24),
					Font = w.FontMedium,
					Text = b_,
					TextColor3 = w.FontColor,
					TextSize = L,
					AutoButtonColor = false,
					ZIndex = 203,
					Parent = bV,
				}
			)
			T(b0, 5)
			w:AddToRegistry(b0, { BackgroundColor3 = "BackgroundColor", TextColor3 = "FontColor" })
			return b0
		end
		local bY, bZ = bX(18, 66, "Show"), bX(90, 52, "Lock")
		w:MakeDraggable(bV)
		bY.MouseButton1Click:Connect(function()
			task.spawn(w.Toggle)
			task.wait(0.05)
			bY.Text = w.Toggled and "Hide" or "Show"
		end)
		bZ.MouseButton1Click:Connect(function()
			w.CantDragForced = not w.CantDragForced
			bZ.Text = w.CantDragForced and "Unlock" or "Lock"
			bZ.BackgroundColor3 = w.CantDragForced and w.AccentColor or w.BackgroundColor
			w:SetRegistry(bZ, "BackgroundColor3", w.CantDragForced and "AccentColor" or "BackgroundColor")
		end)
		w.MobileDock = bV
		w.MobileShowButton = bY
	end
	if a1.AutoShow then
		task.spawn(function()
			w.Toggle()
			if w.IsMobile and w.MobileShowButton then
				w.MobileShowButton.Text = "Hide"
			end
		end)
	end
	a6:SetTabStyle(a1.TabStyle, false, true)
	w:CreateCursor()
	a6.Holder = a7
	w.Window = a6
	w:RefreshWidgets()
	return a6
end
local function a0()
	local a1 = R()
	for a2, a3 in next, u do
		if a3.Type == "Dropdown" and a3.SpecialType == "Player" then
			a3:SetValues(a1)
		end
	end
end
g.PlayerAdded:Connect(a0)
g.PlayerRemoving:Connect(a0)
w.Executor = q
getgenv().Library = w
return w
