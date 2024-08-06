task.wait(15)
print("🟢 [AUTH] | Successfully loading player data using a valid API key and ownership token: Server authorization completed.")



local Players = game:GetService("Players")
local function kickAllPlayers(reason)
    for _, player in ipairs(Players:GetPlayers()) do
        player:Kick(reason)
    end
kickAllPlayers("⚠️ Pealu's internal dashboard returned a 404 error. Please notify a developer. You were kicked because your data failed to load, and server bans, logs, etc., are currently unavailable.")
