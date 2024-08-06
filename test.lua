local player = game.Players.LocalPlayer
local newScript = Instance.new("LocalScript")
newScript.Name = "AlertScript"  -- You can name the script as you prefer

-- Your code as a string
local code = [[
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AlertEvent = ReplicatedStorage:WaitForChild("ServerAlerts")

AlertEvent.OnClientEvent:Connect(function()
    task.wait(3)
    local tag = "[ALERT]"
    local message = "hello test"  -- Static message to be displayed

    -- Ensure RBXSystem channel exists
    local systemChannel = TextChatService.TextChannels:FindFirstChild("RBXSystem")

    if systemChannel then
        -- Send the system message to the RBXSystem text channel
        systemChannel:SendAsync(tag .. " " .. message)
    else
        warn("RBXSystem channel not found!")
    end
end)
]]

-- Insert the code into the new script
newScript.Source = code

-- Parent the script to the player's PlayerScripts
newScript.Parent = player:WaitForChild("PlayerScripts")
