-- init
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("DEV.TOOLS UNIVERSAL", 5013109572)
local LocalPlayer = game.Players.LocalPlayer
local Char = LocalPlayer.Character
local HumRoot = Char.HumanoidRootPart
local TS = game:GetService("TweenService")
local Speed = 250

-- themes
local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(0, 0, 0),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),  
TextColor = Color3.fromRGB(255, 255, 255)
}

-- first page
local page = venyx:addPage("DEV", 5012544693)
local section1 = page:addSection("DEV.TOOLS")
local section2 = page:addSection("PLRS")

spawn(function()
    while wait() do
        if Anchored then
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        else game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        end
    end
    end)
section1:addToggle("Anchored", nil, function(value)
    Anchored = value
end)

spawn(function()
    while wait() do
        if Fly then
            print("NOT DONE YET")
        end
    end
    end)
section1:addToggle("Fly[wip]",nil , function(vu) 
    Fly = value
end)


spawn(function()
    while true do
    player = game.Players.LocalPlayer
    character = player.Character
    if nc then
        for _, v in pairs(character:GetDescendants()) do
            pcall(function()
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end)
        end
    end
    game:GetService("RunService").Stepped:wait()
end
end)
section1:addToggle("NoClip", nil, function(value)
    nc = value
end)

plrsl = {}

for k,v in pairs(game.Players:GetPlayers()) do
    if v ~= game.Players.LocalPlayer then
        table.insert(plrsl,v.Name)
    end
end
section2:addDropdown("Players", plrsl, function(vu)
    Plrs = vu
end)
section2:addButton("Refresh Plrs", function()
    table.clear(plrsl)
    for k,v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer then
            table.insert(plrsl,v.Name)
        end
    end
end)
section2:addButton("Teleport To PLrs", function()
    HumRoot.CFrame = game.Players[Plrs].Character.HumanoidRootPart.CFrame
end)
 spawn(function()
     while wait() do
         if ToSelectedPlayer then
             Time = (game.Players[Plrs].Character.HumanoidRootPart.CFrame.p - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / Speed
             Info = TweenInfo.new(Time, Enum.EasingStyle.Linear)
             Tween = TS:Create(game.Players.LocalPlayer.Character.HumanoidRootPart,Info,{CFrame = CFrame.new(game.Players[Plrs].Character.HumanoidRootPart.CFrame.p)})
             Tween:Play()
         elseif ToSelectedPlayer == false then
             Tween:Cancel()
         end
     end
end)
section2:addToggle("Tween To PLrs",nil, function(vu)
    ToSelectedPlayer = vu
end)



-- second page
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
venyx:setTheme(theme, color3)
end)
end

-- load
venyx:SelectPage(venyx.pages[1], true)