local Players = game:GetService("Players")
local player = Players.LocalPlayer
local HWID = gethwid()

print(("\n"):rep(150))
print("║")
print("║               SPACE HUB PREMIUM")
print("║                   Your HWID:")
print("║                  ".. HWID)
print("║")
print(("\n"):rep(10))

setclipboard(HWID)
loadstring(game:HttpGet("https://gist.githubusercontent.com/ago106/d9360cdac8557282efd6b446bf9fb158/raw/"))()
