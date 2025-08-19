local TweenService = game:GetService("TweenService")

local SolaraKey = "Meow"
local PBED = "14February"
local SolaraInfinity = "159480e6524621f09aaa2e8c0217b833192f6f6ddb14982d49922e543472add0"
local Discord = "https://discord.gg/ktC6dNVxDC"

local KeySystem = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UiCornerMain = Instance.new("UICorner")
local Left = Instance.new("Frame")
local UiCornerLeft = Instance.new("UICorner")
local Line1 = Instance.new("Frame")
local Line2 = Instance.new("Frame")
local Line3 = Instance.new("Frame")
local KeyStroke = Instance.new("TextBox")
local UiCornerKeyStroke = Instance.new("UICorner")
local KeySystem_Text = Instance.new("TextLabel")
local PremiumAd = Instance.new("TextLabel")
local PremiumT = Instance.new("TextLabel")
local SolaraS = Instance.new("TextLabel")
local KeyStatus = Instance.new("Frame")
local UiCornerKeyStatus = Instance.new("UICorner")
local KeyImage = Instance.new("ImageLabel")
local KeyInfo = Instance.new("TextLabel")
local Buttons = Instance.new("Frame")
local UiCornerButtons = Instance.new("UICorner")
local DownButtons = Instance.new("Frame")
local UiCornerDownButtons = Instance.new("UICorner")
local Close = Instance.new("TextButton")
local UiCornerDown = Instance.new("UICorner")
local UiCornerClose = Instance.new("UICorner")
local DiscordInvite = Instance.new("TextButton")
local UiCornerDiscordInvite = Instance.new("UICorner")
local TopButtons = Instance.new("Frame")
local UiCornerTopButtons = Instance.new("UICorner")
local CheckKey = Instance.new("TextButton")
local UiCornerCheckKey = Instance.new("UICorner")
local GetKey = Instance.new("TextButton")
local UiCornerGetKey = Instance.new("UICorner")


KeySystem.Name = "SpaceHub"
KeySystem.Parent = game.CoreGui
KeySystem.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = KeySystem
Main.Active = true
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0, 762,0, 487)
Main.Visible = true

UiCornerMain.Parent = Main

Left.Name = "Left"
Left.Parent = Main
Left.Active = true
Left.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Left.BorderSizePixel = 0
Left.Position = UDim2.new(0, 20, 0, 20)
Left.Size = UDim2.new(0, 500, 0, 447)
Left.Visible = true

UiCornerLeft.Parent = Left

Line1.Name = "Line1"
Line1.Parent = Left
Line1.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Line1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line1.Position = UDim2.new(-0, 0,0.09, 0)
Line1.Size = UDim2.new(0, 500,0, 1)

Line2.Name = "Line2"
Line2.Parent = Left
Line2.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Line2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line2.Position = UDim2.new(0, 0,0.635, 0)
Line2.Size = UDim2.new(0, 500,0, 1)

Line3.Name = "Line3"
Line3.Parent = Left
Line3.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Line3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line3.Position = UDim2.new(.04, 0,0.310, 0)
Line3.Size = UDim2.new(0, 460,0, 1)

KeyStroke.Name = "KeyStroke"
KeyStroke.Parent = Left
KeyStroke.BackgroundColor3 = Color3.fromRGB(85, 0, 127)
KeyStroke.Position = UDim2.new(0.04, 0,0.156, 0)
KeyStroke.Size = UDim2.new(0, 460,0, 50)
KeyStroke.BorderSizePixel = 0
KeyStroke.Font = Enum.Font.FredokaOne
KeyStroke.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
KeyStroke.PlaceholderText = "Enter Key"
KeyStroke.Text = ""
KeyStroke.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyStroke.TextSize = 26.000
KeyStroke.TextWrapped = true

UiCornerKeyStroke.Parent = KeyStroke

KeySystem_Text.Name = "KeySystem_Text"
KeySystem_Text.Parent = Left
KeySystem_Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KeySystem_Text.BackgroundTransparency = 1.000
KeySystem_Text.Position = UDim2.new(0, 0, 0, 0)
KeySystem_Text.Size = UDim2.new(0, 500,0, 40)
KeySystem_Text.Font = Enum.Font.FredokaOne
KeySystem_Text.Text = "KEY SYSTEM" -- KEY SYSTEM
KeySystem_Text.TextColor3 = Color3.fromRGB(255, 255, 255)
KeySystem_Text.TextSize = 14.000
KeySystem_Text.TextScaled = true

