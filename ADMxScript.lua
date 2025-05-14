-- Create a loading screen for Adopt Me
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AdoptMeLoader"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = game:GetService("CoreGui")

local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
background.BorderSizePixel = 0
background.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0, 350, 0, 50)
textLabel.Position = UDim2.new(0.5, -175, 0.5, -25)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
textLabel.Font = Enum.Font.FredokaOne
textLabel.TextScaled = true
textLabel.Text = "Loading Adopt Me Script..."
textLabel.Parent = background

-- Animated dots while loading
local run = true
task.spawn(function()
	local dots = 0
	while run do
		dots = (dots + 1) % 4
		textLabel.Text = "Loading Adopt Me Script" .. string.rep(".", dots)
		task.wait(0.4)
	end
end)

-- Load your external Adopt Me script while screen shows
task.spawn(function()
	local success, result = pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/DoDoHub-12/NEWW/refs/heads/main/Script1.lua"))()
	end)

	if not success then
		warn("Adopt Me script failed to load:", result)
	end

	task.wait(2) -- Delay to show loading even if it's fast
	run = false
	screenGui:Destroy()
end)
