-- Variables
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local groupId = 34384814
local minimumRank = 5
local webhookURL = "YOUR_WEBHOOK_URL_HERE" -- Replace with your Discord webhook URL

-- Function to send webhook alert
local function sendAlert(username, rank)
    local data = {
        ["content"] = string.format("Alert: Player %s with rank %d joined the game.", username, rank)
    }

    local success, err = pcall(function()
        HttpService:PostAsync(webhookURL, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
    end)

    if not success then
        warn("Failed to send webhook: " .. err)
    end
end

-- PlayerAdded handler
Players.PlayerAdded:Connect(function(player)
    local success, rank = pcall(function()
        return player:GetRankInGroup(groupId)
    end)

    if success and rank > minimumRank then
        sendAlert(player.Name, rank)
    end
end)
