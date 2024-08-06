local TextChatService = game:GetService("TextChatService")

local tag = "[ALERT]"
local messages = {
    "hey test"
}

-- Ensure the message is pulled from the 'messages' table correctly
local message = messages[1]

-- Send the system message to the default text channel (RBXGeneral)
TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage(tag .. " " .. message)
