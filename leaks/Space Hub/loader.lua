--[[ Luacore v3.5
_G.Ban = false
_G.Settings.Debug = true
_G.PremiumSettings = {
    Key = "zzz",
    HWID = "zzz",
    User = "123",
    Type = "Premium",
    Time = nil,
    Status = "",
    Activated = false
}
_G.Settings = {
    Debug = false,
    Discord = {
        Short = "spacerb",
        Medium = ".gg/spacerb",
        Full = "https://discord.gg/spacerb"
    },
    Telegram = {
        Short = "rbscr1pts",
        Medium = "t.me/rbscr1pts",
        Full = "https://t.me/rbscr1pts"
    },
    ToS = {
        Link = "https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/Utility/ToS.lua",
        Accepted = false
    },
    Webhooks = {
        Execute = "https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/Webhook/Execute.lua",
        Ban = "",
        Success = "https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/Webhook/LuaCore-Done.lua"
    },
    Utility = {
        Status = "https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/Utility/Status.lua",
        AntiAfk = "https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/Utility/AntiAFK.lua",
        UiToggle = "https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/Utility/UiToggle.lua",
        WaterMark = "https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/Utility/Watermark.lua",
        Load = false,
        Toggle = "LControl"
    },
    Selector = {
        List = "https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/Selector.lua"
    },
    Device = {
        IsMobile = false
    }
}

_G.WatermarkSettings = {
    Enabled = true,
    DisabledPlaceIds = {123, 456, 789},
    Title = "Space Hub",
    Accent = "#BB66FF",
    ShowFPS = true,
    ShowPing = true,
    ShowRuntime = true,
    CustomValues = {
        ["Balls"] = function()
            return "x"
        end,
        ["Coins"] = function()
            return math.random(1, 999)
        end
    }
}

Maid - https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/Utility/Maid.lua
Pathfinding - https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/Utility/Pathfinding.lua
Serializer - https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/Utility/Serializer.lua
Services - https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/Utility/Services.lua
Signal - https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/Utility/Signal.lua
TableDumper - https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/Utility/TableDumper.lua
NotificationLib - https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/Utility/NotificationLib.lua
]]

repeat task.wait(0.1) until game:IsLoaded()

local startTime = os.clock()

--[[
	

    ██╗░░░░░██╗░░░██╗░█████╗░░█████╗░░█████╗░██████╗░███████╗
    ██║░░░░░██║░░░██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝
    ██║░░░░░██║░░░██║███████║██║░░╚═╝██║░░██║██████╔╝█████╗░░
    ██║░░░░░██║░░░██║██╔══██║██║░░██╗██║░░██║██╔══██╗██╔══╝░░
    ███████╗╚██████╔╝██║░░██║╚█████╔╝╚█████╔╝██║░░██║███████╗


        
    ██████╗░██████╗░░██████╗░█████╗░██████╗░░░███╗░░██████╗░████████╗░██████╗░░░██████╗░██╗░░░░░██╗░░░░░
    ██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗░████║░░██╔══██╗╚══██╔══╝██╔════╝░░░██╔══██╗██║░░░░░██║░░░░░
    ██████╔╝██████╦╝╚█████╗░██║░░╚═╝██████╔╝██╔██║░░██████╔╝░░░██║░░░╚█████╗░░░░██║░░██║██║░░░░░██║░░░░░
    ██╔══██╗██╔══██╗░╚═══██╗██║░░██╗██╔══██╗╚═╝██║░░██╔═══╝░░░░██║░░░░╚═══██╗░░░██║░░██║██║░░░░░██║░░░░░
    ██║░░██║██████╦╝██████╔╝╚█████╔╝██║░░██║███████╗██║░░░░░░░░██║░░░██████╔╝██╗██████╔╝███████╗███████╗
    ╚═╝░░╚═╝╚═════╝░╚═════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░░░░░░░╚═╝░░░╚═════╝░╚═╝╚═════╝░╚══════╝╚══════╝


        
    ░██████╗██████╗░░█████╗░░█████╗░███████╗  ██╗░░██╗██╗░░░██╗██████╗░
    ██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔════╝  ██║░░██║██║░░░██║██╔══██╗
    ╚█████╗░██████╔╝███████║██║░░╚═╝█████╗░░  ███████║██║░░░██║██████╦╝
    ░╚═══██╗██╔═══╝░██╔══██║██║░░██╗██╔══╝░░  ██╔══██║██║░░░██║██╔══██╗
    ██████╔╝██║░░░░░██║░░██║╚█████╔╝███████╗  ██║░░██║╚██████╔╝██████╦╝
    ╚═════╝░╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚══════╝  ╚═╝░░╚═╝░╚═════╝░╚═════╝░
]]

