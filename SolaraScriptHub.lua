

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Solara ScripHub",
    LoadingTitle = "Enjoy",
    LoadingSubtitle = "by ozaiplayzyt",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "Solara ScripHub",
       Subtitle = "Key System",
       Note = "Key is GCG, Thanks for using.",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"GCG"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

 local Section = Tab:CreateSection("Universal")

 local Button = Tab:CreateButton({
    Name = "InfiniteYield",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() 
    end
 })

 local Button = Tab:CreateButton({
    Name = "Aimbot [Keybind: Y To turn on and off]",
    Callback = function()
    -- The function that takes place when the button is pressed
    -- this script is so Powerful does not like other Aimbot Which this script Make you become God Being like aim
-- Script Aimbot Advanced v1 Developed by Mawin_CK and https://pastebin.com/u/SigmaBoy456 Writed by Mawin_CK and Fixed by Mawin_CK
-- this script make you Able to Automatically Aimlock Instantly at Player Head who nearest to you and not behind wall 
-- Press T to Target Teammate or not Teammate
-- Press Y To turn off and On Aimbot
-- Reccmond must have Good Device and WiFi or else sometime is can lag For only Mobile Player Except PC player
local player = game.Players.LocalPlayer
local Cam = workspace.CurrentCamera

-- Toggles setting set to False or True to toggle rejoin if you want to re settings 
local targetTeammates = true  -- Initially, target non-teammates or teammate
local aimbotActive = true  -- Initial state of the aimbot

-- Function to check if a player is a teammate
local function isTeammate(targetPlayer)
    return targetPlayer.Team == player.Team
end

-- Function to look at a specific position
local function lookAt(targetPosition)
    Cam.CFrame = CFrame.new(Cam.CFrame.Position, targetPosition)
end

-- Function to check if a target is visible (not behind walls)
local function isTargetVisible(targetPart)
    local origin = Cam.CFrame.Position
    local direction = (targetPart.Position - origin).Unit
    local ray = Ray.new(origin, direction * 5000)
    local part, position = workspace:FindPartOnRayWithIgnoreList(ray, {player.Character, Cam})
    
    return part and part:IsDescendantOf(targetPart.Parent)
end

-- Function to get the closest player to the local player
local function getClosestPlayer(trg_part)
    local nearest = nil
    local lastDistance = math.huge
    local localPlayerPos = player.Character.PrimaryPart.Position
    
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild(trg_part) and v.Character:FindFirstChild("Humanoid") then
            local head = v.Character[trg_part]
            local humanoid = v.Character.Humanoid
            if head and humanoid.Health > 0 then  -- Check if the target is alive
                local distance = (localPlayerPos - head.Position).Magnitude
                
                -- Check visibility, distance, and teammate status
                if distance < lastDistance and isTargetVisible(head) then
                    if (targetTeammates and isTeammate(v)) or (not targetTeammates and not isTeammate(v)) then
                        nearest = v
                        lastDistance = distance
                    end
                end
            end
        end
    end
    
    return nearest
end

-- Toggle function to switch between targeting teammates and non-teammates
local function toggleTargetMode()
    targetTeammates = not targetTeammates
    print("Targeting", targetTeammates and "teammates" or "non-teammates")
end

-- Function to toggle aimbot activation
local function toggleAimbot()
    aimbotActive = not aimbotActive
    print("Aimbot", aimbotActive and "enabled" or "disabled")
end

-- RenderStepped connection to perform aiming
game:GetService("RunService").RenderStepped:Connect(function()
    if aimbotActive then
        local closestPlayer = getClosestPlayer("Head")
        if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("Head") then
            lookAt(closestPlayer.Character.Head.Position)
        end
    end
end)

-- Input binding for toggling targeting mode and aimbot (e.g., press 'T' to toggle targeting mode, press 'Y' to toggle aimbot)
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.T then
            toggleTargetMode()
        elseif input.KeyCode == Enum.KeyCode.Y then
            toggleAimbot()
        end
    end
end)

-- Mobile support for toggling aimbot and targeting mode
local UIS = game:GetService("UserInputService")

UIS.TouchTap:Connect(function(touchPositions, processed)
    if not processed then
        local touch = touchPositions[1]
        if touch.Position.Y < workspace.CurrentCamera.ViewportSize.Y / 2 then
            toggleAimbot()
        else
            toggleTargetMode()
        end
    end
end)
    end
 })

 local Button = Tab:CreateButton({
    Name = "StreamSnipe",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV3/main/SCRIPTHUBV3", true))()
    end
 })

 local Section = Tab:CreateSection("Da Hood")

 local Button = Tab:CreateButton({
    Name = "Fake Macro [Keybind: Q]",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://pastebin.com/raw/QW5Whap9"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "TBO",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet('https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript'))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "lqmc",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/lqmc-da-hood/main/lqmc%20da%20hood"))();
    end
 })

 local Button = Tab:CreateButton({
    Name = "Midnight.CC",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/laeraz/midnightcc/main/public.lua"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "7hbl",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/da-hood/main/da%20hood"))();
    end
 })

 local Button = Tab:CreateButton({
    Name = "Vortex",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineProUser/vortexdahood/main/vortex", true))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "Polakaya",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/pixelheadx/Polakya/main/Bestscript.md"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "AzureModded",
    Callback = function()
    -- The function that takes place when the button is pressed
    --[[
############################################################################
#     _     ______   _ ____  _____   __  __  ___  ____  ____  _____ ____   #
#    / \   |__  / | | |  _ \| ____| |  \/  |/ _ \|  _ \|  _ \| ____|  _ \  #
#   / _ \    / /| | | | |_) |  _|   | |\/| | | | | | | | | | |  _| | | | | #
#  / ___ \  / /_| |_| |  _ <| |___  | |  | | |_| | |_| | |_| | |___| |_| | #
# /_/   \_\/____|\___/|_| \_\_____| |_|  |_|\___/|____/|____/|_____|____/  #
#                                                                          #
#  _                   _        _                                          #
# | |__  _   _        / \   ___| |_ _   _ _ __ _ __                        #
# | '_ \| | | |      / _ \ / __| __| | | | '__| '_ \                       #
# | |_) | |_| |     / ___ \ (__| |_| |_| | |  | | | |                      #
# |_.__/ \__, |    /_/   \_\___|\__|\__, |_|  |_| |_|                      #
#        |___/                      |___/                                  #
############################################################################

Actyrn or discord.gg/azuremodded or discord.gg/hUvujCnGMb
Original script credits go to Elegant and Weda
--]]

loadstring(game:HttpGet("https://raw.githubusercontent.com/Actyrn/Scripts/main/AzureModded"))()
    end
 })

 local Section = Tab:CreateSection("MurderMystery2")

 local Button = Tab:CreateButton({
    Name = "SanpSanix",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Roman34296589/SnapSanix-GUI-MM2/main/SnapSanix%20GUI%20mm2.lua'))()
    end
 })

 local Section = Tab:CreateSection("CounterBlox")

 local Button = Tab:CreateButton({
    Name = "Pissblox",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/toasty-dev/pissblox/main/solaris_bootstrapper.lua",true))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "HappyHub",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/uedan228/Happy-Hub/main/Counter%20Blox%3A%20Source%202"))()
    end
 })

 local Section = Tab:CreateSection("BladeBall")

 local Button = Tab:CreateButton({
    Name = "Nexam Hub",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6af56c1753ac6679dee3acbd1fd952e5.lua"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "FFJ1",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
    end
 })

 local Section = Tab:CreateSection("BuildABoat")

 local Button = Tab:CreateButton({
    Name = "AutoFarm",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://scriptblox.com/raw/Build-A-Boat-For-Treasure-utoFrm-Gold-13684"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "AutoBuild",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/max2007killer/auto-build-not-limit/main/autobuild.txt"))()
    end
 })

 local Section = Tab:CreateSection("Sols Rng")

 local Button = Tab:CreateButton({
    Name = "Xeo",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet('https://raw.githubusercontent.com/MercyfulSmoked/Xeo/main/Main.lua'))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "EruditeHub",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ThacG/EruditeHub/main/Sol's%20RNG/V1.69"))()
    end
 })

 local Section = Tab:CreateSection("KAT")

 local Button = Tab:CreateButton({
    Name = "BelugaWare",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/scripter1cursed1rade/BelugaWare-1.4/main/belugaware.lua"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "KatPlus",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Kat-Plus/main/Script"))()
    end
 })

 local Section = Tab:CreateSection("Prison Life")

 local Button = Tab:CreateButton({
    Name = "PrisonWare",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "PrizzLife",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet('https://raw.githubusercontent.com/elliexmln/PrizzLife/main/pladmin.lua'))()
    end
 })

 local Section = Tab:CreateSection("Life in Prison")

 local Button = Tab:CreateButton({
    Name = "Hitbox",
    Callback = function()
    -- The function that takes place when the button is pressed
    local players = game:GetService("Players")
local local_player = players.LocalPlayer
local run_service = game:GetService("RunService")
local starter_gui = game:GetService("StarterGui")

local function extend_hitboxes(delta_time)
    local character = local_player.Character

    if not character then
        return
    end

    local humanoid_root_part = character:FindFirstChild("HumanoidRootPart")

    if not humanoid_root_part then
        return
    end

    for _, player in pairs(players:GetPlayers()) do
        if player == local_player then
            continue
        end

        local player_character = player.Character
        
        if not player_character then
            continue
        end

        local player_humanoid_root_part = player_character:FindFirstChild("HumanoidRootPart")

        if not player_humanoid_root_part then
            continue
        end

        local are_touching = false

        for _, part in pairs(workspace:GetPartsInPart(player_humanoid_root_part)) do
            if part:IsDescendantOf(character) then
                are_touching = true
                break
            end
        end

        if player.Team == local_player.Team or are_touching then
            player_humanoid_root_part.Size = Vector3.new(8, 8, 8)
            player_humanoid_root_part.Transparency = 0.95
            player_humanoid_root_part.BrickColor = player.Team.TeamColor
            player_humanoid_root_part.Shape = Enum.PartType.Ball
            player_humanoid_root_part.CanCollide = false
            continue
        end

        player_humanoid_root_part.Size = Vector3.new(8, 8, 8)
        player_humanoid_root_part.Transparency = 0.7
        player_humanoid_root_part.BrickColor = player.Team.TeamColor
        player_humanoid_root_part.Shape = Enum.PartType.Ball
        player_humanoid_root_part.CanCollide = true
    end
end

run_service.Stepped:Connect(extend_hitboxes)

starter_gui:SetCore("SendNotification", {
    Title = "LOADING";
    Text = "BY: H4X";
    Icon = "rbxassetid://12794329333";
})
    end
 })

 local Section = Tab:CreateSection("Brookhaven")

 local Button = Tab:CreateButton({
    Name = "CarFly",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xlykor/MikeBayraktarCarFly/main/CarFly"))()
    end
 })

 local Section = Tab:CreateSection("Arsenal")

 local Button = Tab:CreateButton({
    Name = "Midnight.CC",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/laeraz/midnightcc/main/public.lua"))()
    end
 })

 local Tab = Window:CreateTab("Info", 4483362458) -- Title, Image

 local Label = Tab:CreateLabel("Created By: OzaiPlayzYT")

 local Label = Tab:CreateLabel("YouTube: youtube.com/@OzaiPlayzYT")

 local Paragraph = Tab:CreateParagraph({Title = "Discord: ozaiplayzyt", Content = "Dm me if something is wrong."})

 local Paragraph = Tab:CreateParagraph({Title = "Nameless", Content = "If you see a nameless button then idk the name."})
