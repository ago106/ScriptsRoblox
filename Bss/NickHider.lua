-- // Must Claim Hive before execution

getgenv().Hidding = "SkibidiToilet"
getgenv().Hider = true

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function NickHider()
    -- Hive Display
    for _, platform in pairs(Workspace.HivePlatforms:GetChildren()) do
        if platform.PlayerRef.Value == LocalPlayer then
            local Gui = platform.Circle.SurfaceGui.TextLabel
            if Gui then
                if getgenv().Hider == true then
                    surfaceGui.TextLabel.Text = getgenv().Hidding
                else
                    surfaceGui.TextLabel.Text = LocalPlayer.Name
                end
            end
        end
    end
    
    -- Hive Top
    for _, v in pairs(Workspace.Honeycombs:GetChildren()) do
        if v:FindFirstChild("Owner") and v.Owner.Value == LocalPlayer then
            local display = v:FindFirstChild("Display")
            if display and display:FindFirstChild("Gui") then
                local frame = display.Gui:FindFirstChild("Frame")
                if frame and frame:FindFirstChild("OwnerName") then
                    if getgenv().Hider == true then
                        frame.OwnerName.Text = getgenv().Hidding
                    else
                        frame.OwnerName.Text = LocalPlayer.Name
                    end
                end
            end
        end
    end
end

for _, v in pairs(Workspace.Honeycombs:GetChildren()) do
    if v:FindFirstChild("Owner") and v.Owner.Value == nil and v:FindFirstChild("HiveID") then
        local args = {v.HiveID.Value}
        ReplicatedStorage.Events.ClaimHive:FireServer(unpack(args))
    end
end

NickHider()
