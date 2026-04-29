local ts = game:GetService("TweenService")
local char = game.Players.LocalPlayer.Character
local done = false
local originalpos = nil
local originalmaterials = {}
local forcefield = true
local timefortween = 13.5
local tagtext = "boat lover 3000"
local animation = "133640711863790"
local forcefieldanimation = "None"
local autowinrunning = false
local currentanim = nil
local activetweens = {}
local RunService = game:GetService("RunService")

local cloneref = (cloneref or clonereference or function(instance)
	return instance
end)
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local HttpService = cloneref(game:GetService("HttpService"))

local WindUI

do
	local ok, result = pcall(function()
		return require("./src/Init")
	end)

	if ok then
		WindUI = result
	else
		if cloneref(game:GetService("RunService")):IsStudio() then
			WindUI = require(cloneref(ReplicatedStorage:WaitForChild("WindUI"):WaitForChild("Init")))
		else
			WindUI =
				loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
		end
	end
end

WindUI:AddTheme({
	Name = "Cyanile", -- theme name

	Accent = Color3.fromRGB(5, 100, 230),
	Background = Color3.fromRGB(15, 15, 15),
	BackgroundTransparency = 0.15,
	Outline = Color3.fromRGB(5, 100, 230),
	Text = Color3.fromRGB(255, 255, 255),
	Placeholder = Color3.fromRGB(125, 125, 125),
	Button = Color3.fromRGB(15, 40, 200),
	Icon = Color3.fromRGB(0, 125, 255), 

	Hover = Color3.fromRGB(5, 175, 255),

	WindowBackground = Color3.fromRGB(15, 15, 15),
	WindowShadow = Color3.fromRGB(0, 5, 75),

	DialogBackground = Color3.fromRGB(15, 15, 15),
	DialogBackgroundTransparency = 0.15,
	DialogTitle = Color3.fromRGB(255, 255, 255),
	DialogContent = Color3.fromRGB(255, 255, 255),
	DialogIcon = Color3.fromRGB(5, 100, 230),


	WindowTopbarButtonIcon = Color3.fromRGB(5, 100, 230),
	WindowTopbarTitle = Color3.fromRGB(255, 255, 255),
	WindowTopbarAuthor = Color3.fromRGB(125, 125, 125),
	WindowTopbarIcon = Color3.fromRGB(0, 125, 255),


	TabBackground = Color3.fromRGB(15, 40, 200),
	TabTitle = Color3.fromRGB(255, 255, 255),
	TabIcon = Color3.fromRGB(5, 100, 230),


	ElementBackground = Color3.fromRGB(5, 15, 30),
	ElementTitle = Color3.fromRGB(255, 255, 255),
	ElementDesc = Color3.fromRGB(160, 160, 160),
	ElementIcon = Color3.fromRGB(5, 100, 230),


	PopupBackground = Color3.fromRGB(15, 15, 15),
	PopupBackgroundTransparency = 0.15,
	PopupTitle = Color3.fromRGB(255, 255, 255),
	PopupContent = Color3.fromRGB(255, 255, 255),
	PopupIcon = Color3.fromRGB(5, 100, 230),


	Toggle = Color3.fromRGB(15, 40, 200),
	ToggleBar = Color3.fromRGB(5, 100, 230),


	Checkbox = Color3.fromRGB(15, 40, 200),
	CheckboxIcon = Color3.fromRGB(5, 100, 230),

	Slider = Color3.fromRGB(15, 40, 200),
	SliderThumb = Color3.fromRGB(5, 100, 230),
})
function createPopup()
	return WindUI:Popup({
		Title = "fucking boats since 2026",
		Icon = "bird",
		Content = "https://discord.gg/pymGxT7KXR",
		Buttons = {
			{
				Title = "Hahaha",
				Icon = "bird",
				Variant = "Tertiary",
			},
			{
				Title = "Hahaha",
				Icon = "bird",
				Variant = "Tertiary",
			},
			{
				Title = "Hahaha",
				Icon = "bird",
				Variant = "Tertiary",
			},
		},
	})
end

