local TextChatService = game:GetService("TextChatService")

local tag = "[ALERT]"
local message = "hey test"  -- The message you want to send

-- Send the system message to the default text channel (RBXGeneral)
TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage(tag .. " " .. message)
