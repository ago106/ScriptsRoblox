-- perplex ui library
-- perplex ui
if isfile and isfile("menu_plex.font") then
    if delfile then
        delfile("menu_plex.font")
    end
end

local Library = {};
do
    Library = {
        Open = true;
        Folders = {
            main = "Spirit";
            configs = "Spirit/Configs";
        };
        Accent = Color3.new(0.000000, 0.717647, 1.000000);
        Pages = {};
        Sections = {};
        Flags = {};
        UnNamedFlags = 0;
        ThemeObjects = {};
        Instances = {};
        Holder = nil;
        PageHolder = nil;
        Watermark = nil;
        Gradient = nil;
        UIGradient = nil;
        CopiedColor = Color3.new(1,1,1);
        CopiedAlpha = 0;
        AllowedCharacters = {
            [1] = ' ',
            [2] = '!',
            [3] = '"',
            [4] = '#',
            [5] = '$',
            [6] = '%',
            [7] = '&',
            [8] = "'",
            [9] = '(',
            [10] = ')',
            [11] = '*',
            [12] = '+',
            [13] = ',',
            [14] = '-',
            [15] = '.',
            [16] = '/',
            [17] = '0',
            [18] = '1',
            [19] = '2',
            [20] = '3',
            [21] = '4',
            [22] = '5',
            [23] = '6',
            [24] = '7',
            [25] = '8',
            [26] = '9',
            [27] = ':',
            [28] = ';',
            [29] = '<',
            [30] = '=',
            [31] = '>',
            [32] = '?',
            [33] = '@',
            [34] = 'A',
            [35] = 'B',
            [36] = 'C',
            [37] = 'D',
            [38] = 'E',
            [39] = 'F',
            [40] = 'G',
            [41] = 'H',
            [42] = 'I',
            [43] = 'J',
            [44] = 'K',
            [45] = 'L',
            [46] = 'M',
            [47] = 'N',
            [48] = 'O',
            [49] = 'P',
            [50] = 'Q',
            [51] = 'R',
            [52] = 'S',
            [53] = 'T',
            [54] = 'U',
            [55] = 'V',
            [56] = 'W',
            [57] = 'X',
            [58] = 'Y',
            [59] = 'Z',
            [60] = '[',
            [61] = "\\",
            [62] = ']',
            [63] = '^',
            [64] = '_',
            [65] = '`',
            [66] = 'a',
            [67] = 'b',
            [68] = 'c',
            [69] = 'd',
            [70] = 'e',
            [71] = 'f',
            [72] = 'g',
            [73] = 'h',
            [74] = 'i',
            [75] = 'j',
            [76] = 'k',
            [77] = 'l',
            [78] = 'm',
            [79] = 'n',
            [80] = 'o',
            [81] = 'p',
            [82] = 'q',
            [83] = 'r',
            [84] = 's',
            [85] = 't',
            [86] = 'u',
            [87] = 'v',
            [88] = 'w',
            [89] = 'x',
            [90] = 'y',
            [91] = 'z',
            [92] = '{',
            [93] = '|',
            [94] = '}',
            [95] = '~'
        };
        ShiftCharacters = {
            ["1"] = "!",
            ["2"] = "@",
            ["3"] = "#",
            ["4"] = "$",
            ["5"] = "%",
            ["6"] = "^",
            ["7"] = "&",
            ["8"] = "*",
            ["9"] = "(",
            ["0"] = ")",
            ["-"] = "_",
            ["="] = "+",
            ["["] = "{",
            ["\\"] = "|",
            [";"] = ":",
            ["'"] = "\"",
            [","] = "<",
            ["."] = ">",
            ["/"] = "?",
            ["`"] = "~"
        };
        Keys = {
            [Enum.KeyCode.LeftShift] = "LShift",
            [Enum.KeyCode.RightShift] = "RShift",
            [Enum.KeyCode.LeftControl] = "LCtrl",
            [Enum.KeyCode.RightControl] = "RCtrl",
            [Enum.KeyCode.LeftAlt] = "LAlt",
            [Enum.KeyCode.RightAlt] = "RAlt",
            [Enum.KeyCode.CapsLock] = "Caps",
            [Enum.KeyCode.One] = "1",
            [Enum.KeyCode.Two] = "2",
            [Enum.KeyCode.Three] = "3",
            [Enum.KeyCode.Four] = "4",
            [Enum.KeyCode.Five] = "5",
            [Enum.KeyCode.Six] = "6",
            [Enum.KeyCode.Seven] = "7",
            [Enum.KeyCode.Eight] = "8",
            [Enum.KeyCode.Nine] = "9",
            [Enum.KeyCode.Zero] = "0",
            [Enum.KeyCode.KeypadOne] = "Num1",
            [Enum.KeyCode.KeypadTwo] = "Num2",
            [Enum.KeyCode.KeypadThree] = "Num3",
            [Enum.KeyCode.KeypadFour] = "Num4",
            [Enum.KeyCode.KeypadFive] = "Num5",
            [Enum.KeyCode.KeypadSix] = "Num6",
            [Enum.KeyCode.KeypadSeven] = "Num7",
            [Enum.KeyCode.KeypadEight] = "Num8",
            [Enum.KeyCode.KeypadNine] = "Num9",
            [Enum.KeyCode.KeypadZero] = "Num0",
            [Enum.KeyCode.Minus] = "-",
            [Enum.KeyCode.Equals] = "=",
            [Enum.KeyCode.Tilde] = "~",
            [Enum.KeyCode.LeftBracket] = "[",
            [Enum.KeyCode.RightBracket] = "]",
            [Enum.KeyCode.RightParenthesis] = ")",
            [Enum.KeyCode.LeftParenthesis] = "(",
            [Enum.KeyCode.Semicolon] = ",",
            [Enum.KeyCode.Quote] = "'",
            [Enum.KeyCode.BackSlash] = "\\",
            [Enum.KeyCode.Comma] = ",",
            [Enum.KeyCode.Period] = ".",
            [Enum.KeyCode.Slash] = "/",
            [Enum.KeyCode.Asterisk] = "*",
            [Enum.KeyCode.Plus] = "+",
            [Enum.KeyCode.Period] = ".",
            [Enum.KeyCode.Backquote] = "`",
            [Enum.UserInputType.MouseButton1] = "MB1",
            [Enum.UserInputType.MouseButton2] = "MB2",
            [Enum.UserInputType.MouseButton3] = "MB3"
        };
        Connections = {};
        FontSize = 15;
        Notifs = {};
        KeyList = nil;
        UIKey = Enum.KeyCode.End;
        ScreenGUI = nil;
    }
    
    local NewVector2 = Vector2.new
    -- // Ignores
    local Flags = {}; -- Ignore
    local Dropdowns = {}; -- Ignore
    local Pickers = {}; -- Ignore
    local VisValues = {}; -- Ignore

    -- // Extension
    Library.__index = Library
    Library.Pages.__index = Library.Pages
    Library.Sections.__index = Library.Sections
    local LocalPlayer = game:GetService('Players').LocalPlayer;
    local Mouse = LocalPlayer:GetMouse();
    
    -- // Custom Font
    do
        local getsynasset = getcustomasset or getsynasset
        if Font and setreadonly then
            setreadonly(Font, false);
        end
        
        function Font:Register(Name, Weight, Style, Asset)
            if isfile and isfile(Name .. ".font") then
                if isfile and isfile(Asset.Id) then
                    if writefile then
                        writefile(Asset.Id, Asset.Font);
                    end
                end;
                --
                local Data = {
                    name = Name,
                    faces = {{
                        name = "Regular",
                        weight = Weight,
                        style = Style,
                        assetId = getsynasset and getsynasset(Asset.Id) or Asset.Id;
                    }}
                };
                --
                if writefile then
                    writefile(Name .. ".font", game:GetService("HttpService"):JSONEncode(Data));
                    return getsynasset and getsynasset(Name .. ".font") or Name .. ".font";
                end
            else 
                warn("Font already registered");
            end;
        end;
        --
        function Font:GetRegistry(Name)
            if isfile and isfile(Name .. ".font") then
                return getsynasset and getsynasset(Name .. ".font") or Name .. ".font";
            end;
        end;

        if writefile and isfile then
            Font:Register("menu_plex", 400, "normal", {Id = "ProggyClean.ttf", Font = ""});
        end
    end

    -- // Misc Functions
    do
        function Library:Connection(Signal, Callback)
            local Con = Signal:Connect(Callback)
            return Con
        end
        --
        function Library:Disconnect(Connection)
            Connection:Disconnect()
        end
        --
        function Library:Round(Number, Float)
            return Float * math.floor(Number / Float)
        end
        --
        function Library.NextFlag()
            Library.UnNamedFlags = Library.UnNamedFlags + 1
            return string.format("%.14g", Library.UnNamedFlags)
        end
        --
        function Library:RGBA(r, g, b, alpha)
            local rgb = Color3.fromRGB(r, g, b)
            local mt = table.clone and table.clone(getrawmetatable and getrawmetatable(rgb) or {}) or {}

            if setreadonly then
                setreadonly(mt, false)
            end
            local old = mt.__index

            mt.__index = newcclosure and newcclosure(function(self, key)
                if key:lower() == "transparency" then
                    return alpha
                end

                return old(self, key)
            end) or function(self, key)
                if key:lower() == "transparency" then
                    return alpha
                end

                return old(self, key)
            end

            if setrawmetatable then
                setrawmetatable(rgb, mt)
            end

            return rgb
        end
        --
        function Library:GetConfig()
            local Config = ""
            for Index, Value in pairs(self.Flags) do
                if
                    Index ~= "ConfigConfig_List"
                    and Index ~= "ConfigConfig_Load"
                    and Index ~= "ConfigConfig_Save"
                then
                    local Value2 = Value
                    local Final = ""
                    --
                    if typeof(Value2) == "Color3" then
                        local hue, sat, val = Value2:ToHSV()
                        --
                        Final = ("rgb(%s,%s,%s,%s)"):format(hue, sat, val, 1)
                    elseif typeof(Value2) == "table" and Value2.Color and Value2.Transparency then
                        local hue, sat, val = Value2.Color:ToHSV()
                        --
                        Final = ("rgb(%s,%s,%s,%s)"):format(hue, sat, val, Value2.Transparency)
                    elseif typeof(Value2) == "table" and Value.Mode then
                        local Values = Value.current
                        --
                        Final = ("key(%s,%s,%s)"):format(Values[1] or "nil", Values[2] or "nil", Value.Mode)
                    elseif Value2 ~= nil then
                        if typeof(Value2) == "boolean" then
                            Value2 = ("bool(%s)"):format(tostring(Value2))
                        elseif typeof(Value2) == "table" then
                            local New = "table("
                            --
                            for Index2, Value3 in pairs(Value2) do
                                New = New .. Value3 .. ","
                            end
                            --
                            if New:sub(#New) == "," then
                                New = New:sub(0, #New - 1)
                            end
                            --
                            Value2 = New .. ")"
                        elseif typeof(Value2) == "string" then
                            Value2 = ("string(%s)"):format(Value2)
                        elseif typeof(Value2) == "number" then
                            Value2 = ("number(%s)"):format(Value2)
                        end
                        --
                        Final = Value2
                    end
                    --
                    Config = Config .. Index .. ": " .. tostring(Final) .. "\n"
                end
            end
            --
            return Config
        end
        --
        function Library:LoadConfig(Config)
            local Table = string.split(Config, "\n")
            local Table2 = {}
            for Index, Value in pairs(Table) do
                local Table3 = string.split(Value, ":")
                --
                if Table3[1] ~= "ConfigConfig_List" and #Table3 >= 2 then
                    local Value = Table3[2]:sub(2, #Table3[2])
                    --
                    if Value:sub(1, 3) == "rgb" then
                        local Table4 = string.split(Value:sub(5, #Value - 1), ",")
                        --
                        Value = Table4
                    elseif Value:sub(1, 3) == "key" then
                        local Table4 = string.split(Value:sub(5, #Value - 1), ",")
                        --
                        if Table4[1] == "nil" and Table4[2] == "nil" then
                            Table4[1] = nil
                            Table4[2] = nil
                        end
                        --
                        Value = Table4
                    elseif Value:sub(1, 4) == "bool" then
                        local Bool = Value:sub(6, #Value - 1)
                        --
                        Value = Bool == "true"
                    elseif Value:sub(1, 5) == "table" then
                        local Table4 = string.split(Value:sub(7, #Value - 1), ",")
                        --
                        Value = Table4
                    elseif Value:sub(1, 6) == "string" then
                        local String = Value:sub(8, #Value - 1)
                        --
                        Value = String
                    elseif Value:sub(1, 6) == "number" then
                        local Number = tonumber(Value:sub(8, #Value - 1))
                        --
                        Value = Number
                    end
                    --
                    Table2[Table3[1]] = Value
                end
            end
            --
            for i, v in pairs(Table2) do
                if Flags[i] then
                    if typeof(Flags[i]) == "table" then
                        Flags[i]:Set(v)
                    else
                        Flags[i](v)
                    end
                end
            end
        end
        --
        function Library:SetOpen(bool)
            if typeof(bool) == 'boolean' then
                Library.Open = bool;
                if Library.Holder then
                    Library.Holder.Visible = bool;
                end
                if Library.KeyList then
                    Library.KeyList:SetVisible(true)
                end
            end
        end;
        --
        function Library:ChangeAccent(Color)
            Library.Accent = Color

            for obj, theme in next, Library.ThemeObjects do
                if theme:IsA("Frame") or theme:IsA("TextButton") then
                    theme.BackgroundColor3 = Color
                elseif theme:IsA("TextLabel") then
                    theme.TextColor3 = Color
                elseif theme:IsA("TextButton") and theme.BackgroundTransparency == 1 then
                    theme.TextColor3 = Color
                end
            end

            --Library.UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color	),ColorSequenceKeypoint.new(1,Color3.new(0.04313725605607033, 0.04313725605607033, 0.04313725605607033)	)}
        end
        --
        function Library:IsMouseOverFrame(Frame)
            local AbsPos, AbsSize = Frame.AbsolutePosition, Frame.AbsoluteSize;

            if Mouse.X >= AbsPos.X and Mouse.X <= AbsPos.X + AbsSize.X
                and Mouse.Y >= AbsPos.Y and Mouse.Y <= AbsPos.Y + AbsSize.Y then

                return true;
            end;
        end;
        --
        function Library:Watermark()
            if not Library.ScreenGUI then return end
            
            local Outline = Instance.new('Frame', Library.ScreenGUI)
            local Inline = Instance.new('Frame', Outline)
            local Accent = Instance.new('Frame', Inline)
            local Text1 = Instance.new('TextLabel', Inline)
            local Text2 = Instance.new('TextLabel', Inline)
            local TextGradient = Instance.new('UIGradient', Text2)
            local Text3 = Instance.new('TextLabel', Inline)
            
            Outline.Name = "Outline"
            Outline.Position = UDim2.new(0.03,0,0.05,0)
            Outline.Size = UDim2.new(0,220,0,20)
            Outline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
            Outline.BorderSizePixel = 0
            Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
            Outline.AnchorPoint = Vector2.new(0.029999999329447746,0.05000000074505806)
            Outline.Visible = true
            Library.Watermark = Outline
            Inline.Name = "Inline"
            Inline.Position = UDim2.new(0,1,0,1)
            Inline.Size = UDim2.new(1,-2,1,-2)
            Inline.BackgroundColor3 = Color3.new(0.0784,0.0784,0.0784)
            Inline.BorderSizePixel = 0
            Inline.BorderColor3 = Color3.new(0,0,0)
            Accent.Name = "Accent"
            Accent.Size = UDim2.new(1,0,0,1)
            Accent.BackgroundColor3 = Color3.new(0.3333,0.6667,1)
            Accent.BorderSizePixel = 0
            Accent.BorderColor3 = Color3.new(0,0,0)
            Text1.Name = "Text1"
            Text1.Position = UDim2.new(0,4,0,0)
            Text1.Size = UDim2.new(1,-8,1,0)
            Text1.BackgroundColor3 = Color3.new(1,1,1)
            Text1.BackgroundTransparency = 1
            Text1.BorderSizePixel = 0
            Text1.BorderColor3 = Color3.new(0,0,0)
            Text1.Text = "xyn | portal"
            Text1.TextColor3 = Color3.new(1,1,1)
            if Font and Font.GetRegistry then
                Text1.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Text1.TextSize = 12
            Text1.TextXAlignment = Enum.TextXAlignment.Left
            Text1.TextStrokeTransparency = 0
            Text2.Name = "Text2"
            Text2.Position = UDim2.new(0,93,0,0)
            Text2.Size = UDim2.new(1,-8,1,0)
            Text2.BackgroundColor3 = Color3.new(1,1,1)
            Text2.BackgroundTransparency = 1
            Text2.BorderSizePixel = 0
            Text2.BorderColor3 = Color3.new(0,0,0)
            Text2.Text = "BETA"
            Text2.TextColor3 = Color3.new(1,1,1)
            if Font and Font.GetRegistry then
                Text2.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Text2.TextSize = 12
            Text2.TextXAlignment = Enum.TextXAlignment.Left
            Text2.TextStrokeTransparency = 0
            TextGradient.Name = "TextGradient"
            TextGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.new(0.2980392277240753, 0.6352941393852234, 0.9882352948188782)	),ColorSequenceKeypoint.new(0.5,Color3.new(0.9882352948188782, 0.9882352948188782, 0.9882352948188782)	),ColorSequenceKeypoint.new(1,Color3.new(0.2980392277240753, 0.6352941393852234, 0.9882352948188782)	)}
            TextGradient.Rotation = 45
            Text3.Name = "Text3"
            Text3.Position = UDim2.new(0,4,0,0)
            Text3.Size = UDim2.new(1,-8,1,0)
            Text3.BackgroundColor3 = Color3.new(1,1,1)
            Text3.BackgroundTransparency = 1
            Text3.BorderSizePixel = 0
            Text3.BorderColor3 = Color3.new(0,0,0)
            Text3.Text = "Bad Business"
            Text3.TextColor3 = Color3.new(1,1,1)
            if Font and Font.GetRegistry then
                Text3.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Text3.TextSize = 12
            Text3.TextXAlignment = Enum.TextXAlignment.Right
            Text3.TextStrokeTransparency = 0
            
            local ts = game:GetService("TweenService")
            local ti = TweenInfo.new(10, Enum.EasingStyle.Circular, Enum.EasingDirection.Out)
            local offset1 = {Offset = Vector2.new(1, 0)}
            local create = ts:Create(TextGradient, ti, offset1)
            local startingPos = Vector2.new(-1, 0) --start on the right, tween to the left so it looks like the shine went from left to right
            local addWait = 2.5 --the amount of seconds between each couplet of shines
            TextGradient.Offset = startingPos
            
            local function animate()
            
                while true do
                    create:Play()
                    create.Completed:Wait() --wait for tween to stop
                    TextGradient.Offset = startingPos --reset offset
                    create:Play() --play again (I did this only 2 times per "couplet", you can do it more times if you want)
                    create.Completed:Wait()
                    TextGradient.Offset = startingPos
                    wait(addWait) --wait some bit before the next couplet
                end
            end
            
            animate()
        end
        --
        function Library:KeybindList()
            local KeyList = {Keybinds = {}};
            --
            if not Library.ScreenGUI then return KeyList end
            
            local KeyOutline = Instance.new('Frame', Library.ScreenGUI)
            local KeyInline = Instance.new('Frame', KeyOutline)
            local KeyAccent = Instance.new('Frame', KeyInline)
            local KeyHolder = Instance.new('Frame', KeyInline)
            local UIListLayout = Instance.new('UIListLayout', KeyHolder)
            local KeyTitle = Instance.new('TextLabel', KeyInline)
            local LineThing = Instance.new('Frame', KeyInline)
            --
            KeyOutline.Name = "KeyOutline"
            KeyOutline.Position = UDim2.new(0.01,0,0.5,0)
            KeyOutline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
            KeyOutline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
            KeyOutline.AnchorPoint = Vector2.new(0.009999999776482582,0.5)
            KeyOutline.AutomaticSize = Enum.AutomaticSize.XY
            --
            KeyInline.Name = "KeyInline"
            KeyInline.Position = UDim2.new(0,1,0,1)
            KeyInline.Size = UDim2.new(0,-2,0,-2)
            KeyInline.BackgroundColor3 = Color3.new(0.0745,0.0745,0.0745)
            KeyInline.BorderSizePixel = 0
            KeyInline.BorderColor3 = Color3.new(0,0,0)
            KeyInline.AutomaticSize = Enum.AutomaticSize.XY
            --
            KeyAccent.Name = "KeyAccent"
            KeyAccent.Size = UDim2.new(1,0,0,1)
            KeyAccent.BackgroundColor3 = Color3.new(0.3333,0.6667,1)
            KeyAccent.BorderSizePixel = 0
            KeyAccent.BorderColor3 = Color3.new(0,0,0)
            --
            KeyHolder.Name = "KeyHolder"
            KeyHolder.Position = UDim2.new(0,0,0,22)
            KeyHolder.BackgroundColor3 = Color3.new(1,1,1)
            KeyHolder.BackgroundTransparency = 1
            KeyHolder.BorderSizePixel = 0
            KeyHolder.BorderColor3 = Color3.new(0,0,0)
            KeyHolder.AutomaticSize = Enum.AutomaticSize.XY
            --
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            --
            KeyTitle.Name = "KeyTitle"
            KeyTitle.Size = UDim2.new(1,0,0,20)
            KeyTitle.BackgroundColor3 = Color3.new(1,1,1)
            KeyTitle.BackgroundTransparency = 1
            KeyTitle.BorderSizePixel = 0
            KeyTitle.BorderColor3 = Color3.new(0,0,0)
            KeyTitle.Text = "Keybinds"
            KeyTitle.TextColor3 = Color3.new(1,1,1)
            if Font and Font.GetRegistry then
                KeyTitle.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            KeyTitle.TextSize = 12
            KeyTitle.TextStrokeTransparency = 0
            --
            LineThing.Name = "LineThing"
            LineThing.Position = UDim2.new(0,0,0,20)
            LineThing.Size = UDim2.new(1,0,0,1)
            LineThing.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
            LineThing.BorderSizePixel = 0
            LineThing.BorderColor3 = Color3.new(0,0,0)
            KeyOutline.Visible = true
            -- Functions
            function KeyList:SetVisible(State)
                KeyOutline.Visible = true;
            end;
            
            --
            function KeyList:NewKey(Name, Key, Mode)
                print("Creating new keybind:", Name, Key, Mode)
                local KeyValue = {}
                --
                local NewValue = Instance.new('TextLabel', KeyHolder)
                --
                NewValue.Name = "NewValue"
                NewValue.Size = UDim2.new(0,0,0,15)
                NewValue.BackgroundColor3 = Color3.new(1,1,1)
                NewValue.BackgroundTransparency = 1
                NewValue.BorderSizePixel = 0
                NewValue.BorderColor3 = Color3.new(0,0,0)
                NewValue.Text = tostring(" ["..Key.."] " .. Name .. " (" .. Mode ..") ")
                NewValue.TextColor3 = Color3.new(1,1,1)
                if Font and Font.GetRegistry then
                    NewValue.FontFace = Font.new(Font:GetRegistry("menu_plex"))
                end
                NewValue.TextSize = 12
                NewValue.AutomaticSize = Enum.AutomaticSize.X
                NewValue.TextXAlignment = Enum.TextXAlignment.Left
                NewValue.Visible = false
                --
                function KeyValue:SetVisible(State)
                    NewValue.Visible = State;
                end;
                --
                function KeyValue:Update(NewName, NewKey, NewMode)
                    NewValue.Text = tostring(" ["..NewName.."] " .. NewKey .. " (" .. NewMode ..") ")
                end;
                return KeyValue
            end;
            return KeyList
        end
    end

    -- // Colorpicker Element
    do
        function Library:NewPicker(name, default, defaultalpha, parent, count, flag, callback)
            -- // Instances
            local Icon = Instance.new('TextButton', parent)
            local IconInline = Instance.new('Frame', Icon)
            local ColorWindow = Instance.new('Frame', parent)
            local WindowInline = Instance.new('Frame', ColorWindow)
            local Color = Instance.new('TextButton', WindowInline)
            local Sat = Instance.new('ImageLabel', Color)
            local Val = Instance.new('ImageLabel', Color)
            local Pointer = Instance.new('Frame', Color)
            local Container = Instance.new('Frame', Color)
            local ColorOutline = Instance.new('Frame', Color)
            local UIStroke = Instance.new('UIStroke', ColorOutline)
            local Hue = Instance.new('ImageButton', Color)
            local HueOutline = Instance.new('Frame', Hue)
            local UIStroke2 = Instance.new('UIStroke', HueOutline)
            local Alpha = Instance.new('ImageButton', Color)
            local AlphaOutline = Instance.new('Frame', Alpha)
            local UIStroke3 = Instance.new('UIStroke', AlphaOutline)
            local HueSlide = Instance.new('Frame', Hue)
            local AlphaSlide = Instance.new('Frame', Alpha)
            local ModeOutline = Instance.new('Frame', parent)
            local ModeInline = Instance.new('Frame', ModeOutline)
            local UIListLayout = Instance.new('UIListLayout', ModeInline)
            local Hold = Instance.new('TextButton', ModeInline)
            local Toggle = Instance.new('TextButton', ModeInline)
            --
            Icon.Name = "Icon"
            Icon.Position = UDim2.new(1, - (count * 20) - (count * 6),0.5,0)
            Icon.Size = UDim2.new(0,20,0,10)
            Icon.BackgroundColor3 = Color3.fromRGB(45,45,45)
            Icon.BorderColor3 = Color3.fromRGB(10,10,10)
            Icon.AnchorPoint = Vector2.new(1,0.5)
            Icon.AutoButtonColor = false
            Icon.Text = ""
            --
            IconInline.Name = "IconInline"
            IconInline.Position = UDim2.new(0,1,0,1)
            IconInline.Size = UDim2.new(1,-2,1,-2)
            IconInline.BackgroundColor3 = default
            IconInline.BorderSizePixel = 0
            --
            ColorWindow.Name = "ColorWindow"
            ColorWindow.Position = UDim2.new(1,-2,1,2)
            ColorWindow.Size = UDim2.new(0,206,0,170)
            ColorWindow.BackgroundColor3 = Color3.fromRGB(45,45,45)
            ColorWindow.BorderColor3 = Color3.fromRGB(10,10,10)
            ColorWindow.AnchorPoint = Vector2.new(1,0)
            ColorWindow.ZIndex = 100
            ColorWindow.Visible = false
            --
            WindowInline.Name = "WindowInline"
            WindowInline.Position = UDim2.new(0,1,0,1)
            WindowInline.Size = UDim2.new(1,-2,1,-2)
            WindowInline.BackgroundColor3 = Color3.fromRGB(20,20,20)
            WindowInline.BorderSizePixel = 0;
            WindowInline.ZIndex = 100
            --
            Color.Name = "Color"
            Color.Position = UDim2.new(0,8,0,10)
            Color.Size = UDim2.new(0,150,0,150)
            Color.BackgroundColor3 = default
            Color.BorderColor3 = Color3.new(0,0,0)
            Color.Text = ""
            Color.TextColor3 = Color3.new(0,0,0)
            Color.AutoButtonColor = false
            Color.Font = Enum.Font.SourceSans
            Color.TextSize = 14
            Color.ZIndex = 100
            --
            Sat.Name = "Sat"
            Sat.Size = UDim2.new(1,0,1,0)
            Sat.BackgroundColor3 = Color3.new(1,1,1)
            Sat.BackgroundTransparency = 1
            Sat.BorderSizePixel = 0
            Sat.BorderColor3 = Color3.new(0,0,0)
            Sat.Image = "http://www.roblox.com/asset/?id=14684562507"
            Sat.ZIndex = 100
            --
            Val.Name = "Val"
            Val.Size = UDim2.new(1,0,1,0)
            Val.BackgroundColor3 = Color3.new(1,1,1)
            Val.BackgroundTransparency = 1
            Val.BorderSizePixel = 0
            Val.BorderColor3 = Color3.new(0,0,0)
            Val.Image = "http://www.roblox.com/asset/?id=14684563800"
            Val.ZIndex = 100
            --
            Pointer.Name = "Pointer"
            Pointer.Position = UDim2.new(1,0,1,0)
            Pointer.Size = UDim2.new(0,1,0,1)
            Pointer.BackgroundColor3 = Color3.new(1,1,1)
            Pointer.BorderColor3 = Color3.new(0,0,0)
            Pointer.ZIndex = 100
            --
            Container.Name = "Container"
            Container.Position = UDim2.new(0,-2,1,5)
            Container.Size = UDim2.new(0,189,0,55)
            Container.BackgroundColor3 = Color3.new(1,1,1)
            Container.BackgroundTransparency = 1
            Container.BorderColor3 = Color3.new(0,0,0)
            Container.ZIndex = 100
            --
            ColorOutline.Name = "ColorOutline"
            ColorOutline.Position = UDim2.new(0,-1,0,-1)
            ColorOutline.Size = UDim2.new(1,2,1,2)
            ColorOutline.BackgroundColor3 = Color3.new(1,1,1)
            ColorOutline.BackgroundTransparency = 1
            ColorOutline.BorderSizePixel = 0
            ColorOutline.BorderColor3 = Color3.new(0,0,0)
            ColorOutline.ZIndex = 100
            --
            UIStroke.Color = Color3.fromRGB(45,45,45)
            --
            Hue.Name = "Hue"
            Hue.Position = UDim2.new(1,10,0,0)
            Hue.Size = UDim2.new(0,10,1,0)
            Hue.BackgroundColor3 = Color3.new(1,1,1)
            Hue.BorderColor3 = Color3.new(0,0,0)
            Hue.Image = "http://www.roblox.com/asset/?id=14684557999"
            Hue.AutoButtonColor = false
            Hue.ZIndex = 100
            --
            HueOutline.Name = "HueOutline"
            HueOutline.Position = UDim2.new(0,-1,0,-1)
            HueOutline.Size = UDim2.new(1,2,1,2)
            HueOutline.BackgroundColor3 = Color3.new(1,1,1)
            HueOutline.BackgroundTransparency = 1
            HueOutline.BorderSizePixel = 0
            HueOutline.BorderColor3 = Color3.new(0,0,0)
            HueOutline.ZIndex = 100
            --
            UIStroke2.Color = Color3.fromRGB(45,45,45)
            --
            Alpha.Name = "Alpha"
            Alpha.Position = UDim2.new(1,30,0,0)
            Alpha.Size = UDim2.new(0,10,1,0)
            Alpha.BackgroundColor3 = Color3.new(1,1,1)
            Alpha.BorderColor3 = Color3.new(0,0,0)
            Alpha.Image = "http://www.roblox.com/asset/?id=14684560169"
            Alpha.AutoButtonColor = false
            Alpha.ZIndex = 100
            --
            AlphaOutline.Name = "AlphaOutline"
            AlphaOutline.Position = UDim2.new(0,-1,0,-1)
            AlphaOutline.Size = UDim2.new(1,2,1,2)
            AlphaOutline.BackgroundColor3 = Color3.new(1,1,1)
            AlphaOutline.BackgroundTransparency = 1
            AlphaOutline.BorderSizePixel = 0
            AlphaOutline.BorderColor3 = Color3.new(0,0,0)
            AlphaOutline.ZIndex = 100
            --
            UIStroke3.Color = Color3.fromRGB(45,45,45)
            --
            HueSlide.Name = "HueSlide"
            HueSlide.Size = UDim2.new(1,0,0,3)
            HueSlide.BackgroundColor3 = Color3.new(1,1,1)
            HueSlide.BorderColor3 = Color3.new(0,0,0)
            --
            AlphaSlide.Name = "AlphaSlide"
            AlphaSlide.Size = UDim2.new(1,0,0,3)
            AlphaSlide.BackgroundColor3 = Color3.new(1,1,1)
            AlphaSlide.BorderColor3 = Color3.new(0,0,0)
            AlphaSlide.ZIndex = 100
            --
            ModeOutline.Name = "ModeOutline"
            ModeOutline.Position = UDim2.new(1,65,0.5,0)
            ModeOutline.Size = UDim2.new(0,60,0,12)
            ModeOutline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
            ModeOutline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
            ModeOutline.AnchorPoint = Vector2.new(1,0.5)
            ModeOutline.AutomaticSize = Enum.AutomaticSize.Y
            ModeOutline.Visible = false
            ModeOutline.ZIndex = 100
            --
            ModeInline.Name = "ModeInline"
            ModeInline.Position = UDim2.new(0,1,0,1)
            ModeInline.Size = UDim2.new(1,-2,1,-2)
            ModeInline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
            ModeInline.BorderSizePixel = 0
            ModeInline.BorderColor3 = Color3.new(0,0,0)
            ModeInline.ZIndex = 100
            --
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            --
            Hold.Name = "Hold"
            Hold.Size = UDim2.new(1,0,0,15)
            Hold.BackgroundColor3 = Color3.new(1,1,1)
            Hold.BackgroundTransparency = 1
            Hold.BorderSizePixel = 0
            Hold.BorderColor3 = Color3.new(0,0,0)
            Hold.Text = "Copy"
            Hold.TextColor3 = Color3.fromRGB(145,145,145)
            Hold.AutoButtonColor = false
            if Font and Font.GetRegistry then
                Hold.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Hold.TextSize = Library.FontSize
            Hold.TextStrokeTransparency = 0
            Hold.ZIndex = 100
            --
            Toggle.Name = "Toggle"
            Toggle.Size = UDim2.new(1,0,0,15)
            Toggle.BackgroundColor3 = Color3.new(1,1,1)
            Toggle.BackgroundTransparency = 1
            Toggle.BorderSizePixel = 0
            Toggle.BorderColor3 = Color3.new(0,0,0)
            Toggle.Text = "Paste"
            Toggle.TextColor3 = Color3.fromRGB(145,145,145)
            Toggle.AutoButtonColor = false
            if Font and Font.GetRegistry then
                Toggle.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Toggle.TextSize = Library.FontSize
            Toggle.TextStrokeTransparency = 0
            Toggle.ZIndex = 100

            Library:Connection(Icon.MouseEnter, function()
                Icon.BorderColor3 = Library.Accent
            end)
            --
            Library:Connection(Icon.MouseLeave, function()
                Icon.BorderColor3 = Color3.fromRGB(10,10,10)
            end)

            -- // Connections
            local mouseover = false
            local hue, sat, val = default:ToHSV()
            local hsv = default:ToHSV()
            local alpha = defaultalpha
            local oldcolor = hsv
            local slidingsaturation = false
            local slidinghue = false
            local slidingalpha = false

            local function update()
                local real_pos = game:GetService("UserInputService"):GetMouseLocation()
                local mouse_position = Vector2.new(real_pos.X, real_pos.Y - 30)
                local relative_palette = (mouse_position - Color.AbsolutePosition)
                local relative_hue     = (mouse_position - Hue.AbsolutePosition)
                local relative_opacity = (mouse_position - Alpha.AbsolutePosition)
                --
                if slidingsaturation then
                    sat = math.clamp(1 - relative_palette.X / Color.AbsoluteSize.X, 0, 1)
                    val = math.clamp(1 - relative_palette.Y / Color.AbsoluteSize.Y, 0, 1)
                elseif slidinghue then
                    hue = math.clamp(relative_hue.Y / Hue.AbsoluteSize.Y, 0, 1)
                elseif slidingalpha then
                    alpha = math.clamp(relative_opacity.Y / Alpha.AbsoluteSize.Y, 0, 1)
                end

                hsv = Color3.fromHSV(hue, sat, val)
                Pointer.Position = UDim2.new(math.clamp(1 - sat, 0.005, 0.995), 0, math.clamp(1 - val, 0.005, 0.995), 0)
                Color.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
                Alpha.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
                IconInline.BackgroundColor3 = hsv

                HueSlide.Position = UDim2.new(0,0,math.clamp(hue, 0.005, 0.995),0)
                AlphaSlide.Position = UDim2.new(0,0,math.clamp(alpha, 0.005, 0.995),0)

                if flag then
                    Library.Flags[flag] = Library:RGBA(hsv.r * 255, hsv.g * 255, hsv.b * 255, alpha)
                end

                callback(Library:RGBA(hsv.r * 255, hsv.g * 255, hsv.b * 255, alpha))
            end

            local function set(color, a)
                if type(color) == "table" then
                    a = color[4]
                    color = Color3.fromHSV(color[1], color[2], color[3])
                end
                if type(color) == "string" then
                    color = Color3.fromHex(color)
                end

                local oldcolor = hsv
                local oldalpha = alpha

                hue, sat, val = color:ToHSV()
                alpha = a or 1
                hsv = Color3.fromHSV(hue, sat, val)

                if hsv ~= oldcolor then
                    IconInline.BackgroundColor3 = hsv
                    Color.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
                    Pointer.Position = UDim2.new(math.clamp(1 - sat, 0.005, 0.995), 0, math.clamp(1 - val, 0.005, 0.995), 0)
                    Alpha.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
                    HueSlide.Position = UDim2.new(0,0,math.clamp(hue, 0.005, 0.995),0)
                    AlphaSlide.Position = UDim2.new(0,0,math.clamp(alpha, 0.005, 0.995),0)

                    if flag then
                        Library.Flags[flag] = Library:RGBA(hsv.r * 255, hsv.g * 255, hsv.b * 255, alpha)
                    end

                    callback(Library:RGBA(hsv.r * 255, hsv.g * 255, hsv.b * 255, alpha))
                end
            end

            Flags[flag] = set

            set(default, defaultalpha)

            Sat.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    slidingsaturation = true
                    update()
                end
            end)

            Sat.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    slidingsaturation = false
                    update()
                end
            end)

            Hue.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    slidinghue = true
                    update()
                end
            end)

            Hue.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    slidinghue = false
                    update()
                end
            end)

            Alpha.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    slidingalpha = true
                    update()
                end
            end)

            Alpha.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    slidingalpha = false
                    update()
                end
            end)

            Library:Connection(game:GetService("UserInputService").InputChanged, function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    if slidingalpha then
                        update()
                    end

                    if slidinghue then
                        update()
                    end

                    if slidingsaturation then
                        update()
                    end
                end
            end)

            Icon.MouseButton1Down:Connect(function()
                ColorWindow.Visible = not ColorWindow.Visible
                parent.ZIndex = ColorWindow.Visible and 5 or 1

                if slidinghue then
                    slidinghue = false
                end

                if slidingsaturation then
                    slidingsaturation = false
                end

                if slidingalpha then
                    slidingalpha = false
                end
            end)
            
            Library:Connection(Icon.MouseButton2Down, function()
                ModeOutline.Visible = not ModeOutline.Visible
            end)
            --
            Library:Connection(Hold.MouseButton1Down, function()
                Library.CopiedColor = hsv
                Library.CopiedAlpha = alpha
            end)
            --
            Library:Connection(Toggle.MouseButton1Down, function()
                set(Library.CopiedColor or Color3.new(1,1,1), Library.CopiedAlpha or 0)
            end)
            --
            Library:Connection(game:GetService("UserInputService").InputBegan, function(Input)
                if ModeOutline.Visible and Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if not Library:IsMouseOverFrame(ModeOutline) then
                        ModeOutline.Visible = false
                    end
                end
            end)

            local colorpickertypes = {}

            function colorpickertypes:Set(color, newalpha)
                set(color, newalpha)
            end

            Library:Connection(game:GetService("UserInputService").InputBegan, function(Input)
                if ColorWindow.Visible and Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if not Library:IsMouseOverFrame(ColorWindow) and not Library:IsMouseOverFrame(Icon) then
                        ColorWindow.Visible = false
                        parent.ZIndex = 1
                    end
                end
            end)

            return colorpickertypes, ColorWindow
        end
    end

    -- // Library Functions
    do
        local Pages = Library.Pages;
        local Sections = Library.Sections;
        --
        function Library:Window(Options)
            local Window = {
                Pages = {};
                Sections = {};
                Elements = {};
                Dragging = { false, UDim2.new(0, 0, 0, 0) };
                Size = Options.Size or Options.size or UDim2.new(0, 550,0, 600);
            };
            --
            local ScreenGui = Instance.new('ScreenGui', game.CoreGui)
            local Outline = Instance.new('Frame', ScreenGui)
            local Inline = Instance.new('Frame', Outline)
            local Accent = Instance.new('Frame', Inline)
            local HolderOutline = Instance.new('Frame', Inline)
            local HolderInline = Instance.new('Frame', HolderOutline)
            local Tabs = Instance.new('Frame', HolderInline)
            local UIListLayout = Instance.new('UIListLayout', Tabs)
            local DragButton = Instance.new('TextButton', Outline)
            local KeybindList = Library:KeybindList()
            --
            ScreenGui.DisplayOrder = 2
            --
            Outline.Name = "Outline"
            Outline.Position = UDim2.new(0.5,0,0.5,0)
            Outline.Size = Window.Size
            Outline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
            Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
            Outline.AnchorPoint = Vector2.new(0.5,0.5)
            Library.Holder = Outline
            --
            Inline.Name = "Inline"
            Inline.Position = UDim2.new(0,1,0,1)
            Inline.Size = UDim2.new(1,-2,1,-2)
            Inline.BackgroundColor3 = Color3.new(0.0784,0.0784,0.0784)
            Inline.BorderSizePixel = 0
            Inline.BorderColor3 = Color3.new(0,0,0)
            --
            Accent.Name = "Accent"
            Accent.Size = UDim2.new(1,0,0,1)
            Accent.BackgroundColor3 = Library.Accent
            Accent.BorderSizePixel = 0
            Accent.BorderColor3 = Color3.new(0,0,0)
            table.insert(Library.ThemeObjects, Accent)
            --
            HolderOutline.Name = "HolderOutline"
            HolderOutline.Position = UDim2.new(0,7,0,11)
            HolderOutline.Size = UDim2.new(1,-14,1,-18)
            HolderOutline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
            HolderOutline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
            --
            HolderInline.Name = "HolderInline"
            HolderInline.Position = UDim2.new(0,1,0,1)
            HolderInline.Size = UDim2.new(1,-2,1,-2)
            HolderInline.BackgroundColor3 = Color3.new(0.0784,0.0784,0.0784)
            HolderInline.BorderSizePixel = 0
            HolderInline.BorderColor3 = Color3.new(0,0,0)
            --
            Tabs.Name = "Tabs"
            Tabs.Size = UDim2.new(1,0,0,22)
            Tabs.BackgroundColor3 = Color3.new(1,1,1)
            Tabs.BackgroundTransparency = 1
            Tabs.BorderSizePixel = 0
            Tabs.BorderColor3 = Color3.new(0,0,0)
            --
            UIListLayout.FillDirection = Enum.FillDirection.Horizontal
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            --
            DragButton.Name = "DragButton"
            DragButton.Size = UDim2.new(1,0,0,10)
            DragButton.BackgroundColor3 = Color3.new(1,1,1)
            DragButton.BackgroundTransparency = 1
            DragButton.BorderSizePixel = 0
            DragButton.BorderColor3 = Color3.new(0,0,0)
            DragButton.Text = ""
            DragButton.TextColor3 = Color3.new(0,0,0)
            DragButton.AutoButtonColor = false
            if Font and Font.GetRegistry then
                DragButton.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            DragButton.TextSize = 14
            
            
            
            -- // Elements
            Window.Elements = {
                TabHolder = Tabs,
                Holder = HolderInline
            }

            -- // Dragging
            Library:Connection(DragButton.MouseButton1Down, function()
                local Location = game:GetService("UserInputService"):GetMouseLocation()
                Window.Dragging[1] = true
                Window.Dragging[2] = UDim2.new(0, Location.X - Outline.AbsolutePosition.X, 0, Location.Y - Outline.AbsolutePosition.Y)
            end)
            Library:Connection(game:GetService("UserInputService").InputEnded, function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 and Window.Dragging[1] then
                    local Location = game:GetService("UserInputService"):GetMouseLocation()
                    Window.Dragging[1] = false
                    Window.Dragging[2] = UDim2.new(0, 0, 0, 0)
                end
            end)
            Library:Connection(game:GetService("UserInputService").InputChanged, function(Input)
                local Location = game:GetService("UserInputService"):GetMouseLocation()
                local ActualLocation = nil

                -- Dragging
                if Window.Dragging[1] then
                    Outline.Position = UDim2.new(
                        0,
                        Location.X - Window.Dragging[2].X.Offset + (Outline.Size.X.Offset * Outline.AnchorPoint.X),
                        0,
                        Location.Y - Window.Dragging[2].Y.Offset + (Outline.Size.Y.Offset * Outline.AnchorPoint.Y)
                    )
                end
            end)
            Library:Connection(game:GetService("UserInputService").InputBegan, function(Input)
                if Input.KeyCode == Library.UIKey then
                    Library:SetOpen(not Library.Open)
                end
            end)

            -- // Functions
            function Window:UpdateTabs()
                for Index, Page in pairs(Window.Pages) do
                    Page.Elements.Button.Size = UDim2.new(1/#Window.Pages,0,1,0)
                    Page:Turn(Page.Open)
                end
            end

            -- // Returns
            Library.Holder = Outline
            Library.ScreenGUI = ScreenGui
            return setmetatable(Window, Library)
        end
        --
        function Library:Page(Properties)
            if not Properties then
                Properties = {}
            end
            --
            local Page = {
                Name = Properties.Name or "Page",
                Window = self,
                Open = false,
                Sections = {},
                Elements = {},
                Weapons = {},
                Icons = Properties.Weapons or Properties.weapons or false,
            }
            --
            local TabButton = Instance.new('TextButton', Page.Window.Elements.TabHolder)
            local TabAccent = Instance.new('Frame', TabButton)
            local TabLine = Instance.new('Frame', TabButton)
            local WeaponOutline = Instance.new("Frame", Page.Window.Elements.Holder)
            local WeaponInline = Instance.new("Frame", WeaponOutline)
            local UIListLayout3 = Instance.new("UIListLayout", WeaponInline)
            local Left = Instance.new('Frame', Page.Window.Elements.Holder)
            local Right = Instance.new('Frame', Page.Window.Elements.Holder)
            local UIListLayout = Instance.new('UIListLayout', Left)
            local UIListLayout_2 = Instance.new('UIListLayout', Right)
            Left.Name = "Left"
            Left.Position = UDim2.new(0,5,0,35)
            Left.Size = UDim2.new(0.485,-3,1,-40)
            Left.BackgroundColor3 = Color3.new(1,1,1)
            Left.BorderSizePixel = 0
            Left.BackgroundTransparency = 1
            Left.BorderColor3 = Color3.new(0,0,0)
            Left.Visible = false
            Left.ZIndex = 3
            --
            Right.Name = "Right"
            Right.Position = UDim2.new(1,-5,0,35)
            Right.Size = UDim2.new(0.485,-3,1,-40)
            Right.BackgroundColor3 = Color3.new(1,1,1)
            Right.BorderSizePixel = 0
            Right.BorderColor3 = Color3.new(0,0,0)
            Right.AnchorPoint = Vector2.new(1,0)
            Right.Visible = false
            Right.BackgroundTransparency = 1
            --
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0,12)
            --
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.Padding = UDim.new(0,12)
            --
            TabButton.Name = "TabButton"
            TabButton.Size = UDim2.new(0.25,0,1,0)
            TabButton.BackgroundColor3 = Color3.new(1,1,1)
            TabButton.BackgroundTransparency = 1
            TabButton.BorderSizePixel = 0
            TabButton.BorderColor3 = Color3.new(0,0,0)
            TabButton.Text = Page.Name
            TabButton.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
            TabButton.AutoButtonColor = false
            if Font and Font.GetRegistry then
                TabButton.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            TabButton.TextSize = Library.FontSize
            TabButton.TextStrokeTransparency = 0
            TabButton.LineHeight = 1.1
            --
            TabAccent.Name = "TabAccent"
            TabAccent.Size = UDim2.new(1,0,0,1)
            TabAccent.BackgroundColor3 = Library.Accent
            TabAccent.BorderSizePixel = 0
            TabAccent.BorderColor3 = Color3.new(0,0,0)
            TabAccent.Visible = false
            table.insert(Library.ThemeObjects, TabAccent)
            --
            TabLine.Name = "TabLine"
            TabLine.Position = UDim2.new(0,0,1,-1)
            TabLine.Size = UDim2.new(1,0,0,1)
            TabLine.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
            TabLine.BorderSizePixel = 0
            TabLine.BorderColor3 = Color3.new(0,0,0)

            WeaponOutline.Name = "WeaponOutline"
            WeaponOutline.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            WeaponOutline.BorderColor3 = Color3.fromRGB(10, 10, 10)
            WeaponOutline.Position = UDim2.new(0, 5, 0, 25)
            WeaponOutline.Size = UDim2.new(1, -10, 0, 40)
            WeaponOutline.Visible = false
            
            WeaponInline.Name = "WeaponInline"
            WeaponInline.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            WeaponInline.BorderColor3 = Color3.fromRGB(0, 0, 0)
            WeaponInline.BorderSizePixel = 0
            WeaponInline.Position = UDim2.new(0, 1, 0, 1)
            WeaponInline.Size = UDim2.new(1, -2, 1, -2)
            
            UIListLayout3.FillDirection = Enum.FillDirection.Horizontal
            UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
            
            function Page:Turn(bool)
                Page.Open = bool
                if not Page.Icons then
                    Left.Visible = Page.Open
                    Right.Visible = Page.Open
                else
                    WeaponOutline.Visible = Page.Open
                    for Index, Weapon in pairs(Page.Weapons) do
                        Weapon:Turn(Weapon.Open)
                    end
                end
                TabAccent.Visible = Page.Open
                TabLine.Visible = not Page.Open
                TabButton.TextColor3 = Page.Open and Color3.fromRGB(255,255,255) or Color3.fromRGB(145,145,145)
            end
            --
            Library:Connection(TabButton.MouseButton1Down, function()
                if not Page.Open then
                    Page:Turn(true)
                    for _, Pages in pairs(Page.Window.Pages) do
                        if Pages.Open and Pages ~= Page then
                            Pages:Turn(false)
                        end
                    end
                end
            end)
            --
            Library:Connection(TabButton.MouseEnter, function() 
                if not Page.Open then
                    TabButton.TextColor3 = Library.Accent
                end
            end)
            --
            Library:Connection(TabButton.MouseLeave, function() 
                if not Page.Open then
                    TabButton.TextColor3 = Color3.fromRGB(145,145,145)
                end
            end)

            -- // Functions
            function Page:UpdateWeapons()
                for Index, Weapon in pairs(Page.Weapons) do
                    Weapon.Elements.Button.Size = UDim2.new(1/#Page.Weapons,0,1,0)
                    Weapon:Turn(Weapon.Open)
                end
            end

            -- // Elements
            Page.Elements = {
                Left = Page.Icons and nil or Left,
                Right = Page.Icons and nil or Right,
                Button = TabButton,
                WeaponOutline = WeaponOutline,
                WeaponInline = WeaponInline,
            }

            -- // Drawings
            if #Page.Window.Pages == 0 then
                Page:Turn(true)
            end
            Page.Window.Pages[#Page.Window.Pages + 1] = Page
            Page.Window:UpdateTabs()
            return setmetatable(Page, Library.Pages)
        end
        --
        function Pages:Weapon(Properties)
            if not Properties then
                Properties = {}
            end
            --
            local Weapon = {
                Icon = Properties.Icon or Properties.icon or "rbxassetid://11127408662",
                Window = self,
                Open = false,
                Sections = {},
                Elements = {},
            }
            --
            Weapon.Window.Elements.WeaponOutline.Visible = true

            local Left = Instance.new('Frame', Weapon.Window.Window.Elements.Holder)
            local Right = Instance.new('Frame', Weapon.Window.Window.Elements.Holder)
            local UIListLayout = Instance.new('UIListLayout', Left)
            local UIListLayout_2 = Instance.new('UIListLayout', Right)
            local New = Instance.new("ImageButton")
            --
            New.Name = "New"
            New.Parent = Weapon.Window.Elements.WeaponInline
            New.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            New.BackgroundTransparency = 1.000
            New.BorderColor3 = Color3.fromRGB(0, 0, 0)
            New.BorderSizePixel = 0
            New.Size = UDim2.new(0.200000003, 0, 1, 0)
            New.Image = Weapon.Icon
            New.ScaleType = Enum.ScaleType.Fit
            --
            Left.Name = "Left"
            Left.Position = UDim2.new(0,5,0,75)
            Left.Size = UDim2.new(0.485,-3,1, -80)
            Left.BackgroundColor3 = Color3.new(1,1,1)
            Left.BorderSizePixel = 0
            Left.BackgroundTransparency = 1
            Left.BorderColor3 = Color3.new(0,0,0)
            Left.Visible = false
            Left.ZIndex = 3
            --
            Right.Name = "Right"
            Right.Position = UDim2.new(1,-5,0,75)
            Right.Size = UDim2.new(0.485,-3,1, -80)
            Right.BackgroundColor3 = Color3.new(1,1,1)
            Right.BorderSizePixel = 0
            Right.BorderColor3 = Color3.new(0,0,0)
            Right.AnchorPoint = Vector2.new(1,0)
            Right.Visible = false
            Right.BackgroundTransparency = 1
            --
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0,12)
            --
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.Padding = UDim.new(0,12)
            
            function Weapon:Turn(bool)
                Weapon.Open = bool
                Left.Visible = Weapon.Open and Weapon.Window.Open
                Right.Visible = Weapon.Open and Weapon.Window.Open
                New.ImageColor3 = Weapon.Open and Color3.new(1,1,1) or Color3.fromRGB(145,145,145)
            end
            --
            Library:Connection(New.MouseButton1Down, function()
                if not Weapon.Open then
                    Weapon:Turn(true)
                    for _, Weapons in pairs(Weapon.Window.Weapons) do
                        if Weapons.Open and Weapons ~= Weapon then
                            Weapons:Turn(false)
                        end
                    end
                end
            end)
            --

            -- // Elements
            Weapon.Elements = {
                Left = Left,
                Right = Right,
                Button = New
            }

            -- // Drawings
            if #Weapon.Window.Weapons == 0 then
                Weapon:Turn(true)
            end
            Weapon.Window.Weapons[#Weapon.Window.Weapons + 1] = Weapon
            Weapon.Window:UpdateWeapons()
            return setmetatable(Weapon, Library.Pages)
        end
        --
        function Pages:Section(Properties)
            if not Properties then
                Properties = {}
            end
            --
            local Section = {
                Name = Properties.Name or "Section",
                Page = self,
                Side = (Properties.side or Properties.Side or "left"):lower(),
                ZIndex = Properties.ZIndex or 1, -- Idfk why
                Elements = {},
                Content = {},
            }
            --
            local SectionOutline = Instance.new('Frame', Section.Side == "left" and Section.Page.Elements.Left or Section.Side == "right" and Section.Page.Elements.Right)
            local SectionInline = Instance.new('Frame', SectionOutline)
            local Container = Instance.new('Frame', SectionInline)
            local UIListLayout = Instance.new('UIListLayout', Container)
            local Space = Instance.new('Frame', Container)
            local SectionAccent = Instance.new('Frame', SectionInline)
            local Title = Instance.new('TextLabel', SectionOutline)
            local TextBorder = Instance.new('Frame', SectionOutline)	
            --
            SectionOutline.Name = "SectionOutline"
            SectionOutline.Size = UDim2.new(1,0,0,20)
            SectionOutline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
            SectionOutline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
            SectionOutline.AutomaticSize = Enum.AutomaticSize.Y
            SectionOutline.ZIndex = Section.ZIndex
            --
            
            --
            SectionInline.Name = "SectionInline"
            SectionInline.Position = UDim2.new(0,1,0,1)
            SectionInline.Size = UDim2.new(1,-2,1,-2)
            SectionInline.BackgroundColor3 = Color3.new(0.0784,0.0784,0.0784)
            SectionInline.BorderSizePixel = 0
            SectionInline.BorderColor3 = Color3.new(0,0,0)
            --
            Container.Name = "Container"
            Container.Position = UDim2.new(0,7,0,10)
            Container.Size = UDim2.new(1,-14,1,-10)
            Container.BackgroundColor3 = Color3.new(1,1,1)
            Container.BackgroundTransparency = 1
            Container.BorderSizePixel = 0
            Container.BorderColor3 = Color3.new(0,0,0)
            Container.AutomaticSize = Enum.AutomaticSize.Y
            --
            Space.Name = "Space"
            Space.Position = UDim2.new(0,0,1,0)
            Space.Size = UDim2.new(1,0,0,1)
            Space.BackgroundColor3 = Color3.new(1,1,1)
            Space.BackgroundTransparency = 1
            Space.BorderSizePixel = 0
            Space.BorderColor3 = Color3.new(0,0,0)
            Space.LayoutOrder = 1000
            --
            SectionAccent.Name = "SectionAccent"
            SectionAccent.Size = UDim2.new(1,0,0,1)
            SectionAccent.BackgroundColor3 = Library.Accent
            SectionAccent.BorderSizePixel = 0
            SectionAccent.BorderColor3 = Color3.new(0,0,0)
            table.insert(Library.ThemeObjects, SectionAccent)
            table.insert(Library.ThemeObjects, SectionAccent)
            --
            Title.Name = "Title"
            Title.Position = UDim2.new(0,10,0,-8)
            Title.Size = UDim2.new(0,100,0,16)
            Title.BackgroundColor3 = Color3.new(1,1,1)
            Title.BackgroundTransparency = 1
            Title.BorderSizePixel = 0
            Title.BorderColor3 = Color3.new(0,0,0)
            Title.TextColor3 = Color3.new(1,1,1)
            if Font and Font.GetRegistry then
                Title.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Title.TextSize = Library.FontSize
            Title.ZIndex = 3
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Text = Section.Name
            Title.TextStrokeTransparency = 0
            --
            TextBorder.Name = "TextBorder"
            TextBorder.Position = UDim2.new(0,6,0,-2)
            TextBorder.Size = UDim2.new(0,Title.TextBounds.X + 8,0,4)
            TextBorder.BackgroundColor3 = Color3.new(0.0784,0.0784,0.0784)
            TextBorder.BorderSizePixel = 0
            TextBorder.BorderColor3 = Color3.new(0,0,0)
            --
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0,10)
            
            -- // Elements
            Section.Elements = {
                SectionContent = Container;
                SectionHolder = SectionOutline;
            }

            -- // Returning
            Section.Page.Sections[#Section.Page.Sections + 1] = Section
            wait(0.01)
            TextBorder.Size = UDim2.new(0,Title.TextBounds.X + 8,0,4)
            return setmetatable(Section, Library.Sections)
        end
        --
        function Sections:Toggle(Properties)
            if not Properties then
                Properties = {}
            end
            --
            local Toggle = {
                Window = self.Window,
                Page = self.Page,
                Section = self,
                Risk = Properties.Risk or false,
                Name = Properties.Name or "Toggle",
                State = (
                    Properties.state
                        or Properties.State
                        or Properties.def
                        or Properties.Def
                        or Properties.default
                        or Properties.Default
                        or false
                ),
                Callback = (
                    Properties.callback
                        or Properties.Callback
                        or Properties.callBack
                        or Properties.CallBack
                        or function() end
                ),
                Flag = (
                    Properties.flag
                        or Properties.Flag
                        or Properties.pointer
                        or Properties.Pointer
                        or Library.NextFlag()
                ),
                Toggled = false,
                Colorpickers = 0,
            }
            --
            local NewToggle = Instance.new('TextButton', Toggle.Section.Elements.SectionContent)
            local Outline = Instance.new('Frame', NewToggle)
            local Inline = Instance.new('Frame', Outline)
            local Title = Instance.new('TextLabel', NewToggle)
            --
            NewToggle.Name = "NewToggle"
            NewToggle.Size = UDim2.new(1,0,0,10)
            NewToggle.BackgroundColor3 = Color3.new(1,1,1)
            NewToggle.BackgroundTransparency = 1
            NewToggle.BorderSizePixel = 0
            NewToggle.BorderColor3 = Color3.new(0,0,0)
            NewToggle.Text = ""
            NewToggle.TextColor3 = Color3.new(0,0,0)
            NewToggle.AutoButtonColor = false
            if Font and Font.GetRegistry then
                NewToggle.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            NewToggle.TextSize = 14
            --
            Outline.Name = "Outline"
            Outline.Size = UDim2.new(0,10,0,10)
            Outline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
            Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
            --
            Inline.Name = "Inline"
            Inline.Position = UDim2.new(0,1,0,1)
            Inline.Size = UDim2.new(1,-2,1,-2)
            Inline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
            Inline.BorderSizePixel = 0
            Inline.BorderColor3 = Color3.new(0,0,0)
            --
            --[[local inputText = string.upper(Toggle.Name)
            local targetLanguage = "Chinese" -- // English, Arabic, Albanian, Japanese, Spanish, Russian, Chinese, Urdu, French, Portuguese, Hindi
            local translatedText = utility:TranslateString(inputText, targetLanguage)]] 
            -- 
            Title.Name = "Title"
            Title.Position = UDim2.new(0,15,0,0)
            Title.Size = UDim2.new(1,0,0,10)
            Title.BackgroundColor3 = Color3.new(1,1,1)
            Title.BackgroundTransparency = 1
            Title.BorderSizePixel = 0
            Title.BorderColor3 = Color3.new(0,0,0)
            Title.TextColor3 = Toggle.Risk and Color3.fromRGB(158, 158, 24) or Color3.new(0.5686,0.5686,0.5686)
            if Font and Font.GetRegistry then
                Title.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Title.TextSize = Library.FontSize
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Text = Toggle.Name
            Title.TextStrokeTransparency = 0
            
            -- // Functions
            local function SetState()
                Toggle.Toggled = not Toggle.Toggled
                if Toggle.Toggled then
                    table.insert(Library.ThemeObjects, Inline)
                    Inline.BackgroundColor3 = Library.Accent
                    if Toggle.Risk then
                        Title.TextColor3 = Color3.fromRGB(227, 227, 34)
                    else
                        Title.TextColor3 = Color3.fromRGB(255,255,255)
                    end
                else
                    table.remove(Library.ThemeObjects, table.find(Library.ThemeObjects, Inline))
                    Inline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
                    if Toggle.Risk then
                        Title.TextColor3 = Color3.fromRGB(158, 158, 24)
                    else
                        Title.TextColor3 = Color3.fromRGB(145,145,145)
                    end
                end
                Library.Flags[Toggle.Flag] = Toggle.Toggled
                Toggle.Callback(Toggle.Toggled)
            end
            --
            Library:Connection(NewToggle.MouseButton1Down, SetState)
            Library:Connection(NewToggle.MouseEnter, function()
                if not Toggle.Toggled then
                    table.insert(Library.ThemeObjects, Title)
                    Title.TextColor3 = Library.Accent
                end
            end)
            --
            Library:Connection(NewToggle.MouseLeave, function()
                if not Toggle.Toggled then
                    table.remove(Library.ThemeObjects, table.find(Library.ThemeObjects, Title))
                    if Toggle.Risk then
                        Title.TextColor3 = Color3.fromRGB(158, 158, 24)
                    else
                        Title.TextColor3 = Color3.fromRGB(145,145,145)
                    end
                else
                    table.remove(Library.ThemeObjects, table.find(Library.ThemeObjects, Title))
                end
            end)
            
            function Toggle:Keybind(Properties)
                local Properties = Properties or {}
                local Keybind = {
                    Section = self,
                    State = (
                        Properties.state
                            or Properties.State
                            or Properties.def
                            or Properties.Def
                            or Properties.default
                            or Properties.Default
                            or nil
                    ),
                    Mode = (Properties.mode or Properties.Mode or "Toggle"),
                    Callback = (
                        Properties.callback
                            or Properties.Callback
                            or Properties.callBack
                            or Properties.CallBack
                            or function() end
                    ),
                    Flag = (
                        Properties.flag
                            or Properties.Flag
                            or Properties.pointer
                            or Properties.Pointer
                            or Library.NextFlag()
                    ),
                    Name = Properties.name or Properties.Name or "Keybind",
                    Binding = nil,
                }
                local Key
                local State = false
                --
                local Outline = Instance.new('TextButton', NewToggle)
                local Inline = Instance.new('Frame', Outline)
                local Value = Instance.new('TextLabel', Inline)
                local ModeOutline = Instance.new('Frame', NewToggle)
                local ModeInline = Instance.new('Frame', ModeOutline)
                local UIListLayout = Instance.new('UIListLayout', ModeInline)
                local Hold = Instance.new('TextButton', ModeInline)
                local Toggle = Instance.new('TextButton', ModeInline)
                local Always = Instance.new('TextButton', ModeInline)
                local ListValue = Library.KeyList:NewKey(tostring(Keybind.State):gsub("Enum.KeyCode.", ""), Title.Text, Keybind.Mode)
                --
                Outline.Name = "Outline"
                Outline.Position = UDim2.new(1,0,0.5,0)
                Outline.Size = UDim2.new(0,40,0,12)
                Outline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
                Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
                Outline.AnchorPoint = NewVector2(1,0.5)
                Outline.Text = ""
                Outline.AutoButtonColor = false
                --
                Inline.Name = "Inline"
                Inline.Position = UDim2.new(0,1,0,1)
                Inline.Size = UDim2.new(1,-2,1,-2)
                Inline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
                Inline.BorderSizePixel = 0
                Inline.BorderColor3 = Color3.new(0,0,0)
                --
                Value.Name = "Value"
                Value.Size = UDim2.new(1,0,1,0)
                Value.BackgroundColor3 = Color3.new(1,1,1)
                Value.BackgroundTransparency = 1
                Value.BorderSizePixel = 0
                Value.BorderColor3 = Color3.new(0,0,0)
                Value.Text = "MB2"
                Value.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
                if Font and Font.GetRegistry then
                    Value.FontFace = Font.new(Font:GetRegistry("menu_plex"))
                end
                Value.TextSize = Library.FontSize
                Value.TextStrokeTransparency = 0
                --
                ModeOutline.Name = "ModeOutline"
                ModeOutline.Position = UDim2.new(1,65,0.5,0)
                ModeOutline.Size = UDim2.new(0,60,0,12)
                ModeOutline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
                ModeOutline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
                ModeOutline.AnchorPoint = NewVector2(1,0.5)
                ModeOutline.AutomaticSize = Enum.AutomaticSize.Y
                ModeOutline.Visible = false
                --
                ModeInline.Name = "ModeInline"
                ModeInline.Position = UDim2.new(0,1,0,1)
                ModeInline.Size = UDim2.new(1,-2,1,-2)
                ModeInline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
                ModeInline.BorderSizePixel = 0
                ModeInline.BorderColor3 = Color3.new(0,0,0)
                --
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                --
                Hold.Name = "Hold"
                Hold.Size = UDim2.new(1,0,0,15)
                Hold.BackgroundColor3 = Color3.new(1,1,1)
                Hold.BackgroundTransparency = 1
                Hold.BorderSizePixel = 0
                Hold.BorderColor3 = Color3.new(0,0,0)
                Hold.Text = "Hold"
                Hold.TextColor3 = Keybind.Mode == "Hold" and Color3.new(1,1,1) or Color3.new(0.5686,0.5686,0.5686)
                Hold.AutoButtonColor = false
                if Font and Font.GetRegistry then
                    Hold.FontFace = Font.new(Font:GetRegistry("menu_plex"))
                end
                Hold.TextSize = Library.FontSize
                Hold.TextStrokeTransparency = 0
                --
                Toggle.Name = "Toggle"
                Toggle.Size = UDim2.new(1,0,0,15)
                Toggle.BackgroundColor3 = Color3.new(1,1,1)
                Toggle.BackgroundTransparency = 1
                Toggle.BorderSizePixel = 0
                Toggle.BorderColor3 = Color3.new(0,0,0)
                Toggle.Text = "Toggle"
                Toggle.TextColor3 = Keybind.Mode == "Toggle" and Color3.new(1,1,1) or Color3.new(0.5686,0.5686,0.5686)
                Toggle.AutoButtonColor = false
                if Font and Font.GetRegistry then
                    Toggle.FontFace = Font.new(Font:GetRegistry("menu_plex"))
                end
                Toggle.TextSize = Library.FontSize
                Toggle.TextStrokeTransparency = 0
                --
                Always.Name = "Always"
                Always.Size = UDim2.new(1,0,0,15)
                Always.BackgroundColor3 = Color3.new(1,1,1)
                Always.BackgroundTransparency = 1
                Always.BorderSizePixel = 0
                Always.BorderColor3 = Color3.new(0,0,0)
                Always.Text = "Always"
                Always.TextColor3 = Keybind.Mode == "Always" and Color3.new(1,1,1) or Color3.new(0.5686,0.5686,0.5686)
                Always.AutoButtonColor = false
                if Font and Font.GetRegistry then
                    Always.FontFace = Font.new(Font:GetRegistry("menu_plex"))
                end
                Always.TextSize = Library.FontSize
                Always.TextStrokeTransparency = 0

                -- // Functions
                local function set(newkey)
                    if string.find(tostring(newkey), "Enum") then
                        if c then
                            c:Disconnect()
                            if Keybind.Flag then
                                Library.Flags[Keybind.Flag] = false
                            end
                            Keybind.Callback(false)
                        end
                        if tostring(newkey):find("Enum.KeyCode.") then
                            newkey = Enum.KeyCode[tostring(newkey):gsub("Enum.KeyCode.", "")]
                        elseif tostring(newkey):find("Enum.UserInputType.") then
                            newkey = Enum.UserInputType[tostring(newkey):gsub("Enum.UserInputType.", "")]
                        end
                        if newkey == Enum.KeyCode.Backspace then
                            Key = nil

                            local text = "None"

                            Value.Text = text
                            ListValue:Update(text, Keybind.Name, Keybind.Mode)
                        elseif newkey ~= nil then
                            Key = newkey

                            local text = (Library.Keys[newkey] or tostring(newkey):gsub("Enum.KeyCode.", ""))

                            Value.Text = text
                            ListValue:Update(text, Keybind.Name, Keybind.Mode)
                        end

                        Library.Flags[Keybind.Flag .. "_KEY"] = newkey
                    elseif table.find({ "Always", "Toggle", "Hold" }, newkey) then
                        Library.Flags[Keybind.Flag .. "_KEY STATE"] = newkey
                        Keybind.Mode = newkey
                        ListValue:Update((Library.Keys[Key] or tostring(Key):gsub("Enum.KeyCode.", "")), Keybind.Name, Keybind.Mode)
                        if Keybind.Mode == "Always" then
                            State = true
                            if Keybind.Flag then
                                Library.Flags[Keybind.Flag] = State
                            end
                            Keybind.Callback(true)
                            ListValue:SetVisible(true)
                        end
                    else
                        State = newkey
                        if Keybind.Flag then
                            Library.Flags[Keybind.Flag] = newkey
                        end
                        Keybind.Callback(newkey)
                    end
                end
                --
                set(Keybind.State)
                set(Keybind.Mode)
                Outline.MouseButton1Click:Connect(function()
                    if not Keybind.Binding then

                        Value.Text = "..."

                        Keybind.Binding = Library:Connection(
                            game:GetService("UserInputService").InputBegan,
                            function(input, gpe)
                                set(
                                    input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode
                                        or input.UserInputType
                                )
                                Library:Disconnect(Keybind.Binding)
                                task.wait()
                                Keybind.Binding = nil
                            end
                        )
                    end
                end)
                --
                local HoldLoop; 
                Library:Connection(game:GetService("UserInputService").InputBegan, function(inp, Typing)
                    if Typing then return end 

                    if HoldLoop then 
                        HoldLoop:Disconnect() 
                    end 
                    -- 
                    if (inp.KeyCode == Key or inp.UserInputType == Key) and not Keybind.Binding then
                        if Keybind.Mode == "Hold" then
                            if Keybind.Flag then
                                Library.Flags[Keybind.Flag] = true
                            end
                            HoldLoop = Library:Connection(game:GetService("RunService").RenderStepped, function()
                                if Keybind.Callback then
                                    Keybind.Callback(true)
                                end
                            end)
                            ListValue:SetVisible(true)
                        elseif Keybind.Mode == "Toggle" then
                            State = not State
                            if Keybind.Flag then
                                Library.Flags[Keybind.Flag] = State
                            end
                            Keybind.Callback(State)
                            ListValue:SetVisible(State)
                        end
                    end
                end)
                --
                Library:Connection(game:GetService("UserInputService").InputEnded, function(inp, Typing)
                    if Typing then return end 
                    if Keybind.Mode == "Hold" then
                        if Key ~= "" or Key ~= nil then
                            if inp.KeyCode == Key or inp.UserInputType == Key then
                                if c then
                                    c:Disconnect()
                                    if Keybind.Flag then
                                        Library.Flags[Keybind.Flag] = false
                                    end
                                    if Keybind.Callback then
                                        Keybind.Callback(false)
                                    end
                                    ListValue:SetVisible(false)
                                end
                            end
                        end
                    end
                end)
                Library:Connection(Outline.MouseEnter, function()
                    Outline.BorderColor3 = Library.Accent
                end)
                --
                Library:Connection(Outline.MouseLeave, function()
                    Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
                end)
                --
                Library:Connection(Outline.MouseButton2Down, function()
                    ModeOutline.Visible = not ModeOutline.Visible
                end)
                --
                Library:Connection(Hold.MouseButton1Down, function()
                    set("Hold")
                    Hold.TextColor3 = Color3.new(1,1,1)
                    Toggle.TextColor3 = Color3.fromRGB(145,145,145)
                    Always.TextColor3 = Color3.fromRGB(145,145,145)
                end)
                --
                Library:Connection(Toggle.MouseButton1Down, function()
                    set("Toggle")
                    Hold.TextColor3 = Color3.fromRGB(145,145,145)
                    Toggle.TextColor3 = Color3.new(1,1,1)
                    Always.TextColor3 = Color3.fromRGB(145,145,145)
                end)
                --
                Library:Connection(Always.MouseButton1Down, function()
                    set("Always")
                    Hold.TextColor3 = Color3.fromRGB(145,145,145)
                    Toggle.TextColor3 = Color3.fromRGB(145,145,145)
                    Always.TextColor3 = Color3.new(1,1,1)
                end)
                --
                Library:Connection(game:GetService("UserInputService").InputBegan, function(Input)
                    if ModeOutline.Visible and Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if not Library:IsMouseOverFrame(ModeOutline) then
                            ModeOutline.Visible = false
                        end
                    end
                end)
                --
                Library.Flags[Keybind.Flag .. "_KEY"] = Keybind.State
                Library.Flags[Keybind.Flag .. "_KEY STATE"] = Keybind.Mode
                Flags[Keybind.Flag] = set
                Flags[Keybind.Flag .. "_KEY"] = set
                Flags[Keybind.Flag .. "_KEY STATE"] = set
                --
                function Keybind:Set(key)
                    set(key)
                end

                -- // Returning
                return Keybind
            end
            
            function Toggle:Colorpicker(Properties)
                local Properties = Properties or {}
                local Colorpicker = {
                    State = (
                        Properties.state
                            or Properties.State
                            or Properties.def
                            or Properties.Def
                            or Properties.default
                            or Properties.Default
                            or Color3.fromRGB(255, 0, 0)
                    ),
                    Alpha = (
                        Properties.alpha
                            or Properties.Alpha
                            or Properties.transparency
                            or Properties.Transparency
                            or 1
                    ),
                    Callback = (
                        Properties.callback
                            or Properties.Callback
                            or Properties.callBack
                            or Properties.CallBack
                            or function() end
                    ),
                    Flag = (
                        Properties.flag
                            or Properties.Flag
                            or Properties.pointer
                            or Properties.Pointer
                            or Library.NextFlag()
                    ),
                }
                -- // Functions
                Toggle.Colorpickers = Toggle.Colorpickers + 1
                local colorpickertypes = Library:NewPicker(
                    "",
                    Colorpicker.State,
                    Colorpicker.Alpha,
                    NewToggle,
                    Toggle.Colorpickers - 1,
                    Colorpicker.Flag,
                    Colorpicker.Callback
                )

                function Colorpicker:Set(color)
                    colorpickertypes:set(color)
                end

                -- // Returning
                return Colorpicker
            end
            
            -- // Misc Functions
            function Toggle.Set(bool)
                bool = type(bool) == "boolean" and bool or false
                if Toggle.Toggled ~= bool then
                    SetState()
                end
            end
            Toggle.Set(Toggle.State)
            Library.Flags[Toggle.Flag] = Toggle.State
            Flags[Toggle.Flag] = Toggle.Set

            -- // Returning
            return Toggle
        end
        --
        function Sections:Slider(Properties)
            if not Properties then
                Properties = {}
            end
            --
            local Slider = {
                Window = self.Window,
                Page = self.Page,
                Section = self,
                Name = Properties.Name or nil,
                Min = (Properties.min or Properties.Min or Properties.minimum or Properties.Minimum or 0),
                State = (
                    Properties.state
                        or Properties.State
                        or Properties.def
                        or Properties.Def
                        or Properties.default
                        or Properties.Default
                        or 10
                ),
                Max = (Properties.max or Properties.Max or Properties.maximum or Properties.Maximum or 100),
                Sub = (
                    Properties.suffix
                        or Properties.Suffix
                        or Properties.ending
                        or Properties.Ending
                        or Properties.prefix
                        or Properties.Prefix
                        or Properties.measurement
                        or Properties.Measurement
                        or ""
                ),
                Decimals = (Properties.decimals or Properties.Decimals or 1),
                Callback = (
                    Properties.callback
                        or Properties.Callback
                        or Properties.callBack
                        or Properties.CallBack
                        or function() end
                ),
                Flag = (
                    Properties.flag
                        or Properties.Flag
                        or Properties.pointer
                        or Properties.Pointer
                        or Library.NextFlag()
                ),
                Disabled = (Properties.Disabled or Properties.disable or nil),
            }
            local TextValue = ("[value]" .. Slider.Sub)
            --
            local NewSlider = Instance.new('TextButton', Slider.Section.Elements.SectionContent)
            local Outline = Instance.new('Frame', NewSlider)
            local Inline = Instance.new('Frame', Outline)
            local Accent = Instance.new('TextButton', Inline)
            local Add = Instance.new('TextButton', Outline)
            local Subtract = Instance.new('TextButton', Outline)
            local Title = Instance.new('TextLabel', NewSlider)
            local Value = Instance.new('TextLabel', NewSlider)
            --
            NewSlider.Name = "NewSlider"
            NewSlider.Size = UDim2.new(1,0,0,22)
            NewSlider.BackgroundColor3 = Color3.new(1,1,1)
            NewSlider.BackgroundTransparency = 1
            NewSlider.BorderSizePixel = 0
            NewSlider.BorderColor3 = Color3.new(0,0,0)
            NewSlider.Text = ""
            NewSlider.TextColor3 = Color3.new(0,0,0)
            NewSlider.AutoButtonColor = false
            if Font and Font.GetRegistry then
                NewSlider.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            NewSlider.TextSize = 14
            --
            Outline.Name = "Outline"
            Outline.Position = UDim2.new(0,15,1,0)
            Outline.Size = UDim2.new(1,-30,0,7)
            Outline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
            Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
            Outline.AnchorPoint = NewVector2(0,1)
            --
            Inline.Name = "Inline"
            Inline.Position = UDim2.new(0,1,0,1)
            Inline.Size = UDim2.new(1,-2,1,-2)
            Inline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
            Inline.BorderSizePixel = 0
            Inline.BorderColor3 = Color3.new(0,0,0)
            --
            Accent.Name = "Accent"
            Accent.Size = UDim2.new(0,0,1,0)
            Accent.BackgroundColor3 = Library.Accent
            Accent.BorderSizePixel = 0
            Accent.BorderColor3 = Color3.new(0,0,0)
            Accent.Text = ""
            Accent.TextColor3 = Color3.new(0,0,0)
            Accent.AutoButtonColor = false
            if Font and Font.GetRegistry then
                Accent.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Accent.TextSize = 14
            table.insert(Library.ThemeObjects, Accent)
            table.insert(Library.ThemeObjects, Accent)
            --
            Add.Name = "Add"
            Add.Position = UDim2.new(1,5,0.5,0)
            Add.Size = UDim2.new(0,10,0,10)
            Add.BackgroundColor3 = Color3.new(1,1,1)
            Add.BackgroundTransparency = 1
            Add.BorderSizePixel = 0
            Add.BorderColor3 = Color3.new(0,0,0)
            Add.AnchorPoint = NewVector2(0,0.5)
            Add.Text = "+"
            Add.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
            Add.AutoButtonColor = false
            if Font and Font.GetRegistry then
                Add.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Add.TextSize = Library.FontSize
            Add.TextStrokeTransparency = 0
            --
            Subtract.Name = "Subtract"
            Subtract.Position = UDim2.new(0,-15,0.5,0)
            Subtract.Size = UDim2.new(0,10,0,10)
            Subtract.BackgroundColor3 = Color3.new(1,1,1)
            Subtract.BackgroundTransparency = 1
            Subtract.BorderSizePixel = 0
            Subtract.BorderColor3 = Color3.new(0,0,0)
            Subtract.AnchorPoint = NewVector2(0,0.5)
            Subtract.Text = "-"
            Subtract.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
            Subtract.AutoButtonColor = false
            if Font and Font.GetRegistry then
                Subtract.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Subtract.TextSize = Library.FontSize
            Subtract.TextStrokeTransparency = 0
            --
            Title.Name = "Title"
            Title.Position = UDim2.new(0,15,0,0)
            Title.Size = UDim2.new(1,0,0,10)
            Title.BackgroundColor3 = Color3.new(1,1,1)
            Title.BackgroundTransparency = 1
            Title.BorderSizePixel = 0
            Title.BorderColor3 = Color3.new(0,0,0)
            Title.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
            if Font and Font.GetRegistry then
                Title.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Title.TextSize = Library.FontSize
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Text = Slider.Name
            Title.TextStrokeTransparency = 0
            --
            Value.Name = "Value"
            Value.Position = UDim2.new(0,15,0,0)
            Value.Size = UDim2.new(1,-30,0,10)
            Value.BackgroundColor3 = Color3.new(1,1,1)
            Value.BackgroundTransparency = 1
            Value.BorderSizePixel = 0
            Value.BorderColor3 = Color3.new(0,0,0)
            Value.TextColor3 = Color3.new(1,1,1)
            if Font and Font.GetRegistry then
                Value.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Value.TextSize = Library.FontSize
            Value.TextXAlignment = Enum.TextXAlignment.Right
            Value.TextStrokeTransparency = 0
            
            -- // Functions
            local Sliding = false
            local Val = Slider.State
            local function Set(value)
                value = math.clamp(Library:Round(value, Slider.Decimals), Slider.Min, Slider.Max)

                local sizeX = ((value - Slider.Min) / (Slider.Max - Slider.Min))
                Accent.Size = UDim2.new(sizeX, 0, 1, 0)
                --Value.Text = TextValue:gsub("%[value%]", string.format("%.14g", value))
                if Slider.Disabled and value == Slider.Min then
                    Value.Text = Slider.Disabled
                else
                    Value.Text = TextValue:gsub("%[value%]", string.format("%.14g", value))
                end
                Val = value

                Library.Flags[Slider.Flag] = value
                Slider.Callback(value)
            end				
            --
            local function Slide(input)
                local sizeX = (input.Position.X - Outline.AbsolutePosition.X) / Outline.AbsoluteSize.X
                local value = ((Slider.Max - Slider.Min) * sizeX) + Slider.Min
                Set(value)
            end
            --
            Library:Connection(NewSlider.InputBegan, function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Sliding = true
                    Slide(input)
                end
            end)
            Library:Connection(NewSlider.InputEnded, function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Sliding = false
                end
            end)
            Library:Connection(Accent.InputBegan, function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Sliding = true
                    Slide(input)
                end
            end)
            Library:Connection(Accent.InputEnded, function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Sliding = false
                end
            end)
            Library:Connection(game:GetService("UserInputService").InputChanged, function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    if Sliding then
                        Slide(input)
                    end
                end
            end)
            Library:Connection(NewSlider.MouseEnter, function()
                table.insert(Library.ThemeObjects, Title)
                Title.TextColor3 = Library.Accent
            end)
            --
            Library:Connection(NewSlider.MouseLeave, function()
                table.remove(Library.ThemeObjects, table.find(Library.ThemeObjects, Title))
                Title.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
            end)
            --
            Library:Connection(Add.MouseButton1Down, function()
                Set(Val + 1)
            end)
            --
            Library:Connection(Subtract.MouseButton1Down, function()
                Set(Val - 1)
            end)
            --
            function Slider:Set(Value)
                Set(Value)
            end
            -- 
            function Slider:SetVisible(Bool) 
                NewSlider.Visible = Bool
            end 
            --
            Flags[Slider.Flag] = Set
            Library.Flags[Slider.Flag] = Slider.State
            Set(Slider.State)

            -- // Returning
            return Slider
        end
        --
        function Sections:Dropdown(Properties)
            local Properties = Properties or {};
            local Dropdown = {
                Window = self.Window,
                Page = self.Page,
                Section = self,
                Open = false,
                Name = Properties.Name or Properties.name or nil,
                Options = (Properties.options or Properties.Options or Properties.values or Properties.Values or {
                    "1",
                    "2",
                    "3",
                }),
                Max = (Properties.Max or Properties.max or nil),
                State = (
                    Properties.state
                        or Properties.State
                        or Properties.def
                        or Properties.Def
                        or Properties.default
                        or Properties.Default
                        or nil
                ),
                Callback = (
                    Properties.callback
                        or Properties.Callback
                        or Properties.callBack
                        or Properties.CallBack
                        or function() end
                ),
                Flag = (
                    Properties.flag
                        or Properties.Flag
                        or Properties.pointer
                        or Properties.Pointer
                        or Library.NextFlag()
                ),
                OptionInsts = {},
            }
            --
            local NewDrop = Instance.new('Frame', Dropdown.Section.Elements.SectionContent)
            local Outline = Instance.new('TextButton', NewDrop)
            local Inline = Instance.new('Frame', Outline)
            local Value = Instance.new('TextLabel', Inline)
            local Icon = Instance.new('TextLabel', Inline)
            local Title = Instance.new('TextLabel', NewDrop)
            local ContainerOutline = Instance.new('Frame', NewDrop)
            local ContainerInline = Instance.new('Frame', ContainerOutline)
            local UIListLayout = Instance.new('UIListLayout', ContainerInline)
            --
            NewDrop.Name = "NewDrop"
            NewDrop.Size = UDim2.new(1,0,0,30)
            NewDrop.BackgroundColor3 = Color3.new(1,1,1)
            NewDrop.BackgroundTransparency = 1
            NewDrop.BorderSizePixel = 0
            NewDrop.BorderColor3 = Color3.new(0,0,0)
            --
            Outline.Name = "Outline"
            Outline.Position = UDim2.new(0,15,1,0)
            Outline.Size = UDim2.new(1,-30,0,16)
            Outline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
            Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
            Outline.AnchorPoint = NewVector2(0,1)
            Outline.Text = ""
            Outline.AutoButtonColor = false
            --
            Inline.Name = "Inline"
            Inline.Position = UDim2.new(0,1,0,1)
            Inline.Size = UDim2.new(1,-2,1,-2)
            Inline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
            Inline.BorderSizePixel = 0
            Inline.BorderColor3 = Color3.new(0,0,0)
            --
            Value.Name = "Value"
            Value.Position = UDim2.new(0,2,0,0)
            Value.Size = UDim2.new(1,-30,1,0)
            Value.BackgroundColor3 = Color3.new(1,1,1)
            Value.BackgroundTransparency = 1
            Value.BorderSizePixel = 0
            Value.BorderColor3 = Color3.new(0,0,0)
            Value.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
            if Font and Font.GetRegistry then
                Value.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Value.TextSize = Library.FontSize
            Value.TextXAlignment = Enum.TextXAlignment.Left
            Value.TextStrokeTransparency = 0
            Value.TextWrapped = true
            --
            Icon.Name = "Icon"
            Icon.Position = UDim2.new(0,-5,0,0)
            Icon.Size = UDim2.new(1,0,1,0)
            Icon.BackgroundColor3 = Color3.new(1,1,1)
            Icon.BackgroundTransparency = 1
            Icon.BorderSizePixel = 0
            Icon.BorderColor3 = Color3.new(0,0,0)
            Icon.Text = "+"
            Icon.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
            if Font and Font.GetRegistry then
                Icon.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Icon.TextSize = Library.FontSize
            Icon.TextXAlignment = Enum.TextXAlignment.Right
            Icon.TextStrokeTransparency = 0
            --
            Title.Name = "Title"
            Title.Position = UDim2.new(0,15,0,0)
            Title.Size = UDim2.new(1,0,0,10)
            Title.BackgroundColor3 = Color3.new(1,1,1)
            Title.BackgroundTransparency = 1
            Title.BorderSizePixel = 0
            Title.BorderColor3 = Color3.new(0,0,0)
            Title.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
            if Font and Font.GetRegistry then
                Title.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Title.TextSize = Library.FontSize
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.TextStrokeTransparency = 0
            Title.Text = Dropdown.Name
            --
            ContainerOutline.Name = "ContainerOutline"
            ContainerOutline.Position = UDim2.new(0,15,1,2)
            ContainerOutline.Size = UDim2.new(1,-30,0,10)
            ContainerOutline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
            ContainerOutline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
            ContainerOutline.Visible = false
            ContainerOutline.AutomaticSize = Enum.AutomaticSize.Y
            ContainerOutline.ZIndex = 5
            --
            ContainerInline.Name = "ContainerInline"
            ContainerInline.Position = UDim2.new(0,1,0,1)
            ContainerInline.Size = UDim2.new(1,-2,1,-2)
            ContainerInline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
            ContainerInline.BorderSizePixel = 0
            ContainerInline.BorderColor3 = Color3.new(0,0,0)
            ContainerInline.ZIndex = 6;
            --
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            
            -- // Connections
            Library:Connection(Outline.MouseButton1Down, function()
                ContainerOutline.Visible = not ContainerOutline.Visible
                if ContainerOutline.Visible then
                    NewDrop.ZIndex = 2
                    Icon.Text = "-"
                else
                    NewDrop.ZIndex = 1
                    Icon.Text = "+"
                end
            end)
            Library:Connection(game:GetService("UserInputService").InputBegan, function(Input)
                if ContainerOutline.Visible and Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if not Library:IsMouseOverFrame(ContainerOutline) and not Library:IsMouseOverFrame(NewDrop) then
                        ContainerOutline.Visible = false
                        NewDrop.ZIndex = 1
                        Icon.Text = "+"
                    end
                end
            end)
            Library:Connection(NewDrop.MouseEnter, function()
                Outline.BorderColor3 = Library.Accent
                table.insert(Library.ThemeObjects, Title)
                Title.TextColor3 = Library.Accent
            end)
            --
            Library:Connection(NewDrop.MouseLeave, function()
                Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
                table.remove(Library.ThemeObjects, table.find(Library.ThemeObjects, Title))
                Title.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
            end)
            --
            local chosen = Dropdown.Max and {} or nil
            --
            local function handleoptionclick(option, button, text)
                button.MouseButton1Down:Connect(function()
                    if Dropdown.Max then
                        if table.find(chosen, option) then
                            table.remove(chosen, table.find(chosen, option))

                            local textchosen = {}
                            local cutobject = false

                            for _, opt in next, chosen do
                                table.insert(textchosen, opt)
                            end

                            Value.Text = #chosen == 0 and "" or table.concat(textchosen, ",") .. (cutobject and ", ..." or "")

                            text.TextColor3 = Color3.fromRGB(145,145,145)

                            Library.Flags[Dropdown.Flag] = chosen
                            Dropdown.Callback(chosen)
                        else
                            if #chosen == Dropdown.Max then
                                Dropdown.OptionInsts[chosen[1]].text.TextColor3 = Color3.fromRGB(145,145,145)
                                table.remove(chosen, 1)
                            end

                            table.insert(chosen, option)

                            local textchosen = {}
                            local cutobject = false

                            for _, opt in next, chosen do
                                table.insert(textchosen, opt)
                            end

                            Value.Text = #chosen == 0 and "" or table.concat(textchosen, ",") .. (cutobject and ", ..." or "")

                            text.TextColor3 = Color3.fromRGB(255,255,255)

                            Library.Flags[Dropdown.Flag] = chosen
                            Dropdown.Callback(chosen)
                        end
                    else
                        for opt, tbl in next, Dropdown.OptionInsts do
                            if opt ~= option then
                                tbl.text.TextColor3 = Color3.fromRGB(145,145,145)
                            end
                        end
                        chosen = option
                        Value.Text = option
                        text.TextColor3 = Color3.fromRGB(255,255,255)
                        Library.Flags[Dropdown.Flag] = option
                        Dropdown.Callback(option)
                    end
                end)
            end
            --
            local function createoptions(tbl)
                for _, option in next, tbl do
                    Dropdown.OptionInsts[option] = {}
                    local NewOption = Instance.new('TextButton', ContainerInline)
                    local OptionName = Instance.new('TextLabel', NewOption)
                    NewOption.Name = "NewOption"
                    NewOption.Size = UDim2.new(1,0,0,15)
                    NewOption.BackgroundColor3 = Color3.new(1,1,1)
                    NewOption.BackgroundTransparency = 1
                    NewOption.BorderSizePixel = 0
                    NewOption.BorderColor3 = Color3.new(0,0,0)
                    NewOption.Text = ""
                    NewOption.TextColor3 = Color3.new(0,0,0)
                    NewOption.AutoButtonColor = false
                    if Font and Font.GetRegistry then
                        NewOption.FontFace = Font.new(Font:GetRegistry("menu_plex"))
                    end
                    NewOption.TextSize = 14
                    NewOption.ZIndex = 7;
                    Dropdown.OptionInsts[option].button = NewOption
                    --
                    OptionName.Name = "OptionName"
                    OptionName.Position = UDim2.new(0,2,0,0)
                    OptionName.Size = UDim2.new(1,0,1,0)
                    OptionName.BackgroundColor3 = Color3.new(1,1,1)
                    OptionName.BackgroundTransparency = 1
                    OptionName.BorderSizePixel = 0
                    OptionName.BorderColor3 = Color3.new(0,0,0)
                    OptionName.Text = option
                    OptionName.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
                    if Font and Font.GetRegistry then
                        OptionName.FontFace = Font.new(Font:GetRegistry("menu_plex"))
                    end
                    OptionName.TextSize = Library.FontSize
                    OptionName.TextXAlignment = Enum.TextXAlignment.Left
                    OptionName.TextStrokeTransparency = 0
                    OptionName.ZIndex = 8;
                    Dropdown.OptionInsts[option].text = OptionName

                    handleoptionclick(option, NewOption, OptionName)
                end
            end
            createoptions(Dropdown.Options)
            --
            local set
            set = function(option)
                if Dropdown.Max then
                    table.clear(chosen)
                    option = type(option) == "table" and option or {}

                    for opt, tbl in next, Dropdown.OptionInsts do
                        if not table.find(option, opt) then
                            tbl.text.TextColor3 = Color3.fromRGB(145,145,145)
                        end
                    end

                    for i, opt in next, option do
                        if table.find(Dropdown.Options, opt) and #chosen < Dropdown.Max then
                            table.insert(chosen, opt)
                            Dropdown.OptionInsts[opt].text.TextColor3 = Color3.fromRGB(255,255,255)
                        end
                    end

                    local textchosen = {}
                    local cutobject = false

                    for _, opt in next, chosen do
                        table.insert(textchosen, opt)
                    end

                    Value.Text = #chosen == 0 and "" or table.concat(textchosen, ",") .. (cutobject and ", ..." or "")

                    Library.Flags[Dropdown.Flag] = chosen
                    Dropdown.Callback(chosen)
                end
            end
            --
            function Dropdown:Set(option)
                if Dropdown.Max then
                    set(option)
                else
                    for opt, tbl in next, Dropdown.OptionInsts do
                        if opt ~= option then
                            tbl.text.TextColor3 = Color3.fromRGB(145,145,145)
                        end
                    end
                    if table.find(Dropdown.Options, option) then
                        chosen = option
                        Value.Text = option
                        Dropdown.OptionInsts[option].text.TextColor3 = Color3.fromRGB(255,255,255)
                        Library.Flags[Dropdown.Flag] = chosen
                        Dropdown.Callback(chosen)
                    else
                        chosen = nil
                        Value.Text = ""
                        Library.Flags[Dropdown.Flag] = chosen
                        Dropdown.Callback(chosen)
                    end
                end
            end
            --
            function Dropdown:Refresh(tbl)
                for _, opt in next, Dropdown.OptionInsts do
                    coroutine.wrap(function()
                        opt.button:Destroy()
                    end)()
                end
                table.clear(Dropdown.OptionInsts)

                createoptions(tbl)

                if Dropdown.Max then
                    table.clear(chosen)
                else
                    chosen = nil
                end

                Library.Flags[Dropdown.Flag] = chosen
                Dropdown.Callback(chosen)
            end

            -- // Returning
            if Dropdown.Max then
                Flags[Dropdown.Flag] = set
            else
                Flags[Dropdown.Flag] = Dropdown
            end
            Dropdown:Set(Dropdown.State)
            function Dropdown:SetVisible(Bool) 
                NewDrop.Visible = Bool 
            end 
            return Dropdown
        end
        --
        function Sections:Keybind(Properties)
            local Properties = Properties or {}
            local Keybind = {
                Section = self,
                Name = Properties.name or Properties.Name or "Keybind",
                State = (
                    Properties.state
                        or Properties.State
                        or Properties.def
                        or Properties.Def
                        or Properties.default
                        or Properties.Default
                        or nil
                ),
                Mode = (Properties.mode or Properties.Mode or "Toggle"),
                UseKey = (Properties.UseKey or false),
                Ignore = (Properties.ignore or Properties.Ignore or false),
                Callback = (
                    Properties.callback
                        or Properties.Callback
                        or Properties.callBack
                        or Properties.CallBack
                        or function() end
                ),
                Flag = (
                    Properties.flag
                        or Properties.Flag
                        or Properties.pointer
                        or Properties.Pointer
                        or Library.NextFlag()
                ),
                Binding = nil,
            }
            local Key
            local State = false
            --
            local NewKey = Instance.new('Frame', Keybind.Section.Elements.SectionContent)
            local Outline = Instance.new('TextButton', NewKey)
            local Inline = Instance.new('Frame', Outline)
            local Value = Instance.new('TextLabel', Inline)
            local Title = Instance.new('TextLabel', NewKey)
            local ModeOutline = Instance.new('Frame', NewKey)
            local ModeInline = Instance.new('Frame', ModeOutline)
            local UIListLayout = Instance.new('UIListLayout', ModeInline)
            local Hold = Instance.new('TextButton', ModeInline)
            local Toggle = Instance.new('TextButton', ModeInline)
            local Always = Instance.new('TextButton', ModeInline)
            local ListValue = Library.KeyList:NewKey(tostring(Keybind.State):gsub("Enum.KeyCode.", ""), Keybind.Name, Keybind.Mode)
            --
            NewKey.Name = "NewKey"
            NewKey.Size = UDim2.new(1,0,0,12)
            NewKey.BackgroundColor3 = Color3.new(1,1,1)
            NewKey.BackgroundTransparency = 1
            NewKey.BorderSizePixel = 0
            NewKey.BorderColor3 = Color3.new(0,0,0)
            --
            Outline.Name = "Outline"
            Outline.Position = UDim2.new(1,0,0.5,0)
            Outline.Size = UDim2.new(0,40,0,12)
            Outline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
            Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
            Outline.AnchorPoint = NewVector2(1,0.5)
            Outline.Text = ""
            Outline.AutoButtonColor = false
            --
            Inline.Name = "Inline"
            Inline.Position = UDim2.new(0,1,0,1)
            Inline.Size = UDim2.new(1,-2,1,-2)
            Inline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
            Inline.BorderSizePixel = 0
            Inline.BorderColor3 = Color3.new(0,0,0)
            --
            Value.Name = "Value"
            Value.Size = UDim2.new(1,0,1,0)
            Value.BackgroundColor3 = Color3.new(1,1,1)
            Value.BackgroundTransparency = 1
            Value.BorderSizePixel = 0
            Value.BorderColor3 = Color3.new(0,0,0)
            Value.Text = "MB2"
            Value.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
            if Font and Font.GetRegistry then
                Value.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Value.TextSize = Library.FontSize
            Value.TextStrokeTransparency = 0
            --
            Title.Name = "Title"
            Title.Position = UDim2.new(0,15,0,0)
            Title.Size = UDim2.new(1,0,0,10)
            Title.BackgroundColor3 = Color3.new(1,1,1)
            Title.BackgroundTransparency = 1
            Title.BorderSizePixel = 0
            Title.BorderColor3 = Color3.new(0,0,0)
            Title.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
            if Font and Font.GetRegistry then
                Title.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Title.TextSize = Library.FontSize
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Text = Keybind.Name
            Title.TextStrokeTransparency = 0
            --
            ModeOutline.Name = "ModeOutline"
            ModeOutline.Position = UDim2.new(1,65,0.5,0)
            ModeOutline.Size = UDim2.new(0,60,0,12)
            ModeOutline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
            ModeOutline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
            ModeOutline.AnchorPoint = NewVector2(1,0.5)
            ModeOutline.AutomaticSize = Enum.AutomaticSize.Y
            ModeOutline.Visible = false
            --
            ModeInline.Name = "ModeInline"
            ModeInline.Position = UDim2.new(0,1,0,1)
            ModeInline.Size = UDim2.new(1,-2,1,-2)
            ModeInline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
            ModeInline.BorderSizePixel = 0
            ModeInline.BorderColor3 = Color3.new(0,0,0)
            --
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            --
            Hold.Name = "Hold"
            Hold.Size = UDim2.new(1,0,0,15)
            Hold.BackgroundColor3 = Color3.new(1,1,1)
            Hold.BackgroundTransparency = 1
            Hold.BorderSizePixel = 0
            Hold.BorderColor3 = Color3.new(0,0,0)
            Hold.Text = "Hold"
            Hold.TextColor3 = Keybind.Mode == "Hold" and Color3.new(1,1,1) or Color3.new(0.5686,0.5686,0.5686)
            Hold.AutoButtonColor = false
            if Font and Font.GetRegistry then
                Hold.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Hold.TextSize = Library.FontSize
            Hold.TextStrokeTransparency = 0
            --
            Toggle.Name = "Toggle"
            Toggle.Size = UDim2.new(1,0,0,15)
            Toggle.BackgroundColor3 = Color3.new(1,1,1)
            Toggle.BackgroundTransparency = 1
            Toggle.BorderSizePixel = 0
            Toggle.BorderColor3 = Color3.new(0,0,0)
            Toggle.Text = "Toggle"
            Toggle.TextColor3 = Keybind.Mode == "Toggle" and Color3.new(1,1,1) or Color3.new(0.5686,0.5686,0.5686)
            Toggle.AutoButtonColor = false
            if Font and Font.GetRegistry then
                Toggle.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Toggle.TextSize = Library.FontSize
            Toggle.TextStrokeTransparency = 0
            --
            Always.Name = "Always"
            Always.Size = UDim2.new(1,0,0,15)
            Always.BackgroundColor3 = Color3.new(1,1,1)
            Always.BackgroundTransparency = 1
            Always.BorderSizePixel = 0
            Always.BorderColor3 = Color3.new(0,0,0)
            Always.Text = "Always"
            Always.TextColor3 = Keybind.Mode == "Always" and Color3.new(1,1,1) or Color3.new(0.5686,0.5686,0.5686)
            Always.AutoButtonColor = false
            if Font and Font.GetRegistry then
                Always.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Always.TextSize = Library.FontSize
            Always.TextStrokeTransparency = 0
            --
            -- // Functions
            local function set(newkey)
                if string.find(tostring(newkey), "Enum") then
                    if c then
                        c:Disconnect()
                        if Keybind.Flag then
                            Library.Flags[Keybind.Flag] = false
                        end
                        Keybind.Callback(false)
                    end
                    if tostring(newkey):find("Enum.KeyCode.") then
                        newkey = Enum.KeyCode[tostring(newkey):gsub("Enum.KeyCode.", "")]
                    elseif tostring(newkey):find("Enum.UserInputType.") then
                        newkey = Enum.UserInputType[tostring(newkey):gsub("Enum.UserInputType.", "")]
                    end
                    if newkey == Enum.KeyCode.Backspace then
                        Key = nil
                        if Keybind.UseKey then
                            if Keybind.Flag then
                                Library.Flags[Keybind.Flag] = Key
                            end
                            Keybind.Callback(Key)
                        end
                        local text = "None"

                        Value.Text = text
                        ListValue:Update(text, Keybind.Name, Keybind.Mode)
                    elseif newkey ~= nil then
                        Key = newkey
                        if Keybind.UseKey then
                            if Keybind.Flag then
                                Library.Flags[Keybind.Flag] = Key
                            end
                            Keybind.Callback(Key)
                        end
                        local text = (Library.Keys[newkey] or tostring(newkey):gsub("Enum.KeyCode.", ""))

                        Value.Text = text
                        ListValue:Update(text, Keybind.Name, Keybind.Mode)
                    end

                    Library.Flags[Keybind.Flag .. "_KEY"] = newkey
                elseif table.find({ "Always", "Toggle", "Hold" }, newkey) then
                    if not Keybind.UseKey then
                        Library.Flags[Keybind.Flag .. "_KEY STATE"] = newkey
                        Keybind.Mode = newkey
                        ListValue:Update((Library.Keys[Key] or tostring(Key):gsub("Enum.KeyCode.", "")), Toggle.Name, Keybind.Mode)
                        if Keybind.Mode == "Always" then
                            State = true
                            if Keybind.Flag then
                                Library.Flags[Keybind.Flag] = State
                            end
                            Keybind.Callback(true)
                            ListValue:SetVisible(true)
                        end
                    end
                else
                    State = newkey
                    if Keybind.Flag then
                        Library.Flags[Keybind.Flag] = newkey
                    end
                    Keybind.Callback(newkey)
                end
            end
            --
            set(Keybind.State)
            set(Keybind.Mode)
            Outline.MouseButton1Click:Connect(function()
                if not Keybind.Binding then

                    Value.Text = "..."

                    Keybind.Binding = Library:Connection(
                        game:GetService("UserInputService").InputBegan,
                        function(input, gpe)
                            set(
                                input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode
                                    or input.UserInputType
                            )
                            Library:Disconnect(Keybind.Binding)
                            task.wait()
                            Keybind.Binding = nil
                        end
                    )
                end
            end)
            --
            Library:Connection(game:GetService("UserInputService").InputBegan, function(inp, Chatting)
                if not Chatting then 
                    if (inp.KeyCode == Key or inp.UserInputType == Key) and not Keybind.Binding and not Keybind.UseKey then
                        if Keybind.Mode == "Hold" then
                            if Keybind.Flag then
                                Library.Flags[Keybind.Flag] = true
                            end
                            c = Library:Connection(game:GetService("RunService").RenderStepped, function()
                                if Keybind.Callback then
                                    Keybind.Callback(true)
                                end
                            end)
                            ListValue:SetVisible(true)
                        elseif Keybind.Mode == "Toggle" then
                            State = not State
                            if Keybind.Flag then
                                Library.Flags[Keybind.Flag] = State
                            end
                            Keybind.Callback(State)
                            ListValue:SetVisible(State)
                        end
                    end 
                end 
            end)
            --
            Library:Connection(game:GetService("UserInputService").InputEnded, function(inp, Chatting)
                if not Chatting then 
                    if Keybind.Mode == "Hold" and not Keybind.UseKey then
                        if Key ~= "" or Key ~= nil then
                            if inp.KeyCode == Key or inp.UserInputType == Key then
                                if c then
                                    c:Disconnect()
                                    if Keybind.Flag then
                                        Library.Flags[Keybind.Flag] = false
                                    end
                                    if Keybind.Callback then
                                        Keybind.Callback(false)
                                    end
                                    ListValue:SetVisible(false)
                                end
                            end
                        end
                    end
                end 
            end)
            Library:Connection(Outline.MouseEnter, function()
                Outline.BorderColor3 = Library.Accent
            end)
            --
            Library:Connection(Outline.MouseLeave, function()
                Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
            end)
            --
            Library:Connection(Outline.MouseButton2Down, function()
                ModeOutline.Visible = not ModeOutline.Visible
            end)
            --
            Library:Connection(NewKey.MouseEnter, function()
                table.insert(Library.ThemeObjects, Title)
                Title.TextColor3 = Library.Accent
            end)
            --
            Library:Connection(NewKey.MouseLeave, function()
                table.remove(Library.ThemeObjects, table.find(Library.ThemeObjects, Title))
                Title.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
            end)
            --
            Library:Connection(Hold.MouseButton1Down, function()
                set("Hold")
                Hold.TextColor3 = Color3.new(1,1,1)
                Toggle.TextColor3 = Color3.fromRGB(145,145,145)
                Always.TextColor3 = Color3.fromRGB(145,145,145)
            end)
            --
            Library:Connection(Toggle.MouseButton1Down, function()
                set("Toggle")
                Hold.TextColor3 = Color3.fromRGB(145,145,145)
                Toggle.TextColor3 = Color3.new(1,1,1)
                Always.TextColor3 = Color3.fromRGB(145,145,145)
            end)
            --
            Library:Connection(Always.MouseButton1Down, function()
                set("Always")
                Hold.TextColor3 = Color3.fromRGB(145,145,145)
                Toggle.TextColor3 = Color3.fromRGB(145,145,145)
                Always.TextColor3 = Color3.new(1,1,1)
            end)
            --
            Library:Connection(game:GetService("UserInputService").InputBegan, function(Input, Chatting)
                if ModeOutline.Visible and Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if not Library:IsMouseOverFrame(ModeOutline) then
                        ModeOutline.Visible = false
                    end
                end
            end)
            --
            Library.Flags[Keybind.Flag .. "_KEY"] = Keybind.State
            Library.Flags[Keybind.Flag .. "_KEY STATE"] = Keybind.Mode
            Flags[Keybind.Flag] = set
            Flags[Keybind.Flag .. "_KEY"] = set
            Flags[Keybind.Flag .. "_KEY STATE"] = set
            --
            function Keybind:Set(key)
                set(key)
            end

            -- // Returning
            return Keybind
        end
        --
        function Sections:Colorpicker(Properties)
            local Properties = Properties or {}
            local Colorpicker = {
                Window = self.Window,
                Page = self.Page,
                Section = self,
                Name = (Properties.Name or "Colorpicker"),
                State = (
                    Properties.state
                        or Properties.State
                        or Properties.def
                        or Properties.Def
                        or Properties.default
                        or Properties.Default
                        or Color3.fromRGB(255, 0, 0)
                ),
                Alpha = (
                    Properties.alpha
                        or Properties.Alpha
                        or Properties.transparency
                        or Properties.Transparency
                        or 1
                ),
                Callback = (
                    Properties.callback
                        or Properties.Callback
                        or Properties.callBack
                        or Properties.CallBack
                        or function() end
                ),
                Flag = (
                    Properties.flag
                        or Properties.Flag
                        or Properties.pointer
                        or Properties.Pointer
                        or Library.NextFlag()
                ),
                Colorpickers = 0,
            }
            --
            local NewToggle = Instance.new('Frame', Colorpicker.Section.Elements.SectionContent)
            local TextLabel = Instance.new('TextLabel', NewToggle)
            --
            NewToggle.Name = "NewToggle"
            NewToggle.Size = UDim2.new(1,0,0,10)
            NewToggle.BackgroundColor3 = Color3.new(1,1,1)
            NewToggle.BackgroundTransparency = 1
            NewToggle.BorderSizePixel = 0
            NewToggle.BorderColor3 = Color3.new(0,0,0)
            --
            TextLabel.Position = UDim2.new(0,15,0,0)
            TextLabel.Size = UDim2.new(0,100,1,0)
            TextLabel.BackgroundColor3 = Color3.new(1,1,1)
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.BorderColor3 = Color3.new(0,0,0)
            TextLabel.Text = Colorpicker.Name
            TextLabel.TextColor3 = Color3.fromRGB(145, 145, 145)
            if Font and Font.GetRegistry then
                TextLabel.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            TextLabel.TextSize = Library.FontSize
            TextLabel.TextXAlignment = Enum.TextXAlignment.Left
            TextLabel.TextStrokeTransparency = 0
            
            Library:Connection(NewToggle.MouseEnter, function()
                table.insert(Library.ThemeObjects, TextLabel)
                TextLabel.TextColor3 = Library.Accent
            end)
            --
            Library:Connection(NewToggle.MouseLeave, function()
                table.remove(Library.ThemeObjects, table.find(Library.ThemeObjects, TextLabel))
                TextLabel.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
            end)

            -- // Functions
            Colorpicker.Colorpickers = Colorpicker.Colorpickers + 1
            local colorpickertypes = Library:NewPicker(
                Colorpicker.Name,
                Colorpicker.State,
                Colorpicker.Alpha,
                NewToggle,
                Colorpicker.Colorpickers - 1,
                Colorpicker.Flag,
                Colorpicker.Callback
            )

            function Colorpicker:Set(color)
                colorpickertypes:set(color, false, true)
            end

            -- // Returning
            return Colorpicker
        end
        --
        function Sections:Textbox(Properties)
            local Properties = Properties or {}
            local Textbox = {
                Window = self.Window,
                Page = self.Page,
                Section = self,
                Name = (Properties.Name or Properties.name or "textbox"),
                Placeholder = (
                    Properties.placeholder
                        or Properties.Placeholder
                        or Properties.holder
                        or Properties.Holder
                        or ""
                ),
                State = (
                    Properties.state
                        or Properties.State
                        or Properties.def
                        or Properties.Def
                        or Properties.default
                        or Properties.Default
                        or ""
                ),
                Callback = (
                    Properties.callback
                        or Properties.Callback
                        or Properties.callBack
                        or Properties.CallBack
                        or function() end
                ),
                Flag = (
                    Properties.flag
                        or Properties.Flag
                        or Properties.pointer
                        or Properties.Pointer
                        or Library.NextFlag()
                ),
            }
            --
            local NewDrop = Instance.new('Frame', Textbox.Section.Elements.SectionContent)
            local Outline = Instance.new('TextButton', NewDrop)
            local Inline = Instance.new('Frame', Outline)
            local Value = Instance.new('TextBox', Inline)
            local Title = Instance.new('TextLabel', NewDrop)
            --
            NewDrop.Name = "NewDrop"
            NewDrop.Size = UDim2.new(1,0,0,30)
            NewDrop.BackgroundColor3 = Color3.new(1,1,1)
            NewDrop.BackgroundTransparency = 1
            NewDrop.BorderSizePixel = 0
            NewDrop.BorderColor3 = Color3.new(0,0,0)
            --
            Outline.Name = "Outline"
            Outline.Position = UDim2.new(0,15,1,0)
            Outline.Size = UDim2.new(1,-30,0,16)
            Outline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
            Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
            Outline.AnchorPoint = NewVector2(0,1)
            Outline.Text = ""
            Outline.AutoButtonColor = false
            --
            Inline.Name = "Inline"
            Inline.Position = UDim2.new(0,1,0,1)
            Inline.Size = UDim2.new(1,-2,1,-2)
            Inline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
            Inline.BorderSizePixel = 0
            Inline.BorderColor3 = Color3.new(0,0,0)
            --
            Value.Name = "Value"
            Value.Position = UDim2.new(0,2,0,0)
            Value.Size = UDim2.new(1,0,1,0)
            Value.BackgroundColor3 = Color3.new(1,1,1)
            Value.BackgroundTransparency = 1
            Value.BorderSizePixel = 0
            Value.BorderColor3 = Color3.new(0,0,0)
            Value.TextColor3 = Color3.fromRGB(145,145,145)
            if Font and Font.GetRegistry then
                Value.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Value.TextSize = Library.FontSize
            Value.TextXAlignment = Enum.TextXAlignment.Left
            Value.TextStrokeTransparency = 0
            Value.TextWrapped = true
            Value.Text = Textbox.State
            Value.ClearTextOnFocus = false
            --
            Title.Name = "Title"
            Title.Position = UDim2.new(0,15,0,0)
            Title.Size = UDim2.new(1,0,0,10)
            Title.BackgroundColor3 = Color3.new(1,1,1)
            Title.BackgroundTransparency = 1
            Title.BorderSizePixel = 0
            Title.BorderColor3 = Color3.new(0,0,0)
            Title.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
            if Font and Font.GetRegistry then
                Title.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Title.TextSize = Library.FontSize
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.TextStrokeTransparency = 0
            Title.Text = Textbox.Name
            
            -- // Connections
            Library:Connection(NewDrop.MouseEnter, function()
                Outline.BorderColor3 = Library.Accent
                table.insert(Library.ThemeObjects, Title)
                Title.TextColor3 = Library.Accent
            end)
            --
            Library:Connection(NewDrop.MouseLeave, function()
                Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
                table.remove(Library.ThemeObjects, table.find(Library.ThemeObjects, Title))
                Title.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
            end)
            Value.FocusLost:Connect(function()
                Textbox.Callback(Value.Text)
                Library.Flags[Textbox.Flag] = Value.Text
            end)
            --
            local function set(str)
                Value.Text = str
                Library.Flags[Textbox.Flag] = str
                Textbox.Callback(str)
            end

            -- // Return
            Flags[Textbox.Flag] = set
            return Textbox
        end
        --
        function Sections:Button(Properties)
            local Properties = Properties or {}
            local Button = {
                Window = self.Window,
                Page = self.Page,
                Section = self,
                Name = Properties.Name or "button",
                Callback = (
                    Properties.callback
                        or Properties.Callback
                        or Properties.callBack
                        or Properties.CallBack
                        or function() end
                ),
            }
            --
            local NewButton = Instance.new('TextButton', Button.Section.Elements.SectionContent)
            local Outline = Instance.new('Frame', NewButton)
            local Inline = Instance.new('Frame', Outline)
            local Value = Instance.new('TextLabel', Inline)
            --
            NewButton.Name = "NewButton"
            NewButton.Size = UDim2.new(1,0,0,14)
            NewButton.BackgroundColor3 = Color3.new(1,1,1)
            NewButton.BackgroundTransparency = 1
            NewButton.BorderSizePixel = 0
            NewButton.BorderColor3 = Color3.new(0,0,0)
            NewButton.Text = ""
            NewButton.TextColor3 = Color3.new(0,0,0)
            NewButton.AutoButtonColor = false
            if Font and Font.GetRegistry then
                NewButton.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            NewButton.TextSize = 14
            --
            Outline.Name = "Outline"
            Outline.Position = UDim2.new(0,15,1,0)
            Outline.Size = UDim2.new(1,-30,0,14)
            Outline.BackgroundColor3 = Color3.new(0.1765,0.1765,0.1765)
            Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
            Outline.AnchorPoint = NewVector2(0,1)
            --
            Inline.Name = "Inline"
            Inline.Position = UDim2.new(0,1,0,1)
            Inline.Size = UDim2.new(1,-2,1,-2)
            Inline.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
            Inline.BorderSizePixel = 0
            Inline.BorderColor3 = Color3.new(0,0,0)
            --
            Value.Name = "Value"
            Value.Size = UDim2.new(1,0,1,0)
            Value.BackgroundColor3 = Color3.new(1,1,1)
            Value.BackgroundTransparency = 1
            Value.BorderSizePixel = 0
            Value.BorderColor3 = Color3.new(0,0,0)
            Value.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
            if Font and Font.GetRegistry then
                Value.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            Value.TextSize = Library.FontSize
            Value.Text = Button.Name
            Value.TextStrokeTransparency = 0
            
            Library:Connection(NewButton.MouseEnter, function()
                Outline.BorderColor3 = Library.Accent
            end)
            --
            Library:Connection(NewButton.MouseLeave, function()
                Outline.BorderColor3 = Color3.new(0.0392,0.0392,0.0392)
            end)
            --
            Library:Connection(NewButton.MouseButton1Down, function()
                Button.Callback()
                Value.TextColor3 = Library.Accent
            end)
            --
            Library:Connection(NewButton.MouseButton1Up, function()
                Value.TextColor3 = Color3.new(0.5686,0.5686,0.5686)
            end)
        end
        --
        function Sections:Label(Properties) -- fuck niggers
            local Properties = Properties or {}
            local Label = {
                Window = self.Window,
                Page = self.Page,
                Section = self,
                Name = Properties.Name or "label",
                Centered = Properties.Centered or false,
            }
            local NewButton = Instance.new('TextLabel', Label.Section.Elements.SectionContent) -- ya im lazy
            --
            NewButton.Name = "NewButton"
            NewButton.Size = UDim2.new(1,0,0,12)
            NewButton.BackgroundColor3 = Color3.new(1,1,1)
            NewButton.BackgroundTransparency = 1
            NewButton.BorderSizePixel = 0
            NewButton.BorderColor3 = Color3.new(0,0,0)
            NewButton.Text = Label.Name
            NewButton.TextColor3 = Color3.fromRGB(255,255,255)
            if Font and Font.GetRegistry then
                NewButton.FontFace = Font.new(Font:GetRegistry("menu_plex"))
            end
            NewButton.TextSize = Library.FontSize
            NewButton.TextXAlignment = Label.Centered and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left
            NewButton.TextStrokeTransparency = 0
            NewButton.TextStrokeColor3 = Color3.new(0,0,0)
        end
    end
end

return Library