-- */  Window  /* --
local Window = WindUI:CreateWindow({
	Title = "boat lover 3000",
	--Author = "by .ftgs • Footagesus",
	Folder = "boatlover",
	Icon = "solar:folder-2-bold-duotone",
	--Theme = "Mellowsi",
	--IconSize = 22*2,
	NewElements = true,
	--Size = UDim2.fromOffset(700,700),

	HideSearchBar = false,

	OpenButton = {
		Title = "love boats", -- can be changed
		CornerRadius = UDim.new(1, 0), -- fully rounded
		StrokeThickness = 3, -- removing outline
		Enabled = true, -- enable or disable openbutton
		Draggable = true,
		OnlyMobile = false,
		Scale = 0.5,

		Color = ColorSequence.new(Color3.fromHex("#30FF6A"), Color3.fromHex("#e7ff2f")),
	},
	Topbar = {
		Height = 44,
		ButtonsType = "Mac",
	},
})
local Tab = Window:Tab({
	Title = "Main",
	Icon = "house",
	Locked = false,
})
local didstart = false
local Button = Tab:Button({
	Title = "Start",
	Desc = "Start the auto farm.",
	Locked = false,
	Callback = function()
		if autowinrunning then
			stopautowin()
			didstart = false
		else
			autowin()
			didstart = true
		end
	end,
})
local Tab1 = Window:Tab({
	Title = "Config",
	Icon = "settings",
	Locked = false,
})
local Toggle = Tab1:Toggle({
	Title = "ForceField",
	Desc = "Enable setting all your parts material to ForceField (visual, doesn't affect anything.)",
	Icon = "circle",
	Type = "Checkbox",
	Value = true,
	Callback = function(state)
		forcefield = true
	end,
})
local Slider = Tab1:Slider({
	Title = "Time",
	Desc = "How long it takes\nto get to the end.\n(higher = more reliable,\ndefault = 13.5)",

	Step = 0.1,
	Value = {
		Min = 8,
		Max = 20,
		Default = 13.5,
	},
	Callback = function(value)
		timefortween = value
	end,
})
local Input = Tab1:Input({
	Title = "Tag Text",
	Desc = "Input text",
	Value = "boat lover 3000",
	InputIcon = "keyboard",
	Type = "Input",
	Placeholder = "Enter text to display on member tag...",
	Callback = function(input)
		char.HumanoidRootPart.GroupLabel.TextLabel.Text = input
		tagtext = input
	end,
})
animation = 10713990381
local ForceFieldDropdown = Tab1:Dropdown({
	Title = "ForceField Animation",
	Desc = "Changes the ForceField material animation",
	Values = {
		"None",
		"ForceField",
		"Neon",
		"Glass",
		"Ice",
		"DiamondPlate",
		"Plastic",
		"Wood",
		"Marble",
		"Granite",
		"Slate",
		"Concrete",
		"CorrodedMetal",
		"Metal",
		"Brick",
		"Pebble",
		"Cobblestone",
		"Sand",
		"Fabric",
		"Grass",
		"Rock",
		"Water",
		"Snow",
	},
	Value = "None",
	Callback = function(option)
		forcefieldanimation = option
	end,
})
local Dropdown = Tab1:Dropdown({
	Title = "Animation",
	Desc = "Sets animation (the one playing when auto farm starts).",
	Values = { "10713990381 (Bodybuilder)", "10714340543 (Floss)", "140666916022488 (The Worm)" },
	Value = "10713990381 (Bodybuilder)",
	Callback = function(option)
		animation = string.split(option, " ")[1]
	end,
})
local Section2 = Tab1:Section({
	Title = "This only applies after you start/restart the auto farm!",
	Box = true,
	TextXAlignment = "Center",
})
local haventrespawned = true
function autowin()
	if autowinrunning then
		return
	end
    if workspace.BoatStages.OtherStages.LightHouseStage.Water then
        workspace.BoatStages.OtherStages.LightHouseStage.Water:Destroy()
    end
	autowinrunning = true
	WindUI:Notify({
		Title = "boat lover 3000",
		Content = "starting auto farm",
		Duration = 5,
		Icon = "info",
	})
	Button:SetTitle("Stop")
	Button:SetDesc("Stop the auto farm.")

	if not char or not char:FindFirstChild("HumanoidRootPart") then
		autowinrunning = false
		return
	end

	originalpos = char.HumanoidRootPart.CFrame
	originalmaterials = {}
	for i, v in char:GetDescendants() do
		if v:IsA("BasePart") then
			originalmaterials[v] = v.Material
		end
	end

	local spawnedtask = task.spawn(function()
		local rs = game:GetService("RunService")
		while autowinrunning do
			char = game.Players.LocalPlayer.Character
			if char and char:FindFirstChild("HumanoidRootPart") then
				char.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
				--[[anti afk]]
				local virtualuser = cloneref(game:GetService("VirtualInputManager"))
				virtualuser:SendKeyEvent(true, Enum.KeyCode.E, false, game)
				virtualuser:SendKeyEvent(false, Enum.KeyCode.E, false, game)
			end
			rs.Heartbeat:Wait()
		end
	end)

	local hum = char:FindFirstChild("Humanoid")
	if not hum then
		autowinrunning = false
		return
	end

	local anim = Instance.new("Animation")
	if
		char:FindFirstChild("HumanoidRootPart")
		and char.HumanoidRootPart:FindFirstChild("GroupLabel")
		and char.HumanoidRootPart.GroupLabel:FindFirstChild("TextLabel")
	then
		char.HumanoidRootPart.GroupLabel.TextLabel.Text = tagtext
	end
	WindUI:Notify({
		Title = "boat lover 3000",
		Content = "setting visual stuff (animations, forcefields, noclip, etc.)",
		Duration = 5,
		Icon = "info",
	})
	if forcefield then
		for i, v in char:GetDescendants() do
			if v:IsA("BasePart") then
				if forcefieldanimation == "None" then
					v.Material = Enum.Material.ForceField
				else
					v.Material = Enum.Material[forcefieldanimation]
				end
				v.BrickColor = BrickColor.new("White")
			end
		end
	end
	for _, v in char:GetDescendants() do
		if v:IsA("BasePart") then
			v.CanCollide = false
		end
	end

	anim.AnimationId = "rbxassetid://" .. animation
	currentanim = hum:LoadAnimation(anim)
	currentanim.Priority = Enum.AnimationPriority.Action4
	currentanim.Looped = true
	currentanim:Play()
	WindUI:Notify({
		Title = "boat lover 3000",
		Content = "done setting up visual stuff, going to end",
		Duration = 5,
		Icon = "info",
	})
	local tween1 = ts:Create(
		char.HumanoidRootPart,
		TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
		{ CFrame = CFrame.new(-49.53977966308594, 50.675152778625488, -210.26626586914062) }
	)
	tween1:Play()
	table.insert(activetweens, tween1)

	local startTime = tick()
	while tick() - startTime < 1 and autowinrunning do
		task.wait()
	end
	if not autowinrunning then
		return
	end

	char.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
	char.Humanoid.PlatformStand = true
	char.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero

	local tween2 = ts:Create(
		char.HumanoidRootPart,
		TweenInfo.new(timefortween, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
		{ CFrame = CFrame.new(-49.53977966308594, 50.675152778625488, 8704.6015625) }
	)
	tween2:Play()
	table.insert(activetweens, tween2)

	startTime = tick()
	while tick() - startTime < timefortween and autowinrunning do
		task.wait()
	end
	if not autowinrunning then
		return
	end

	local tween3 = ts:Create(
		char.HumanoidRootPart,
		TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
		{ CFrame = CFrame.new(-49.7924575805664, -293.89971923828125, 8704.3369140625) }
	)
	tween3:Play()
	table.insert(activetweens, tween3)

	startTime = tick()
	while tick() - startTime < 0.25 and autowinrunning do
		task.wait()
	end
	if not autowinrunning then
		return
	end

	char.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero

	local tween4 = ts:Create(
		char.HumanoidRootPart,
		TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
		{ CFrame = CFrame.new(-55.33697509765625, -362.5498352050781, 9492.3759765625) }
	)

	tween4:Play()
	table.insert(activetweens, tween4)
	startTime = tick()
	while tick() - startTime < 0.25 and autowinrunning do
		task.wait()
	end
	if not autowinrunning then
		return
	end

	local spawnedtask2 = task.spawn(function()
		WindUI:Notify({
			Title = "boat lover 3000",
			Content = "waiting for chest to get claimed",
			Duration = 5,
			Icon = "info",
		})
		while autowinrunning and haventrespawned do
			char.HumanoidRootPart.CFrame = CFrame.new(-55.33697509765625, -361.0498352050781, 9491.87597656255)
			task.wait(0.1)
		end
		WindUI:Notify({
			Title = "boat lover 3000",
			Content = "auto farm done",
			Duration = 5,
			Icon = "info",
		})
	end)

	task.cancel(spawnedtask)
end

function stopautowin()
	autowinrunning = false

	Button:SetTitle("Start")
	Button:SetDesc("Start the auto farm.")

	if currentanim then
		currentanim:Stop()
		currentanim:Destroy()
		currentanim = nil
	end

	for _, tween in ipairs(activetweens) do
		if tween then
			tween:Cancel()
		end
	end
	activetweens = {}

	char.Humanoid.PlatformStand = false
	char.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero

	if originalpos then
		char.HumanoidRootPart.CFrame = originalpos
	end

	for part, material in pairs(originalmaterials) do
		if part and part:IsA("BasePart") then
			part.Material = material
		end
	end

	originalpos = nil
	originalmaterials = {}
end

-- */  Colors  /* --
local Purple = Color3.fromHex("#7775F2")
local Yellow = Color3.fromHex("#ECA201")
local Green = Color3.fromHex("#10C550")
local Grey = Color3.fromHex("#83889E")
local Blue = Color3.fromHex("#257AF7")
local Red = Color3.fromHex("#EF4F1D")

-- */ Other Functions /* --
local function parseJSON(luau_table, indent, level, visited)
	indent = indent or 2
	level = level or 0
	visited = visited or {}

	local currentIndent = string.rep(" ", level * indent)
	local nextIndent = string.rep(" ", (level + 1) * indent)

	if luau_table == nil then
		return "null"
	end

	local dataType = type(luau_table)

	if dataType == "table" then
		if visited[luau_table] then
			return '"[Circular Reference]"'
		end

		visited[luau_table] = true

		local isArray = true
		local maxIndex = 0

		for k, _ in pairs(luau_table) do
			if type(k) == "number" and k > maxIndex then
				maxIndex = k
			end
			if type(k) ~= "number" or k <= 0 or math.floor(k) ~= k then
				isArray = false
				break
			end
		end

		local count = 0
		for _ in pairs(luau_table) do
			count = count + 1
		end
		if count ~= maxIndex and isArray then
			isArray = false
		end

		if count == 0 then
			return "{}"
		end

		if isArray then
			if count == 0 then
				return "[]"
			end

			local result = "[\n"

			for i = 1, maxIndex do
				result = result .. nextIndent .. parseJSON(luau_table[i], indent, level + 1, visited)
				if i < maxIndex then
					result = result .. ","
				end
				result = result .. "\n"
			end

			result = result .. currentIndent .. "]"
			return result
		else
			local result = "{\n"
			local first = true

			local keys = {}
			for k in pairs(luau_table) do
				table.insert(keys, k)
			end
			table.sort(keys, function(a, b)
				if type(a) == type(b) then
					return tostring(a) < tostring(b)
				else
					return type(a) < type(b)
				end
			end)

			for _, k in ipairs(keys) do
				local v = luau_table[k]
				if not first then
					result = result .. ",\n"
				else
					first = false
				end

				if type(k) == "string" then
					result = result .. nextIndent .. '"' .. k .. '": '
				else
					result = result .. nextIndent .. '"' .. tostring(k) .. '": '
				end

				result = result .. parseJSON(v, indent, level + 1, visited)
			end

			result = result .. "\n" .. currentIndent .. "}"
			return result
		end
	elseif dataType == "string" then
		local escaped = luau_table:gsub("\\", "\\\\")
		escaped = escaped:gsub('"', '\\"')
		escaped = escaped:gsub("\n", "\\n")
		escaped = escaped:gsub("\r", "\\r")
		escaped = escaped:gsub("\t", "\\t")

		return '"' .. escaped .. '"'
	elseif dataType == "number" then
		return tostring(luau_table)
	elseif dataType == "boolean" then
		return luau_table and "true" or "false"
	elseif dataType == "function" then
		return '"function"'
	else
		return '"' .. dataType .. '"'
	end
end

local function tableToClipboard(luau_table, indent)
	indent = indent or 4
	local jsonString = parseJSON(luau_table, indent)
	setclipboard(jsonString)
	return jsonString
end

-- */  About Tab  /* --
WindUI:SetTheme("Cyanile")
game.Players.LocalPlayer.CharacterAdded:Connect(function(newchar)
	if not didstart then
		return
	end
	autowinrunning = false
	haventrespawned = false
	char = game.Players.LocalPlayer.Character
	char:WaitForChild("HumanoidRootPart")
	task.wait(0.5)
	WindUI:Notify({
		Title = "boat lover 3000",
		Content = "detected respawn, restarting!",
		Duration = 3,
		Icon = "info",
	})
	autowin()
end)

local SupportTab = Window:Tab({
	Title = "Support Me",
	Icon = "hand-heart",
})

local Section3 = SupportTab:Section({
	Title = "Support Me by Joining My Server!",
	Box = true,
})

local Button4 = SupportTab:Button({
	Title = "Join Discord",
	Desc = "Click to join our Discord server for more awesome scripts!",
	Callback = function()
		setclipboard("https://discord.gg/pymGxT7KXR")
		WindUI:Notify({
			Title = "Copied to clipboard!",
			Content = "https://discord.gg/pymGxT7KXR",
			Duration = 3,
			Icon = "check",
		})
	end,
})
