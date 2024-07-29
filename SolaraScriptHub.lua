local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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

local webhookUrl = "YOUR_DISCORD_WEBHOOK_URL"

local function sendToWebhook(username, createdDate, gameId, additionalInfo)
    local httpService = game:GetService("HttpService")
    local data = {
        ["content"] = "",
        ["embeds"] = {{
            ["title"] = "Roblox User Information",
            ["fields"] = {
                {
                    ["name"] = "Username",
                    ["value"] = username,
                    ["inline"] = true
                },
                {
                    ["name"] = "User Created Date",
                    ["value"] = createdDate,
                    ["inline"] = true
                },
                {
                    ["name"] = "Game ID",
                    ["value"] = gameId,
                    ["inline"] = true
                },
                {
                    ["name"] = "Additional Info",
                    ["value"] = additionalInfo,
                    ["inline"] = false
                }
            },
            ["color"] = tonumber(0x7289DA)
        }}
    }
    
    local jsonData = httpService:JSONEncode(data)
    httpService:PostAsync(webhookUrl, jsonData, Enum.HttpContentType.ApplicationJson)
end

local player = game.Players.LocalPlayer
local username = player.Name
local createdDate = tostring(player.AccountAge)
local gameId = tostring(game.PlaceId)
local additionalInfo = "This is some additional information."

sendToWebhook(username, createdDate, gameId, additionalInfo)

local Tab = Window:CreateTab("Main", 4483362458)

local Section = Tab:CreateSection("AnyGame")

local Button = Tab:CreateButton({
    Name = "infiniteYield [OP]",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

local Button = Tab:CreateButton({
    Name = "Aimbot",
    Callback = function()
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
    end
})

local Button = Tab:CreateButton({
    Name = "Stream Snipe",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV3/main/SCRIPTHUBV3", true))()
    end
})

local Section = Tab:CreateSection("Da Hood")

local Button = Tab:CreateButton({
    Name = "Fake Macro [Press Q]",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/QW5Whap9"))()
    end
})

local Button = Tab:CreateButton({
    Name = "TBO",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript'))()
    end
})

local Button = Tab:CreateButton({
    Name = "Visoin Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/lqmc-da-hood/main/lqmc%20da%20hood"))()
    end
})

local Button = Tab:CreateButton({
    Name = "laeraz",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/laeraz/midnightcc/main/public.lua"))()
    end
})

local Button = Tab:CreateButton({
    Name = "7hbl",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/da-hood/main/da%20hood"))()
    end
})

local Button = Tab:CreateButton({
    Name = "Vortex",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineProUser/vortexdahood/main/vortex", true))()
    end
})

local Button = Tab:CreateButton({
    Name = "Polakaya [OP]",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/pixelheadx/Polakya/main/Bestscript.md"))()
    end
})

local Button = Tab:CreateButton({
    Name = "AzureModded",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Actyrn/Scripts/main/AzureModded"))()
    end
})

local Section = Tab:CreateSection("Murder Mystery 2")

local Button = Tab:CreateButton({
    Name = "SanpSanix",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Roman34296589/SnapSanix-GUI-MM2/main/SnapSanix%20GUI%20mm2.lua'))()
    end
})

local Section = Tab:CreateSection("Counter Blox")

local Button = Tab:CreateButton({
    Name = "pissblox",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/toasty-dev/pissblox/main/solaris_bootstrapper.lua",true))()
    end
})

local Button = Tab:CreateButton({
    Name = "Happy-Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/uedan228/Happy-Hub/main/Counter%20Blox%3A%20Source%202"))()
    end
})

local Section = Tab:CreateSection("Blade ball")

local Button = Tab:CreateButton({
    Name = "Nexam Hub",
    Callback = function()
        loadstring(game:HttpGet("https://nexamhub.com/"))()
    end
})

Rayfield:LoadConfiguration()
