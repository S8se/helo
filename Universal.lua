-- init
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("DEV.TOOLS UNIVERSAL", 5013109572)
local LocalPlayer = game.Players.LocalPlayer
local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumRoot = Char.HumanoidRootPart
local TS = game:GetService("TweenService")
local Speed = 250
local OldAmbient = game.Lighting.Ambient
local gameID = game.PlaceId
local OldFog = game.Lighting.FogEnd
local OldOutdoorAmbient = game.Lighting.OutdoorAmbient
local x = {}

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
local pagex = venyx:addPage("[+]")
local sectiona = pagex:addSection("WELCOME")     
local page = venyx:addPage("DEV", 5012544693)
local section1 = page:addSection("DEV.TOOLS")
local section2 = page:addSection("PLRS")
local section3 = page:addSection("Lightning")
local page1 = venyx:addPage("DEVTP", 5012544693)
local sectionA = page1:addSection("Places")
local sectionB = page1:addSection("Specific")




a = "%x"
b = "%X"
warn("Executed At", os.date(a), os.date(b), "No Errors were found.")
sectiona:addButton("x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x")
sectiona:addButton("i dont know how to add label so i used button instead lol")
sectiona:addButton("due to my stupidity")
sectiona:addButton(os.date(a))
sectiona:addButton("x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x")
sectiona:addButton("Click for Teleport (Tween method) script form", function()
    setclipboard("https://raw.githubusercontent.com/S8se/fat/main/TS")
end)
sectiona:addButton("Click for Teleport scirpt from", function ()
    setclipboard("https://raw.githubusercontent.com/S8se/helo/main/cframenew")
end)
sectiona:addButton("SimpleSpy", function ()
    loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
end)
sectiona:addButton("Infinite Yiff", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
sectiona:addButton("x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x")
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
Fly = false
function activatefly()
    local mouse =game.Players.LocalPlayer:GetMouse''
    local player =game.Players.LocalPlayer
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local torso = game.Players.LocalPlayer.Character.HumanoidRootPart
    local speedSET=25
    local keys={a=false,d=false,w=false,s=false}
    local e1
    local e2
    local function start()
        local pos = Instance.new("BodyPosition",torso)
        local gyro = Instance.new("BodyGyro",torso)
        pos.Name="EPIXPOS"
        pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
        pos.position = torso.Position
        gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        gyro.cframe = torso.CFrame
        repeat
            wait()
            LocalPlayer.Character.Humanoid.PlatformStand=true
            local new=gyro.cframe - gyro.cframe.p + pos.position
            if not keys.w and not keys.s and not keys.a and not keys.d then
                speed=1
            end
            if keys.w then
                new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed=speed+speedSET
            end
            if keys.s then
                new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed=speed+speedSET
            end
            if keys.d then
                new = new * CFrame.new(speed,0,0)
                speed=speed+speedSET
            end
            if keys.a then
                new = new * CFrame.new(-speed,0,0)
                speed=speed+speedSET
            end
            if speed>speedSET then
                speed=speedSET
            end
            pos.position=new.p
            if keys.w then
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*15),0,0)
            elseif keys.s then
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*15),0,0)
            else
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame
            end
        until not Fly
        if gyro then 
            gyro:Destroy() 
        end
        if pos then 
            pos:Destroy() 
        end
        flying=false
        LocalPlayer.Character.Humanoid.PlatformStand=false
        speed=0
    end
    e1=mouse.KeyDown:connect(function(key)
        if not torso or not torso.Parent then 
            flying=false e1:disconnect() e2:disconnect() return 
        end
        if key=="w" then
            keys.w=true
        elseif key=="s" then
            keys.s=true
        elseif key=="a" then
            keys.a=true
        elseif key=="d" then
            keys.d=true
        end
    end)
    e2=mouse.KeyUp:connect(function(key)
        if key=="w" then
            keys.w=false
        elseif key=="s" then
            keys.s=false
        elseif key=="a" then
            keys.a=false
        elseif key=="d" then
            keys.d=false
        end
    end)
    start()
end
section1:addToggle("Fly",nil , function(vu) 
    Fly = vu
    activatefly()
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
section1:addTextbox("Walkspeed [good ol' humanoid method]", "Number", function(Vu)
    Char.Humanoid.WalkSpeed = Vu
end)
section1:addTextbox("Jumppower [good ol' humanoid method]", "Number", function(Vu)
    Char.Humanoid.JumpPower = Vu
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
             Time = (game.Players[Plrs].Character.HumanoidRootPart.CFrame.p - HumRoot.Position).Magnitude / Speed
             Info = TweenInfo.new(Time, Enum.EasingStyle.Linear)
             Tween = TS:Create(HumRoot,Info,{CFrame = CFrame.new(game.Players[Plrs].Character.HumanoidRootPart.CFrame.p)})
             Tween:Play()
         elseif ToSelectedPlayer == false then
             Tween:Cancel()
         end
     end
end)
section2:addToggle("Tween To PLrs",nil, function(vu)
    ToSelectedPlayer = vu
end)
function Mag()
    spawn(function()
    while Magnet do wait()
        HumRoot.CFrame = game.Players[Plrs].Character.HumanoidRootPart.CFrame    
    end
    end)
end
section2:addToggle("Magnet Plrs", nil, function(vu)
    Magnet = vu 
    if Magnet then
        Mag()
    end
end)
spawn(function()
    while wait() do
        if Ambient then
            game.Lighting.Ambient = Color3.fromRGB(255,255,255)
        elseif Ambient == false then
            game.Lighting.Ambient = OldAmbient
        end
    end
end)
section3:addToggle("Bright Ambient",nil,function(value)
    Ambient = value
end)
spawn(function()
    while wait() do
       if Fog then
           game.Lighting.FogEnd = 99999999999999
       elseif Fog == false then
            game.Lighting.FogEnd =  OldFog
       end 
    end
end)
section3:addToggle("Remove Fog", nil,function(viu)
    Fog = viu
end)
spawn(function()
    while wait() do
       if BOA then
           game.Lighting.OutdoorAmbient = Color3.fromRGB(255,255,255)
       elseif BOA == false then
            game.Lighting.OutdoorAmbient = OldOutdoorAmbient
       end 
    end
end)
section3:addToggle("Bright Outdoor Ambient",nil,function(vu)
    BOA = vu
end)
sectionA:addButton("Rejoin Server", function()
    game:GetService("TeleportService"):Teleport(gameID, LocalPlayer)
end)
function Hop()
	for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			x[#x + 1] = v.id
		end
	end
	if #x > 0 then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
    end
end
sectionA:addButton("Server Hop", function()
    Hop()
end)
sectionA:addTextbox(
    "Teleport Other game [REQUIRE GAMEID]", "INPUT GAMEID", function(vu)
        game:GetService("TeleportService"):Teleport(vu, LocalPlayer)
end)
sectionB:addButton("Copy Current Vector3 value", function()
    setclipboard(tostring(HumRoot.CFrame.p))
end)


-- second page
local Settings = venyx:addPage("Configurations", 5012544693)
local colors = Settings:addSection("Colors")
local Other = Settings:addSection("Others")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
venyx:setTheme(theme, color3)
end)
end

Other:addButton("Destroy UI", function()
    for k, v in next, game:GetService("CoreGui"):GetChildren() do
        if v.Name == "DEV.TOOLS UNIVERSAL" then
            v:Destroy()
        end
    end    
end)
Other:addKeybind("Toggle Keybind", Enum.KeyCode.RightControl, function()
    venyx:toggle()
end)
-- load
venyx:SelectPage(venyx.pages[1], true)



