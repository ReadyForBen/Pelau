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
