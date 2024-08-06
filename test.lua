-- Variables
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local SendWebhook = ReplicatedStorage:WaitForChild("SendWebhook")

local webhookURL = "https://discord.com/api/webhooks/1270071017464922193/s3i_A9VomZOJcfKB01UkEf-mS8UBcuN-bLewVPLU9oqibehcGYIHPFHsM1_LxlbtvVJK" -- Your Discord webhook URL

-- Function to send webhook
local function sendWebhook(username, timeSpent)
    local data = {
        ["content"] = string.format("Player %s spent %d seconds in the game.", username, timeSpent)
    }

    local success, err = pcall(function()
        HttpService:PostAsync(webhookURL, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
    end)

    if not success then
        warn("Failed to send webhook: " .. err)
    end
end

-- PlayerAdded and PlayerRemoving handlers
Players.PlayerAdded:Connect(function(player)
    -- Create a start time for the player
    player:SetAttribute("JoinTime", tick())
end)

Players.PlayerRemoving:Connect(function(player)
    local joinTime = player:GetAttribute("JoinTime")
    if joinTime then
        local timeSpent = tick() - joinTime
        if timeSpent > 15 then
            sendWebhook(player.Name, math.floor(timeSpent))
        end
    end
end)
