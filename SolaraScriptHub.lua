local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local function sendWebhookLog(message)
    local webhookUrl = "https://discord.com/api/webhooks/1267324391490981958/xw8GIxG1kCp772OUPXhQJH6foWEQh36kF87Phv2hecJLw5DjchbPq7P4GKUyj6mPKPZC"
    local data = {
        ["content"] = message
    }
    local success, response = pcall(function()
        return game:GetService("HttpService"):PostAsync(webhookUrl, game:GetService("HttpService"):JSONEncode(data), Enum.HttpContentType.ApplicationJson)
    end)
    if not success then
        print("Failed to send webhook:", response)
    end
end

local Window = Rayfield:CreateWindow({
    Name = "Solara ScripHub",
    LoadingTitle = "Enjoy",
    LoadingSubtitle = "by ozaiplayzyt",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Big Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Solara ScripHub",
        Subtitle = "Key System",
        Note = "Try to guess the key: ₲₵₲",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"GCG"}
    }
})

local Tab = Window:CreateTab("Main", 4483362458)

local function createButton(name, callback)
    local Button = Tab:CreateButton({
        Name = name,
        Callback = callback
    })
    if not Button then
        print("Failed to create button:", name)
    end
end

createButton("infiniteYield [OP]", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

createButton("Aimbot", function()
    -- Aimbot code
    local player = game.Players.LocalPlayer
    local Cam = workspace.CurrentCamera

    local targetTeammates = true
    local aimbotActive = true

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
end)

createButton("Stream Snipe", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV3/main/SCRIPTHUBV3", true))()
end)

createButton("Fake Macro [Press Q]", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/QW5Whap9"))()
end)

createButton("TBO", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript'))()
end)

createButton("Visoin Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/lqmc-da-hood/main/lqmc%20da%20hood"))()
end)

createButton("laeraz", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/laeraz/midnightcc/main/public.lua"))()
end)

createButton("7hbl", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/da-hood/main/da%20hood"))()
end)

createButton("Vortex", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineProUser/vortexdahood/main/vortex", true))()
end)

createButton("Polakaya [OP]", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/pixelheadx/Polakya/main/Bestscript.md"))()
end)

createButton("AzureModded", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Actyrn/Scripts/main/AzureModded"))()
end)

-- Add other buttons similarly...

-- Example of logging an action
sendWebhookLog("Script loaded successfully.")