_G.NotificationLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/Utility/NotificationLib.lua"))()
_G.Settings = loadstring(game:HttpGet("https://gist.githubusercontent.com/ago106/a1567f2eb4db3e8d8d965a320b148221/raw/"))
local Services = loadstring(game:HttpGet("https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/Utility/Services.lua"))()
local LuaCoreAPI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Space-RB/Hub/refs/heads/main/LuaCore-Guard.lua"))()

local Notifications = _G.NotificationLib

do
    local UIS = game:GetService("UserInputService")
    _G.Settings.Device.IsMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled

    if not _G.Settings.Utility then
        _G.Settings.Utility = {}
    end

    if _G.Settings.Utility.Toggle == nil or _G.Settings.Utility.Toggle == "" then
        _G.Settings.Utility.Toggle = "LControl"
    end
end

_G.log = function(logType, text)
    local prefix = "[Space Hub]: "
    text = tostring(text)

    if logType == "print" then
        print(prefix .. text)
    elseif logType == "warn" then
        warn(prefix .. text)
    else
        warn(prefix .. "Unknown log type: " .. tostring(logType) .. " | " .. text)
    end
end

_G.Notify = function(kind, title, text, duration, callback)
    kind = tostring(kind or "Info")
    title = tostring(title or "Space Hub")
    text = tostring(text or "")
    duration = tonumber(duration) or 5

    if Notifications and type(Notifications[kind]) == "function" then
        Notifications[kind](Notifications, title, text, duration, callback)
    elseif Notifications and type(Notifications.Info) == "function" then
        Notifications:Info(title, text, duration, callback)
    else
        _G.log("warn", title .. " | " .. text)
    end
end

local function Logo()
    print([[
        

        ██╗░░░░░██╗░░░██╗░█████╗░░█████╗░░█████╗░██████╗░███████╗
        ██║░░░░░██║░░░██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝
        ██║░░░░░██║░░░██║███████║██║░░╚═╝██║░░██║██████╔╝█████╗░░
        ██║░░░░░██║░░░██║██╔══██║██║░░██╗██║░░██║██╔══██╗██╔══╝░░
        ███████╗╚██████╔╝██║░░██║╚█████╔╝╚█████╔╝██║░░██║███████╗
        ╚══════╝░╚═════╝░╚═╝░░╚═╝░╚════╝░░╚════╝░╚═╝░░╚═╝╚══════╝
    ]])

    print("                    DEVELOPER MESSAGE")
    print("        Loader made by RBScr1pts.dll for Space Hub")
    print("             " .. tostring(_G.Settings.Discord.Full))
end

local function loadScript(url, name)
    if type(url) ~= "string" or url == "" then
        return false, "Empty URL: " .. tostring(name or "Unknown")
    end

    local ok, result = pcall(function()
        local response = game:HttpGet(url, true)
        local fn = loadstring(response)
        return fn()
    end)

    if not ok then
        _G.log("warn", "Failed to load " .. tostring(name or url) .. ": " .. tostring(result))
        return false, result
    end

    return true, result
end