PremiumT.Name = "PremiumT"
PremiumT.Parent = Left
PremiumT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PremiumT.BackgroundTransparency = 1.000
PremiumT.Position = UDim2.new(0, 0,0.664, 0)
PremiumT.Size = UDim2.new(0, 500,0, 30)
PremiumT.Font = Enum.Font.FredokaOne
PremiumT.Text = "⭐Space Hub - Premium⭐"
PremiumT.TextColor3 = Color3.fromRGB(255, 255, 0)
PremiumT.TextSize = 14.000
PremiumT.TextScaled = true

SolaraS.Name = "SolaraS"
SolaraS.Parent = Left
SolaraS.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SolaraS.BackgroundTransparency = 1.000
SolaraS.Position = UDim2.new(0, 0,0.328, 0)
SolaraS.Size = UDim2.new(0, 500,0, 125)
SolaraS.Font = Enum.Font.FredokaOne
SolaraS.Text = "⚠ If your executor solara / JJsploit - you can find key in our discord ⚠"
SolaraS.TextColor3 = Color3.fromRGB(255, 255, 255)
SolaraS.TextScaled = true
SolaraS.TextWrapped = true
SolaraS.TextSize = 30.000

PremiumAd.Name = "PremiumAd"
PremiumAd.Parent = Left
PremiumAd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PremiumAd.BackgroundTransparency = 1.000
PremiumAd.Position = UDim2.new(0, 0,0.746, 0)
PremiumAd.Size = UDim2.new(0, 500,0, 100)
PremiumAd.Font = Enum.Font.FredokaOne
PremiumAd.Text = "Tired of limited features?                           You can get full access by purchasing premium in our Discord"
PremiumAd.TextColor3 = Color3.fromRGB(255, 255, 255)
PremiumAd.TextWrapped = true
PremiumAd.TextSize = 30.000

KeyStatus.Name = "KeyStatus"
KeyStatus.Parent = Main
KeyStatus.Active = true
KeyStatus.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyStatus.BorderSizePixel = 0
KeyStatus.Position = UDim2.new(0.71, 0,0.04, 0)
KeyStatus.Size = UDim2.new(0, 200,0, 100)
KeyStatus.Visible = true

UiCornerKeyStatus.Parent = KeyStatus

KeyImage.Name = "KeyImage"
KeyImage.Parent = KeyStatus
KeyImage.BackgroundTransparency = 1.000
KeyImage.Position = UDim2.new(0.375, 0,0.1, 0)
KeyImage.Size = UDim2.new(0, 50,0, 50)
KeyImage.ZIndex = 2
KeyImage.Image = "rbxassetid://3926307971"
KeyImage.ImageColor3 = Color3.fromRGB(255, 38, 38)
KeyImage.ImageRectOffset = Vector2.new(44, 324)
KeyImage.ImageRectSize = Vector2.new(36, 36)

KeyInfo.Name = "KeyInfo"
KeyInfo.Parent = KeyStatus
KeyInfo.BackgroundColor3 = Color3.fromRGB(26, 26, 2)
KeyInfo.BackgroundTransparency = 1.000
KeyInfo.BorderColor3 = Color3.fromRGB(26, 26, 26)
KeyInfo.Position = UDim2.new(0, 0,0.6, 0)
KeyInfo.Size = UDim2.new(0, 200,0, 40)
KeyInfo.Font = Enum.Font.SourceSansSemibold
KeyInfo.Text = "Key Required"
KeyInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInfo.TextSize = 25.000


Buttons.Name = "Buttons"
Buttons.Parent = Main
Buttons.Active = true
Buttons.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Buttons.Transparency = 1.000
Buttons.BorderSizePixel = 0
Buttons.Position = UDim2.new(0.71, 0,0.288, 0)
Buttons.Size = UDim2.new(0, 200,0, 325)
Buttons.Visible = true

UiCornerButtons.Parent = Buttons

DownButtons.Name = "DownButtons"
DownButtons.Parent = Buttons
DownButtons.Active = true
DownButtons.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
DownButtons.BorderSizePixel = 0
DownButtons.Position = UDim2.new(0, 0,0.538, 0)
DownButtons.Size = UDim2.new(0, 200,0, 150)
DownButtons.Visible = true

UiCornerDownButtons.Parent = DownButtons

DiscordInvite.Name = "DiscordInvite"
DiscordInvite.Parent = DownButtons
DiscordInvite.BackgroundColor3 = Color3.fromRGB(121, 7, 149)
DiscordInvite.Position = UDim2.new(0.045, 0,0.103, 0)
DiscordInvite.Size = UDim2.new(0, 180,0, 50)
DiscordInvite.Font = Enum.Font.FredokaOne
DiscordInvite.Text = "Discord Invite"
DiscordInvite.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordInvite.TextSize = 36.000
DiscordInvite.TextWrapped = true
DiscordInvite.TextScaled = true
DiscordInvite.MouseButton1Down:Connect(function()
    setclipboard(Discord)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Discord Invite",
        Text = "Link Copied.",
        Duration = 5
    })
