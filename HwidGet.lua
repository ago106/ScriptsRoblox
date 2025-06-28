local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HWID = gethwid() or game:GetService("RbxAnalyticsService"):GetClientId()

print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")

print("║")
print("║")
print("║               SPACE HUB PREMIUM")
print("║                   Your HWID:")
print("║                  ".. HWID)
print("║")                                             
print("║\n\n\n\n\n\n\n\n\n\n")

setclipboard(HWID)
LocalPlayer:Kick("Your HWID: (" .. HWID .. ") \nAUTO COPIED TO THE CLIPBOARD!")
loadstring(game:HttpGet("https://gist.githubusercontent.com/ago106/d9360cdac8557282efd6b446bf9fb158/raw/"))()