local function loadUtilities()
    local utilities = {
        { name = "Status", url = _G.Settings.Utility.Status },
        { name = "AntiAfk", url = _G.Settings.Utility.AntiAfk },
        { name = "UiToggle", url = _G.Settings.Utility.UiToggle },
        { name = "WaterMark", url = _G.Settings.Utility.WaterMark }
    }

    local loaded = 0

    for i, lib in ipairs(utilities) do
        _G.log("print", ("Loading Additional Library: %d/%d - %s"):format(i, #utilities, lib.name))

        local ok = loadScript(lib.url, lib.name)
        if ok then
            loaded += 1
        end
    end

    _G.Settings.Utility.Load = true
end

local function checkBlacklist()
    _G.log("print", "Checking Blacklist.")

    local banUrl = _G.Settings.Webhooks and _G.Settings.Webhooks.Ban
    if type(banUrl) ~= "string" or banUrl == "" then
        _G.log("print", "Blacklist URL not set, skipping.")
        return false
    end

    local ok, result = loadScript(banUrl, "Blacklist")
    if ok and result then
        _G.log("warn", "User is blacklisted.")
        _G.Ban = true
        Ban = true
        getgenv().Blacklisted = true
        return true
    end

    return false
end

local function executeRemoteScript(url, sourceName)
    local ok, err = loadScript(url, sourceName)
    if ok then
        return true
    end

    _G.log("warn", "Failed to execute script from " .. tostring(sourceName) .. ": " .. tostring(err))
    return false
end

do
    _G.log("print", "Game Loaded")
    Logo()

    --[[ ToS
    _G.log("print", "Checking - Terms of Service...")
    loadScript(_G.Settings.ToS.Link, "ToS")
    repeat task.wait() until _G.ToS and _G.ToS.Accepted == true
    _G.log("print", "Terms of Service accepted.")
    ]]

    task.spawn(function()
        loadScript(_G.Settings.Webhooks.Execute, "Execute Webhook")
    end)

    task.spawn(function()
        loadUtilities()
    end)

    checkBlacklist()
end

repeat task.wait() until _G.Settings.Utility.Load == true

if getgenv().Blacklisted or Ban == true or _G.Ban == true then
    _G.log("warn", "Execution stopped - user is blacklisted.")
    return
end

_G.log("print", "Loading game databases...")
local selectorOk, selectorResult = loadScript(_G.Settings.Selector.List, "Selector")

if not selectorOk then
    _G.log("warn", "Failed to load selector database.")
    return
end

local GamesByPlaceID, GamesByName = selectorResult, nil

if type(selectorResult) == "table" then
    GamesByPlaceID = selectorResult[1] or selectorResult.GamesByPlaceID or selectorResult.PlaceIDs or selectorResult
    GamesByName = selectorResult[2] or selectorResult.GamesByName or selectorResult.Names
end

if type(GamesByPlaceID) ~= "table" then
    GamesByPlaceID = {}
end

if type(GamesByName) ~= "table" then
    GamesByName = {}
end

local scriptExecuted = false
local forcedGameName = getgenv().GameName

if forcedGameName and forcedGameName ~= "" then
    if GamesByName[forcedGameName] then
        _G.log("print", "Found script for GameName: " .. tostring(forcedGameName))
        scriptExecuted = executeRemoteScript(GamesByName[forcedGameName], "GameName")
    else
        _G.log("warn", "Named game not found in database: " .. tostring(forcedGameName))
    end
end

if not scriptExecuted then
    local placeScript = GamesByPlaceID[game.PlaceId] or GamesByPlaceID[tostring(game.PlaceId)]

    if placeScript then
        _G.log("print", "Found script for PlaceID: " .. tostring(game.PlaceId))
        scriptExecuted = executeRemoteScript(placeScript, "PlaceID")
    else
        _G.log("warn", "Game not found in database (PlaceId: " .. tostring(game.PlaceId) .. ")")
    end
end

local loadTime = os.clock() - startTime

if scriptExecuted then
    _G.log("print", "Script executed successfully! Load time: " .. string.format("%.5f s", loadTime))
else
    _G.log("warn", "Load completed with errors. Load time: " .. string.format("%.5f s", loadTime))
end