end)

UiCornerDiscordInvite.Parent = DiscordInvite

Close.Name = "Close"
Close.Parent = DownButtons
Close.BackgroundColor3 = Color3.fromRGB(121, 7, 149)
Close.Position = UDim2.new(0.045, 0,0.58, 0)
Close.Size = UDim2.new(0, 180,0, 50)
Close.Font = Enum.Font.FredokaOne
Close.Text = "Close"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 36.000
Close.MouseButton1Down:Connect(function()
    KeySystem:Destroy()
end)

UiCornerClose.Parent = Close

TopButtons.Name = "TopButtons"
TopButtons.Parent = Buttons
TopButtons.Active = true
TopButtons.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TopButtons.BorderSizePixel = 0
TopButtons.Position = UDim2.new(0, 0,0, 0)
TopButtons.Size = UDim2.new(0, 200,0, 150)
TopButtons.Visible = true

UiCornerTopButtons.Parent = TopButtons

GetKey.Name = "GetKey"
GetKey.Parent = TopButtons
GetKey.BackgroundColor3 = Color3.fromRGB(121, 7, 149)
GetKey.Position = UDim2.new(0.045, 0,0.103, 0)
GetKey.Size = UDim2.new(0, 180,0, 50)
GetKey.Font = Enum.Font.FredokaOne
GetKey.Text = "Get Key"
GetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKey.TextSize = 36.000
GetKey.MouseButton1Down:Connect(function()
    local key = "there logic"
    setclipboard(key)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Key Copied",
        Text = "The key was copied into your clipboard",
        Duration = 5
    })
    GetKey.Text = "Key Copied"
    GetKey.TextSize = 25.000
    wait(3)
    GetKey.Text = "Get Key"
    GetKey.TextSize = 36.000
end)

UiCornerGetKey.Parent = GetKey

function KeyValid()
    local TweenService = game:GetService("TweenService")
    local keyImage = KeyImage
    local info = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

    KeyInfo.Text = "Key Correct"
    local tween = TweenService:Create(keyImage, info, {ImageColor3 = Color3.fromRGB(106, 255, 106)})
    tween:Play()
    wait(1)
    
    KeySystem:Destroy()
    loadstring(game:HttpGet('))()
end
function KeyValidPremium()
    local TweenService = game:GetService("TweenService")
    local keyImage = KeyImage
    local info = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

    KeyInfo.Text = "Key Correct"
    local tween = TweenService:Create(keyImage, info, {ImageColor3 = Color3.fromRGB(106, 255, 106)})
    tween:Play()
    wait(1)
    
    KeySystem:Destroy()
    loadstring(game:HttpGet(''))()
end
CheckKey.Name = "CheckKey"
CheckKey.Parent = TopButtons
CheckKey.BackgroundColor3 = Color3.fromRGB(121, 7, 149)
CheckKey.Position = UDim2.new(0.045, 0,0.58, 0)
CheckKey.Size = UDim2.new(0, 180,0, 50)
CheckKey.Font = Enum.Font.FredokaOne
CheckKey.Text = "Check Key"
CheckKey.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckKey.TextSize = 36.000
CheckKey.MouseButton1Down:Connect(function()
    local function getExecutor()
        return (identifyexecutor and identifyexecutor()) or 
               (getexecutorname and getexecutorname()) or 
               "Unknown"
    end
    local executor = getExecutor()
    local inputKey = KeyStroke.Text
    
    if inputKey == PBED then
        KeyValidPremium()
    elseif inputKey == SolaraKey then
        KeyValid()
    elseif PandaAuth:ValidateKey(ServiceID, inputKey) then
        KeyValid()
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Invalid Key",
            Text = "The key you entered is invalid or you are not authorized to use it.",
            Duration = 5
        })
    end
end)

UiCornerCheckKey.Parent = CheckKey

Main.Position = UDim2.new(0.5, 0, 1.1, 0)

Main.Visible = true

local tweenInfo = TweenInfo.new(1.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local goalPosition = UDim2.new(0.5, 0, 0.47, 0)

local tween = TweenService:Create(Main, tweenInfo, {Position = goalPosition})
tween:Play()
wait(1.3)
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local goalPosition = UDim2.new(0.5, 0, 0.5, 0)
local tween = TweenService:Create(Main, tweenInfo, {Position = goalPosition})
tween:Play()
