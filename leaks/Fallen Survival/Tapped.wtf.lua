
do -- before loading
    if not game:IsLoaded() then
        repeat
            game.Loaded:Wait()
        until game:IsLoaded()
    end
    --
    if not LPH_OBFUSCATED then
        function LPH_NO_VIRTUALIZE(f)
            return f
        end
        function LPH_JIT(...)
            return ...
        end
        function LPH_JIT_MAX(...)
            return ...
        end
        function LPH_NO_UPVALUES(f)
            return function(...)
                return f(...)
            end
        end
        function LPH_ENCSTR(...)
            return ...
        end
        function LPH_ENCNUM(...)
            return ...
        end
        function LPH_CRASH()
            return print(debug.traceback())
        end
    end
    --
    local game_name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name:gsub("[^a-zA-Z0-9%s]", ""):lower()
    local executor = identifyexecutor and identifyexecutor() or "Unknown"
    if not game_name:find("fallen survival", 1, true) then
        game:GetService("Players")["LocalPlayer"]:Kick("Execute in Fallen only!")
        return
    end
    if executor == "Wave" or executor == "AWP" or executor == "Potassium" or executor == "Swift" or executor == "Zenith" or executor == "Hydrogen" then
        print("...")
    else
        game:GetService("Players")["LocalPlayer"]:Kick("Unsupported Executor " .. executor)
        return
    end
    --
    local Hud = Instance.new("ScreenGui")
    Hud.Parent = cloneref(gethui())
    Hud.Name = cloneref(game:GetService("HttpService")):GenerateGUID(false)
    Hud.IgnoreGuiInset = true
    --
    getgenv().gethui = newcclosure(function()
        return cloneref(Hud)
    end)
    -- Bypass
    loadstring(
            game:HttpGetAsync(
                    "https://raw.githubusercontent.com/not-mathias/lebron/refs/heads/main/veiny_dih.lua",
                    true
            )
    )()
end
task.wait(2) -- needed check to make sure its fully loaded

if getgenv().library then 
    getgenv().library:unload_menu() 
end 


-- LIBRARY IGNORE (Do not loadstring god forbid)
    -- Library Variables 
        local uis = game:GetService("UserInputService") 
        local players = game:GetService("Players") 
        local ws = game:GetService("Workspace")
        local rs = game:GetService("ReplicatedStorage")
        local http_service = game:GetService("HttpService")
        local gui_service = game:GetService("GuiService")
        local lighting = game:GetService("Lighting")
        local run = game:GetService("RunService")
        local stats = game:GetService("Stats")
        local coregui = game:GetService("CoreGui")
        local debris = game:GetService("Debris")
        local tween_service = game:GetService("TweenService")
        local sound_service = game:GetService("SoundService")
        local Players = game:GetService("Players")
        local UserInputService = game:GetService("UserInputService")
        local RunService = game:GetService("RunService")

        local vec2 = Vector2.new
        local vec3 = Vector3.new
        local dim2 = UDim2.new
        local dim = UDim.new 
        local rect = Rect.new
        local cfr = CFrame.new
        local empty_cfr = cfr()
        local point_object_space = empty_cfr.PointToObjectSpace
        local angle = CFrame.Angles
        local dim_offset = UDim2.fromOffset

        local color = Color3.new
        local rgb = Color3.fromRGB
        local hex = Color3.fromHex
        local hsv = Color3.fromHSV
        local rgbseq = ColorSequence.new
        local rgbkey = ColorSequenceKeypoint.new
        local numseq = NumberSequence.new
        local numkey = NumberSequenceKeypoint.new

        local camera = ws.CurrentCamera
        local lp = players.LocalPlayer 
        local mouse = lp:GetMouse() 
        local gui_offset = gui_service:GetGuiInset().Y

        local max = math.max 
        local floor = math.floor 
        local min = math.min 
        local abs = math.abs 
        local noise = math.noise
        local rad = math.rad 
        local random = math.random 
        local pow = math.pow 
        local sin = math.sin 
        local pi = math.pi 
        local tan = math.tan 
        local atan2 = math.atan2 
        local clamp = math.clamp 

        local insert = table.insert 
        local find = table.find 
        local remove = table.remove
        local concat = table.concat
    -- 

    -- Library init
        getgenv().library = {
            directory = "fecuriaawdwdtyyy",
            folders = {
                "/fonts",
                "/configs",
            },
            flags = {},
            config_flags = {},

            connections = {},   
            notifications = {notifs = {}, offset = 0},
            playerlist_data = {
                players = {},
                player = {}, 
            },
            colorpicker_open = false; 
            gui; 
        }

        if not isfolder("fecuriaawdwdtyyy") then
            makefolder("fecuriaawdwdtyyy")

            
        end

        local themes = {
            preset = {
                accent = rgb(250, 238, 30), -- old color: Color3.fromRGB(132, 135, 250)-- (30, 108, 253)
                text = rgb(255, 255, 255),
                text_outline = rgb(0, 0, 0),
            },
            
            utility = {
                accent = {
                    BackgroundColor3 = {}, 	
                    TextColor3 = {}, 
                    ImageColor3 = {}, 
                    ScrollBarImageColor3 = {} 
                },
                text = {
                    TextColor3 = {}	
                },
                text_outline = {
                    Color = {} 	
                }
            }
        }

        local keys = {
            [Enum.KeyCode.LeftShift] = "LS",
            [Enum.KeyCode.RightShift] = "RS",
            [Enum.KeyCode.LeftControl] = "LC",
            [Enum.KeyCode.RightControl] = "RC",
            [Enum.KeyCode.Insert] = "INS",
            [Enum.KeyCode.Backspace] = "BS",
            [Enum.KeyCode.Return] = "Ent",
            [Enum.KeyCode.LeftAlt] = "LA",
            [Enum.KeyCode.RightAlt] = "RA",
            [Enum.KeyCode.CapsLock] = "CAPS",
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
            [Enum.UserInputType.MouseButton3] = "MB3",
            [Enum.KeyCode.Escape] = "ESC",
            [Enum.KeyCode.Space] = "SPC",
        }
            
        library.__index = library

        for _, path in next, library.folders do 
            makefolder(library.directory .. path)
        end

        local flags = library.flags 
        local config_flags = library.config_flags

        local fonts = {}; do
            function Register_Font(Name, Weight, Style, Asset)
                if not isfile(Asset.Id) then
                    writefile(Asset.Id, Asset.Font)
                end

                if isfile(Name .. ".font") then
                    delfile(Name .. ".font")
                end
                
                local Data = {
                    name = Name,
                    faces = {
                        {
                            name = "Normal",
                            weight = Weight,
                            style = Style,
                            assetId = getcustomasset(Asset.Id),
                        },
                    },
                }

                writefile(Name .. ".font", http_service:JSONEncode(Data))

                return getcustomasset(Name .. ".font");
            end
            
            local Rubik = Register_Font("Rubik", 400, "Normal", {
                Id = "Rubik.ttf",
                Font = game:HttpGet("https://github.com/googlefonts/rubik/raw/refs/heads/main/fonts/variable/Rubik%5Bwght%5D.ttf"),
            })
            
            fonts = {
                main = Font.new(Rubik, Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                esp = Font.new(Rubik, Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            }
end

    --

library.flags["ResolveUndergroundAA"] = false 
library.flags["Enable Anti Fling"] = false
library.flags["Always Perfect Farm"] = false
library.flags["NoDamage"] = false
library.flags["Sprint While Attacking"] = false

    -- Library functions 
        -- Misc functions
            function library:tween(obj, properties) 
                local tween = tween_service:Create(obj, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), properties):Play()
                    
                return tween
            end 

            function library:next_flag()
                local idx = #self.flags + 1
                return string.format("flag_%s", idx);
            end

            function library:resizify(frame) 
                local Frame = Instance.new("TextButton")
                Frame.Position = dim2(1, -10, 1, -10)
                Frame.BorderColor3 = rgb(0, 0, 0)
                Frame.Size = dim2(0, 10, 0, 10)
                Frame.BorderSizePixel = 0
                Frame.BackgroundColor3 = rgb(255, 255, 255)
                Frame.Parent = frame
                Frame.BackgroundTransparency = 1 
                Frame.Text = ""

                local resizing = false 
                local start_size 
                local start 
                local og_size = frame.Size  

                Frame.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        resizing = true
                        start = input.Position
                        start_size = frame.Size
                    end
                end)

                Frame.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        resizing = false
                    end
                end)

                library:connection(uis.InputChanged, function(input, game_event) 
                    if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
                        local viewport_x = camera.ViewportSize.X
                        local viewport_y = camera.ViewportSize.Y

                        local current_size = dim2(
                            start_size.X.Scale,
                            math.clamp(
                                start_size.X.Offset + (input.Position.X - start.X),
                                og_size.X.Offset,
                                viewport_x
                            ),
                            start_size.Y.Scale,
                            math.clamp(
                                start_size.Y.Offset + (input.Position.Y - start.Y),
                                og_size.Y.Offset,
                                viewport_y
                            )
                        )
                        frame.Size = current_size
                    end
                end)
            end

            function library:mouse_in_frame(uiobject)
                local y_cond = uiobject.AbsolutePosition.Y <= mouse.Y and mouse.Y <= uiobject.AbsolutePosition.Y + uiobject.AbsoluteSize.Y
                local x_cond = uiobject.AbsolutePosition.X <= mouse.X and mouse.X <= uiobject.AbsolutePosition.X + uiobject.AbsoluteSize.X

                return (y_cond and x_cond)
            end

            function library:draggify(frame)
                local dragging = false 
                local start_size = frame.Position
                local start 

                frame.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        start = input.Position
                        start_size = frame.Position
                    end
                end)

                frame.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)

                library:connection(uis.InputChanged, function(input, game_event) 
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        local viewport_x = camera.ViewportSize.X
                        local viewport_y = camera.ViewportSize.Y

                        local current_position = dim2(
                            0,
                            clamp(
                                start_size.X.Offset + (input.Position.X - start.X),
                                0,
                                viewport_x - frame.Size.X.Offset
                            ),
                            0,
                            math.clamp(
                                start_size.Y.Offset + (input.Position.Y - start.Y),
                                0,
                                viewport_y - frame.Size.Y.Offset
                            )
                        )

                        frame.Position = current_position
                    end
                end)
            end 

            function library:convert(str)
                local values = {}

                for value in string.gmatch(str, "[^,]+") do
                    insert(values, tonumber(value))
                end
                
                if #values == 4 then              
                    return unpack(values)
                else 
                    return
                end
            end
            
            function library:convert_enum(enum)
                local enum_parts = {}
            
                for part in string.gmatch(enum, "[%w_]+") do
                    insert(enum_parts, part)
                end
            
                local enum_table = Enum
                for i = 2, #enum_parts do
                    local enum_item = enum_table[enum_parts[i]]
            
                    enum_table = enum_item
                end
            
                return enum_table
            end

            local config_holder;
            local cfg_name;
            function library:update_config_list() 
                if not config_holder then 
                    return 
                end
            
                local list = {}
            
                for idx, file in next, listfiles(library.directory .. "/configs") do
                    local name = file:gsub(library.directory .. "/configs\\", ""):gsub(".cfg", ""):gsub(library.directory .. "\\configs\\", "")
                    list[#list + 1] = name
                end
                
                config_holder.refresh_options(list)
            end 

            function library:get_config()
                local Config = {}
                
                for _, v in next, flags do
                    if type(v) == "table" and v.key then
                        Config[_] = {active = v.active, mode = v.mode, key = tostring(v.key)}
                    elseif type(v) == "table" and v["Transparency"] and v["Color"] then
                        Config[_] = {Transparency = v["Transparency"], Color = v["Color"]:ToHex()}
                    else
                        Config[_] = v
                    end
                end 
                
                return http_service:JSONEncode(Config)
            end

            function library:load_config(config_json) 
                local config = http_service:JSONDecode(config_json)
                
                for _, v in next, config do 
                    local function_set = library.config_flags[_]
                    
                    if _ == "config_name_list" then 
                        continue 
                    end

                    if function_set then 
                        if type(v) == "table" and v["Transparency"] and v["Color"] then
                            function_set(hex(v["Color"]), v["Transparency"])
                        elseif type(v) == "table" and v["active"] then 
                            function_set(v)
                        else
                            function_set(v)
                        end
                    end 
                end 
            end 
            
            function library:round(number, float)
                local multiplier = 1 / (float or 1)

                return floor(number * multiplier + 0.5) / multiplier
            end 

            function library:apply_theme(instance, theme, property) 
                insert(themes.utility[theme][property], instance)
            end

            function library:update_theme(theme, color)
                for _, property in themes.utility[theme] do 

                    for m, object in property do 
                        if object[_] == themes.preset[theme] then 
                            object[_] = color 
                        end 
                    end
                end 

                themes.preset[theme] = color 
            end 

            function library:connection(signal, callback)
                local connection = signal:Connect(callback)
                
                insert(library.connections, connection)

                return connection 
            end

            function library:apply_stroke(parent) 
                local STROKE = library:create("UIStroke", {
                    Parent = parent,
                    Color = themes.preset.text_outline, 
                    LineJoinMode = Enum.LineJoinMode.Miter
                }) 

                library:apply_theme(STROKE, "text_outline", "Color")
            end

            function library:create(instance, options)
                local ins = Instance.new(instance) 
                
                for prop, value in options do 
                    ins[prop] = value
                end
                
                if instance == "TextLabel" or instance == "TextButton" or instance == "TextBox" then 	
                    library:apply_theme(ins, "text", "TextColor3")
                end
                
                return ins 
            end

            function library:unload_menu() 
                if library[ "items" ] then 
                    library[ "items" ]:Destroy()
                end

                if library[ "other" ] then 
                    library[ "other" ]:Destroy()
                end 
                
                for index, connection in library.connections do 
                    connection:Disconnect() 
                    connection = nil 
                end
                
                library = nil 
            end 

            function library:change_fontsize(int)
                for _, property in themes.utility.text do 
                    for m, object in property do 
                        object.TextSize = int -- triangle code
                    end
                end 
            end 
        --
            
        -- Library element functions
            function library:window(properties)
                local cfg = {  
                    name = properties.name or properties.Name or '<font color = "#FFFFFF">chud</font>vision<font color = "#FFFFFF">.net</font>';
                    size = properties.size or properties.Size or dim2(0, 752, 0, 502);
                    selected_tab;
                    items = {};
                }
                
                library[ "items" ] = library:create( "ScreenGui" , {
                    Parent = coregui;
                    Name = "\0";
                    Enabled = true;
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
                    IgnoreGuiInset = true;
                });
                
                library[ "other" ] = library:create( "ScreenGui" , {
                    Parent = coregui;
                    Name = "\0";
                    Enabled = true;
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
                    IgnoreGuiInset = true;
                }); 

                local items = cfg.items; do
        items["main"] = library:create("Frame", {
            Parent = library["items"];
            Name = "\0";
            Position = dim2(0.5, -cfg.size.X.Offset / 2, 0.5, -cfg.size.Y.Offset / 2);
            BorderColor3 = rgb(0, 0, 0);
            Size = cfg.size;
            BorderSizePixel = 0;
            BackgroundColor3 = rgb(7, 7, 9)
        }); items["main"].Position = dim2(0, items["main"].AbsolutePosition.X, 0, items["main"].AbsolutePosition.Y)
        
        library:create("UIStroke", {
            Parent = items["main"];
            Color = rgb(250, 238, 30);
            Thickness = 2;
            Transparency = 0.20;
            LineJoinMode = Enum.LineJoinMode.Round
        });
        

        items["tab_element_holder"] = library:create("Frame", {
            Name = "\0";
            Parent = items["main"];
            BorderColor3 = rgb(0, 0, 0);
            Size = dim2(0, 82, 1, 0);
            BorderSizePixel = 0;
            BackgroundColor3 = rgb(18, 18, 20)
        });
        
        items["tab_buttons"] = library:create("Frame", {
            Parent = items["tab_element_holder"];
            Name = "\0";
            Position = dim2(0, 1, 0, 1);
            BorderColor3 = rgb(0, 0, 0);
            Size = dim2(1, -2, 1, -2);
            BorderSizePixel = 0;
            BackgroundColor3 = rgb(7, 7, 9)
        });
        
        items["tab_holder"] = library:create("Frame", {
            Parent = items["tab_buttons"];
            Name = "\0";
            BackgroundTransparency = 1;
            ClipsDescendants = true;
            BorderColor3 = rgb(0, 0, 0);
            Size = dim2(1, 0, 1, 0);
            Position = dim2(0, 0, 0, 0);
            BorderSizePixel = 0;
            BackgroundColor3 = rgb(255, 255, 255)
        });
        

        items["top_icon"] = library:create("ImageLabel", {
            Parent = items["tab_holder"];
            Name = "\0";
            BackgroundTransparency = 1;
            Image = "rbxassetid://100935829985170"; 
            ImageColor3 = rgb(255, 255, 255);
            Size = dim2(0, 70, 0, 60);
            Position = dim2(0.5, 10, 0.5, 10); 
            AnchorPoint = vec2(0.5, 0); 
            BorderColor3 = rgb(0, 0, 0);
            BorderSizePixel = 0;
            }); library:apply_theme(items["top_icon"], "accent", "ImageColor3")

        library:create("UIListLayout", {
            Parent = items["tab_holder"];
            Padding = dim(0, 15);
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        
        library:create("UIPadding", {
            Parent = items["tab_holder"];
            PaddingTop = dim(0, 10)
        });         
    end  
                
                do -- Other
                    library:draggify(items[ "main" ])
                    library:resizify(items[ "main" ])
                end 

                -- Keybind list
                    cfg.keybind_list = library:create("Frame", {
                        BorderColor3 = rgb(0, 0, 0);
                        Parent = library[ "other" ];
                        BackgroundTransparency = 1;
                        Position = dim2(0, 100, 0, 600);
                        Size = dim2(0, 250, 0, 66);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(255, 255, 255)
                    }); library:resizify(cfg.keybind_list); library:draggify(cfg.keybind_list);
                    
                    library:create("UIStroke", {
                        Parent = cfg.keybind_list;
                        LineJoinMode = Enum.LineJoinMode.Miter;
                        Transparency = 1;
                    });	
                    
                    local inline1 = library:create("Frame", {
                        BorderColor3 = rgb(0, 0, 0);
                        Parent = cfg.keybind_list;
                        BackgroundTransparency = 1;
                        Position = dim2(0, 1, 0, 1);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        AutomaticSize = Enum.AutomaticSize.XY;
                        BackgroundColor3 = rgb(56, 56, 56)
                    });	
                    
                    library:create("UIStroke", {
                        Color = rgb(56, 56, 56);
                        LineJoinMode = Enum.LineJoinMode.Miter;
                        Parent = inline1;
                        Transparency = 1
                    });
                    
                    local inline2 = library:create("Frame", {
                        BorderColor3 = rgb(0, 0, 0);
                        Parent = inline1;
                        BackgroundTransparency = 1;
                        Position = dim2(0, 1, 0, 1);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        AutomaticSize = Enum.AutomaticSize.XY;
                        BackgroundColor3 = rgb(46, 46, 46)
                    });
                    
                    library:create("UIStroke", {
                        Color = rgb(46, 46, 46);
                        LineJoinMode = Enum.LineJoinMode.Miter;
                        Parent = inline2;
                        Transparency = 1
                    });
                    
                    local inline3 = library:create("Frame", {
                        BorderColor3 = rgb(0, 0, 0);
                        Parent = inline2;
                        BackgroundTransparency = 1;
                        Position = dim2(0, 1, 0, 1);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        AutomaticSize = Enum.AutomaticSize.XY;
                        BackgroundColor3 = rgb(46, 46, 46)
                    });
                    
                    library:create("UIStroke", {
                        Color = rgb(46, 46, 46);
                        LineJoinMode = Enum.LineJoinMode.Miter;
                        Parent = inline3;
                        Transparency = 1
                    });	
                    
                    local inline4 = library:create("Frame", {
                        BorderColor3 = rgb(0, 0, 0);
                        Parent = inline3;
                        BackgroundTransparency = 1;
                        Position = dim2(0, 1, 0, 1);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        AutomaticSize = Enum.AutomaticSize.XY;
                        BackgroundColor3 = rgb(46, 46, 46)
                    });	
                    
                    library:create("UIStroke", {
                        Color = rgb(56, 56, 56);
                        LineJoinMode = Enum.LineJoinMode.Miter;
                        Parent = inline4;
                        Transparency = 1
                    });	
                    
                    local inline5 = library:create("Frame", {
                        Parent = inline4;
                        BackgroundTransparency = 1;
                        Size = dim2(1, 0, 1, 0);
                        BorderColor3 = rgb(0, 0, 0);
                        BorderSizePixel = 0;
                        AutomaticSize = Enum.AutomaticSize.XY;
                        BackgroundColor3 = rgb(0, 0, 0)
                    });	
                    
                    local tab_holder = library:create("Frame", {
                        Parent = inline5;
                        BackgroundTransparency = 1;
                        Position = dim2(0, 17, 0, 0);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, 0, 0, 28);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    library:create("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal;
                        HorizontalFlex = Enum.UIFlexAlignment.Fill;
                        Parent = tab_holder;
                        Padding = dim(0, 4);
                        SortOrder = Enum.SortOrder.LayoutOrder;
                        VerticalFlex = Enum.UIFlexAlignment.Fill
                    });
                    
                    local button = library:create("TextButton", {
                        FontFace = fonts.main;
                        TextColor3 = rgb(255, 255, 255);
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "keybinds";
                        Parent = tab_holder;
                        TextStrokeTransparency = 0;
                        BackgroundTransparency = 1;
                        Size = dim2(0, 200, 0, 50);
                        BorderSizePixel = 0;
                        TextSize = 9;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    local accent = library:create("Frame", {
                        AnchorPoint = vec2(0, 1);
                        Parent = button;
                        Position = dim2(0, 0, 1, 0);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, 0, 0, 4);
                        BorderSizePixel = 0;
                        BackgroundColor3 = themes.preset.accent
                    }); library:apply_theme(accent, "accent", "BackgroundColor3")
                    
                    local split = library:create("Frame", {
                        AnchorPoint = vec2(0, 1);
                        Parent = accent;
                        Position = dim2(0, 0, 1, 0);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, 0, 0, 2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = themes.preset.accent
                    }); library:apply_theme(split, "accent", "BackgroundColor3")
                    
                    library:create("UIGradient", {
                        Color = rgbseq{rgbkey(0, rgb(167, 167, 167)), rgbkey(1, rgb(167, 167, 167))};
                        Parent = split
                    });
                    
                    local inline6 = library:create("Frame", {
                        Parent = inline5;
                        BackgroundTransparency = 1;
                        Size = dim2(1, -34, 0, 0);
                        Position = dim2(0, 17, 0, 31);
                        BorderColor3 = rgb(0, 0, 0);
                        BorderSizePixel = 0;
                        AutomaticSize = Enum.AutomaticSize.XY;
                        BackgroundColor3 = rgb(0, 0, 0)
                    });	
                    
                    local inline7 = library:create("Frame", {
                        Parent = inline6;
                        Size = dim2(1, -2, 1, -2);
                        Position = dim2(0, 1, 0, 1);
                        BackgroundTransparency = 1;
                        BorderColor3 = rgb(0, 0, 0);
                        BorderSizePixel = 0;
                        AutomaticSize = Enum.AutomaticSize.XY;
                        BackgroundColor3 = rgb(46, 46, 46)
                    });
                    
                    local inline8 = library:create("Frame", {
                        Parent = inline7;
                        Size = dim2(1, -2, 1, -2);
                        Position = dim2(0, 1, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        BorderSizePixel = 0;
                        AutomaticSize = Enum.AutomaticSize.XY;
                        BackgroundTransparency = 1;
                        BackgroundColor3 = rgb(21, 21, 21)
                    }); library.keybind_list = inline8
                    
                    library:create("UIListLayout", {
                        Parent = inline8;
                        Padding = dim(0, 10);
                        SortOrder = Enum.SortOrder.LayoutOrder
                    });
                    
                    library:create("UIPadding", {
                        PaddingTop = dim(0, 8);
                        PaddingBottom = dim(0, 8);
                        Parent = inline8;
                        PaddingRight = dim(0, 2);
                        PaddingLeft = dim(0, 8)
                    });
                    
                    library:create("UIPadding", {
                        PaddingBottom = dim(0, 2);
                        PaddingRight = dim(0, 2);
                        Parent = inline7
                    });
                    
                    library:create("UIPadding", {
                        PaddingBottom = dim(0, 2);
                        PaddingRight = dim(0, 2);
                        Parent = inline6
                    });
                    
                    library:create("UIPadding", {
                        PaddingBottom = dim(0, 10);
                        PaddingRight = dim(0, 34);
                        Parent = inline5
                    });
                    
                    library:create("UIPadding", {
                        Parent = inline4
                    });
                    
                    library:create("UIPadding", {
                        PaddingBottom = dim(0, 2);
                        PaddingRight = dim(0, 2);
                        Parent = inline3
                    });
                    
                    library:create("UIPadding", {
                        PaddingBottom = dim(0, 2);
                        PaddingRight = dim(0, 2);
                        Parent = inline2
                    });
                    
                    library:create("UIPadding", {
                        PaddingBottom = dim(0, 2);
                        PaddingRight = dim(0, 2);
                        Parent = inline1
                    });
                    
                    library:create("UIPadding", {
                        PaddingBottom = dim(0, 2);
                        PaddingRight = dim(0, 2);
                        Parent = cfg.keybind_list
                    });                 
                -- 

                -- Information list
                    cfg.info_list = library:create("Frame", {
                        BorderColor3 = rgb(0, 0, 0);
                        Parent = library[ "other" ];
                        BackgroundTransparency = 1;
                        Position = dim2(0, 100, 0, 700);
                        Size = dim2(0, 202, 0, 66);
                        BorderSizePixel = 0;
                        AutomaticSize = Enum.AutomaticSize.XY;
                        BackgroundColor3 = rgb(255, 255, 255)
                    }); library:resizify(cfg.info_list); library:draggify(cfg.info_list);
                    
                    library:create("UIStroke", {
                        Parent = cfg.info_list;
                        LineJoinMode = Enum.LineJoinMode.Miter;
                        Transparency = 1;
                    });	
                    
                    local info_inline1 = library:create("Frame", {
                        BorderColor3 = rgb(0, 0, 0);
                        Parent = cfg.info_list;
                        BackgroundTransparency = 1;
                        Position = dim2(0, 1, 0, 1);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        AutomaticSize = Enum.AutomaticSize.XY;
                        BackgroundColor3 = rgb(56, 56, 56)
                    });	
                    
                    library:create("UIStroke", {
                        Color = rgb(56, 56, 56);
                        LineJoinMode = Enum.LineJoinMode.Miter;
                        Parent = info_inline1;
                        Transparency = 1
                    });

                    -- Add header
                    local tab_holder = library:create("Frame", {
                        Parent = info_inline1;
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, 0, 0, 28);
                        BorderSizePixel = 0;
                        BackgroundTransparency = 1;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    library:create("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal;
                        HorizontalFlex = Enum.UIFlexAlignment.Fill;
                        Parent = tab_holder;
                        Padding = dim(0, 4);
                        SortOrder = Enum.SortOrder.LayoutOrder;
                        VerticalFlex = Enum.UIFlexAlignment.Fill
                    });
                    
                    local button = library:create("TextButton", {
                        FontFace = fonts.main;
                        TextColor3 = rgb(255, 255, 255);
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "information";
                        Parent = tab_holder;
                        TextStrokeTransparency = 0;
                        BackgroundTransparency = 1;
                        Size = dim2(0, 200, 0, 50);
                        BorderSizePixel = 0;
                        TextSize = 9;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    local accent = library:create("Frame", {
                        AnchorPoint = vec2(0, 1);
                        Parent = button;
                        Position = dim2(0, 0, 1, 0);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, 0, 0, 4);
                        BorderSizePixel = 0;
                        BackgroundColor3 = themes.preset.accent
                    }); library:apply_theme(accent, "accent", "BackgroundColor3");

                    local content_container = library:create("Frame", {
                        Parent = info_inline1;
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, 0, 0, 0);
                        Position = dim2(0, 0, 0, 28);
                        BorderSizePixel = 0;
                        AutomaticSize = Enum.AutomaticSize.XY;
                        BackgroundTransparency = 1;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });

                    library:create("UIListLayout", {
                        Parent = content_container;
                        Padding = dim(0, 10);
                        SortOrder = Enum.SortOrder.LayoutOrder
                    });

                    library:create("UIPadding", {
                        PaddingTop = dim(0, 8);
                        PaddingBottom = dim(0, 8);
                        Parent = content_container;
                        PaddingRight = dim(0, 2);
                        PaddingLeft = dim(0, 8)
                    });

                    library.info_list = content_container;

                    local timed_crate_info = library:create("TextLabel", {
                        FontFace = fonts.main;
                        TextColor3 = rgb(255, 255, 255);
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "Timed Crate - 00:00";
                        Parent = content_container;
                        AutomaticSize = Enum.AutomaticSize.XY;
                        Position = dim2(0, 18, 0, -3);
                        BackgroundTransparency = 1;
                        TextXAlignment = Enum.TextXAlignment.Left;
                        BorderSizePixel = 0;
                        ZIndex = 2;
                        TextStrokeTransparency = 0;
                        TextSize = 9;
                        BackgroundColor3 = rgb(255, 255, 255);
                        Visible = false;
                        RichText = true
                    });

                    task.spawn(function()
                        while task.wait(0.3) do
                            local enabled = flags["Enable Timed Crate ESP"]
                            local timerLabel = workspace.Bases.Loners:FindFirstChild("Timed Crate") 
                                and workspace.Bases.Loners["Timed Crate"]:FindFirstChild("Timed Crate")
                                and workspace.Bases.Loners["Timed Crate"]["Timed Crate"]:FindFirstChild("Timer")
                                and workspace.Bases.Loners["Timed Crate"]["Timed Crate"].Timer:FindFirstChild("GuiHolder")
                                and workspace.Bases.Loners["Timed Crate"]["Timed Crate"].Timer.GuiHolder:FindFirstChild("Label")
                                and workspace.Bases.Loners["Timed Crate"]["Timed Crate"].Timer.GuiHolder.Label:FindFirstChild("TextLabel")

                            timed_crate_info.Visible = enabled and timerLabel ~= nil
                            if enabled and timerLabel then
                                local time = timerLabel.Text
                                local minutes, seconds = time:match("(%d+):(%d+)")
                                local totalSeconds = (tonumber(minutes) or 0) * 60 + (tonumber(seconds) or 0)
                                local color = totalSeconds == 0 and "00ff00" or "ff0000"
                                timed_crate_info.Text = string.format("Timed Crate - <font color='#%s'>%s</font>", color, time)
                            end
                        end
                    end)

                    local btr_status_info = library:create("TextLabel", {
                        FontFace = fonts.main;
                        TextColor3 = rgb(255, 255, 255);
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "BTR Status - Not Spawned";
                        Parent = content_container;
                        AutomaticSize = Enum.AutomaticSize.XY;
                        Position = dim2(0, 18, 0, -3);
                        BackgroundTransparency = 1;
                        TextXAlignment = Enum.TextXAlignment.Left;
                        BorderSizePixel = 0;
                        ZIndex = 2;
                        TextStrokeTransparency = 0;
                        TextSize = 9;
                        BackgroundColor3 = rgb(255, 255, 255);
                        Visible = false;
                        RichText = true
                    });

                    task.spawn(function()
                        while task.wait(0.3) do
                            local enabled = flags["Enable BTR ESP"]
                            local BTR = workspace:FindFirstChild("Events") 
                                and workspace.Events:FindFirstChild("BTR") 
                                and workspace.Events.BTR:FindFirstChild("Detail") 
                                and workspace.Events.BTR.Detail:FindFirstChild("Main")

                            local destroyedBTR = workspace:FindFirstChild("Events")
                                and workspace.Events:FindFirstChild("BTR")
                                and workspace.Events.BTR:FindFirstChild("destroyedBTR")
                                and workspace.Events.BTR.destroyedBTR:FindFirstChild("SmokePart")

                            btr_status_info.Visible = enabled
                            if enabled then
                                local status = BTR and "Spawned" or destroyedBTR and "Destroyed" or "Not Spawned"
                                local color = BTR and "00ff00" or destroyedBTR and "ffff00" or "ff0000"
                                btr_status_info.Text = string.format("BTR Status - <font color='#%s'>%s</font>", color, status)
                            end
                        end
                    end)

                    local carepackage_status_info = library:create("TextLabel", {
                        FontFace = fonts.main;
                        TextColor3 = rgb(255, 255, 255);
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "Carepackage's: 0";
                        Parent = content_container;
                        AutomaticSize = Enum.AutomaticSize.XY;
                        Position = dim2(0, 18, 0, -3);
                        BackgroundTransparency = 1;
                        TextXAlignment = Enum.TextXAlignment.Left;
                        BorderSizePixel = 0;
                        ZIndex = 2;
                        TextStrokeTransparency = 0;
                        TextSize = 9;
                        BackgroundColor3 = rgb(255, 255, 255);
                        Visible = false;
                        RichText = true
                    });
                    
                    task.spawn(function()
                        while task.wait(0.3) do
                            local enabled = flags["Enable Care Package ESP"]
                            local carepackages = workspace:FindFirstChild("Bases") 
                                and workspace.Bases:FindFirstChild("Loners") 
                                and workspace.Bases.Loners:FindFirstChild("Care Package")
                            
                            carepackage_status_info.Visible = enabled
                            if enabled and carepackages then
                                local count = #carepackages:GetChildren()
                                local color = count > 0 and "00ff00" or "ff0000"
                                carepackage_status_info.Text = string.format("Carepackage's: <font color='#%s'>%d</font>", color, count)
                            end
                        end
                    end)

                -- Playerlist
                    items[ "outline" ] = library:create( "Frame" , {
                        Parent = library[ "other" ];
                        Name = "\0";
                        Visible = false;
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(0.1417543888092041, 0, 0.3601022958755493, 0);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(18, 18, 20)
                    }); cfg.mod_list = items[ "outline" ]
                    
                    library:draggify(items[ "outline" ])
                    library:resizify(items[ "outline" ])
                    items[ "outline" ].Position = dim2(0, items[ "main" ].AbsoluteSize.X + items[ "main" ].AbsolutePosition.X + 5, 0, items[ "main" ].AbsolutePosition.Y + 58);

                    items[ "inline" ] = library:create( "Frame" , {
                        Parent = items[ "outline" ];
                        Name = "\0";
                        Position = dim2(0, 1, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(7, 7, 9)
                    });
                    
                    items[ "title" ] = library:create( "TextLabel" , {
                        FontFace = fonts.main;
                        TextColor3 = rgb(68, 68, 70);
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "MODERATOR LIST";
                        TextStrokeTransparency = 0;
                        Parent = items[ "inline" ];
                        Name = "\0";
                        Size = dim2(1, 0, 0, 11);
                        BackgroundTransparency = 1;
                        TextXAlignment = Enum.TextXAlignment.Left;
                        Position = dim2(0, 15, 0, 15);
                        BorderSizePixel = 0;
                        TextSize = 9;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    items[ "scrolling" ] = library:create( "ScrollingFrame" , {
                        ScrollBarImageColor3 = rgb(250, 238, 30);
                        Active = true;
                        AutomaticCanvasSize = Enum.AutomaticSize.Y;
                        ScrollBarThickness = 2;
                        Parent = items[ "inline" ];
                        Name = "\0";
                        Size = dim2(1, 0, 1, -23);
                        BackgroundColor3 = rgb(255, 255, 255);
                        BackgroundTransparency = 1;
                        Position = dim2(0, 0, 0, 23);
                        ScrollingEnabled = false;
                        BorderColor3 = rgb(0, 0, 0);
                        BorderSizePixel = 0;
                        CanvasSize = dim2(0, 0, 0, 0)
                    });
                    
                    library:create( "UIPadding" , {
                        Parent = items[ "scrolling" ];
                        PaddingTop = dim(0, 18);
                        PaddingRight = dim(0, 15);
                        PaddingLeft = dim(0, 15)
                    });
                    
                    items[ "object" ] = library:create( "TextLabel" , {
                        FontFace = fonts.main;
                        TextColor3 = rgb(0, 0, 0);
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "";
                        Parent = items[ "scrolling" ];
                        BackgroundTransparency = 1;
                        Name = "\0";
                        Size = dim2(1, -31, 1, -10);
                        BorderSizePixel = 0;
                        TextSize = 9;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    items[ "playerlist_holder" ] = library:create( "Frame" , {
                        Parent = items[ "object" ];
                        BackgroundTransparency = 1;
                        Name = "\0";
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, 0, 1, -23);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    items[ "ScrollingFrame" ] = library:create( "ScrollingFrame" , {
                        ScrollBarImageColor3 = rgb(250, 238, 30);
                        Active = true;
                        AutomaticCanvasSize = Enum.AutomaticSize.Y;
                        ScrollBarThickness = 2;
                        Parent = items[ "playerlist_holder" ];
                        Size = dim2(1, 0, 1, -20);
                        BackgroundTransparency = 1;
                        Position = dim2(0, 0, 0, 10);
                        BackgroundColor3 = rgb(255, 255, 255);
                        BorderColor3 = rgb(0, 0, 0);
                        BorderSizePixel = 0;
                        CanvasSize = dim2(0, 0, 0, 0)
                    });
                    
                    library:create( "UIPadding" , {
                        PaddingTop = dim(0, 10);
                        PaddingBottom = dim(0, 10);
                        Parent = items[ "ScrollingFrame" ];
                        PaddingRight = dim(0, 10);
                        PaddingLeft = dim(0, 10)
                    });
                    
                    library:create( "UIListLayout" , {
                        Parent = items[ "ScrollingFrame" ];
                        Padding = dim(0, 10);
                        SortOrder = Enum.SortOrder.LayoutOrder
                    });
                    
                    library:create( "UIStroke" , {
                        Color = rgb(18, 18, 20);
                        Parent = items[ "playerlist_holder" ]
                    });
                    
function cfg.add_mod(name)
    cfg.mod_list_text.Text = name -- Устанавливаем имя модератора
end

function cfg.remove_mod()
    cfg.mod_list_text.Text = "No Moderator Found" -- Возвращаем текст по умолчанию
end
                -- 
                    
                return setmetatable(cfg, library)
            end 

            function library:Page(properties)
                local cfg = {
                    name = properties.name or properties.Name or "visuals"; 
                    items = {};
                    icon = properties.icon or properties.Icon or "rbxassetid://98725940881913"
                } 

                local items = cfg.items; do 
                    -- Tab buttons 
                        items[ "button" ] = library:create( "TextButton" , {
                            Parent = self.items[ "tab_holder" ];
                            Name = "\0";
                            BackgroundTransparency = 1;
                            Position = dim2(0, -1, 0, 0);
                            Text = "";
                            BorderColor3 = rgb(0, 0, 0);
                            Size = dim2(1, 0, 0, 66);
                            BorderSizePixel = 0;
                            BackgroundColor3 = rgb(27, 27, 27)
                        });

                        items[ "logo" ] = library:create( "ImageLabel" , {
                            ImageColor3 = rgb(69, 69, 71);
                            BorderColor3 = rgb(0, 0, 0);
                            Parent = items[ "button" ];
                            AnchorPoint = vec2(0.5, 0.5);
                            Image = cfg.icon;
                            BackgroundTransparency = 1;
                            Position = dim2(0.5, 0, 0.5, -10);
                            Name = "\0";
                            Size = dim2(0, 32, 0, 32);
                            BorderSizePixel = 0;
                            BackgroundColor3 = rgb(255, 255, 255)
                        });	library:apply_theme(items[ "logo" ], "accent", "ImageColor3")

                        items[ "text" ] = library:create( "TextLabel" , {
                            FontFace = fonts.main;
                            TextColor3 = rgb(69, 69, 71);
                            BorderColor3 = rgb(0, 0, 0);
                            Text = cfg.name;
                            TextStrokeTransparency = 0;
                            Parent = items[ "button" ];
                            Name = "\0";
                            BackgroundTransparency = 1;
                            Position = dim2(0, 0, 0, 19);
                            Size = dim2(1, 0, 1, 0);
                            BorderSizePixel = 0;
                            TextSize = 9;
                            BackgroundColor3 = rgb(255, 255, 255)
                        }); library:apply_theme(items[ "text" ], "accent", "TextColor3")
                    -- 
                    
                    -- Tab Directory 
                        items[ "tab" ] = library:create( "Frame" , {
                            Parent = self.items[ "main" ];
                            Name = "\0";
                            Visible = false;
                            BackgroundTransparency = 1;
                            Position = dim2(0, 80, 0, 0);
                            BorderColor3 = rgb(0, 0, 0);
                            Size = dim2(1, -80, 1, 0);
                            BorderSizePixel = 0;
                            BackgroundColor3 = rgb(255, 255, 255)
                        });

                        library:create( "UIPadding" , {
                            PaddingTop = dim(0, 14);
                            PaddingBottom = dim(0, 14);
                            Parent = items[ "tab" ];
                            PaddingRight = dim(0, 14);
                            PaddingLeft = dim(0, 14)
                        });
                        
                        library:create( "UIListLayout" , {
                            FillDirection = Enum.FillDirection.Horizontal;
                            HorizontalFlex = Enum.UIFlexAlignment.Fill;
                            Parent = items[ "tab" ];
                            Padding = dim(0, 14);
                            SortOrder = Enum.SortOrder.LayoutOrder;
                            VerticalFlex = Enum.UIFlexAlignment.Fill
                        });

                        for _, side in {"left", "middle", "right"} do 
                            items[ side .. "_column" ] = library:create( "Frame" , {
                                Parent = items[ "tab" ];
                                BackgroundTransparency = 1;
                                Name = "\0";
                                BorderColor3 = rgb(0, 0, 0);
                                Size = dim2(1, 0, 1, 0);
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(18, 18, 20)
                            });                        
                        end
                    -- 
                end 

                function cfg.open_tab() 
                    local selected_tab = self.selected_tab
                    
                    if selected_tab then 
                        selected_tab[ 1 ].ImageColor3 = rgb(69, 69, 71)
                        selected_tab[ 2 ].TextColor3 = rgb(69, 69, 71)
                        selected_tab[ 3 ].Visible = false
                    end

                    items[ "logo" ].ImageColor3 = themes.preset.accent
                    items[ "text" ].TextColor3 = themes.preset.accent
                    items[ "tab" ].Visible = true

                    self.selected_tab = {
                        items[ "logo" ];
                        items[ "text" ];
                        items[ "tab" ];
                    }
                end

                items[ "button" ].MouseButton1Down:Connect(function()
                    cfg.open_tab()
                end)

                if not self.selected_tab then 
                    cfg.open_tab(true) 
                end

                return setmetatable(cfg, library)    
            end

            function library:Section(properties)
                local cfg = {
                    name = properties.name or properties.Name or "section"; 
                    side = properties.side or properties.Side or "left";
                    items = {};
                };

                local items = cfg.items; do -- Instances
                    items[ "outline" ] = library:create( "Frame" , {
                        Name = "\0";
                        Parent = self.items[ string.lower(cfg.side) .. "_column" ];
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, 0, 1, 0);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(18, 18, 20)
                    });
                    
                    items[ "inline" ] = library:create( "Frame" , {
                        Parent = items[ "outline" ];
                        Name = "\0";
                        Position = dim2(0, 1, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(7, 7, 9)
                    });
                    
                    items[ "title" ] = library:create( "TextLabel" , {
                        FontFace = fonts.main;
                        TextColor3 = rgb(68, 68, 70);
                        BorderColor3 = rgb(0, 0, 0);
                        Text = cfg.name;
                        Parent = items[ "inline" ];
                        TextStrokeTransparency = 0;
                        Name = "\0";
                        Size = dim2(1, 0, 0, 11);
                        BackgroundTransparency = 1;
                        TextXAlignment = Enum.TextXAlignment.Left;
                        Position = dim2(0, 15, 0, 15);
                        BorderSizePixel = 0;
                        TextSize = 9;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    items[ "scrolling_frame" ] = library:create( "ScrollingFrame" , {
                        ScrollBarImageColor3 = rgb(30, 108, 253);
                        Active = true;
                        AutomaticCanvasSize = Enum.AutomaticSize.Y;
                        ScrollBarThickness = 4;
                        Parent = items[ "inline" ];
                        Name = "\0";
                        Size = dim2(1, 0, 1, -23);
                        BackgroundTransparency = 1;
                        Position = dim2(0, 0, 0, 23);
                        BackgroundColor3 = rgb(255, 255, 255);
                        BorderColor3 = rgb(0, 0, 0);
                        BorderSizePixel = 0;
                        CanvasSize = dim2(0, 0, 0, 0)
                    });
                    
                    items[ "elements" ] = library:create( "Frame" , {
                        Name = "\0";
                        Parent = items[ "scrolling_frame" ];
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -31, 0, 0);
                        Position = dim2(0, 0, 0, 15);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    library:create( "UIListLayout" , {
                        Parent = items[ "elements" ];
                        Padding = dim(0, 15);
                        SortOrder = Enum.SortOrder.LayoutOrder
                    });

                    library:create( "UIPadding" , {
                        Parent = items[ "elements" ];
                        PaddingBottom = dim(0, 15);
                    });
                    
                    library:create( "UIPadding" , {
                        Parent = items[ "scrolling_frame" ];
                        PaddingTop = dim(0, 18);
                        PaddingRight = dim(0, 15);
                        PaddingLeft = dim(0, 15)
                    });
                    
                    


                end;

                return setmetatable(cfg, library)
            end

            -- Elements  
                function library:Toggle(options) 
                    local cfg = {
                        enabled = options.enabled or options.Enabled or nil,
                        name = options.name or options.Name or "Toggle",
                        info = options.info or options.Info or options.Name or options.name or "",
                        flag = options.flag or options.Flag or options.name or options.Name,
                        default = options.default or options.Default or false,
                        folding = options.folding or options.Folding or false, 
                        callback = options.callback or options.Callback or function() end,

                        items = {};
                    }

                    flags[cfg.flag] = cfg.default

                    local items = cfg.items; do 
                        items[ "object" ] = library:create( "TextButton" , {
                            FontFace = fonts.main;
                            TextColor3 = rgb(0, 0, 0);
                            BorderColor3 = rgb(0, 0, 0);
                            Text = "";
                            Parent = self.items[ "elements" ];
                            BackgroundTransparency = 1;
                            Name = "\0";
                            Size = dim2(1, 0, 0, 22);
                            BorderSizePixel = 0;
                            TextSize = 9;
                            BackgroundColor3 = rgb(255, 255, 255)
                        });
                        
                        items[ "title" ] = library:create( "TextLabel" , {
                            FontFace = fonts.main;
                            TextColor3 = rgb(255, 255, 255);
                            BorderColor3 = rgb(0, 0, 0);
                            Text = cfg.name;
                            TextStrokeTransparency = 0;
                            Parent = items[ "object" ];
                            Name = "\0";
                            BackgroundTransparency = 1;
                            TextXAlignment = Enum.TextXAlignment.Left;
                            Size = dim2(1, 0, 0, 11);
                            BorderSizePixel = 0;
                            TextSize = 9;
                            BackgroundColor3 = rgb(255, 255, 255)
                        });
                        
                        items[ "info" ] = library:create( "TextLabel" , {
                            TextWrapped = true;
                            Parent = items[ "object" ];
                            TextColor3 = rgb(68, 68, 70);
                            BorderColor3 = rgb(0, 0, 0);
                            Text = cfg.info;
                            Name = "\0";
                            TextStrokeTransparency = 0;
                            Size = dim2(1, 0, 0, 11);
                            Position = dim2(0, 0, 0, 13);
                            BackgroundTransparency = 1;
                            TextXAlignment = Enum.TextXAlignment.Left;
                            BorderSizePixel = 0;
                            FontFace = fonts.main;
                            TextSize = 9;
                            BackgroundColor3 = rgb(255, 255, 255)
                        });
                        
                        items[ "toggle_holder" ] = library:create( "Frame" , {
                            AnchorPoint = vec2(1, 0);
                            Parent = items[ "object" ];
                            Name = "\0";
                            Position = dim2(1, 0, 0, 5);
                            BorderColor3 = rgb(0, 0, 0);
                            Size = dim2(0, 34, 0, 20);
                            BorderSizePixel = 0;
                            BackgroundColor3 = rgb(18, 18, 20)
                        });
                        
                        library:create( "UICorner" , {
                            Parent = items[ "toggle_holder" ];
                            CornerRadius = dim(0, 99)
                        });
                        
                        items[ "circle" ] = library:create( "Frame" , {
                            Parent = items[ "toggle_holder" ];
                            Name = "\0";
                            Position = dim2(0, 2, 0, 2);
                            BorderColor3 = rgb(0, 0, 0);
                            Size = dim2(0, 16, 0, 16);
                            BorderSizePixel = 0;
                            BackgroundColor3 = rgb(68, 68, 70)
                        }); library:apply_theme(items[ "circle" ], "accent", "BackgroundColor3")
                        
                        library:create( "UICorner" , {
                            Parent = items[ "circle" ];
                            CornerRadius = dim(0, 99)
                        });
                    end;
                    
                    function cfg.set(bool)
                        items[ "circle" ].BackgroundColor3 = bool and themes.preset.accent or rgb(68, 68, 70)
                        items[ "circle" ].Position = bool and dim_offset(15, 2) or dim_offset(2, 2)

                        cfg.callback(bool)

                        flags[cfg.flag] = bool
                    end 
                    
                    items[ "object" ].MouseButton1Click:Connect(function()
                        cfg.enabled = not cfg.enabled 

                        cfg.set(cfg.enabled)
                    end)
                    
                    cfg.set(cfg.default)
                    config_flags[cfg.flag] = cfg.set

                    return setmetatable(cfg, library)
                end 
                
                function library:Slider(options) 
                    local cfg = {
                        name = options.name or options.Name or nil,
                        suffix = options.suffix or options.Suffix or "";
                        flag = options.flag or options.Flag or library:next_flag(),
                        callback = options.callback or options.Callback or function() end, 
                        
                        -- value settings
                        min = options.min or options.minimum or options.Minimum or 0,
                        max = options.max or options.maximum or options.Maximum or 100,
                        intervals = options.interval or options.decimal or options.Decimals or 1,
                        default = options.default or options.Default or 10,
                        value = options.default or options.Default or 10, 

                        dragging = false,
                        items = {}
                    } 

                    flags[cfg.flag] = cfg.default

                    local items = cfg.items; do 
                        items[ "object" ] = library:create( "TextLabel" , {
                            FontFace = fonts.main;
                            TextColor3 = rgb(0, 0, 0);
                            BorderColor3 = rgb(0, 0, 0);
                            Text = "";
                            Parent = self.items[ "elements" ];
                            Name = "\0";
                            BackgroundTransparency = 1;
                            Size = dim2(1, 0, 0, 28);
                            BorderSizePixel = 0;
                            AutomaticSize = Enum.AutomaticSize.Y;
                            TextSize = 9;
                            BackgroundColor3 = rgb(255, 255, 255)
                        });
                        
                        items[ "title" ] = library:create( "TextLabel" , {
                            FontFace = fonts.main;
                            TextColor3 = rgb(255, 255, 255);
                            BorderColor3 = rgb(0, 0, 0);
                            Text = cfg.name;
                            TextStrokeTransparency = 0;
                            Parent = items[ "object" ];
                            Name = "\0";
                            BackgroundTransparency = 1;
                            TextXAlignment = Enum.TextXAlignment.Left;
                            Size = dim2(1, 0, 0, 11);
                            BorderSizePixel = 0;
                            TextSize = 9;
                            BackgroundColor3 = rgb(255, 255, 255)
                        });
                        
                        items[ "slider" ] = library:create( "TextButton" , {
                            Parent = items[ "object" ];
                            Text = "";
                            AutoButtonColor = false;
                            Name = "\0";
                            Position = dim2(0, 0, 0, 22);
                            BorderColor3 = rgb(0, 0, 0);
                            Size = dim2(1, 0, 0, 6);
                            BorderSizePixel = 0;
                            BackgroundColor3 = rgb(33, 33, 33)
                        });
                        
                        items[ "fill" ] = library:create( "Frame" , {
                            Name = "\0";
                            Parent = items[ "slider" ];
                            BorderColor3 = rgb(0, 0, 0);
                            Size = dim2(0.5, 0, 1, 0);
                            BorderSizePixel = 0;
                            BackgroundColor3 = themes.preset.accent
                        }); library:apply_theme(items[ "fill" ], "accent", "BackgroundColor3")
                        
                        items[ "circle" ] = library:create( "Frame" , {
                            AnchorPoint = vec2(0.5, 0.5);
                            Parent = items[ "fill" ];
                            Name = "\0";
                            Position = dim2(1, 0, 0.5, 0);
                            BorderColor3 = rgb(0, 0, 0);
                            Size = dim2(0, 12, 0, 12);
                            BorderSizePixel = 0;
                            BackgroundColor3 = themes.preset.accent
                        }); library:apply_theme(items[ "circle" ], "accent", "BackgroundColor3")
                        
                        library:create( "UICorner" , {
                            Parent = items[ "circle" ];
                            CornerRadius = dim(0, 99)
                        });
                        
                        items[ "value" ] = library:create( "TextLabel" , {
                            FontFace = fonts.main;
                            TextColor3 = rgb(255, 255, 255);
                            BorderColor3 = rgb(0, 0, 0);
                            Text = "300 metres";
                            TextStrokeTransparency = 0;
                            Parent = items[ "object" ];
                            Name = "\0";
                            BackgroundTransparency = 1;
                            TextXAlignment = Enum.TextXAlignment.Right;
                            Size = dim2(1, 0, 0, 11);
                            BorderSizePixel = 0;
                            TextSize = 9;
                            BackgroundColor3 = rgb(255, 255, 255)
                        });                    
                    end 

                    function cfg.set(value)
                        cfg.value = clamp(library:round(value, cfg.intervals), cfg.min, cfg.max)

                        items[ "fill" ].Size = dim2((cfg.value - cfg.min) / (cfg.max - cfg.min), 0, 1, 0)
                        items[ "value" ].Text = tostring(cfg.value) .. (options.ending or options.Ending or "")

                        flags[cfg.flag] = cfg.value
                        cfg.callback(flags[cfg.flag])
                    end

                    items[ "slider" ].MouseButton1Down:Connect(function()
                        cfg.dragging = true 
                    end)

                    library:connection(uis.InputChanged, function(input)
                        if cfg.dragging and input.UserInputType == Enum.UserInputType.MouseMovement then 
                            local size_x = (input.Position.X - items[ "slider" ].AbsolutePosition.X) / items[ "slider" ].AbsoluteSize.X
                            local value = ((cfg.max - cfg.min) * size_x) + cfg.min

                            cfg.set(value)
                        end
                    end)

                    library:connection(uis.InputEnded, function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            cfg.dragging = false 
                        end 
                    end)

                    cfg.set(cfg.default)
                    config_flags[cfg.flag] = cfg.set

                    return setmetatable(cfg, library)
                end 

                function library:List(options) 
                    local cfg = {
                        name = options.name or options.Name or "Dropdown";
                        info = options.info or options.Info or "";
                        flag = options.flag or options.Flag or options.name or options.Name;
                        
                        options = options.items or options.Items or options.Options or {""};
                        callback = options.callback or options.Callback or function() end;
                        multi = options.multi or options.Multi or false;
                        scrolling = options.scrolling or false;
                        size = options.size or 85;

                        -- Ignore these 
                        open = false;
                        option_instances = {};
                        multi_items = {};
                        ignore = options.ignore or false;
                        items = {};
                    }   
                    
                    cfg.default = options.Default or (cfg.multi and {cfg.items[1]}) or cfg.items[1] or "None"
                    flags[cfg.flag] = cfg.default

                    local items = cfg.items; do 
                        -- Element
                            items[ "object" ] = library:create( "TextLabel" , {
                                FontFace = fonts.main;
                                TextColor3 = rgb(0, 0, 0);
                                BorderColor3 = rgb(0, 0, 0);
                                Text = "";
                                Parent = self.items[ "elements" ];
                                BackgroundTransparency = 1;
                                Name = "\0";
                                Size = dim2(1, 0, 0, 25);
                                BorderSizePixel = 0;
                                TextSize = 9;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });

                            items[ "title" ] = library:create( "TextLabel" , {
                                FontFace = fonts.main;
                                TextColor3 = rgb(237, 237, 237);
                                BorderColor3 = rgb(0, 0, 0);
                                Text = cfg.name;
                                Parent = items[ "object" ];
                                Name = "\0";
                                BackgroundTransparency = 1;
                                TextXAlignment = Enum.TextXAlignment.Left;
                                Size = dim2(1, 0, 0, 11);
                                BorderSizePixel = 0;
                                TextSize = 9;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });
                            
                            items[ "info" ] = library:create( "TextLabel" , {
                                FontFace = fonts.main;
                                TextColor3 = rgb(68, 68, 70);
                                BorderColor3 = rgb(0, 0, 0);
                                Text = cfg.info;
                                Parent = items[ "object" ];
                                Name = "\0";
                                Size = dim2(1, 0, 0, 11);
                                Position = dim2(0, 0, 0, 13);
                                BackgroundTransparency = 1;
                                TextXAlignment = Enum.TextXAlignment.Left;
                                BorderSizePixel = 0;
                                TextWrapped = true;
                                TextSize = 9;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });
                            
                            items[ "dropdown_holder" ] = library:create( "TextButton" , {
                                AnchorPoint = vec2(1, 0.5);
                                Parent = items[ "object" ];
                                Name = "\0";
                                Text = "";
                                AutoButtonColor = false;
                                Position = dim2(1, 0, 0.5, 0);
                                BorderColor3 = rgb(0, 0, 0);
                                Size = dim2(0, cfg.size, 0, 18);
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(18, 18, 20)
                            });

                            local grad = library:create( "Frame" , {
                                AnchorPoint = vec2(1, 0);
                                Parent = items[ "dropdown_holder" ];
                                Position = dim2(1, 0, 0, 1);
                                BorderColor3 = rgb(0, 0, 0);
                                Size = dim2(0, 30, 1, -2);
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(7, 7, 9)
                            });
                            
                            library:create( "UIGradient" , {
                                Rotation = -8;
                                Transparency = numseq{numkey(0, 1), numkey(0.691, 0), numkey(1, 0)};
                                Parent = grad
                            });
                            
                            library:create( "UICorner" , {
                                Parent = grad;
                                CornerRadius = dim(0, 3)
                            });                            

                            library:create("UIPadding", {
                                Parent = items[ "dropdown_holder" ];
                                PaddingRight = dim(0, 2);
                            })

                            items[ "text_holder" ] = library:create( "TextButton" , {
                                Parent = items[ "dropdown_holder" ];
                                Name = "\0";
                                AutomaticSize = Enum.AutomaticSize.X;
                                Text = "";
                                AutoButtonColor = false;
                                BorderColor3 = rgb(0, 0, 0);
                                Position = dim2(0, 1, 0, 1);
                                Size = dim2(1, -2, 1, -2);
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(7, 7, 9);
                            });
                            
                            library:create( "UICorner" , {
                                Parent = items[ "dropdown_holder" ];
                                CornerRadius = dim(0, 3)
                            });

                            library:create( "UICorner" , {
                                Parent = items[ "text_holder" ];
                                CornerRadius = dim(0, 3)
                            });
                            
                            items[ "inner_text" ] = library:create( "TextLabel" , {
                                TextWrapped = true;
                                TextColor3 = rgb(255, 255, 255);
                                BorderColor3 = rgb(0, 0, 0);
                                Text = "RMB";
                                AutomaticSize = Enum.AutomaticSize.X;
                                Parent = items[ "text_holder" ];
                                TextStrokeTransparency = 0;
                                Size = dim2(0, 0, 1, 0);
                                Position = dim2(0, 4, 0, 0);
                                BackgroundTransparency = 1;
                                TextXAlignment = Enum.TextXAlignment.Left;
                                BorderSizePixel = 0;
                                FontFace = fonts.main;
                                TextSize = 9;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });

                            library:create("UIPadding", {
                                PaddingRight = dim(0, 20);
                                Parent = items.inner_text;
                            })
                            
                            items[ "arrow" ] = library:create( "ImageLabel" , {
                                BorderColor3 = rgb(0, 0, 0);
                                Parent = items[ "text_holder" ];
                                AnchorPoint = vec2(1, 0.5);
                                Image = "rbxassetid://116451868004607";
                                BackgroundTransparency = 1;
                                Position = dim2(1, -10, 0.5, 0);
                                Name = "\0";
                                Size = dim2(0, 7, 0, 5);
                                ZIndex = 2;
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });        
                        -- 
                        
                        -- Holder
                            items[ "holder" ] = library:create( "Frame" , {
                                Parent = library[ "items" ];
                                Size = dim2(0, cfg.size, 0, 0);
                                Position = dim2(0, 0, 0, 0);
                                Visible = false;
                                ClipsDescendants = true;
                                BorderColor3 = rgb(0, 0, 0);
                                BorderSizePixel = 0;
                                AutomaticSize = Enum.AutomaticSize.Y;
                                BackgroundColor3 = rgb(7, 7, 9)
                            });

                            library:create( "UICorner" , {
                                Parent = items[ "holder" ];
                                CornerRadius = dim(0, 3)
                            });

                            library:create( "UIStroke" , {
                                Color = rgb(18, 18, 20);
                                Parent = items[ "holder" ]
                            });

                            library:create( "UIListLayout" , {
                                Parent = items[ "holder" ];
                                Padding = dim(0, 10);
                                SortOrder = Enum.SortOrder.LayoutOrder;
                                HorizontalFlex = Enum.UIFlexAlignment.Fill
                            });

                            library:create( "UIPadding" , {
                                PaddingTop = dim(0, 10);
                                PaddingBottom = dim(0, 10);
                                Parent = items[ "holder" ];
                                PaddingRight = dim(0, 10);
                                PaddingLeft = dim(0, 10)
                            });
                        -- 
                    end 

                    function cfg.render_option(text)
                        local option = library:create( "TextButton" , {
                            TextColor3 = rgb(255, 255, 255);
                            BorderColor3 = rgb(0, 0, 0);
                            Text = text;
                            Parent = items[ "holder" ];
                            TextStrokeTransparency = 0;
                            Position = dim2(0, 4, 0, 0);
                            BorderSizePixel = 0;
                            BackgroundTransparency = 1;
                            TextXAlignment = Enum.TextXAlignment.Left;
                            FontFace = fonts.main;
                            AutomaticSize = Enum.AutomaticSize.XY;
                            TextSize = 9;
                            BackgroundColor3 = rgb(255, 255, 255)
                        }); library:apply_theme(option, "accent", "TextColor3");

                        return option
                    end

                    function cfg.set_visible(bool) 
                        items[ "holder" ].Visible = bool
                        items[ "holder" ].Position = dim2(0, items[ "dropdown_holder" ].AbsolutePosition.X, 0, items[ "dropdown_holder" ].AbsolutePosition.Y + 80)
                        items[ "dropdown_holder" ].Size = dim2(0, items[ "holder" ].AbsoluteSize.X, 0, 15)
                        items[ "arrow" ].Rotation = bool and 180 or 0
                    end
                    
                    function cfg.set(value)
                        local selected = {}
                        local isTable = type(value) == "table"

                        for _, option in next, cfg.option_instances do 
                            if option.Text == value or (isTable and find(value, option.Text)) then 
                                insert(selected, option.Text)
                                cfg.multi_items = selected
                                option.TextColor3 = themes.preset.accent
                            else
                                option.TextColor3 = themes.preset.text
                            end
                        end

                        items[ "inner_text" ].Text = isTable and concat(selected, ", ") or selected[1] or ""
                        flags[cfg.flag] = isTable and selected or selected[1]
                            
                        items[ "holder" ].Position = dim2(0, items[ "dropdown_holder" ].AbsolutePosition.X, 0, items[ "dropdown_holder" ].AbsolutePosition.Y + 80)
                        items[ "dropdown_holder" ].Size = dim2(0, items[ "holder" ].AbsoluteSize.X, 0, 15)

                        cfg.callback(flags[cfg.flag]) 				
                    end
                    
                    function cfg.refresh_options(list) 
                        for _, option in cfg.option_instances do 
                            option:Destroy() 
                        end
                        
                        cfg.option_instances = {} 

                        for _, option in list do 
                            local button = cfg.render_option(option)

                            insert(cfg.option_instances, button)
                            
                            button.MouseButton1Down:Connect(function()
                                if cfg.multi then 
                                    local selected_index = find(cfg.multi_items, button.Text)
        
                                    if selected_index then 
                                        remove(cfg.multi_items, selected_index)
                                    else
                                        insert(cfg.multi_items, button.Text)
                                    end
                                    
                                    cfg.set(cfg.multi_items) 				
                                else 
                                    cfg.set_visible(false)
                                    cfg.open = false 
                                    
                                    cfg.set(button.Text)
                                end
                            end)
                        end
                    end

                    items[ "text_holder" ].MouseButton1Click:Connect(function()
                        cfg.open = not cfg.open 
                        
                        cfg.set_visible(cfg.open)
                    end)

                    library:connection(uis.InputBegan, function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if not (library:mouse_in_frame(items[ "text_holder" ]) or library:mouse_in_frame(items[ "holder" ])) then 
                                cfg.open = false
                                cfg.set_visible(false)
                            end
                        end
                    end)

                    flags[cfg.flag] = {} 
                    config_flags[cfg.flag] = cfg.set
                    
                    cfg.refresh_options(cfg.options)
                    cfg.set(cfg.default)
                        
                    return setmetatable(cfg, library)
                end
                
                function library:Colorpicker(options) 
                    local cfg = {
                        name = options.name or options.Name or "Colorpicker", 
                        info = options.info or options.Info or "Info";
                        flag = options.flag or options.Flag or options.name or options.Name,

                        color = options.color or options.Default or color(1, 1, 1), -- Default to white color if not provided
                        alpha = options.alpha and 1 - options.alpha or 0,
                        
                        open = false,   
                        callback = options.callback or function() end,
                        items = {};
                    }

                    local dragging_sat = false 
                    local dragging_hue = false 
                    local dragging_alpha = false 

                    local r, g, b = cfg.color.R, cfg.color.G, cfg.color.B
r = math.clamp(r, 0, 1)
g = math.clamp(g, 0, 1)
b = math.clamp(b, 0, 1)

cfg.color = Color3.new(r, g, b)

                    local h, s, v = cfg.color:ToHSV() 
                    local a = cfg.alpha 

                    flags[cfg.flag] = {Color = cfg.color, Transparency = cfg.alpha}

                    local items = cfg.items; do 
                        -- Component
                            items[ "object" ] = library:create( "TextLabel" , {
                                FontFace = fonts.main;
                                TextColor3 = rgb(0, 0, 0);
                                BorderColor3 = rgb(0, 0, 0);
                                Text = "";
                                Parent = self.items[ "elements" ];
                                Name = "\0";
                                BackgroundTransparency = 1;
                                Size = dim2(1, 0, 0, 22);
                                BorderSizePixel = 0;
                                AutomaticSize = Enum.AutomaticSize.Y;
                                TextSize = 9;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });
                            
                            items[ "title" ] = library:create( "TextLabel" , {
                                FontFace = fonts.main;
                                TextColor3 = rgb(255, 255, 255);
                                BorderColor3 = rgb(0, 0, 0);
                                Text = cfg.name;
                                TextStrokeTransparency = 0;
                                Parent = items[ "object" ];
                                Name = "\0";
                                BackgroundTransparency = 1;
                                TextXAlignment = Enum.TextXAlignment.Left;
                                Size = dim2(1, 0, 0, 11);
                                BorderSizePixel = 0;
                                TextSize = 9;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });
                            
                            items[ "info" ] = library:create( "TextLabel" , {
                                TextWrapped = true;
                                Parent = items[ "object" ];
                                TextColor3 = rgb(68, 68, 70);
                                BorderColor3 = rgb(0, 0, 0);
                                Text = cfg.info;
                                Name = "\0";
                                TextStrokeTransparency = 0;
                                Size = dim2(1, 0, 0, 11);
                                Position = dim2(0, 0, 0, 13);
                                BackgroundTransparency = 1;
                                TextXAlignment = Enum.TextXAlignment.Left;
                                BorderSizePixel = 0;
                                FontFace = fonts.main;
                                TextSize = 9;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });
                            
                            items[ "colorpicker" ] = library:create( "TextButton" , {
                                AnchorPoint = vec2(1, 0);
                                Parent = items[ "object" ];
                                Text = "";
                                AutoButtonColor = false;
                                Name = "\0";
                                Position = dim2(1, 0, 0, 5);
                                BorderColor3 = rgb(0, 0, 0);
                                Size = dim2(0, 16, 0, 16);
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(30, 108, 253)
                            });
                            
                            library:create( "UICorner" , {
                                Parent = items[ "colorpicker" ];
                                CornerRadius = dim(0, 3)
                            });    
                        --

                        -- Colorpicker
                            items[ "colorpicker_holder" ] = library:create( "Frame" , {
                                Parent = library[ "items" ];
                                Size = dim2(0, 180, 0, 180);
                                Name = "\0";
                                Visible = false;
                                BorderColor3 = rgb(0, 0, 0);
                                ZIndex = 100;
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(0, 0, 0)
                            });
                            
                            library:create( "UICorner" , {
                                Parent = items[ "colorpicker_holder" ];
                                CornerRadius = dim(0, 4)
                            });
                            
                            items[ "colorpicker_inline" ] = library:create( "Frame" , {
                                Parent = items[ "colorpicker_holder" ];
                                Size = dim2(1, -2, 1, -2);
                                Name = "\0";
                                ClipsDescendants = true;
                                BorderColor3 = rgb(0, 0, 0);
                                Position = dim2(0, 1, 0, 1);
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(32, 32, 32)
                            });
                            
                            library:create( "UICorner" , {
                                Parent = items[ "colorpicker_inline" ];
                                CornerRadius = dim(0, 4)
                            });
                            
                            items[ "colorpicker_background" ] = library:create( "Frame" , {
                                Parent = items[ "colorpicker_inline" ];
                                Size = dim2(1, -2, 1, -2);
                                Name = "\0";
                                ClipsDescendants = true;
                                BorderColor3 = rgb(0, 0, 0);
                                Position = dim2(0, 1, 0, 1);
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(8, 8, 8)
                            });
                            
                            library:create( "UICorner" , {
                                Parent = items[ "colorpicker_background" ];
                                CornerRadius = dim(0, 4)
                            });
                            
                            library:create( "UIPadding" , {
                                PaddingTop = dim(0, 5);
                                PaddingBottom = dim(0, 5);
                                Parent = items[ "colorpicker_background" ];
                                PaddingRight = dim(0, 5);
                                PaddingLeft = dim(0, 5)
                            });
                            
                            items[ "saturation_outline" ] = library:create( "Frame" , {
                                Name = "\0";
                                Parent = items[ "colorpicker_background" ];
                                BorderColor3 = rgb(0, 0, 0);
                                Size = dim2(1, -12, 1, -12);
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(0, 0, 0)
                            });
                            
                            items[ "color_saturation" ] = library:create( "TextButton" , {
                                Parent = items[ "saturation_outline" ];
                                AutoButtonColor = false;
                                Text = "";
                                Name = "\0";
                                Position = dim2(0, 1, 0, 1);
                                BorderColor3 = rgb(0, 0, 0);
                                Size = dim2(1, -2, 1, -2);
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(255, 39, 39)
                            });
                            
                            items[ "sat" ] = library:create( "Frame" , {
                                Parent = items[ "color_saturation" ];
                                Name = "\0";
                                Size = dim2(1, 0, 1, 0);
                                BorderColor3 = rgb(0, 0, 0);
                                ZIndex = 2;
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });
                            
                            library:create( "UIGradient" , {
                                Rotation = 270;
                                Transparency = numseq{numkey(0, 0), numkey(1, 1)};
                                Parent = items[ "sat" ];
                                Color = rgbseq{rgbkey(0, rgb(0, 0, 0)), rgbkey(1, rgb(0, 0, 0))}
                            });
                            
                            items[ "satval_picker" ] = library:create( "Frame" , {
                                Parent = items[ "color_saturation" ];
                                Size = dim2(0, 3, 0, 3);
                                Name = "\0";
                                Position = dim2(0, 1, 0.5, 1);
                                BorderColor3 = rgb(0, 0, 0);
                                ZIndex = 4;
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(0, 0, 0)
                            });
                            
                            library:create( "Frame" , {
                                Parent = items[ "satval_picker" ];
                                Size = dim2(1, -2, 1, -2);
                                Name = "\0";
                                Position = dim2(0, 1, 0, 1);
                                BorderColor3 = rgb(0, 0, 0);
                                ZIndex = 2;
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });
                            
                            items[ "val" ] = library:create( "Frame" , {
                                Name = "\0";
                                Parent = items[ "color_saturation" ];
                                BorderColor3 = rgb(0, 0, 0);
                                Size = dim2(1, 0, 1, 0);
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });
                            
                            library:create( "UIGradient" , {
                                Parent = items[ "val" ];
                                Transparency = numseq{numkey(0, 0), numkey(1, 1)}
                            });
                            
                            items[ "hue_slider" ] = library:create( "TextButton" , {
                                Parent = items[ "colorpicker_background" ];
                                Text = "";
                                AutoButtonColor = false;
                                Name = "\0";
                                Position = dim2(1, -10, 0, 0);
                                BorderColor3 = rgb(0, 0, 0);
                                Size = dim2(0, 10, 1, -12);
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(0, 0, 0)
                            });
                            
                            items[ "hue_components" ] = library:create( "Frame" , {
                                Parent = items[ "hue_slider" ];
                                Name = "\0";
                                Position = dim2(0, 1, 0, 1);
                                BorderColor3 = rgb(0, 0, 0);
                                Size = dim2(1, -2, 1, -2);
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });
                            
                            library:create( "UIGradient" , {
                                Rotation = 270;
                                Parent = items[ "hue_components" ];
                                Color = rgbseq{rgbkey(0, rgb(255, 0, 0)), rgbkey(0.17, rgb(255, 255, 0)), rgbkey(0.33, rgb(0, 255, 0)), rgbkey(0.5, rgb(0, 255, 255)), rgbkey(0.67, rgb(0, 0, 255)), rgbkey(0.83, rgb(255, 0, 255)), rgbkey(1, rgb(255, 0, 0))}
                            });
                            
                            items[ "hue_picker" ] = library:create( "Frame" , {
                                Parent = items[ "hue_components" ];
                                Size = dim2(1, 2, 0, 3);
                                Name = "\0";
                                Position = dim2(0, -1, 0, -1);
                                BorderColor3 = rgb(0, 0, 0);
                                ZIndex = 4;
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(0, 0, 0)
                            });
                            
                            library:create( "Frame" , {
                                Parent = items[ "hue_picker" ];
                                Size = dim2(1, -2, 1, -2);
                                Name = "\0";
                                Position = dim2(0, 1, 0, 1);
                                BorderColor3 = rgb(0, 0, 0);
                                ZIndex = 2;
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });
                            
                            items[ "alpha_slider" ] = library:create( "TextButton" , {
                                Parent = items[ "colorpicker_background" ];
                                Text = "";
                                AutoButtonColor = false;
                                Name = "\0";
                                Position = dim2(0, 0, 1, -10);
                                BorderColor3 = rgb(0, 0, 0);
                                Size = dim2(1, -12, 0, 10);
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(0, 0, 0)
                            });
                            
                            items[ "alpha_components" ] = library:create( "Frame" , {
                                Parent = items[ "alpha_slider" ];
                                Name = "\0";
                                Position = dim2(0, 1, 0, 1);
                                BorderColor3 = rgb(0, 0, 0);
                                Size = dim2(1, -2, 1, -2);
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });
                            
                            library:create( "UIGradient" , {
                                Color = rgbseq{rgbkey(0, rgb(0, 0, 0)), rgbkey(1, rgb(255, 255, 255))};
                                Parent = items[ "alpha_components" ]
                            });
                            
                            items[ "alpha_picker" ] = library:create( "Frame" , {
                                Parent = items[ "alpha_components" ];
                                Size = dim2(0, 3, 1, 2);
                                Name = "\0";
                                Position = dim2(0, -1, 0, -1);
                                BorderColor3 = rgb(0, 0, 0);
                                ZIndex = 4;
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(0, 0, 0)
                            });
                            
                            library:create( "Frame" , {
                                Parent = items[ "alpha_picker" ];
                                Size = dim2(1, -2, 1, -2);
                                Name = "\0";
                                Position = dim2(0, 1, 0, 1);
                                BorderColor3 = rgb(0, 0, 0);
                                ZIndex = 2;
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });
                        
                        
                        --                  
                    end;  

                    function cfg.set_visible(bool)
                        items[ "colorpicker_holder" ].Visible = bool
                        items[ "colorpicker_holder" ].Position = dim_offset(items[ "colorpicker" ].AbsolutePosition.X, items[ "colorpicker" ].AbsolutePosition.Y + items[ "colorpicker" ].AbsoluteSize.Y + 65)
                    end

                    function cfg.set(color, alpha)
                        if color then 
                            if color then
    h, s, v = color:ToHSV()
    
	h = math.clamp(h, 0, 1)
    s = math.clamp(s, 0, 1)
    v = math.clamp(v, 0, 1)
end

                        end
                        
                        if alpha then 
                            a = alpha
                        end 
                        
                        local Color = Color3.fromHSV(h, s, v)
                        
                        items[ "hue_picker" ].Position = dim2(0, -1, 1 - h, -1)
                        items[ "alpha_picker" ].Position = dim2(1 - a, -1, 0, -1)
                        items[ "satval_picker" ].Position = dim2(s, -1, 1 - v, -1)

                        items[ "colorpicker" ].BackgroundColor3 = Color
                        items[ "color_saturation" ].BackgroundColor3 = Color3.fromHSV(h, 1, 1)
                        
                        flags[cfg.flag] = {
                            Color = Color;
                            Transparency = a 
                        }
                        
                        cfg.callback(Color, a)
                    end
                    
                    function cfg.update_color() 
                        local mouse = uis:GetMouseLocation() 
                        local offset = vec2(mouse.X, mouse.Y - gui_offset) 

                        if dragging_sat then	
                            s = math.clamp((offset - items["color_saturation"].AbsolutePosition).X / items["color_saturation"].AbsoluteSize.X, 0, 1)
                            v = 1 - math.clamp((offset - items["color_saturation"].AbsolutePosition).Y / items["color_saturation"].AbsoluteSize.Y, 0, 1)
                        elseif dragging_hue then
                            h = 1 - math.clamp((offset - items[ "hue_slider" ].AbsolutePosition).Y / items[ "hue_slider" ].AbsoluteSize.Y, 0, 1)
                        elseif dragging_alpha then
                            a = 1 - math.clamp((offset - items[ "alpha_slider" ].AbsolutePosition).X / items[ "alpha_slider" ].AbsoluteSize.X, 0, 1)
                        end

                        cfg.set(nil, nil)
                    end

                    items[ "colorpicker" ].MouseButton1Click:Connect(function()
                        cfg.open = not cfg.open 

                        cfg.set_visible(cfg.open)            
                    end)

                    uis.InputChanged:Connect(function(input)
                        if (dragging_sat or dragging_hue or dragging_alpha) and input.UserInputType == Enum.UserInputType.MouseMovement then
                            cfg.update_color() 
                        end
                    end)

                    library:connection(uis.InputEnded, function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging_sat = false
                            dragging_hue = false
                            dragging_alpha = false

                            if not (library:mouse_in_frame(items[ "colorpicker" ]) or library:mouse_in_frame(items[ "colorpicker_holder" ])) then 
                                cfg.open = false
                                cfg.set_visible(false)
                            end
                        end
                    end)

                    library:connection(uis.InputBegan, function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if not (library:mouse_in_frame(items[ "colorpicker" ]) or library:mouse_in_frame(items[ "colorpicker_holder" ])) then 
                                cfg.open = false
                                cfg.set_visible(false)
                            end
                        end
                    end)

                    items[ "alpha_slider" ].MouseButton1Down:Connect(function()
                        dragging_alpha = true 
                    end)
                    
                    items[ "hue_slider" ].MouseButton1Down:Connect(function()
                        dragging_hue = true 
                    end)
                    
                    items[ "color_saturation" ].MouseButton1Down:Connect(function()
                        dragging_sat = true  
                    end)

                    cfg.set(cfg.color, cfg.alpha)
                    config_flags[cfg.flag] = cfg.set

                    return setmetatable(cfg, library)
                end 

                function library:textbox(options) 
                    local cfg = {
                        name = options.name or "TextBox",
                        placeholder = options.placeholder or options.placeholdertext or options.holder or options.holdertext or "type here...",
                        default = options.default or "",
                        flag = options.flag or library:next_flag(),
                        callback = options.callback or function() end,
                        visible = options.visible or true,
                        items = {};
                    }

                    flags[cfg.flag] = cfg.default

                    local items = cfg.items; do 
                        items[ "object" ] = library:create( "TextLabel" , {
                            FontFace = fonts.main;
                            TextColor3 = rgb(0, 0, 0);
                            BorderColor3 = rgb(0, 0, 0);
                            Text = "";
                            Parent = self.items[ "elements" ];
                            Name = "\0";
                            BackgroundTransparency = 1;
                            Size = dim2(1, 0, 0, 28);
                            BorderSizePixel = 0;
                            AutomaticSize = Enum.AutomaticSize.Y;
                            TextSize = 9;
                            BackgroundColor3 = rgb(255, 255, 255)
                        });
                        
                        items[ "holder" ] = library:create( "Frame" , {
                            AnchorPoint = vec2(1, 0.5);
                            Parent = items[ "object" ];
                            Name = "\0";
                            Position = dim2(1, 0, 0.5, 10);
                            BorderColor3 = rgb(0, 0, 0);
                            Size = dim2(1, 0, 0, 22);
                            BorderSizePixel = 0;
                            BackgroundColor3 = rgb(7, 7, 9)
                        });
                        
                        library:create( "UICorner" , {
                            Parent = items[ "holder" ];
                            CornerRadius = dim(0, 3)
                        });
                        
                        library:create( "UIStroke" , {
                            Color = rgb(18, 18, 20);
                            Parent = items[ "holder" ]
                        });
                        
                        items[ "title" ] = library:create( "TextLabel" , {
                            FontFace = fonts.main;
                            TextColor3 = rgb(255, 255, 255);
                            BorderColor3 = rgb(0, 0, 0);
                            Text = cfg.name;
                            Parent = items[ "object" ];
                            TextStrokeTransparency = 0;
                            Name = "\0";
                            Size = dim2(1, 0, 0, 0);
                            BackgroundTransparency = 1;
                            TextXAlignment = Enum.TextXAlignment.Left;
                            BorderSizePixel = 0;
                            AutomaticSize = Enum.AutomaticSize.Y;
                            TextSize = 9;
                            BackgroundColor3 = rgb(255, 255, 255)
                        });
                                            
                        items[ "input" ] = library:create( "TextBox" , {
                            FontFace = fonts.main;
                            TextColor3 = rgb(255, 255, 255);
                            BorderColor3 = rgb(0, 0, 0);
                            Text = "255";
                            Parent = items[ "holder" ];
                            Name = "\0";
                            Size = dim2(1, 0, 1, 0);
                            BorderSizePixel = 0;
                            BackgroundTransparency = 1;
                            PlaceholderColor3 = rgb(255, 255, 255);
                            CursorPosition = -1;
                            TextWrapped = true;
                            ClearTextOnFocus = false;
                            TextSize = 9;
                            BackgroundColor3 = rgb(255, 255, 255)
                        });             
                    end 
                    
                    function cfg.set(text) 
                        flags[cfg.flag] = text

                        items[ "input" ].Text = text

                        cfg.callback(text)
                    end 
                    
                    items[ "input" ]:GetPropertyChangedSignal("Text"):Connect(function()
                        cfg.set(items[ "input" ].Text or "") 
                    end)
                        
                    if cfg.default then 
                        cfg.set(cfg.default) 
                    end

                    config_flags[cfg.flag] = cfg.set

                    return setmetatable(cfg, library)
                end 

                function library:Keybind(options) 
                    local cfg = {
                        flag = options.flag or options.Flag or options.name or options.Name,
                        callback = options.callback or options.Callback or function() end,
                        name = options.name or options.Name or "Keybind";
                        info = options.info or options.Info or "";
                        ignore_key = options.ignore or false, 
                        
                        key = options.key or options.Default or nil, 
                        mode = options.mode or options.Mode or "Toggle",
                        active = options.default or false,

                        open = false,
                        binding = nil, 

                        hold_instances = {},
                        items = {};
                    }

                    flags[cfg.flag] = {
                        mode = cfg.mode,
                        key = cfg.key, 
                        active = cfg.active
                    }

                    local items = cfg.items; do 
                        -- Component
                            items[ "object" ] = library:create( "TextLabel" , {
                                FontFace = fonts.main;
                                TextColor3 = rgb(0, 0, 0);
                                BorderColor3 = rgb(0, 0, 0);
                                Text = "";
                                Parent = self.items[ "elements" ];
                                BackgroundTransparency = 1;
                                Name = "\0";
                                Size = dim2(1, 0, 0, 25);
                                BorderSizePixel = 0;
                                TextSize = 9;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });
                            
                            items[ "title" ] = library:create( "TextLabel" , {
                                FontFace = fonts.main;
                                TextColor3 = rgb(237, 237, 237);
                                BorderColor3 = rgb(0, 0, 0);
                                Text = cfg.name;
                                Parent = items[ "object" ];
                                Name = "\0";
                                BackgroundTransparency = 1;
                                TextXAlignment = Enum.TextXAlignment.Left;
                                Size = dim2(1, 0, 0, 11);
                                BorderSizePixel = 0;
                                TextSize = 9;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });
                            
                            items[ "info" ] = library:create( "TextLabel" , {
                                FontFace = fonts.main;
                                TextColor3 = rgb(68, 68, 70);
                                BorderColor3 = rgb(0, 0, 0);
                                Text = cfg.info;
                                Parent = items[ "object" ];
                                Name = "\0";
                                Size = dim2(1, 0, 0, 11);
                                Position = dim2(0, 0, 0, 13);
                                BackgroundTransparency = 1;
                                TextXAlignment = Enum.TextXAlignment.Left;
                                BorderSizePixel = 0;
                                TextWrapped = true;
                                TextSize = 9;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });
                            
                            items[ "filler" ] = library:create( "Frame" , {
                                AnchorPoint = vec2(1, 0.5);
                                Parent = items[ "object" ];
                                Name = "\0";
                                Position = dim2(1, 0, 0.5, 0);
                                BorderColor3 = rgb(0, 0, 0);
                                Size = dim2(0, 46, 0, 19);
                                BorderSizePixel = 0;
                                BackgroundColor3 = rgb(7, 7, 9)
                            });

                            items[ "keybinds" ] = library:create( "TextButton" , {
                                AnchorPoint = vec2(1, 0.5);
                                Text = "";
                                Parent = items[ "object" ];
                                Name = "\0";
                                Position = dim2(1, 0, 0.5, 0);
                                BorderColor3 = rgb(0, 0, 0);
                                Size = dim2(0, 46, 0, 19);
                                BorderSizePixel = 0;
                                AutoButtonColor = false;
                                BackgroundTransparency = 1;
                                BackgroundColor3 = rgb(7, 7, 9)
                            });
                            
                            library:create( "UICorner" , {
                                Parent = items[ "filler" ];
                                CornerRadius = dim(0, 3)
                            });
                            
                            items[ "name" ] = library:create( "TextLabel" , {
                                TextWrapped = true;
                                TextColor3 = rgb(255, 255, 255);
                                BorderColor3 = rgb(0, 0, 0);
                                Text = "RMB";
                                TextStrokeTransparency = 0;
                                Parent = items[ "keybinds" ];
                                Name = "\0";
                                BackgroundTransparency = 1;
                                Size = dim2(1, 0, 1, 0);
                                BorderSizePixel = 0;
                                FontFace = fonts.main;
                                TextSize = 9;
                                BackgroundColor3 = rgb(255, 255, 255)
                            });
                            
                            library:create( "UIStroke" , {
                                Color = rgb(18, 18, 20);
                                Parent = items[ "filler" ]
                            });   
                        -- 
                        
                        -- Mode Holder
                            items[ "element" ] = library:create( "Frame" , {
                                BorderColor3 = rgb(0, 0, 0);
                                AnchorPoint = vec2(1, 0.5);
                                Parent = library[ "items" ];
                                Name = "\0";
                                Visible = false;
                                Position = dim2(1, 0, 0.5, 0);
                                Size = dim2(0, 0, 0, 0);
                                BorderSizePixel = 0;
                                AutomaticSize = Enum.AutomaticSize.XY;
                                BackgroundColor3 = rgb(7, 7, 9)
                            });
                            
                            library:create( "UICorner" , {
                                Parent = items[ "element" ];
                                CornerRadius = dim(0, 3)
                            });
                            
                            library:create( "UIStroke" , {
                                Color = rgb(18, 18, 20);
                                Parent = items[ "element" ]
                            });
                            
                            library:create( "UIListLayout" , {
                                Parent = items[ "element" ];
                                Padding = dim(0, 10);
                                SortOrder = Enum.SortOrder.LayoutOrder;
                                HorizontalFlex = Enum.UIFlexAlignment.Fill
                            });
                            
                            library:create( "UIPadding" , {
                                PaddingTop = dim(0, 10);
                                PaddingBottom = dim(0, 10);
                                Parent = items[ "element" ];
                                PaddingRight = dim(0, 10);
                                PaddingLeft = dim(0, 10)
                            });
                            
                            local options = {"Hold", "Toggle", "Always"}
                            
                            for _, option in options do
                                local name = library:create( "TextButton" , {
                                    TextWrapped = true;
                                    TextColor3 = rgb(255, 255, 255);
                                    BorderColor3 = rgb(0, 0, 0);
                                    Text = option;
                                    Parent = items[ "element" ];
                                    TextStrokeTransparency = 0;
                                    Position = dim2(0, 4, 0, 0);
                                    BorderSizePixel = 0;
                                    BackgroundTransparency = 1;
                                    TextXAlignment = Enum.TextXAlignment.Left;
                                    FontFace = fonts.main;
                                    AutomaticSize = Enum.AutomaticSize.XY;
                                    TextSize = 9;
                                    BackgroundColor3 = rgb(255, 255, 255)
                                }); cfg.hold_instances[option] = name 
                                library:apply_theme(name, "accent", "TextColor3")

                                name.MouseButton1Click:Connect(function()
                                    cfg.set(option)

                                    cfg.set_visible(false)

                                    cfg.open = false
                                end)
                            end
                        -- 

                        -- Keybind list text
                            if not cfg.ignore_key then 
                                items[ "keybind_list_text" ] = library:create("TextLabel", {
                                    FontFace = fonts.main;
                                    TextColor3 = rgb(255, 255, 255);
                                    BorderColor3 = rgb(0, 0, 0);
                                    Text = "[ M ] triggerbot: always";
                                    Parent = library.keybind_list;
                                    Size = dim2(1, -36, 0, 20);
                                    Position = dim2(0, 18, 0, -3);
                                    BackgroundTransparency = 1;
                                    TextXAlignment = Enum.TextXAlignment.Left;
                                    BorderSizePixel = 0;
                                    ZIndex = 2;
                                    TextStrokeTransparency = 0;
                                    TextSize = 9;
                                    BackgroundColor3 = rgb(255, 255, 255)
                                });
                            end
                        -- 
                    end 

                    function cfg.modify_mode_color(path) -- ts so frikin tuff 💀
                        for _, v in cfg.hold_instances do 
                            v.TextColor3 = themes.preset.text
                        end
                        
                        cfg.hold_instances[path].TextColor3 = themes.preset.accent
                    end

                    function cfg.set_mode(mode) 
                        cfg.mode = mode 

                        if mode == "Always" then
                            cfg.set(true)
                        elseif mode == "Hold" then
                            cfg.set(false)
                        end

                        flags[cfg.flag]["mode"] = mode
                        cfg.modify_mode_color(mode)
                    end 

                    function cfg.set(input)
                        if type(input) == "boolean" then 
                            cfg.active = input

                            if cfg.mode == "Always" then 
                                cfg.active = true
                            end
                        elseif tostring(input):find("Enum") then 
                            input = input.Name == "Escape" and "NONE" or input
                            
                            cfg.key = input or "NONE"	
                        elseif find({"Toggle", "Hold", "Always"}, input) then 
                            if input == "Always" then 
                                cfg.active = true 
                            end 

                            cfg.mode = input
                            cfg.set_mode(cfg.mode) 
                        elseif type(input) == "table" then 
                            input.key = type(input.key) == "string" and input.key ~= "NONE" and library:convert_enum(input.key) or input.key
                            input.key = input.key == Enum.KeyCode.Escape and "NONE" or input.key

                            cfg.key = input.key or "NONE"
                            cfg.mode = input.mode or "Toggle"

                            if input.active then
                                cfg.active = input.active
                            end

                            cfg.set_mode(cfg.mode) 
                        end 

                        cfg.callback(cfg.active)

                        local text = tostring(cfg.key) ~= "Enums" and (keys[cfg.key] or tostring(cfg.key):gsub("Enum.", "")) or nil
                        local __text = text and (tostring(text):gsub("KeyCode.", ""):gsub("UserInputType.", ""))
                        
                        items[ "name" ].Text = __text

                        flags[cfg.flag] = {
                            mode = cfg.mode,
                            key = cfg.key, 
                            active = cfg.active
                        }

                        if items[ "keybind_list_text" ] then 
                            items[ "keybind_list_text" ].Text = "[ ".. __text  .." ] ".. cfg.name ..":".. string.lower(cfg.mode) .."";
                            items[ "keybind_list_text" ].Visible = cfg.active
                        end 
                    end

                    function cfg.set_visible(bool)
                        items[ "element" ].Visible = bool
                        items[ "element" ].Position = dim_offset(items[ "keybinds" ].AbsolutePosition.X + items[ "element" ].AbsoluteSize.X, items[ "keybinds" ].AbsolutePosition.Y + items[ "keybinds" ].AbsoluteSize.Y + 95)
                    end
                    
                    items[ "keybinds" ].MouseButton1Down:Connect(function()
                        task.wait()
                        items[ "name" ].Text = "..."	

                        cfg.binding = library:connection(uis.InputBegan, function(keycode, game_event)  
                            cfg.set(keycode.KeyCode ~= Enum.KeyCode.Unknown and keycode.KeyCode or keycode.UserInputType)
                            
                            cfg.binding:Disconnect() 
                            cfg.binding = nil
                        end)
                    end)

                    items[ "keybinds" ].MouseButton2Down:Connect(function()
                        cfg.open = not cfg.open 

                        cfg.set_visible(cfg.open)
                    end)

                    library:connection(uis.InputBegan, function(input, game_event) 
                        if not game_event then
                            local selected_key = input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode or input.UserInputType

                            if selected_key == cfg.key then 
                                if cfg.mode == "Toggle" then 
                                    cfg.active = not cfg.active
                                    cfg.set(cfg.active)
                                elseif cfg.mode == "Hold" then 
                                    cfg.set(true)
                                end
                            end
                        end

                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if not (library:mouse_in_frame(items[ "keybinds" ]) or library:mouse_in_frame(items[ "element" ])) then 
                                cfg.open = false
                                cfg.set_visible(false)
                            end
                        end
                    end)

                    library:connection(uis.InputEnded, function(input, game_event) 
                        if game_event then 
                            return 
                        end 

                        local selected_key = input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode or input.UserInputType
            
                        if selected_key == cfg.key then
                            if cfg.mode == "Hold" then 
                                cfg.set(false)
                            end
                        end
                    end)
                    
                    cfg.set({mode = cfg.mode, active = cfg.active, key = cfg.key})           
                    config_flags[cfg.flag] = cfg.set

                    return setmetatable(cfg, library)
                end 

                function library:button(options) 
                    local cfg = {
                        name = options.name or "TextBox",
                        callback = options.callback or function() end,
                        items = {};
                    }
                    
                    local items = cfg.items; do 
                        items[ "object" ] = library:create( "TextButton" , {
                            FontFace = fonts.main;
                            TextColor3 = rgb(0, 0, 0);
                            BorderColor3 = rgb(0, 0, 0);
                            Text = "";
                            Parent = self.items[ "elements" ];
                            BackgroundTransparency = 1;
                            Name = "\0";
                            Size = dim2(1, 0, 0, 22);
                            BorderSizePixel = 0;
                            TextSize = 9;
                            BackgroundColor3 = rgb(255, 255, 255)
                        });
                        
                        items[ "button" ] = library:create( "Frame" , {
                            AnchorPoint = vec2(1, 0.5);
                            Parent = items[ "object" ];
                            Name = "\0";
                            Position = dim2(1, 0, 0.5, 0);
                            BorderColor3 = rgb(0, 0, 0);
                            Size = dim2(1, 0, 1, 0);
                            BorderSizePixel = 0;
                            BackgroundColor3 = rgb(7, 7, 9)
                        });
                        
                        library:create( "UICorner" , {
                            Parent = items[ "button" ];
                            CornerRadius = dim(0, 3)
                        });
                        
                        items[ "title" ] = library:create( "TextLabel" , {
                            TextWrapped = true;
                            TextColor3 = rgb(255, 255, 255);
                            BorderColor3 = rgb(0, 0, 0);
                            Text = cfg.name;
                            Parent = items[ "button" ];
                            TextStrokeTransparency = 0;
                            Name = "\0";
                            Size = dim2(1, 0, 1, 0);
                            BackgroundTransparency = 1;
                            Position = dim2(0, 4, 0, 0);
                            BorderSizePixel = 0;
                            FontFace = fonts.main;
                            TextSize = 9;
                            BackgroundColor3 = rgb(255, 255, 255)
                        });
                        
                        library:create( "UIStroke" , {
                            Color = rgb(18, 18, 20);
                            Parent = items[ "button" ]
                        });                         
                    end 

                    items[ "object" ].MouseButton1Click:Connect(function()
                        cfg.callback()
                    end)
                    
                    return setmetatable(cfg, library)
                end 
            -- 
        -- 
    -- 

    -- Notification Library
        local notifications = library.notifications

        function notifications:refresh_notifs() 
            local yOffset = 50
            for i, v in ipairs(notifications.notifs) do
                local Position = vec2(20, yOffset)
                tween_service:Create(v, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Position = dim_offset(Position.X, Position.Y)}):Play()
                yOffset = yOffset + v.AbsoluteSize.Y + 10
            end
        end

        function notifications:fade(path, is_fading)
            local fading = is_fading and 1 or 0 
            
            tween_service:Create(path, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = fading}):Play()

            for _, instance in path:GetDescendants() do 
                if instance:IsA("UIStroke") then
                    tween_service:Create(instance, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Transparency = fading}):Play()
                elseif instance:IsA("TextLabel") then
                    tween_service:Create(instance, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = fading}):Play()
                elseif instance:IsA("Frame") then
                    tween_service:Create(instance, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = fading}):Play()
                end
            end
        end 

        function notifications:create_notification(options)
            local cfg = {
                name = options.name or "Hit: q3sm (finobe) in the Head for 100 Damage!",
                outline; 
            }

            -- Instances
                local outline = library:create("Frame", {
                    Parent = library[ "items" ];
                    Size = dim2(0.3, 0, 0, 0);
                    BorderColor3 = rgb(0, 0, 0);
                    BorderSizePixel = 0;
                    AutomaticSize = Enum.AutomaticSize.XY;
                    BackgroundColor3 = rgb(46, 46, 46)
                });

                local inline = library:create("Frame", {
                    Parent = outline;
                    Position = dim2(0, 1, 0, 1);
                    BorderColor3 = rgb(0, 0, 0);
                    BorderSizePixel = 0;
                    AutomaticSize = Enum.AutomaticSize.XY;
                    BackgroundColor3 = rgb(21, 21, 21)
                });	
                
                local uigradient = library:create("UIGradient", {
                    Color = rgbseq{rgbkey(0, rgb(255, 0, 0)), rgbkey(0.17, rgb(255, 255, 0)), rgbkey(0.33, rgb(0, 255, 0)), rgbkey(0.5, rgb(0, 255, 255)), rgbkey(0.67, rgb(0, 0, 255)), rgbkey(0.83, rgb(255, 0, 255)), rgbkey(1, rgb(255, 0, 0))};
                    Transparency = numseq{numkey(0, -1), numkey(1, -1)};
                    Parent = menu_title
                });
                
                library:create("UIPadding", {
                    PaddingTop = dim(0, 7);
                    PaddingBottom = dim(0, 6);
                    Parent = inline;
                    PaddingRight = dim(0, 8);
                    PaddingLeft = dim(0, 4)
                });
                
                local misc_text = library:create("TextLabel", {
                    FontFace = fonts.main;
                    Parent = inline;
                    LineHeight = 1.75;
                    TextColor3 = rgb(255, 255, 255);
                    BorderColor3 = rgb(0, 0, 0);
                    Text = cfg.name;
                    AutomaticSize = Enum.AutomaticSize.XY;
                    Size = dim2(1, -4, 1, 0);
                    Position = dim2(0, 4, 0, -2);
                    BackgroundTransparency = 1;
                    TextXAlignment = Enum.TextXAlignment.Left;
                    BorderSizePixel = 0;
                    ZIndex = 2;
                    TextSize = 9;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                library:create("UIPadding", {
                    PaddingBottom = dim(0, 1);
                    PaddingRight = dim(0, 1);
                    Parent = outline
                });

                local line = library:create( "Frame" , {
                    Parent = outline;
                    Name = "\0";
                    Position = dim2(0, 1, 1, -1);
                    BorderColor3 = rgb(0, 0, 0);
                    Size = dim2(0, 0, 0, 1);
                    BorderSizePixel = 0;
                    BackgroundColor3 = themes.preset.accent
                });
                
                local accent = library:create( "Frame" , {
                    Parent = outline;
                    Name = "\0";
                    Position = dim2(0, 1, 0, 1);
                    BorderColor3 = rgb(0, 0, 0);
                    Size = dim2(0, 1, 1, -1);
                    BorderSizePixel = 0;
                    BackgroundColor3 = themes.preset.accent
                });
            -- 
            
            local index = #notifications.notifs + 1
            notifications.notifs[index] = outline
            
            notifications:refresh_notifs()
            tween_service:Create(outline, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {AnchorPoint = vec2(0, 0)}):Play()
            
            notifications:fade(outline, false)

            task.spawn(function()
                tween_service:Create(line, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = dim2(1, -1, 0, 1)}):Play()
                task.wait(3)
                notifications.notifs[index] = nil
                notifications:fade(outline, true)
                task.wait(1)
                outline:Destroy() 
                notifications:refresh_notifs()
            end)
        end

    -- 
-- 

-- Modules
    local Workspace = cloneref(game:GetService("Workspace"))
    local run_service = cloneref(game:GetService("RunService"))
    local rs = cloneref(game:GetService("ReplicatedStorage"))
    local players = cloneref(game:GetService("Players"))
    local uis = cloneref(game:GetService("UserInputService"))
    local tween_service = cloneref(game:GetService("TweenService"))
    local stats = cloneref(game:GetService("Stats"))
    local get_team = cloneref(game:GetService("Teams"))
    local lighting = cloneref(game:GetService("Lighting"))
    local teams = get_team:GetTeams()
    local camera = Workspace["CurrentCamera"]
    local viewport_size = camera["ViewportSize"]
    local local_player = players["LocalPlayer"]
    local lplayer_name = local_player["Name"]
    local local_char = local_player.Character or local_player.CharacterAdded:Wait()
    local get_mouse = local_player:GetMouse()
    local sky = lighting:FindFirstChildOfClass("Sky") or cloneref(Instance.new("Sky", lighting))
    local color_correct = lighting:FindFirstChildOfClass("ColorCorrectionEffect")
            or cloneref(Instance.new("ColorCorrectionEffect", lighting))
    local fov_circle, sounds, snap_lines, skys = {}, {}, {},  {};
    local info_viewer= {};
    local modules = rs:FindFirstChild("Modules")
    local sound_module = modules:FindFirstChild("SoundModule")
    local sound_table = require(sound_module)
    local folder = Workspace:FindFirstChild("VFX") and Workspace.VFX:FindFirstChild("VMs")
    local settings_module = modules:FindFirstChild("SettingsModule")
    local settings_table = require(settings_module)
-- 

if not settings_table then
    return local_player:Kick("SettingsModule not found!")
end

if not folder then
    return local_player:Kick("VMs not found!")
end

local items_module = modules:FindFirstChild("Items")
local items_table = require(items_module)

-- cache
    local lighting_cache = {
        Brightness = game:GetService("Lighting").Brightness,
        ClockTime = game:GetService("Lighting").ClockTime,
        Ambient = game:GetService("Lighting").Ambient,
        OutdoorAmbient = game:GetService("Lighting").OutdoorAmbient,
        FogEnd = game:GetService("Lighting").FogEnd,
        FieldOfView = game:GetService("Workspace").CurrentCamera.FieldOfView,
        Density = game:GetService("Lighting"):FindFirstChild("Atmosphere").Density,
        Offset = game:GetService("Lighting"):FindFirstChild("Atmosphere").Offset,
        Glare = game:GetService("Lighting"):FindFirstChild("Atmosphere").Glare,
        Haze = game:GetService("Lighting"):FindFirstChild("Atmosphere").Haze,
    }

    local player = Players.LocalPlayer
    local character = nil
    local hrp = nil
    local humanoid = nil

    local spinbot_toggle = false
    local spinbot_speed = 300
    local random_factor = 10 

    local function waitForCharacter()
        character = player.Character or player.CharacterAdded:Wait()
        hrp = character:WaitForChild("HumanoidRootPart")
        humanoid = character:WaitForChild("Humanoid")
    end
    
    player.CharacterAdded:Connect(function()
        waitForCharacter()
    end)    

    local custom_textures = {
        ["Scan"] = "rbxassetid://9305457875",
        ["Scanning-hexagon"] = "rbxassetid://89067318",
        ["Hexagon"] = "rbxassetid://2930247814",
        ["Alien"] = "rbxassetid://459487304",
        ["Triangles"] = "rbxassetid://1478668577",
        ["Illusion"] = "rbxassetid://5841714970",
        ["Ground"] = "rbxassetid://11619804506",
        ["Lasers"] = "rbxassetid://398330154",
        ["Player"] = "rbxassetid://4504366173",
        ["Stars"] = "rbxassetid://4952604311",
        ["Lidar"] = "rbxassetid://965496575",
        ["Pixels"] = "rbxassetid://140652787",
        ["Pixels2"] = "rbxassetid://11780157037",
        ["Lidar2"] = "rbxassetid://13173535584",
        ["CityScan"] = "rbxassetid://951824492",
        ["Clouds"] = "rbxassetid://1723973648",
        ["Rainbow"] = "rbxassetid://10037165803",
        ["Scanning"] = "rbxassetid://5843010904",
        ["Groove"] = "rbxassetid://10785404176",
        ["Waves"] = "rbxassetid://6151763633",
        ["Corrupted"] = "rbxassetid://1212976946",
        ["Tiles"] = "rbxassetid://85065287",
        ["Netflix"] = "rbxassetid://8313072955",
        ["Circle"] = "rbxassetid://13996983074",
        ["Web"] = "rbxassetid://301464986",
        ["Swirl"] = "rbxassetid://8133639623",
        ["Scratches"] = "rbxassetid://4952604311",
        ["Webz"] = "rbxassetid://14410238962",
        ["Pixels3"] = "rbxassetid://12561493608",
        ["Outline"] = "rbxassetid://12361388066",
        ["Webz2"] = "rbxassetid://12646281757",
        ["Outline2"] = "rbxassetid://5125811022",
        ["Akatsuki"] = "rbxassetid://10913193650",
        ["America"] = "rbxassetid://936775406",
        ["Shield Forcefield"] = "rbxassetid://361073795",
        ["Water"] = "rbxasset://textures/water/normal_21.dds",
    };

    local targetutil = {entry = nil, closest_part = nil, hasshot = false}


    local bases_folder = {
        workspace.Bases.Loners:FindFirstChild("External Wooden Gate") or nil,
        workspace.Bases.Loners:FindFirstChild("External Stone Gate") or nil,
    }

    for _, v in pairs(workspace.Bases:GetChildren()) do
        if v:IsA("Folder") and v.Name == "Base" then
            for _, sub in ipairs({"Doorway", "Floor", "Triangle Floor", "Foundation", "Triangle Foundation", "Wall", "Wall Frame", "Window"}) do
                local sub_folder = v:FindFirstChild(sub)
                if sub_folder then
                    table.insert(bases_folder, sub_folder)
                end
            end
        end
    end

    local skyboxes = {
        ["Blue Sky"] = { "591058823", "591059876", "591058104", "591057861", "591057625", "591059642" },
        ["Vaporwave"] = { "1417494030", "1417494146", "1417494253", "1417494402", "1417494499", "1417494643" },
        ["Redshift"] = { "401664839", "401664862", "401664960", "401664881", "401664901", "401664936" },
        ["Blaze"] = { "150939022", "150939038", "150939047", "150939056", "150939063", "150939082" },
        ["Among Us"] = { "5752463190", "5752463190", "5752463190", "5752463190", "5752463190", "5752463190" },
        ["Dark Night"] = { "6285719338", "6285721078", "6285722964", "6285724682", "6285726335", "6285730635" },
        ["Bright Pink"] = { "271042516", "271077243", "271042556", "271042310", "271042467", "271077958" },
        ["Purple Sky"] = { "570557514", "570557775", "570557559", "570557620", "570557672", "570557727" },
        ["Galaxy"] = { "15125283003", "15125281008", "15125277539", "15125279325", "15125274388", "15125275800" },
    }

    local hit_sounds = {
        ["Dink"]      = "rbxassetid://988593556";
        ["TF2"]       = "rbxassetid://8255306220";
        ["Gamesense"] = "rbxassetid://4817809188";
        ["Rust"]      = "rbxassetid://1255040462";
        ["Neverlose"] = "rbxassetid://8726881116";
        ["Bubble"]    = "rbxassetid://198598793";
        ["Quake"]     = "rbxassetid://1455817260";
        ["Among-Us"]  = "rbxassetid://7227567562";
        ["Ding"]      = "rbxassetid://2868331684";
        ["Minecraft"] = "rbxassetid://6361963422";
        ["Blackout"]  = "rbxassetid://3748776946";
        ["Osu"]       = "rbxassetid://7151989073"
    };


    local entry, closest_part
    local target_Paradox = {
        target = {
            entry = nil,
            part = nil,
            distance = math.huge,
        },
    }   
    local highlight_player = nil
    local player_esp = {
        player_cache = {},
        drawing_cache = {},

        childadded_connections = {},
        childremoved_connections = {},
        functions = {},
    }

    --[[GLOBALS]]
    getgenv().silent = false
    getgenv().silent_key = false
    getgenv().silent_hitchance = 100

    getgenv().xray_toggle = false
    getgenv().xray_enabled = false
    getgenv().xray_opacity = 0.5

    local freecam = {
        enabled = false,
        pitch = 0,
        yaw = 0,
        keys = {},
        old_type = Enum.CameraType.Custom,
        old_behavior = Enum.MouseBehavior.Default,
    }

    local NoLagBackSettings = {
        Enabled = false,
        HeartbeatConnection = nil,
        LastPosition = nil,
        Stop = false
    }

    local platform = Instance.new("Part")
    platform.Size = Vector3.new(2, 0.1, 2)
    platform.Anchored = true
    platform.BrickColor = BrickColor.new("Black")
    platform.CanCollide = true
    platform.Name = "Platform"
    platform.Parent = Workspace
    platform.Transparency = 1

    local shooting = false

    for v in pairs(skyboxes) do
        table.insert(skys, v)
    end

    for name in pairs(hit_sounds) do 
        table.insert(sounds, name) 
    end;
--

task.wait(5)

-- pre documentation function init
    -- Traps
        local stored_parts = { DamagePart = {}, TouchCollision = {}, Collision = {} }

        workspace.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("BasePart") then
                for partName, flag in pairs({DamagePart = flags["No Spike Damage"], TouchCollision = flags["No Trap Damage"]}) do
                    if descendant.Name == partName and flag then
                        stored_parts[partName][descendant] = descendant.Parent
                        descendant.Parent = cloneref(game:GetService("CoreGui"))
                        descendant.Destroying:Connect(function()
                            stored_parts[partName][descendant] = nil
                        end)
                    end
                end
            end
        end)
--
    -- Other gun mods 
        local gun_mods = {
            old_recoil1 = nil,
            old_recoil2 = nil,
            old_spread = {},
            old_firerates = {},
            old_auto = {},
            old_bullet_speeds = {},
            old_vm_mults = {},
            old_equip_anims = {},
            old_aim_down_speeds = {},
            old_melee_cooldowns = {},
        }

        local fast_fire_callback = function()
            local value = library.flags["Enable RPM"]
            for _, tbl in getgc(true) do
                if type(tbl) ~= "table" then
                    continue
                end

                local current_rpm = rawget(tbl, "RPM")
                if current_rpm then
                    if not gun_mods.old_firerates[tbl] then
                        gun_mods.old_firerates[tbl] = current_rpm
                    end

                    if value then
                        tbl.RPM = gun_mods.old_firerates[tbl] * library.flags["RPM Boost"]
                    else
                        tbl.RPM = gun_mods.old_firerates[tbl]
                    end
                end
            end
        end
    --

    -- Mod warning
        local activeConnections = {}
        local activeNotifications = 0

        function mod_check(player) -- btw u pasted the same func 2 times XD
            if not player:IsDescendantOf(game) then
                return false
            end

            local role = player:GetRoleInGroup(1154360)
            if table.find({ "Game Moderator", "Developer", "Lead Developer", "Co-Founder", "Founder" }, role) then
                return true, role
            end

            return false
        end
    -- 

    -- Bullet Manipulation
        local uis        = game:GetService("UserInputService")
        local players    = game:GetService("Players")
        local runService = game:GetService("RunService")
        local local_player = players.LocalPlayer
        
        -- [[Configuration]]
        local WALK_SPEED         = 20
        local FORCEFIELD_COLOR   = BrickColor.new("White")
        local SHOW_DISTANCE_TEXT = true
        local MAX_DISTANCE       = 8
        
        local remake = {
            enabled        = false,
            startReplica   = nil,
            startPosition  = nil,
            remakePosition = nil,
            distanceText   = Drawing.new("Text"),
            character      = nil,
            diedConnection = nil,
        }
        
        remake.distanceText.Size     = 18
        remake.distanceText.Center   = true
        remake.distanceText.Outline  = true
        remake.distanceText.Visible  = false
        remake.distanceText.Position = Vector2.new(
            workspace.CurrentCamera.ViewportSize.X/2,
            workspace.CurrentCamera.ViewportSize.Y/2 + 50
        )
        
        local function createClone(character, color)
            local replica = Instance.new("Model")
            replica.Name = "ForcefieldClone"
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    local clone = Instance.new("Part")
                    clone.Size       = part.Size
                    clone.CFrame     = part.CFrame
                    clone.Anchored   = true
                    clone.CanCollide = false
                    clone.Material   = Enum.Material.ForceField
                    clone.BrickColor = color
        
                    local mesh = part:FindFirstChildWhichIsA("SpecialMesh")
                    if mesh then
                        local meshClone = Instance.new("SpecialMesh")
                        pcall(function()
                            meshClone.MeshType  = mesh.MeshType
                            meshClone.MeshId    = mesh.MeshId
                            meshClone.TextureId = mesh.TextureId
                            meshClone.Scale     = mesh.Scale
                        end)
                        meshClone.Parent = clone
                    end
        
                    clone.Parent = replica
                end
            end
            replica.Parent = workspace
            return replica
        end

        local function ManipulationReset()
            remake.enabled = false
            if remake.startReplica then
                remake.startReplica:Destroy()
                remake.startReplica = nil
            end
            remake.distanceText.Visible = false
            if remake.character and remake.character:FindFirstChild("HumanoidRootPart") then
                remake.character.HumanoidRootPart.Anchored = false
            end
        end
        
        local function updateCharacterReferences()
            remake.character = local_player.Character or local_player.CharacterAdded:Wait()
            remake.character:WaitForChild("HumanoidRootPart")
            remake.character:WaitForChild("Humanoid")
        
            if remake.diedConnection then
                remake.diedConnection:Disconnect()
            end
            remake.diedConnection = remake.character.Humanoid.Died:Connect(ManipulationReset)
        end
        
        updateCharacterReferences()

        local_player.CharacterAdded:Connect(function()
            ManipulationReset()
            updateCharacterReferences()
        end)
    -- 

    -- XRay
        local function upd_xray(state)
            if not getgenv().xray_toggle then
                return
            end
            for _, v in pairs(bases_folder) do
                for _, obj in ipairs(v:GetDescendants()) do
                    if obj:IsA("MeshPart") then
                        obj.Transparency = state and getgenv().xray_opacity or 0
                    end
                end
            end
        end
    -- 
-- 

-- CHEATTABLE SIGMA
local show_hit_notification = false
local hit_target_name = ""
local hit_part_name = ""

function on_bullet_hit(hitobj)
    if hitobj and hitobj.Parent then
        hit_target_name = hitobj.Parent.Name
        hit_part_name = hitobj.Name
        show_hit_notification = true
    end
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CheatTable = {Locals = {}}

CheatTable.Locals.ToolInfoCache = {}
            
                local function DeepCopy(Table)
                    local Copy = {}
                
                    for Index, Value in pairs(Table) do
                        if typeof(Value) == "table" then
                            Copy[Index] = DeepCopy(Value)
                        else
                            Copy[Index] = Value
                        end
                    end
                
                    return Copy
                end
            
                CheatTable.Locals.ToolInfo = require(ReplicatedStorage.Modules.ToolInfo)
                CheatTable.Locals.ToolInfoCache = DeepCopy(require(ReplicatedStorage.Modules.ToolInfo))

-- docs
    local ui = {sections = {}}
    ui.window = library:window({})
    ui.tabs = {
        assist = ui.window:Page({name = "Assist", Icon = "rbxassetid://73783113517057"});
        visuals = ui.window:Page({name = "Visuals", Icon = "rbxassetid://8547254518"});
        esp = ui.window:Page({name = "ESP", Icon = "rbxassetid://140220393387264"});
        misc = ui.window:Page({name = "Misc", Icon = "rbxassetid://136353072758587"});
    }

    do -- Assist
        local section = ui.tabs.assist:Section({Name = "Main", Side = "Left"}) do 
            section:Toggle({ Name = "Aimbot", Flag = "Enable Aimbot", Info = "Lock onto targets"})
            section:Toggle({ Name = "Silent Aim", Flag = "Enable Silent Aim", Info = "Magic bullet", Callback = function(state) getgenv().silent = state end })
            section:Toggle({ Name = "Inventory Viewer", Flag = "Armor Viewer", Info = "View enemy inventory" })
            section:Toggle({ Name = "Auto Shoot", Flag = "Enable Auto Shoot", Info = "Auto fire on peak" })
            section:Keybind({ Flag = "Aimbot Keybind", Name = "Aimbot Keybind", Default = Enum.UserInputType.MouseButton2, Mode = "Hold", Info = "Key for aimbot" })
            section:Keybind({ Flag = "Silent Aim Keybind", Name = "Silent Aim Keybind", Default = Enum.UserInputType.MouseButton1, Mode = "Hold", Info = "Key for silent", Callback = function(state) getgenv().silent_key = state end })
            section:Slider({ Name = "Aimbot Speed", Flag = "Aimbot Speed", Default = 0.5, Minimum = 0.05, Maximum = 1, Decimals = 0.01, Ending = "", Info = "Aimbot Delay" })
            section:Slider({ Name = "Hitchance", Flag = "Hitchance", Default = 100, Minimum = 1, Maximum = 100, Decimals = 1, Ending = "%", Info = "% Hit Chance", Callback = function(state) getgenv().silent_hitchance = state end })
            section:Slider({ Name = "Max Distance", Flag = "Aimbot Max Distance", Default = 500, Minimum = 100, Maximum = 2500, Decimals = 1, Ending = "s", Info = "Max lock range" })
            section:List({ Name = "Aimbone", Flag = "Aimbot Bone", Options = { "Head", "UpperTorso", "LowerTorso", "Closest Bone" }, Default = "Head", Info = "Aiming Bone" })
        end; 

        local section = ui.tabs.assist:Section({Name = "Select", Side = "Middle"}) do 
            section:Toggle({ Name = "Team Check", Flag = "Friendly Check", Info = "Ignore people on team" })
            section:Toggle({ Name = "Visible Check", Flag = "Visible Check", Info = "See only visible people" })
            section:Toggle({ Name = "FOV Circle", Flag = "Enable FOV", Info = "Show aim help circle" })
            section:Colorpicker({ Name = "FOV Color", Flag = "FOV Accent", Default = Color3.fromRGB(255, 255, 255), Info = "Pick aim circle color" })
            section:Toggle({ Name = "FOV Filled", Flag = "FOV Filled", Info = "Fill the FOV circle" })
            section:Slider({ Name = "FOV Fill Opacity", Flag = "FOV Fill Opacity", Default = 50, Minimum = 0, Maximum = 100, Decimals = 1, Ending = "%", Info = "FOV fill transparency" })
            section:Colorpicker({ Name = "FOV Fill Color", Flag = "FOV Fill Accent", Default = Color3.fromRGB(255, 255, 255), Info = "Pick aim circle fill color" })
            section:Slider({ Name = "FOV Radius", Flag = "FOV Radius", Default = 120, Minimum = 30, Maximum = 750, Decimals = 1, Ending = "px", Info = "Size of aim circle" })
            section:Toggle({ Name = "Snaplines", Flag = "Enable Snaplines", Info = "Lines to enemies"})
            section:Colorpicker({ Name = "Snaplines Color", Flag = "Snaplines Accent", Default = Color3.fromRGB(255, 255, 255), Info = "Pick snapline color" })

            section:Toggle({Name = "Crosshair", Risk = false, Default = false, Flag = "Crosshair Enabled"})
            section:Colorpicker({ Name = "Color", Flag = "Crosshair Color", Default = Color3.fromRGB(255, 255, 255), Info = "Crosshair color" })
            section:Toggle({Name = "Spin", Risk = false, Default = false, Flag = "Crosshair Spin"})
            section:Slider({Name = "Speed", Flag = "Crosshair Speed", Minimum = 1, Maximum = 100, Default = 10})
            section:Slider({Name = "Length", Flag = "Crosshair Length", Minimum = 1, Maximum = 100, Default = 50})
            section:Slider({Name = "Width", Flag = "Crosshair Width", Minimum = 1, Maximum = 5, Default = 1})
            section:Slider({Name = "Spread", Flag = "Crosshair Spread", Minimum = 0, Maximum = 50, Default = 10})
        end; 

        local section = ui.tabs.assist:Section({Name = "Traps", Side = "Right"}) do
            for name,partName in {["No Spike Damage"] = "DamagePart", ["No Trap Damage"] = "TouchCollision"} do 
                section:Toggle({ Name = name, Flag = name, Default = false, Callback = function(state) 
                    if state then 
                        for _, v in workspace:GetDescendants() do 
                            if v:IsA("BasePart") and v.Name == partName then 
                                stored_parts[partName][v] = v.Parent 
                                v.Parent = cloneref(game:GetService("CoreGui")) 
                                v.Destroying:Connect(function() 
                                    stored_parts[partName][v] = nil 
                                end) 
                            end 
                        end 
                    else 
                        for part, old_parent in pairs(stored_parts[partName]) do 
                            part.Parent = old_parent 
                        end 
                        table.clear(stored_parts[partName]) 
                    end 
                end })
            end

            

            section:Toggle({Name = "Mod check", Flag = "Mod Check", Default = false, Callback = function(enabled)
                if enabled then
                    local messages = {}

                    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                        local isMod, rank = mod_check(player)
                        if isMod then
                            table.insert(messages, rank .. " already in game! - " .. player.Name)
                        end
                    end
                    
                    if #messages > 0 then
                        notifications:create_notification({name = table.concat(messages, ", ")})
                    end
        
                    table.insert(activeConnections, game:GetService("Players").PlayerAdded:Connect(function(player)
                        local isMod, rank = mod_check(player)
                        if isMod and flags["Mod Check"] then
                            notifications:create_notification({name = rank .. " joined - " .. player.Name})
                        end
                    end))
        
                    table.insert(activeConnections, game:GetService("Players").PlayerRemoving:Connect(function(player)
                        local isMod, rank = mod_check(player)
                        if isMod and flags["Mod Check"] then
                            notifications:create_notification({name = rank .. " left - " .. player.Name})
                        end
                    end))
                else
                    -- Disconnect all previous connections
                    for _, connection in ipairs(activeConnections) do
                        connection:Disconnect()
                    end
                    activeConnections = {}
                end
            end})
        end;
    end 

    do -- Esp 
        local section = ui.tabs.esp:Section({Name = "Options", Side = "Left"}) do 
            section:Toggle({ Name = "Names", Flag = "Enable Names", Info = "Show player name tag" })
            section:Toggle({ Name = "Boxes", Flag = "Enable Boxes", Info = "Draw box on player" })
            section:List({ Name = "Box Style", Flag = "Box Style", Options = { "Full Box", "Cornered" }, Default = "Full Box", Info = "Box ESP style" })
            section:Toggle({ Name = "Distance", Flag = "Enable Distance", Info = "Show distance" })
            section:Toggle({ Name = "Weapon", Flag = "Enable Weapon", Info = "Show player weapons" })
            section:Toggle({ Name = "Healthbar", Flag = "Enable Healthbar", Info = "Show player health bar" })
            section:Toggle({ Name = "Gradient Healthbar", Flag = "Healthbar Gradient", Info = "Gradient Healthbar" })
            section:Toggle({ Name = "Visible Icons", Flag = "Enable Visible Icons", Info = "Show icon if seen" })
            section:Toggle({ Name = "Healthtext", Flag = "Enable Healthtext", Info = "Show health text" })
            section:Toggle({ Name = "Viewangle", Flag = "Enable Viewangle", Info = "Show view line angle" })
            section:Slider({ Name = "Viewangle Length", Flag = "Viewangle Length", Default = 5, Minimum = 1, Maximum = 15, Decimals = 0.1, Ending = ""})
            section:Toggle({ Name = "Penis ESP", Flag = "Enable Penis ESP", Info = "penile esp!" })
            section:Slider({ Name = "Penis Length", Flag = "Penis Length", Default = 5, Minimum = 1, Maximum = 15, Decimals = 0.1, Ending = ""})
            section:Toggle({ Name = "Skeleton", Flag = "Enable Skeletons", Info = "Show bone line draw" })
            section:Slider({ Name = "Skeleton Thickness", Flag = "Skeleton Thickness", Default = 1, Minimum = 1, Maximum = 2, Decimals = 0.1, Ending = ""})
            section:Toggle({ Name = "Chams", Flag = "Enable Chams", Info = "Glow player body part" })
            section:Slider({ Name = "Chams Opacity", Flag = "Chams Opacity", Default = 50, Minimum = 0, Maximum = 100, Decimals = 1, Ending = "%", Info = "Glow see through percent" })
            section:Toggle({ Name = "Adornments", Flag = "CHAMS gxentry SEX NIGGERS", Info = "Friggin block chams" })
            section:List({ Name = "Chams", Flag = "Chams Visible Check", Options = { "Visible Only", "Always Visible" }, Info = "Outline people"})
        end 

        local section = ui.tabs.esp:Section({Name = "Colors", Side = "Right"}) do 
            section:Colorpicker({ Name = "Names Color", Flag = "Names Accent", Default = Color3.fromRGB(255, 255, 255), Info = "Pick name tag color" })
            section:Colorpicker({ Name = "Boxes Color", Flag = "Boxes Accent", Default = Color3.fromRGB(255, 255, 255), Info = "Pick box line color" })
            section:Colorpicker({ Name = "Distance Color", Flag = "Distance Accent", Default = Color3.fromRGB(255, 255, 255), Info = "Pick distance text color" })
            section:Colorpicker({ Name = "Weapon Color", Flag = "Weapon Accent", Default = Color3.fromRGB(255, 255, 255), Info = "Pick gun name color" })
            section:Colorpicker({ Name = "High Health", Flag = "Health1", Default = Color3.new(0, 1, 0), Info = "Pick seen icon color" })
            section:Colorpicker({ Name = "Mid Health", Flag = "Health2", Default = Color3.new(0.7, 0.8, 0), Info = "Pick seen icon color" })
            section:Colorpicker({ Name = "Low Health", Flag = "Health3", Default = Color3.new(1, 0, 0), Info = "Pick seen icon color" })
            section:Colorpicker({ Name = "Visible Icon Color", Flag = "Visible Icon Accent", Default = Color3.fromRGB(255, 0, 0), Info = "Pick seen icon color" })
            section:Colorpicker({ Name = "Viewangle Color", Flag = "Viewangle Accent", Default = Color3.fromRGB(255, 255, 255), Info = "Pick view line color" })
            section:Colorpicker({ Name = "Skeletons Color", Flag = "Skeletons Accent", Default = Color3.fromRGB(255, 255, 255), Info = "Pick bone line color" })
            section:Colorpicker({ Name = "Chams Color", Flag = "Chams Accent", Default = Color3.fromRGB(255, 255, 255), Info = "Pick chams body color" })
            section:Colorpicker({ Name = "Adornments Color", Flag = "CHAM COLOR gxentry SEX NIGGERS", Default = Color3.fromRGB(255, 255, 255), Info = "Pick chams body color" })
            section:Colorpicker({ Name = "Highlight Color", Flag = "Highlight Accent", Default = Color3.fromRGB(255, 0, 0), Info = "Pick glow light color" })
            section:Colorpicker({ Name = "Boss ESP Color", Flag = "boss_Color", Default = Color3.new(255, 255, 255), Info = "Boss ESP Color" })
            section:Colorpicker({ Name = "Soldier ESP Color", Flag = "soldier_Color", Default = Color3.new(255, 255, 255), Info = "Soldier ESP Color" })
            section:Colorpicker({ Name = "Body Bag ESP Color", Flag = "Body Bag ESP Color", Default = Color3.fromRGB(255, 255, 255), Info = "Pick body bag esp color" })            
            section:Colorpicker({ Name = "Phosphate ESP Color", Flag = "Phosphate ESP Color", Default = Color3.fromRGB(255, 255, 255), Info = "Pick phosphate esp color" })
            section:Colorpicker({ Name = "Metal ESP Color", Flag = "Metal ESP Color", Default = Color3.fromRGB(255, 255, 255), Info = "Pick metal esp color" })
            section:Colorpicker({ Name = "Stone ESP Color", Flag = "Stone ESP Color", Default = Color3.fromRGB(255, 255, 255), Info = "Pick stone esp color" })
            -- plants
            section:Colorpicker({ Name = "Wool ESP Color", Flag = "Wool ESP Color", Default = Color3.fromRGB(255, 255, 255), Info = "Pick wool esp color" })
            section:Colorpicker({ Name = "Blueberry ESP Color", Flag = "Blueberry ESP Color", Default = Color3.fromRGB(102, 153, 255), Info = "Pick blueberry esp color" })
            section:Colorpicker({ Name = "Corn ESP Color", Flag = "Corn ESP Color", Default = Color3.fromRGB(255, 255, 102), Info = "Pick corn esp color" })
            section:Colorpicker({ Name = "Lemon ESP Color", Flag = "Lemon ESP Color", Default = Color3.fromRGB(255, 255, 0), Info = "Pick lemon esp color" })
            section:Colorpicker({ Name = "Pumpkin ESP Color", Flag = "Pumpkin ESP Color", Default = Color3.fromRGB(255, 165, 0), Info = "Pick pumpkin esp color" })
            section:Colorpicker({ Name = "Raspberry ESP Color", Flag = "Raspberry ESP Color", Default = Color3.fromRGB(255, 102, 178), Info = "Pick raspberry esp color" })
            section:Colorpicker({ Name = "Tomato ESP Color", Flag = "Tomato ESP Color", Default = Color3.fromRGB(255, 80, 80), Info = "Pick tomato esp color" })            
            -- plants
            -- eggs
            section:Colorpicker({ Name = "Large Egg Color", Flag = "Large Egg ESP Color", Default = Color3.fromRGB(255, 255, 255), Info = "Pick large egg color" }) -- egg
            section:Colorpicker({ Name = "Medium Egg Color", Flag = "Medium Egg ESP Color", Default = Color3.fromRGB(255, 255, 255), Info = "Pick medium egg color" }) -- egg
            section:Colorpicker({ Name = "Small Egg Color", Flag = "Small Egg ESP Color", Default = Color3.fromRGB(255, 255, 255), Info = "Pick small egg color" }) -- egg
            -- eggs
            section:Colorpicker({ Name =  "BTR ESP Color", Flag = "BTR ESP Color", Default = Color3.fromRGB(255, 255, 255), Info = "BTR ESP color"})
            section:Colorpicker({ Name = "Timed Crate ESP Color", Flag = "Timed Crate ESP Color", Default = Color3.fromRGB(255, 215, 0), Info = "Pick timed crate esp color" })    
            section:Colorpicker({ Name = "Care Package ESP Color", Flag = "Care Package ESP Color", Default = Color3.fromRGB(255, 190, 0), Info = "Pick care package ESP color" })        
        end 

        local section = ui.tabs.esp:Section({Name = "Other", Side = "Middle"}) do 
            section:Toggle({ Name = "Highlight Target", Flag = "Highlight ESP", Info = "Glow main target only" })
            section:Toggle({ Name = "Team Check", Flag = "Enable TeamCheck", Info = "Only show enemy team" })
			section:Toggle({ Name = "Visible Check", Flag = "Enable VisibleCheck", Info = "Only visible niggers" })
            section:Toggle({ Name = "Display Name", Default = true, Flag = "Display Name", Info = "Show player display name" })
            section:Toggle({ Name = "Outline Lines", Flag = "Outline Skeletons", Info = "Add edge line view" })
            section:Slider({ Name = "Max Player ESP Distance", Flag = "Max ESP Distance", Default = 500, Minimum = 100, Maximum = 2500, Decimals = 1, Ending = "s", Info = "How far esp shows" })
            section:Toggle({ Name = "World Esp", Flag = "Enable World ESP", Info = "Turn world esp on" })
            section:Slider({ Name = "Max World ESP Distance", Flag = "World ESP Max Distance", Default = 500, Minimum = 100, Maximum = 2500, Decimals = 1, Ending = "s", Info = "How far esp shows" })
            section:Toggle({ Name = "Enable Body Bag ESP", Flag = "Enable Body Bag ESP", Info = "Show ESP for body bags" })            
            -- plants
            section:Toggle({ Name = "Enable Wool ESP", Flag = "Enable Wool ESP", Info = "Show wool with color" })
            section:Toggle({ Name = "Enable Blueberry ESP", Flag = "Enable Blueberry ESP", Info = "Show blueberry plant" })
            section:Toggle({ Name = "Enable Corn ESP", Flag = "Enable Corn ESP", Info = "Show corn plant" })
            section:Toggle({ Name = "Enable Lemon ESP", Flag = "Enable Lemon ESP", Info = "Show lemon plant" })
            section:Toggle({ Name = "Enable Pumpkin ESP", Flag = "Enable Pumpkin ESP", Info = "Show pumpkin plant" })
            section:Toggle({ Name = "Enable Raspberry ESP", Flag = "Enable Raspberry ESP", Info = "Show raspberry plant" })
            section:Toggle({ Name = "Enable Tomato ESP", Flag = "Enable Tomato ESP", Info = "Show tomato plant" })            
            -- plants
            section:Toggle({ Name = "Enable Stone ESP", Flag = "Enable Stone ESP", Info = "Show stone with color" })
            section:Toggle({ Name = "Enable Metal ESP", Flag = "Enable Metal ESP", Info = "Show metal with color" })
            section:Toggle({ Name = "Enable Phosphate ESP", Flag = "Enable Phosphate ESP", Info = "Show phosphate with color" })
            -- eggs
            section:Toggle({ Name = "Enable Large Egg ESP", Flag = "Enable Large Egg ESP", Info = "Show large egg" })
            section:Toggle({ Name = "Enable Medium Egg ESP", Flag = "Enable Medium Egg ESP", Info = "Show medium egg" })
            section:Toggle({ Name = "Enable Small Egg ESP", Flag = "Enable Small Egg ESP", Info = "Show small egg" })
            -- eggs
            section:Toggle({ Name = "Soldier ESP", Flag = "soldier_Name", Default = false, Info = "Soldier ESP" })
            section:Toggle({ Name = "Show Health", Flag = "soldier_Health", Default = false, Info = "Show health" })
            section:Toggle({ Name = "Show Distance", Flag = "soldier_Distance", Default = false, Info = "Show distance" })
            section:Toggle({ Name = "Boss ESP", Flag = "boss_Name", Default = false, Info = "Boss ESP" })
            section:Toggle({ Name = "Enable BTR ESP", Flag = "Enable BTR ESP", Info = "Enable ESP for BTR"})
            section:Toggle({ Name = "Enable Timed Crate ESP", Flag = "Enable Timed Crate ESP", Info = "Show ESP for timed crate" })       
            section:Toggle({ Name = "Enable Care Package ESP", Flag = "Enable Care Package ESP", Info = "Show ESP for care packages" })     
        end 
    end 

    do -- Visuals
        local section = ui.tabs.visuals:Section({Name = "Self", Side = "Left"}) do
            section:Toggle({ Name = "Local Chams", Flag = "Viewmodel Chams", Default = false, Info = "Show custom viewmodel" })
            section:Toggle({ Name = "Arm Chams", Flag = "Arm Chams", Default = false, Info = "Show arms with chams" })
            section:Toggle({ Name = "Weapon Chams", Flag = "Weapon Chams", Default = false, Info = "Show weapon with chams" })
            section:List({ Name = "Custom Material", Flag = "Custom Model Material", Options = { "ForceField", "Neon" }, Default = "ForceField", Info = "Material for model" })
            section:List({ Name = "Custom Textures", Flag = "TexturesIDS", Options = { "Default", "Scan", "Scanning-hexagon", "Hexagon", "Alien", "Triangles", "Illusion", "Ground", "Lasers", "Player", "Stars", "Lidar", "Pixels", "Pixels2", "Lidar2", "CityScan", "Clouds", "Rainbow", "Scanning", "Groove", "Waves", "Corrupted", "Tiles", "Netflix", "Circle", "Web", "Swirl", "Scratches", "Webz", "Pixels3", "Outline", "Webz2", "Outline2", "Akatsuki", "America", "Player FF Texture", "Shield Forcefield", "Water" }, Default = "Default", Info = "Pick texture style" })
            section:Slider({ Name = "Inline Opacity", Flag = "Local Chams Inline Opacity", Default = 50, Minimum = 0, Maximum = 100, Decimals = 1, Ending = "%", Info = "Opacity inside model" })
            section:Slider({ Name = "Outline Opacity", Flag = "Local Chams Outline Opacity", Default = 50, Minimum = 0, Maximum = 100, Decimals = 1, Ending = "%", Info = "Opacity outer edge" })
            section:Colorpicker({ Name = "Model Color", Flag = "Custom Model Accent", Default = Color3.fromRGB(255, 255, 255), Info = "Main color for model" })
            section:Colorpicker({ Name = "Inline Color", Flag = "Local Chams Inline accent", Default = Color3.fromRGB(255, 255, 255), Info = "Inside color glow" })
            section:Colorpicker({ Name = "Outline Color", Flag = "Local Chams Outline accent", Default = Color3.fromRGB(255, 255, 255), Info = "Outside color edge" })

            section:Toggle({Name = "Viewmodel Position", Info = "ato_ale and w3bcam are sigmas", Default = false, Flag = "Viewmodel Position", Callback = function(State)
                for Index, Value in next, CheatTable.Locals.ToolInfo do
                    if Value.Offsets and Value.Offsets.Local then
                        if State then
                            Value.Offsets.Local = CheatTable.Locals.ToolInfoCache[Index].Offsets.Local * CFrame.new(
                                flags["Viewmodel Position X"],
                                flags["Viewmodel Position Y"],
                                flags["Viewmodel Position Z"]
                            )
                        else
                            Value.Offsets.Local = CheatTable.Locals.ToolInfoCache[Index].Offsets.Local
                        end
                    end
                end
            end})
            
            section:Slider({Name = "X pos", Flag = "Viewmodel Position X", Minimum = -2, Maximum = 2, Default = 0, Decimals = 0.1, Style = "Full", Callback = function(State)
                flags["Viewmodel Position X"] = State
                
                for Index, Value in next, CheatTable.Locals.ToolInfo do
                    if Value.Offsets and Value.Offsets.Local and flags["Viewmodel Position"] then
                        Value.Offsets.Local = CheatTable.Locals.ToolInfoCache[Index].Offsets.Local * CFrame.new(
                            State,
                            flags["Viewmodel Position Y"],
                            flags["Viewmodel Position Z"]
                        )
                    end
                end
            end})
            
            section:Slider({Name = "Y pos", Flag = "Viewmodel Position Y", Minimum = -2, Maximum = 2, Default = 0, Decimals = 0.1, Style = "Full", Callback = function(State)
                flags["Viewmodel Position Y"] = State
                
                for Index, Value in next, CheatTable.Locals.ToolInfo do
                    if Value.Offsets and Value.Offsets.Local and flags["Viewmodel Position"] then
                        Value.Offsets.Local = CheatTable.Locals.ToolInfoCache[Index].Offsets.Local * CFrame.new(
                            flags["Viewmodel Position X"],
                            State,
                            flags["Viewmodel Position Z"]
                        )
                    end
                end
            end})
            
            section:Slider({Name = "Z pos", Flag = "Viewmodel Position Z", Minimum = -2, Maximum = 2, Default = 0, Decimals = 0.1, Style = "Full", Callback = function(State)
                flags["Viewmodel Position Z"] = State

                for Index, Value in next, CheatTable.Locals.ToolInfo do
                    if Value.Offsets and Value.Offsets.Local and flags["Viewmodel Position"] then
                        Value.Offsets.Local = CheatTable.Locals.ToolInfoCache[Index].Offsets.Local * CFrame.new(
                            flags["Viewmodel Position X"],
                            flags["Viewmodel Position Y"],
                            State
                        )
                    end
                end
            end})

            section:Toggle({ Name = "Bullet Tracers", Flag = "Bullet Tracers" })
            section:Toggle({ Name = "Hitmarkers", Flag = "Hitmarkers" })
            section:Toggle({ Name = "Hitlogs", Flag = "Hitlogs" })
            section:Toggle({ Name = "Hitsounds", Flag = "Hitsounds" })
            section:List({ Name = "Sound type", Flag = "Hitsound Type", Options = sounds })
        end

        local section = ui.tabs.visuals:Section({Name = "Main", Side = "Middle"}) do
            section:Toggle({ Name = "Enable", Flag = "Enable Xray", Info = "Enable Xray", Callback = function(state) 
                getgenv().xray_toggle = state 
            end })
            section:Keybind({ Flag = "Xray Keybind", Name = "Xray Keybind", Default = Enum.KeyCode.T, Mode = "Toggle", Callback = function() 
                if getgenv().xray_toggle then 
                    getgenv().xray_enabled = not getgenv().xray_enabled 
                    upd_xray(getgenv().xray_enabled) 
                end 
            end, Info = "Xray Keybind" })
            section:Slider({ Name = "Opacity", Flag = "Xray Opacity", Default = 50, Minimum = 0, Maximum = 100, Decimals = 1, Ending = "%", Callback = function(state) 
                getgenv().xray_opacity = state / 100 
                if getgenv().xray_toggle and getgenv().xray_enabled then 
                    upd_xray(true) 
                end 
            end})
        end 

        local section = ui.tabs.visuals:Section({Name = "World", Side = "Right"}) do 
            section:Toggle({ Name = "No Grass", Callback = function(state)
                sethiddenproperty(Workspace:FindFirstChildOfClass("Terrain"), "Decoration", not state)
            end })
            
            section:Toggle({ Name = "No Fog", Flag = "Enable No Fog" })
            
            section:Toggle({ Name = "Fullbright", Flag = "Enable Fullbright", Callback = function(state)
                lighting["GlobalShadows"] = state
            end })
            
            section:Toggle({ Name = "Ambient", Flag = "Enable Ambient" })
            
            section:Colorpicker({ Name = "Outdoor Ambient Color", Flag = "Outdoor Ambient Accent", Default = Color3.fromRGB(255, 255, 255) })
            
            section:Colorpicker({ Name = "Ambient Color", Flag = "Ambient Accent", Default = Color3.fromRGB(255, 255, 255) })
            
            section:List({ Name = "Skybox", Flag = "Skyboxes", Options = skys, Callback = function(state)
                if skyboxes[state] then
                    sky.SkyboxBk = "rbxassetid://" .. skyboxes[state][1]
                    sky.SkyboxDn = "rbxassetid://" .. skyboxes[state][2]
                    sky.SkyboxFt = "rbxassetid://" .. skyboxes[state][3]
                    sky.SkyboxLf = "rbxassetid://" .. skyboxes[state][4]
                    sky.SkyboxRt = "rbxassetid://" .. skyboxes[state][5]
                    sky.SkyboxUp = "rbxassetid://" .. skyboxes[state][6]
                end
            end, Info = "Change sky texture" })
        end 
    end 

    do -- Misc
        local section = ui.tabs.misc:Section({Name = "Rage", Side = "Left"}) do 
            section:Toggle({name = "Always Grounded",flag = "GroundedFeatures", Info = "Stay close to ground", callback = function(value)library.flags["Always Grounded"] = value library.flags["Shoot While Jumping"] = value end})
            section:Toggle({ Name = "Always Sprint", Flag = "Always Sprint", Info = "Run all the time" })
            section:Toggle({ Name = "Sprint While Attacking", flag = "Sprint While Attacking", callback = function(state) print("Sprint While Attacking set to:", state) end }) 
            section:Slider({ Name = "Sprint Speed", Flag = "Sprint Speed", Default = 27, Minimum = 0, Maximum = 40, Decimals = 0.01, Ending = "", Info = "Sprint Speed" })
            section:Toggle({ Name = "Fly", Flag = "Spiderclimb", Info = "Superpowers!" })
            section:Keybind({ Flag = "Spiderclimb Keybind", Name = "Fly Keybind", Default = Enum.KeyCode.Space, Mode = "Hold", Info = "Hold to climb walls" })
            section:Slider({ Name = "Fly Speed", Flag = "Spiderclimb Speed", Default = 0.75, Minimum = 0.5, Maximum = 10.0, Decimals = 0.01, Ending = "", Info = "How fast you climb" })
            section:Toggle({ Name = "Infinite Fly", Default = false, flag = "NoDamage", callback = function(state) ToggleNoDamage = state end })
            section:Toggle({ name = "Anti Fling", flag = "Enable Anti Fling", callback = function(state) ToggleAntiFling = state end })
            section:Toggle({ Name = "Anti Aim", Flag = "Anti Aim", Info = "Spinny" })
            section:Slider({ Name = "Anti Aim Speed", Flag = "Anti Aim Speed", Default = 50, Minimum = 1, Maximum = 100, Decimals = 1, Ending = "" })
            --section:Toggle({ Name = "Always crit", Flag = "always perfect farm", Default = false , Info = "Self explanatory" }) -- disabled :broken_heart:
            section:Toggle({ Name = "Insta loot", Flag = "Insta Loot", Default = false , Info = "Collect items quickly" }) -- gxentry additional bebi
            section:Toggle({ Name = "Silent Walk", Flag = "Silent Walk", Default = false , Info = "Be quietttt" })
            section:Toggle({ Name = "Manipulation", Flag = "zins_Enabled", Callback = function(val) flags["zins_Enabled"] = val if not val then ManipulationReset() end end })
            section:Keybind({ Flag = "zins_keybind", Name = "Keybind", Default = Enum.KeyCode.F, Mode = "Toggle", Info = "Self Explanatory"})
            section:Toggle({ Name = "BTR Teleport", Flag = "BTR Teleport", Info = "Teleport BTR to your character" })
            section:Keybind({ Flag = "Teleport Keybind", Name = "Teleport Keybind", Default = Enum.KeyCode.X, Mode = "Hold", Info = "Teleport BTR to yourself" })
            section:Toggle({ Name = "Random Anti Aim", Flag = "Random Anti Aim"}) -- disabled
            section:Keybind({ Flag = "Random Anti", Name = "Keybind", Info = "Random Key", Default = Enum.KeyCode.Z, Mode = "Toggle" })
        end
        
        local section = ui.tabs.misc:Section({Name = "Camera", Side = "Middle"}) do 
            section:Toggle({ Name = "Camera FOV", Flag = "FOV", Info = "Turn camera FOV on" })
            section:Slider({ Name = "Camera FOV Amount", Flag = "FOV Ammount", Default = 70, Minimum = 30, Maximum = 120, Decimals = 1, Ending = "x", Info = "Change camera view size" })
            section:Toggle({ Name = "Zoom", Flag = "Zoom", Info = "Turn zoom on off" })
            section:Keybind({ Flag = "Zoom Keybind", Name = "Zoom Keybind", Mode = "Hold", Info = "Hold key to zoom" })
            section:Slider({ Name = "Zoom Amount", Flag = "Zoom Ammount", Default = 30, Minimum = 5, Maximum = 70, Decimals = 1, Ending = "x", Info = "Set how far zooms" })
            section:Toggle({ Name = "Freecam", Flag = "Enable Freecam", Info = "Deattach from character" })
            section:Keybind({ Flag = "Freecam Keybind", Name = "Freecam Keybind", Default = Enum.KeyCode.K, Mode = "Toggle", Info = "Freecam Key" })
            section:Slider({ Name = "Freecam Speed", Flag = "Freecam Speed", Default = 2, Minimum = 0.5, Maximum = 10, Decimals = 0.1, Ending = "" })
            section:Slider({ Name = "Freecam Sensitivity", Flag = "Freecam Sensitivity", Default = 0.3, Minimum = 0.1, Maximum = 1, Decimals = 0.01, Ending = "" })
            section:Toggle({ Name = "Third Person", Flag = "Third Person", Info = "Self Explanatory" })
            section:Keybind({ Flag = "Third Person Key", Name = "Third Person Key", Default = Enum.KeyCode.J, Mode = "Toggle", Info = "Third Person Key" })
            section:Slider({ Name = "Third Person Distance", Flag = "Third Person Distance", Default = 5, Minimum = 1, Maximum = 10, Decimals = 0.1, Ending = "" })
        end
        
        local section = ui.tabs.misc:Section({Name = "Gun Mods", Side = "Right"}) do 
            section:Toggle({ Name = "Force Auto", Flag = "Force Auto", Default = false, Info = "Make all guns auto", Callback = function(state)
                if state then
                    for _, tbl in getgc(true) do
                        if type(tbl) ~= "table" then
                            continue
                        end
                        
                        local weapon_auto = rawget(tbl, "Auto")
                        if weapon_auto ~= nil then
                            if not gun_mods.old_auto[tbl] then
                                gun_mods.old_auto[tbl] = weapon_auto
                            end
            
                            tbl.Auto = true
                        end
                    end
                else
                    for tbl, v in gun_mods.old_auto do
                        tbl["Auto"] = v
                    end
                end
            end})

            local gun_mods = gun_mods or {}
            gun_mods.recoil_backup = gun_mods.recoil_backup or {}
            
            section:Toggle({ Name = "Recoil Control", Flag = "Recoil Control", Info = "Control weapon recoil", 
                Callback = function(state)
                    for _, tbl in getgc(true) do
                        if type(tbl) ~= "table" then
                            continue
                        end
                        
                        local recoil_start = rawget(tbl, "RecoilStart")
                        local recoil_finish = rawget(tbl, "RecoilFinish")
                        
                        if recoil_start and recoil_finish then
                            if not gun_mods.recoil_backup[tbl] then
                                gun_mods.recoil_backup[tbl] = {
                                    RecoilStart = recoil_start,
                                    RecoilFinish = recoil_finish
                                }
                            end
                            
                            if state then
                                rawset(tbl, "RecoilStart", function(...)
                                    local x, y = recoil_start(...)
                                    local reduction = flags["Recoil Reduction"] / 100
                                    return x * (1 - reduction), y * (1 - reduction)
                                end)
                                
                                rawset(tbl, "RecoilFinish", function(...)
                                    local x, y = recoil_finish(...)
                                    local reduction = flags["Recoil Reduction"] / 100
                                    return x * (1 - reduction), y * (1 - reduction)
                                end)
                            else
                                local backup = gun_mods.recoil_backup[tbl]
                                if backup then
                                    rawset(tbl, "RecoilStart", backup.RecoilStart)
                                    rawset(tbl, "RecoilFinish", backup.RecoilFinish)
                                    gun_mods.recoil_backup[tbl] = nil
                                end
                            end
                        end
                    end
                end
            })

            section:Slider({Name = "Recoil Percentage", Flag = "Recoil Reduction", Default = 100, Minimum = 0, Maximum = 100, Decimals = 1, Ending = "%", Info = "slidey recoil - amy was here"})

            section:Toggle({ Name = "No Spread", Flag = "No Spread", Info = "No bullet spread", Callback = function(state)
                for _, tbl in getgc(true) do
                    if type(tbl) ~= "table" then
                        continue
                    end
            
                    local spread_table = rawget(tbl, "Spread")
                    if spread_table and typeof(spread_table) == "table" then
                        for _, spread_stuff in spread_table do
                            for i, v in spread_stuff do
                                if type(v) == "number" then
                                    gun_mods.old_spread[spread_stuff] = gun_mods.old_spread[spread_stuff] or {}
                                    gun_mods.old_spread[spread_stuff][i] = gun_mods.old_spread[spread_stuff][i] or v
                                    spread_stuff[i] = state and 0 or gun_mods.old_spread[spread_stuff][i]
                                end
                            end
                        end
                    end
                end
            end})
            section:Toggle({ Name = "No Sway", Flag = "No Sway", Info = "No gun bob", Callback = function(state)
                if state then
                    for _, tbl in getgc(true) do
                        if type(tbl) ~= "table" then
                            continue
                        end
            
                        local vm_movement_mults = rawget(tbl, "VMMovementMults")
                        if vm_movement_mults then
                            for i, v in vm_movement_mults do
                                if not gun_mods.old_vm_mults[vm_movement_mults] then
                                    gun_mods.old_vm_mults[vm_movement_mults] = {}
                                end
            
                                if not gun_mods.old_vm_mults[vm_movement_mults][i] then
                                    gun_mods.old_vm_mults[vm_movement_mults][i] = v
                                end
            
                                vm_movement_mults[i] = 0
                            end
                        end
                    end
                else
                    for tbl, values in gun_mods.old_vm_mults do
                        for i, v in values do
                            tbl[i] = v
                        end
                    end
                end
            end})
            section:Toggle({ Name = "RPM", Flag = "Enable RPM", Default = false, Info = "Fire Rate", Callback = fast_fire_callback })
            section:Slider({ Name = "RPM Boost", Flag = "RPM Boost", Minimum = 1, Maximum = 3, Default = 0, Decimals = 0.1, Ending = "%", Callback = fast_fire_callback })
            section:Toggle({ Name = "Instant Bolt", Flag = "Instant Bolt", Info = "Remove Barret Delay"})
            section:Toggle({ Name = "Instant Hit", Flag = "Instant Hit", Info = "Instant Bullet", Callback = function(state)
                if state then
                    for _, tbl in getgc(true) do
                        if type(tbl) ~= "table" then
                            continue
                        end
            
                        local bullet_table = rawget(tbl, "Bullet")
                        if bullet_table and type(bullet_table) == "table" then
                            if not gun_mods.old_bullet_speeds[bullet_table] then
                                gun_mods.old_bullet_speeds[bullet_table] = bullet_table.Speed
                            end
                            bullet_table.Speed = 10000
                        end
                    end
                else
                    for tbl, speed_value in gun_mods.old_bullet_speeds do
                        tbl["Speed"] = speed_value
                    end
                end
            end})
            local gun_mods = {
                old_equip_anims = {},
                old_aim_down_speeds = {},
                old_melee_cooldowns = {}
            }



            section:Toggle({
                name = "Resolve Underground",
                default = false,
                flag = "ResolveUndergroundAA",
                callback = function(state)
                    print("Resolve Underground:", state)
                end
            })


            section:Toggle({
                name = "Stream Spoof",
                default = false,
                    callback = function(state)
                        local playerGui = game:GetService("Players").LocalPlayer.PlayerGui.Main
                        playerGui.Team.Visible = not state
                        playerGui.BuildVersion.Visible = not state
                        playerGui.ServerName.Visible = not state
                        library.flags["StreamSpoof"] = state
                        end
            })


            section:Toggle({ Name = "Wallbang", Flag = "Wallbang", Info = "Shoot through walls", Callback = function(state)
                if state then
                    if not getgenv().WallbangSystem then
                        getgenv().WallbangSystem = {
                            modifiedParts = {}
                        }
                        
                        getgenv().WallbangSystem.revertPart = function(character)
                            local data = getgenv().WallbangSystem.modifiedParts[character]
                            if data then
                                local part = data.part
                                if part and part.Parent then
                                    part.Size = data.originalSize
                                    part.CanQuery = false
                                    part.Transparency = data.originalTransparency
                                    if data.originalParent then
                                        part.Parent = data.originalParent
                                    end
                                end
                                getgenv().WallbangSystem.modifiedParts[character] = nil
                            end
                        end
                        
                        getgenv().WallbangSystem.applyWallbang = function(character)
                            if not character or not flags["Wallbang"] then
                                return
                            end
                            
                            local existingData = getgenv().WallbangSystem.modifiedParts[character]
                            if existingData then
                                local part = existingData.part
                                if not part or not part.Parent then
                                    getgenv().WallbangSystem.revertPart(character)
                                end
                            end
                            
                            local targetPart
                            
                            for _, descendant in pairs(character:GetDescendants()) do
                                if descendant.Name == "BarrelMain" and descendant:IsA("Part") and not descendant:IsA("MeshPart") then
                                    targetPart = descendant
                                    break
                                end
                            end
                            
                            if not targetPart then
                                targetPart = character:FindFirstChild("HairPart")
                                if targetPart and not targetPart:IsA("BasePart") then
                                    targetPart = nil
                                end
                            end
                            
                            if not targetPart then
                                local hairModel = character:FindFirstChild("Hair")
                                if hairModel then
                                    targetPart = hairModel:FindFirstChild("HairPart")
                                    if targetPart and not targetPart:IsA("BasePart") then
                                        targetPart = nil
                                    end
                                end
                            end
                            
                            if not targetPart then
                                for _, descendant in pairs(character:GetDescendants()) do
                                    if descendant.Name == "Handle" and descendant:IsA("BasePart") then
                                        targetPart = descendant
                                        break
                                    end
                                end
                            end
                            
                            if targetPart then
                                getgenv().WallbangSystem.modifiedParts[character] = {
                                    part = targetPart,
                                    originalParent = targetPart.Parent,
                                    originalSize = targetPart.Size,
                                    originalTransparency = targetPart.Transparency
                                }
                                
                                targetPart.Parent = character
                                targetPart.Transparency = 0.999
                                targetPart.CanQuery = true
                                targetPart.Size = Vector3.new(14, 14, 14)
                            end
                        end
                        getgenv().WallbangSystem.wallbangConnection = RunService.Heartbeat:Connect(function()
                            if not flags["Wallbang"] then
                                for character, _ in pairs(getgenv().WallbangSystem.modifiedParts) do
                                    getgenv().WallbangSystem.revertPart(character)
                                end
                                return
                            end
                            
                            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                                if player.Character and player ~= game:GetService("Players").LocalPlayer then
                                    getgenv().WallbangSystem.applyWallbang(player.Character)
                                end
                            end
                        end)
                    else
                        if getgenv().WallbangSystem.wallbangConnection then
                            getgenv().WallbangSystem.wallbangConnection:Disconnect()
                        end
                        
                        getgenv().WallbangSystem.wallbangConnection = RunService.Heartbeat:Connect(function()
                            if not flags["Wallbang"] then
                                for character, _ in pairs(getgenv().WallbangSystem.modifiedParts) do
                                    getgenv().WallbangSystem.revertPart(character)
                                end
                                return
                            end
                            
                            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                                if player.Character and player ~= game:GetService("Players").LocalPlayer then
                                    getgenv().WallbangSystem.applyWallbang(player.Character)
                                end
                            end
                        end)
                    end
                else
                    if getgenv().WallbangSystem and getgenv().WallbangSystem.wallbangConnection then
                        getgenv().WallbangSystem.wallbangConnection:Disconnect()
                        
                        for character, _ in pairs(getgenv().WallbangSystem.modifiedParts) do
                            getgenv().WallbangSystem.revertPart(character)
                        end
                    end
                end
            end})
            
            section:Toggle({ Name = "Instant Equip", Flag = "Instant Equip", Info = "Remove equip animation delay", Callback = function(state)
                if state then
                    for _, tbl in getgc(true) do
                        if type(tbl) ~= "table" then
                            continue
                        end
                        
                        if rawget(tbl, "EquipAnimSpeed") then
                            if not gun_mods.old_equip_anims[tbl] then
                                gun_mods.old_equip_anims[tbl] = tbl.EquipAnimSpeed
                            end
                            tbl.EquipAnimSpeed = 100
                        end
                    end
                else
                    for tbl, v in pairs(gun_mods.old_equip_anims) do
                        if tbl and v then
                            tbl["EquipAnimSpeed"] = v
                        end
                    end
                end
            end})

            section:Toggle({ Name = "Instant Aim", Flag = "Instant Aim", Info = "self explanatory", Callback = function(state)
                if state then
                    for _, tbl in getgc(true) do
                        if type(tbl) ~= "table" then
                            continue
                        end

                        local aim_down_speeds = rawget(tbl, "AimDownSpeed")
                        if aim_down_speeds and type(aim_down_speeds) == "table" then
                            for i, v in aim_down_speeds do
                                if not gun_mods.old_aim_down_speeds[aim_down_speeds] then
                                    gun_mods.old_aim_down_speeds[aim_down_speeds] = {}
                                end

                                if not gun_mods.old_aim_down_speeds[aim_down_speeds][i] then
                                    gun_mods.old_aim_down_speeds[aim_down_speeds][i] = v
                                end
                                aim_down_speeds[i] = 0
                            end
                        end
                    end
                else
                    for tbl, values in gun_mods.old_aim_down_speeds do
                        for i, v in values do
                            tbl[i] = v
                        end
                    end
                end
            end})

            local old_ranges = {}
            section:Toggle({ Name = "Extend Melee Range", Flag = "Extend Melee Range", Info = "self explanatory", Callback = function(state)
                for _, tbl in getgc(true) do
                    if type(tbl) ~= "table" then
                        continue
                    end

                    local current_range = rawget(tbl, "Range")
                    if current_range and rawget(tbl, "Offset") then
                        if not old_ranges[tbl] then
                            old_ranges[tbl] = current_range
                        end

                        if state then
                            tbl.Range = old_ranges[tbl] * flags["Melee Range Multiplier"]
                        else
                            tbl.Range = old_ranges[tbl]
                        end
                    end
                end
            end})

            section:Slider({ Name = "Range Multiplier", Flag = "Melee Range Multiplier", Default = 1, Minimum = 1, Maximum = 4, Decimals = 0.1, Ending = "x", Info = "self explanatory", Callback = function(value)
                if flags["Extend Melee Range"] then
                    for _, tbl in getgc(true) do
                        if type(tbl) ~= "table" then
                            continue
                        end

                        local current_range = rawget(tbl, "Range")
                        if current_range and rawget(tbl, "Offset") then
                            if not old_ranges[tbl] then
                                old_ranges[tbl] = current_range
                            end
                            tbl.Range = old_ranges[tbl] * value
                        end
                    end
                end
            end})

            section:Toggle({ Name = "Melee Speed", Flag = "Melee Speed", Info = "self explanatory", Callback = function(state)
                if state then
                    for _, tbl in getgc(true) do
                        if type(tbl) ~= "table" then
                            continue
                        end

                        local current_cooldown = rawget(tbl, "Cooldown")
                        if current_cooldown then
                            if not gun_mods.old_melee_cooldowns[tbl] then
                                gun_mods.old_melee_cooldowns[tbl] = current_cooldown
                            end

                            if state then
                                tbl.Cooldown = gun_mods.old_melee_cooldowns[tbl] / flags["Melee Speed Multiplier"]
                            else
                                tbl.Cooldown = gun_mods.old_melee_cooldowns[tbl]
                            end
                        end
                    end
                else
                    for tbl, cooldown in gun_mods.old_melee_cooldowns do
                        tbl.Cooldown = cooldown
                    end
                end
            end})

            section:Slider({ Name = "M Speed Multiplier", Flag = "Melee Speed Multiplier", Default = 1, Minimum = 1, Maximum = 2.0, Decimals = 0.1, Ending = "x", Info = "self explanatory", Callback = function(value)
                if flags["Melee Speed"] then
                    for _, tbl in getgc(true) do
                        if type(tbl) ~= "table" then
                            continue
                        end

                        local current_cooldown = rawget(tbl, "Cooldown")
                        if current_cooldown then
                            if not gun_mods.old_melee_cooldowns[tbl] then
                                gun_mods.old_melee_cooldowns[tbl] = current_cooldown
                            end
                            tbl.Cooldown = gun_mods.old_melee_cooldowns[tbl] / value
                        end
                    end
                end
            end})
        end 
    end 

    do --[[ config section]] 
        local settings = ui.window:Page({name = "Settings", icon = "rbxassetid://8547256547"})
        local section = settings:Section({name = "CONFIGS", side = "left"})
        config_holder = section:List({name = "Configs", info = "Config Selector", flag = "config_name_list", callback = function(opt)
            if cfg_name then 
                cfg_name.set(opt)
            end 
        end}) library:update_config_list() 
        cfg_name = section:textbox({name = "Config name", flag = "config_name_text_box"})

        section:button({name = "Create", callback = function()
            if flags["config_name_text_box"] == "" then 
                return 
            end 

            writefile(library.directory .. "/configs/" .. flags["config_name_text_box"] .. ".cfg", library:get_config())

            library:update_config_list()
        end})

        section:button({name = "Delete", callback = function()
            if flags["config_name_text_box"] == "" then 
                return 
            end 
            
            delfile(library.directory .. "/configs/" .. flags["config_name_text_box"] .. ".cfg")
            library:update_config_list()
        end})

        section:button({name = "Load", callback = function()
            if flags["config_name_text_box"] == "" then 
                return 
            end 

            library:load_config(readfile(library.directory .. "/configs/" .. flags["config_name_text_box"] .. ".cfg"))
        end})

        section:button({name = "Save", callback = function()
            if flags["config_name_text_box"] == "" then 
                return 
            end 
            
            writefile(library.directory .. "/configs/" .. flags["config_name_text_box"] .. ".cfg", library:get_config())
            library:update_config_list()
        end})

        section:button({name = "Refresh configs", callback = function()
            library:update_config_list()
        end}); library:update_config_list()

        local old_config;

        local section = settings:Section({name = "OTHER", side = "middle"})
        section:button({name = "Unload Config", callback = function()
            library:load_config(old_config)
        end})

        section:button({name = "Unload Menu", callback = function()
            library:unload_menu()
        end})

        section:Colorpicker({name = "Accent", info = "Customizes Menu Color", color = themes.preset.accent, callback = function(color) if color == rgb(255, 255, 255) then return end library:update_theme("accent", color) end})
        section:Toggle({name = "Keybind list", info = "Shows keybinds enabled.", default = false, flag = "keybind_list", callback = function(bool) ui.window.keybind_list.Visible = bool end})
        section:Toggle({name = "Info list", info = "Shows information list.", default = false, flag = "info_list", callback = function(bool) ui.window.info_list.Visible = bool end})
        section:Keybind({name = "UI Bind", info = "Toggles the menu", default = true, ignore = true, callback = function(bool) ui.window.items[ "main" ].Visible = bool  end})
    end;

    old_config = library:get_config()
-- 

-- Libraries
    do -- functions
        player_esp.functions.create_drawing = function(class, prop, ...)
            local inst = (typeof(class) == "string") and (Instance.new(class)) or (class)
            for property, val in pairs(prop) do
                inst[property] = val
            end
            for _, t in { ... } do
                table.insert(t, inst)
            end
            return inst
        end

        player_esp.functions.get_armor_icon = function(Character)
            local icons = {}
        
            for _, child in ipairs(Character:GetChildren()) do
                if child and child.Name then
                    local armorNumber, skinName = child.Name:match("Armor_(%d+)/(.*)")
                    if armorNumber then
                        local key = tonumber(armorNumber)
                        if key then
                            local item = items_table[key]
                            if item and item.Type == "Armor" and item.Image then
                                if type(item.Image) == "table" then
                                    if skinName and item.Image[skinName] then
                                        table.insert(icons, item.Image[skinName])
                                    elseif item.Image.Default then
                                        table.insert(icons, item.Image.Default)
                                    end
                                elseif type(item.Image) == "string" then
                                    table.insert(icons, item.Image)
                                end
                            end
                        end
                    end
                end
            end
        
            if #icons > 0 then
                return icons
            end
        
            return nil
        end; 

        player_esp.functions.get_boundings = function(model)
            local hrp = model:FindFirstChild("HumanoidRootPart")
            if hrp then
                local cframe, size = model:GetBoundingBox()
                size = Vector3.new(math.min(size.X, 4), math.min(size.Y, 6), math.min(size.Z, 5))
                return hrp.CFrame, size, hrp.Position
            end
            return nil
        end

        player_esp.functions.is_visible = function(character)
            if not character or character == local_player.Character then
                return false
            end

            local part = character.PrimaryPart
            if not part then
                return false
            end

            local raycast_params = RaycastParams.new()
            raycast_params.FilterType = Enum.RaycastFilterType.Blacklist
            local ignore_list = { local_player.Character, camera }

            if folder then
                for _, model in ipairs(folder:GetChildren()) do
                    if model:IsA("Model") then
                        table.insert(ignore_list, model)
                    end
                end
            end

            raycast_params.FilterDescendantsInstances = ignore_list

            local RaycastResult =
            Workspace:Raycast(camera.CFrame.p, (part.Position - camera.CFrame.p).Unit * 10000, raycast_params)
            return RaycastResult and RaycastResult.Instance and RaycastResult.Instance:IsDescendantOf(character)
        end

        player_esp.functions.is_visible2 = function(character)
            if not character or character == local_player.Character then
                return false
            end
        
            local character_model = character.Character
            if not character_model then
                return false
            end
        
            local part = character_model:FindFirstChild("HumanoidRootPart")
            if not part then
                return false
            end
        
            local raycast_params = RaycastParams.new()
            raycast_params.FilterType = Enum.RaycastFilterType.Blacklist
            local ignore_list = { local_player.Character, camera }
        
            if folder then
                for _, model in ipairs(folder:GetChildren()) do
                    if model:IsA("Model") then
                        table.insert(ignore_list, model)
                    end
                end
            end
        
            raycast_params.FilterDescendantsInstances = ignore_list
        
            local RaycastResult = Workspace:Raycast(camera.CFrame.p, (part.Position - camera.CFrame.p).Unit * 10000, raycast_params)
        
            return RaycastResult and RaycastResult.Instance and RaycastResult.Instance:IsDescendantOf(character_model)
        end    

        local function YallahCheckTeam(player)
            if not player then
                return false
            end
        
            if player.Neutral then
                return getrenv().shared.cachedTeamModels[player.UserId]
            end
        
            return player.Team == local_player.Team
        end

        local function cache_character_parts(character)
                return {
                    "Head",
                    "UpperTorso",
                    "LowerTorso",
                    "LeftUpperArm",
                    "RightUpperArm",
                    "LeftLowerArm",
                    "RightLowerArm",
                    "LeftLeg",
                    "RightLeg",
                    "LeftFoot",
                    "RightFoot",
                }
        end

        player_esp.functions.get_player = function()
            target_Paradox.target.entry = nil
            target_Paradox.target.part = nil
            target_Paradox.target.distance = flags["Enable FOV"] 
                    and flags["FOV Radius"] / math.tan(math.rad(camera.FieldOfView / 2))
                    or math.huge
    
            local mouse_position, cam_position = uis:GetMouseLocation(), camera.CFrame.Position
            local closest_entry, closest_part = nil, nil
            local part_cache = {}
            local ignore_team_check = #teams == 0 or (#teams == 1 and flags["Friendly Check"])
    
            for _, cache in next, player_esp.drawing_cache do
                local player = cache.player

                if player == local_player then
                    continue
                end
                local character = cache.type == "Player" and player.Character or player
                local checkteam = cache.type == "Player" and YallahCheckTeam(player) or false
                if character and character:FindFirstChild("Humanoid") then
                    if flags["Friendly Check"] and checkteam then
                        continue
                    end
    
                    if not part_cache[player] then
                        part_cache[player] = cache_character_parts(character)
                    end
    
                    local bones_to_check = flags["Aimbot Bone"] == "Closest Bone" and part_cache[player]
                            or { flags["Aimbot Bone"] }
                    for _, part_name in ipairs(bones_to_check) do
                        local part = character:FindFirstChild(part_name)
                        if part then
                            local screen_pos, on_screen = camera:WorldToViewportPoint(part.Position)
                            if on_screen then

                                local mouse_distance = (Vector2.new(screen_pos.X, screen_pos.Y) - Vector2.new(
                                        mouse_position.X,
                                        mouse_position.Y
                                )).Magnitude
                                local distance_to_target = (part.Position - cam_position).Magnitude
                                local is_part_visible = not flags["Visible Check"]
                                        or (player ~= local_player and player_esp.functions.is_visible(character))
                                if
                                distance_to_target <= (flags["Aimbot Max Distance"] or math.huge) and is_part_visible
                                then
                                    if
                                    mouse_distance < target_Paradox.target.distance
                                            or (
                                            mouse_distance == target_Paradox.target.distance
                                                    and distance_to_target
                                                    < (target_Paradox.target.part and (
                                                    target_Paradox.target.part.Position - cam_position
                                            ).Magnitude or math.huge)
                                    )
                                    then
                                        closest_entry = player
                                        closest_part = part
                                        target_Paradox.target.distance = mouse_distance
                                    end
                                end
                            end
                        end
                    end
                end
            end
    
            return closest_entry, closest_part, cache.type
        end

        player_esp.functions.get_tool = function(Character)
            for _, value in pairs(Character:GetChildren()) do
                if
                value.Name ~= "HolsterModel"
                        and value:IsA("Model")
                        and value.Name ~= "Hair"
                        and (value:FindFirstChild("Detail") or value:FindFirstChild("Main") or value:FindFirstChild("Handle") or value:FindFirstChild(
                        "Attachments"
                ) or value:FindFirstChild("ArrowAttach") or value:FindFirstChild("Attach"))
                        and value.PrimaryPart
                then
                    return value.Name
                end
            end
            return "None"
        end
    end

    -- Bullet manipulation
        runService.RenderStepped:Connect(function(deltaTime)
            if flags["zins_Enabled"] and flags["zins_keybind"].active then
                if not remake.enabled then
                    remake.enabled = true
                    local root = remake.character:FindFirstChild("HumanoidRootPart")
                    if root then
                        root.Anchored = true
                        remake.startPosition = root.Position
                        remake.remakePosition = root.Position
                        remake.startReplica = createClone(remake.character, FORCEFIELD_COLOR)
                        if SHOW_DISTANCE_TEXT then
                            remake.distanceText.Visible = true
                        end
                    end
                end
            else
                if remake.enabled then
                    ManipulationReset()
                end
            end

            local root = remake.character and remake.character:FindFirstChild("HumanoidRootPart")

            if flags["Random Anti Aim"] and flags["Random Anti"].active then
                local range = flags["Random Range Anti"] or 10
                local randomRotation = math.random(-360, 360)
                local randomMovement = Vector3.new(
                    math.random(-range, range),
                    0,
                    math.random(-range, range)
                )
                root.CFrame += randomMovement
                root.CFrame = root.CFrame * CFrame.Angles(math.rad(randomRotation), math.rad(randomRotation), math.rad(randomRotation))
            end 

            if remake.enabled then
                if root then
                    local dir = Vector3.new()
                    if uis:IsKeyDown(Enum.KeyCode.W) then dir += Vector3.new(0, 0, -1) end
                    if uis:IsKeyDown(Enum.KeyCode.A) then dir += Vector3.new(-1, 0, 0) end
                    if uis:IsKeyDown(Enum.KeyCode.S) then dir += Vector3.new(0, 0, 1) end
                    if uis:IsKeyDown(Enum.KeyCode.D) then dir += Vector3.new(1, 0, 0) end
        
                    if dir.Magnitude > 0 then
                        dir = dir.Unit * WALK_SPEED * deltaTime
                    end
        
                    local newPos = root.Position + root.CFrame:VectorToWorldSpace(dir)
                    local dist = (newPos - remake.startPosition).Magnitude
                    if dist > MAX_DISTANCE then
                        newPos = remake.startPosition + (newPos - remake.startPosition).Unit * MAX_DISTANCE
                    end
        
                    root.CFrame = CFrame.new(newPos)
                    remake.remakePosition = newPos
        
                    if SHOW_DISTANCE_TEXT then
                        local d = (remake.remakePosition - remake.startPosition).Magnitude
                        remake.distanceText.Text = string.format("Manipulating: %.2f", d)
                        remake.distanceText.Color = Color3.new(1, 1, 1)
                    end
                end
            end
        end)
    -- 

    -- Silent step 
        local old_toggle_footstep = sound_table.ToggleFootstep;
        local old_play_sound = sound_table.PlaySound;
        sound_table.ToggleFootstep = function(_, character, sound, playback_speed)
            if flags["Silent Walk"] and sound then
                return sound_table:StopSound(sound);
            end;
            return old_toggle_footstep(_, character, sound, playback_speed);
        end;
        sound_table.PlaySound = function(_, sound, is_duplicate, playback_speed)
            if sound and sound.Name == "WalkWater" and flags["Silent Walk"] then
                return sound_table:StopSound(sound);
            end;
            return old_play_sound(_, sound, is_duplicate, playback_speed);
        end;
    -- 

    -- Fov circle
        local FieldOfView = player_esp.functions.create_drawing("ScreenGui", { Parent = cloneref(gethui()), IgnoreGuiInset = true })
        local Frame = player_esp.functions.create_drawing("Frame", {
            Visible = false,
            BackgroundTransparency = 1,
            BackgroundColor3 = Color3.new(1, 1, 1),  -- white as default
            Size = UDim2.new(0, (flags["FOV Radius"] or 120) * 2, 0, (flags["FOV Radius"] or 120) * 2),
            Position = UDim2.new(0, 0, 0, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Parent = FieldOfView,
            ZIndex = 2,
        })
        local UICorner = player_esp.functions.create_drawing("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame })
        local Stroke = player_esp.functions.create_drawing(
                "UIStroke",
                { Color = Color3.new(1, 1, 1), Thickness = 2, Transparency = 0, Parent = Frame }
        )
        -- returns
        fov_circle.FieldOfView = FieldOfView
        fov_circle.Frame = Frame
        fov_circle.Stroke = Stroke
    -- 

    -- Snap lines
        local snaplines = player_esp.functions.create_drawing("ScreenGui", { Parent = cloneref(gethui()), IgnoreGuiInset = true })
        local line = player_esp.functions.create_drawing("Frame", {
            BackgroundTransparency = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BorderSizePixel = 0,
            ZIndex = 2,
            Parent = snaplines,
        })
        -- returns
        snap_lines.snaplines = snaplines
        snap_lines.line = line
    -- 

    -- Inventory Viewer 
        local inventory_view = player_esp.functions.create_drawing("ScreenGui", { Parent = cloneref(gethui()), IgnoreGuiInset = true })
        local background = player_esp.functions.create_drawing("Frame", { BackgroundTransparency = 0, Size = UDim2.new(0, 400, 0, 15), BackgroundColor3 = Color3.fromRGB(9, 9, 9), AnchorPoint = Vector2.new(0.5, 0.5), BorderSizePixel = 0, ZIndex = 99, Parent = inventory_view })
        local icon_holder = player_esp.functions.create_drawing("Frame", { BackgroundTransparency = 1, Size = UDim2.new(0, 900, 0, 75), BackgroundColor3 = Color3.fromRGB(9, 9, 9), AnchorPoint = Vector2.new(0.5, 0.5), BorderSizePixel = 0, ZIndex = 99, Parent = inventory_view })
        local name = player_esp.functions.create_drawing("TextLabel", { BackgroundTransparency = 0, AnchorPoint = Vector2.new(0.5, 0.5), BorderSizePixel = 0, ZIndex = 999, TextColor3 = Color3.fromRGB(255, 255, 255), TextStrokeTransparency = 0, TextStrokeColor3 = Color3.fromRGB(0, 0, 0), TextSize = 10, FontFace = fonts.esp, Parent = background, Position = UDim2.new(0.5, 0, 0.5, 0), TextXAlignment = Enum.TextXAlignment.Center, TextYAlignment = Enum.TextYAlignment.Center })

        player_esp.functions.create_drawing("UIListLayout", {
            Parent = icon_holder,
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
        });
    
        info_viewer.inventory_view = inventory_view
        info_viewer.background = background
        info_viewer.icon_holder = icon_holder
        info_viewer.name = name
    -- 

    local zoom_state = {
        current_fov = 70,
        target_fov = 70,
        is_zooming = false,
        animation_speed = 0.1 -- higher = faster
    }

    do -- FOV AND ZOOM CACHING
        local old_setting = settings_table.GetSetting
        do -- funcs
            settings_table.GetSetting = function(cat, set, ...)
                if set == "Field Of View" then
                    if flags["Zoom"] and flags["Zoom Keybind"].active then
                        zoom_state.target_fov = flags["Zoom Ammount"]
                    elseif flags["FOV"] then
                        zoom_state.target_fov = flags["FOV Ammount"]
                    else
                        zoom_state.target_fov = 70
                    end
    
                    zoom_state.current_fov = zoom_state.current_fov + (zoom_state.target_fov - zoom_state.current_fov) * zoom_state.animation_speed
    
                    return zoom_state.current_fov
                end
                return old_setting(cat, set, ...)
            end
        end
    end
    -- 

    -- gxentry library
        local gxentry = {}

        function gxentry:Instance(ClassName, Properties)
            local Instance = Instance.new(ClassName)
        
            for Index, Value in next, Properties do
                Instance[Index] = Value
            end
        
            return Instance
        end
        
        function gxentry:CreateBeam(Origin, Direction)
            local Tracer = gxentry:Instance("Model", { Parent = workspace })
            local Beam = gxentry:Instance("Beam", {
                FaceCamera = true,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                    ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)),
                }),
                LightEmission = 0,
                LightInfluence = 0,
                Width0 = 0.75,
                Width1 = 0.75,
                Texture = "rbxassetid://446111271",
                TextureLength = 30,
                TextureMode = Enum.TextureMode.Wrap,
                TextureSpeed = 1,
                Parent = Tracer,
                Brightness = 150,
                Attachment0 = gxentry:Instance("Attachment", {
                    Parent = gxentry:Instance("Part", {
                        Position = Origin,
                        Anchored = true,
                        Transparency = 1,
                        CanCollide = false,
                        Parent = Tracer,
                        Size = Vector3.new(0.001, 0.001, 0.001),
                    }),
                }),
                Attachment1 = gxentry:Instance("Attachment", {
                    Parent = gxentry:Instance("Part", {
                        Position = Direction,
                        Anchored = true,
                        Transparency = 1,
                        CanCollide = false,
                        Parent = Tracer,
                        Size = Vector3.new(0.001, 0.001, 0.001),
                    }),
                }),
            })
        
            task.delay(5, function()
                Tracer:Destroy()
            end)
        
            return Tracer
        end
        
        function gxentry:CreateHitmarker(Direction)
            local ProtectedModel = gxentry:Instance("Model", { Parent = workspace })
        
            local HitmarkerPart = gxentry:Instance("Part", {
                Position = Direction,
                Size = Vector3.new(0.1, 0.1, 0.1),
                Transparency = 1,
                CanCollide = false,
                Anchored = true,
                Parent = ProtectedModel,
            })
        
            local HitmarkerGui = gxentry:Instance("BillboardGui", {
                Size = UDim2.new(0, 20, 0, 20),
                AlwaysOnTop = true,
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
                Parent = HitmarkerPart,
            })
        
            local HitmarkerData = {
                { UDim2.new(0, 7, 0, 1), UDim2.new(0, 0, 0.35, -6), 45 },
                { UDim2.new(0, 7, 0, 1), UDim2.new(0, 0, 0.35, 4), -45 },
                { UDim2.new(0, 7, 0, 1), UDim2.new(1, -10, 0.35, -6), -45 },
                { UDim2.new(0, 7, 0, 1), UDim2.new(1, -10, 0.35, 4), 45 },
            }
        
            for _, Data in next, HitmarkerData do
                local Line = gxentry:Instance("Frame", {
                    Size = Data[1],
                    BackgroundColor3 = Color3.new(1, 1, 1),
                    BackgroundTransparency = 0,
                    BorderSizePixel = 1,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Position = Data[2],
                    Rotation = Data[3],
                    Parent = HitmarkerGui,
                })
            end
        
            task.delay(5, function()
                for Index = 1, 100 do
                    for _, Object in pairs(HitmarkerGui:GetChildren()) do
                        if Object:IsA("Frame") then
                            Object.BackgroundTransparency = Index / 100
                        end
                    end
        
                    task.wait()
                end
        
                HitmarkerGui:Destroy()
                HitmarkerPart:Destroy()
                ProtectedModel:Destroy()
            end)
        end
        
        function gxentry:CreateSound()
            local selected_sound = flags["Hitsound Type"];
            local sound_id = hit_sounds[selected_sound];
        
            local Sound = gxentry:Instance("Sound", {
                Parent = workspace,
                SoundId = sound_id,
                Volume = 5,
                PlayOnRemove = true,
            })
        
            Sound:Destroy()
        end
        
        gxentry.Bodyparts = {
            "HumanoidRootPart",
            "LowerTorso",
            "UpperTorso",
            "LeftLeg",
            "RightLeg",
            "LeftArm",
            "RightArm",
            "Head",
            "Neck",
            "LeftHand",
            "RightHand",
            "LeftFoot",
            "RightFoot",
            "LeftLowerArm",
            "RightLowerArm",
            "LeftUpperArm",
            "RightUpperArm",
            "LeftLowerLeg",
            "RightLowerLeg",
            "LeftUpperLeg",
            "RightUpperLeg",
        }

        gxentry.QuickStackItems = {}
    -- 
-- 

-- priority functions 
do -- viewmodel chams
        local old_materials, old_texture, old_colors = {}, {}, {};
        local revert = function()
            for child, material in old_materials do child.Material = material end
            for child, color in old_colors do child.Color = color end
            for child, texture in old_texture do child.TextureID = texture end
            table.clear(old_materials)
            table.clear(old_texture)
            table.clear(old_colors)
        end;
        local chams; chams = function(folder)
            for _, child in folder:GetChildren() do
                if child:IsA("BasePart") then 
                    if (folder.Name == "Arms" and flags["Arm Chams"]) or (folder.Name == "Weapon" and flags["Weapon Chams"]) then
                        old_materials[child] = child.Material
                        old_colors[child] = child.Color
                        if child:IsA("MeshPart") then 
                            old_texture[child] = child.TextureID
                        end
                        
                        child.Color = flags["Custom Model Accent"].Color
                        child.Material = Enum.Material[flags["Custom Model Material"]]    
                        if child:IsA("MeshPart") then 
                            local selectedTexture = flags["TexturesIDS"]
                            local textureID = custom_textures[selectedTexture] or ""
                        
                            if typeof(textureID) == "string" and textureID ~= "" then
                                child.TextureID = textureID
                            else
                                child.TextureID = ""
                            end;
                        end;
                    end;
                end;
                if child:IsA("Model") then chams(child) end
                if child.Name == "Attachments" then
                    chams(child)
                    child.ChildAdded:Connect(function()
                        chams(child)
                    end);
                end;
            end;
        end;
        local chams_handler = function(model)
            revert()
            for _, folder in model:GetChildren() do
                if (folder.Name == "Weapon" and flags["Weapon Chams"]) or (folder.Name == "Arms" and flags["Arm Chams"]) then
                    chams(folder)
                    folder.ChildAdded:Connect(function() chams(folder) end)
                end;
            end;
        end;
        folder.ChildAdded:Connect(function(model) 
            model.ChildAdded:Connect(function() chams_handler(model) end)
            chams_handler(model)
        end);
    end;
    do -- hide viewmodel
        local hide_viewmodel = function(folder)
            if not (folder.Name == "Weapon" or folder.Name == "Arms") then return end;
        
            if flags["Hide Viewmodel"] then
                for _, v in ipairs(folder:GetDescendants()) do 
                    if v:IsA("BasePart") or v:IsA("Part") or v:IsA("MeshPart") then
                        v.Transparency = 1
                    end
                end
            end
        end;
        
        local hide_viewmodel_handler = function(model)
            for _, folder in model:GetChildren() do
                if folder.Name == "Weapon" or folder.Name == "Arms" then
                    hide_viewmodel(folder);
                    folder.ChildAdded:Connect(function() hide_viewmodel(folder) end);
                end;
            end;
        end;
        
        folder.ChildAdded:Connect(function(model)
            model.ChildAdded:Connect(function() hide_viewmodel_handler(model) end);
            hide_viewmodel_handler(model);
        end);
    end;

    -- Character esp
        local function esp_for_character(character, nameFlag, healthFlag, distanceFlag, colorFlag)
            local player = game:GetService("Players").LocalPlayer
            local runService = game:GetService("RunService")
            local camera = workspace.CurrentCamera
            local hrp = character:FindFirstChild("HumanoidRootPart")
            local hum = character:FindFirstChildOfClass("Humanoid")
            
            if hrp and hum then
                local text = Drawing.new("Text")
                text.Color = flags[colorFlag].Color 
                text.Size = 14
                text.Center = true
                text.Outline = true
                text.Visible = true

                local connec

                table.insert(player_esp.drawing_cache, {
                    label = text,
                    update_conn = connec,
                    type = "NPC",
                    player = character, -- character = player here gng
                })
        
        
                connec = runService.RenderStepped:Connect(function()
                    if not character:IsDescendantOf(workspace) or hum.Health <= 0 then
                        text:Remove()
                        connec:Disconnect()
                        for _, cache in next, player_esp.drawing_cache do
                            if cache.player == character then
                                if cache.update_conn then
                                    cache.update_conn:Disconnect()
                                end
                                cache.label:Destroy()
                                table.remove(player_esp.drawing_cache, _)
                                break
                            end
                        end
                        return
                    end
        
                    if (character.Name:lower() == "soldier" and not flags["soldier_Name"]) or ((character.Name == "Bruno" or character.Name == "Boris") and not flags["boss_Name"]) then
                        text.Visible = false
                    else
                        local head_pos = hrp.Position + Vector3.new(0, 3, 0)
                        local text_screen, on_screen = camera:WorldToViewportPoint(head_pos)
        
                        local displayText = ""
                        if flags[nameFlag] then displayText = displayText .. character.Name end
                        if healthFlag and flags[healthFlag] then
                            if character.Name:lower() == "soldier" then
                                displayText = string.format("Soldier - %d HP", math.floor(hum.Health))
                            else
                                displayText = string.format("%s - %d HP", character.Name, math.floor(hum.Health))
                            end
                        end
                        if distanceFlag and flags[distanceFlag] then
                            local distance = math.floor((hrp.Position - camera.CFrame.Position).Magnitude)
                            displayText = displayText .. string.format(" - %d s", distance)
                        end
        
                        text.Position = Vector2.new(text_screen.X, text_screen.Y)
                        text.Text = displayText
                        text.Visible = on_screen
                        text.Color = flags[colorFlag].Color
                    end
                end)
            end
        end

        do -- zoom animation
            if flags["Zoom"] and flags["Zoom Keybind"].active then
                zoom_state.is_zooming = true
            else
                zoom_state.is_zooming = false
            end
        end

        local function initialize_esp()
            for _, character in ipairs(workspace:GetDescendants()) do
                if character:IsA("Model") and (character.Name:lower() == "soldier" or character.Name == "Bruno" or character.Name == "Boris") then
                    if character.Name:lower() == "soldier" then
                        esp_for_character(character, "soldier_Name", "soldier_Health", "soldier_Distance", "soldier_Color")
                    elseif character.Name == "Bruno" or character.Name == "Boris" then
                        esp_for_character(character, "boss_Name", "soldier_Health", "soldier_Distance", "boss_Color")
                    end
                end
            end

            workspace.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "Head" and descendant.Parent and descendant.Parent:FindFirstChildOfClass("Humanoid") then
                    if descendant.Parent.Name == "Soldier" then
                        esp_for_character(descendant.Parent, "soldier_Name", "soldier_Health", "soldier_Distance", "soldier_Color")
                    elseif descendant.Parent.Name == "Bruno" or descendant.Parent.Name == "Boris" then
                        esp_for_character(descendant.Parent, "boss_Name", "soldier_Health", "soldier_Distance", "boss_Color")
                    end
                end
            end)
        end
        
        initialize_esp()
    -- 
    local Protected = Instance.new("ScreenGui", gethui())
    Protected.IgnoreGuiInset = true

local CrosshairHolder = gxentry:Instance("Frame", {BorderColor3 = Color3.fromRGB(0, 0, 0), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, Position = UDim2.new(0.5, 0, 0.5, 0), Parent = Protected})
local CrosshairTop = gxentry:Instance("Frame", {AnchorPoint = Vector2.new(0.5, 1), BorderColor3 = Color3.fromRGB(0, 0, 0), Parent = CrosshairHolder})
local CrosshairRight = gxentry:Instance("Frame", {AnchorPoint = Vector2.new(0, 0.5), BorderColor3 = Color3.fromRGB(0, 0, 0), Parent = CrosshairHolder})
local CrosshairLeft = gxentry:Instance("Frame", {AnchorPoint = Vector2.new(1, 0.5), BorderColor3 = Color3.fromRGB(0, 0, 0), Parent = CrosshairHolder})
local CrosshairBottom = gxentry:Instance("Frame", { AnchorPoint = Vector2.new(0.5, 0), BorderColor3 = Color3.fromRGB(0, 0, 0), Parent = CrosshairHolder})

-- main loops 
    run_service.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
        if show_hit_notification then
            notifications:create_notification({
                name = "Bullet hit " .. hit_target_name .. " in the " .. hit_part_name
            })
            show_hit_notification = false
        end

        entry, closest_part, typeplayer = player_esp.functions.get_player()

        do -- update target
            if closest_part and (closest_part ~= target_Paradox.target.part) then
                target_Paradox.target.part = closest_part
                target_Paradox.target.entry = entry
                target_Paradox.target.distance = (closest_part.Position - camera.CFrame.Position).Magnitude
            end
        end

        do -- crosshair
            if flags["Crosshair Enabled"] then
                CrosshairHolder.Rotation = flags["Crosshair Spin"] and CrosshairHolder.Rotation + flags["Crosshair Speed"] / 100 or 0
    
                CrosshairTop.Position = UDim2.new(0.5, 0, 0, -flags["Crosshair Spread"] / 2)
                CrosshairRight.Position = UDim2.new(1, flags["Crosshair Spread"] / 2, 0.5, 0)
                CrosshairLeft.Position = UDim2.new(0, -flags["Crosshair Spread"] / 2, 0.5, 0)
                CrosshairBottom.Position = UDim2.new(0.5, 0, 1, flags["Crosshair Spread"] / 2)
            
                CrosshairTop.Size = UDim2.new(0, flags["Crosshair Width"], 0, flags["Crosshair Length"])
                CrosshairRight.Size = UDim2.new(0, flags["Crosshair Length"], 0, flags["Crosshair Width"])
                CrosshairLeft.Size = UDim2.new(0, flags["Crosshair Length"], 0, flags["Crosshair Width"])
                CrosshairBottom.Size = UDim2.new(0, flags["Crosshair Width"], 0, flags["Crosshair Length"])
    
                CrosshairTop.BackgroundColor3 = flags["Crosshair Color"].Color
                CrosshairRight.BackgroundColor3 = flags["Crosshair Color"].Color
                CrosshairLeft.BackgroundColor3 = flags["Crosshair Color"].Color
                CrosshairBottom.BackgroundColor3 = flags["Crosshair Color"].Color
    
                CrosshairTop.Visible = true
                CrosshairRight.Visible = true
                CrosshairLeft.Visible = true
                CrosshairBottom.Visible = true
            else
                CrosshairTop.Visible = false
                CrosshairRight.Visible = false
                CrosshairLeft.Visible = false
                CrosshairBottom.Visible = false
            end
        end

        highlight_player = target_Paradox.target.entry -- highlight

        do -- auto shoot
            if local_player.Character then
                if flags["Enable Auto Shoot"] and target_Paradox and target_Paradox.target and target_Paradox.target.entry and target_Paradox.target.part and player_esp.functions.is_visible2(entry) then
                    mouse1press()
                    mouse1release()
                end
            end            
        end;

        do -- aimbot
            if (target_Paradox and target_Paradox.target and target_Paradox.target.entry and target_Paradox.target.part and target_Paradox.target.entry ~= local_player) then
                if (flags["Enable Aimbot"] and flags["Aimbot Keybind"].active) then
                    local enemy_pos = target_Paradox.target.part.Position
                    camera.CFrame = flags["Aimbot Speed"] ~= 1 and camera.CFrame:Lerp(CFrame.lookAt(camera.CFrame.Position, enemy_pos), flags["Aimbot Speed"]) or CFrame.lookAt(camera.CFrame.Position, enemy_pos)
                end
            end
        end
        
        do -- anti aim
            if (flags["Anti Aim"]) then
                local root = local_char:FindFirstChild("HumanoidRootPart");
                local human = local_char:FindFirstChild("Humanoid");
                local spin_speed = math.rad(flags["Anti Aim Speed"] / 10);

                if (local_char and local_char:FindFirstChild("HumanoidRootPart")) then
                    local cameraLook = camera.CFrame.LookVector;
                    root.CFrame = root.CFrame * CFrame.Angles(0, spin_speed, 0);
                end;

                if (root and human) then
                    human.AutoRotate = false;
                    root.CFrame = root.CFrame * CFrame.Angles(0, spin_speed, 0);
                end;
            else
                local_char:FindFirstChild("Humanoid").AutoRotate = true;
            end;
        end;

        do -- btr teleport
            if (flags["BTR Teleport"] and flags["Teleport Keybind"].active) then
                local player = game.Players.LocalPlayer
                local playerHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        
                local events = workspace:FindFirstChild("Events")
                local btr = events and events:FindFirstChild("BTR")
                local targetPart = btr and btr:FindFirstChild("HumanoidRootPart")
        
                if playerHRP and targetPart then
                    targetPart.CFrame = playerHRP.CFrame
                end
            end
        end        

        do -- local chams
            for _, model in ipairs(folder:GetChildren()) do
                if model:IsA("Model") then
                    local highlight = model:FindFirstChildOfClass("Highlight")

                    if flags["Local Chams"] then
                        if not highlight then
                            highlight = Instance.new("Highlight")
                            highlight.Parent = model
                        end
                        highlight.FillColor = flags["Local Chams Accent"].Color
                        highlight.OutlineColor = flags["Local Chams Accent"].Color
                        highlight.OutlineTransparency = flags["Local Chams Opacity"] / 100
                        highlight.FillTransparency = flags["Local Chams Opacity"] / 100
                        highlight.Enabled = true
                    elseif highlight then
                        highlight.Enabled = false
                    end
                end
            end
        end
        --
        do -- insta loot heh
            if gxentry.QuickStackItems and #gxentry.QuickStackItems > 0 then
                for _, func in next, gxentry.QuickStackItems do
                    setconstant(func, 18, flags["Insta Loot"] and 0 or 0.3)
                    setconstant(func, 19, flags["Insta Loot"] and 0 or 0.1)
                end
            end
        end
        --
        do -- plr mods
            if flags["Enable Aimbot"] or getgenv().silent then
                entry, closest_part, typeplayer = player_esp.functions.get_player()
            end

            -- Freecam toggle check
            if flags["Enable Freecam"] and flags["Freecam Keybind"].active then
                if not freecam.enabled then
                    freecam.enabled = true
                    freecam.old_type = camera.CameraType
                    freecam.old_behavior = uis.MouseBehavior
                    camera.CameraType = Enum.CameraType.Scriptable
                    uis.MouseBehavior = Enum.MouseBehavior.LockCenter
                    if local_char and local_char:FindFirstChild("HumanoidRootPart") then
                        local_char.HumanoidRootPart.Anchored = true
                    end
                end
            else
                if freecam.enabled then
                    freecam.enabled = false
                    camera.CameraType = freecam.old_type
                    uis.MouseBehavior = freecam.old_behavior
                    if local_char and local_char:FindFirstChild("HumanoidRootPart") then
                        local_char.HumanoidRootPart.Anchored = false
                    end
                end
            end

            if freecam.enabled then
                local delta = uis:GetMouseDelta()
                freecam.pitch = math.clamp(freecam.pitch - delta.Y * flags["Freecam Sensitivity"], -80, 80)
                freecam.yaw = freecam.yaw - delta.X * flags["Freecam Sensitivity"]

                camera.CFrame = CFrame.new(camera.CFrame.Position)
                        * CFrame.Angles(0, math.rad(freecam.yaw), 0)
                        * CFrame.Angles(math.rad(freecam.pitch), 0, 0)

                local move = Vector3.zero
                if uis:IsKeyDown(Enum.KeyCode.W) then
                    move += Vector3.new(0, 0, -1)
                end
                if uis:IsKeyDown(Enum.KeyCode.A) then
                    move += Vector3.new(-1, 0, 0)
                end
                if uis:IsKeyDown(Enum.KeyCode.S) then
                    move += Vector3.new(0, 0, 1)
                end
                if uis:IsKeyDown(Enum.KeyCode.D) then
                    move += Vector3.new(1, 0, 0)
                end
                if uis:IsKeyDown(Enum.KeyCode.Space) then
                    move += Vector3.new(0, 1, 0)
                end
                if uis:IsKeyDown(Enum.KeyCode.LeftShift) then
                    move += Vector3.new(0, -1, 0)
                end

                if move.Magnitude > 0 then
                    camera.CFrame += (camera.CFrame - camera.CFrame.Position):VectorToWorldSpace(
                move.Unit * flags["Freecam Speed"]
                    )
                end

                if local_char and local_char:FindFirstChild("HumanoidRootPart") then
                    local_char.HumanoidRootPart.CFrame = camera.CFrame
                end
            end


            -- always sprint
            if
            flags["Always Sprint"]
                    and (
                    uis:IsKeyDown(Enum.KeyCode.W)
                            or uis:IsKeyDown(Enum.KeyCode.A)
                            or uis:IsKeyDown(Enum.KeyCode.S)
                            or uis:IsKeyDown(Enum.KeyCode.D)
            )
            then
                local plr_model = local_char
                if plr_model and plr_model:FindFirstChild("HumanoidRootPart") then
                    local root = plr_model:FindFirstChild("HumanoidRootPart")
                    if root then
                        local dir, look = Vector3.new(), camera.CFrame.LookVector

                        for k, v in pairs({
                            [Enum.KeyCode.W] = Vector3.new(look.X, 0, look.Z),
                            [Enum.KeyCode.A] = Vector3.new(look.Z, 0, -look.X),
                            [Enum.KeyCode.S] = Vector3.new(-look.X, 0, -look.Z),
                            [Enum.KeyCode.D] = Vector3.new(-look.Z, 0, look.X),
                        }) do
                            if uis:IsKeyDown(k) then
                                dir += v
                            end
                        end

                        if dir.Magnitude > 0 then
                            root.Velocity = dir.Unit * flags["Sprint Speed"] + Vector3.new(0, root.Velocity.Y, 0)
                        end
                    end
                end
            end
            -- spiderclimb
            if flags["Spiderclimb"] and flags["Spiderclimb Keybind"].active then
                local plr_model = local_char or local_player.CharacterAdded:Wait()

                if plr_model and plr_model:FindFirstChild("HumanoidRootPart") then
                    local hrp = plr_model.HumanoidRootPart
                    local climb_speed = flags["Spiderclimb Speed"]

                    local current_velocity = hrp.AssemblyLinearVelocity
                    local vertical_velocity = Vector3.new(0, climb_speed, 0)

                    hrp.CFrame = hrp.CFrame * CFrame.new(0, climb_speed * 0.1, 0)
                    hrp.AssemblyLinearVelocity =
                    Vector3.new(current_velocity.X, vertical_velocity.Y, current_velocity.Z)
                end
            end
            --
local isAlwaysGrounded = flags["Always Grounded"]
local isShootWhileJumping = flags["Shoot While Jumping"] or isAlwaysGrounded

-- Combined logic for Shoot While Jumping and Always Grounded
if (isShootWhileJumping or isAlwaysGrounded) and local_player.Character then
    local plr_model = local_player.Character
    local humanoid = plr_model:FindFirstChildOfClass("Humanoid")
    local root = plr_model:FindFirstChild("HumanoidRootPart")

    -- Shoot While Jumping logic
    if isShootWhileJumping and humanoid then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
        if humanoid:GetState() == Enum.HumanoidStateType.Jumping or humanoid:GetState() == Enum.HumanoidStateType.Freefall then
            humanoid:ChangeState(Enum.HumanoidStateType.Running)
        end
    end

    -- Always Grounded (platform) logic
    if isAlwaysGrounded and root then
        local targetPosition = root.Position - Vector3.new(0, 3.2, 0)
        platform.Position = targetPosition
    else
        platform.Position = Vector3.new(0, 0, 0)
    end
else
    platform.Position = Vector3.new(0, 0, 0)
    end
end
        --
        local antifling_connection = nil

local function ToggleAntiFling(state)
    local speaker = game:GetService("Players").LocalPlayer

    if state then
        if antifling_connection then
            antifling_connection:Disconnect()
            antifling_connection = nil
        end
        antifling_connection = game:GetService("RunService").Stepped:Connect(function()
            pcall(function()
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player ~= speaker and player.Character then
                        for _, part in pairs(player.Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    end
                end
            end)
        end)
    else
        if antifling_connection then
            antifling_connection:Disconnect()
            antifling_connection = nil
        end
    end
end
        --
        do -- lighting
            if flags["Enable Fullbright"] then
                if lighting.ClockTime ~= (flags["Enable Fullbright"] and 12 or lighting_cache.ClockTime) then
                    lighting.ClockTime = flags["Enable Fullbright"] and 12 or lighting_cache.ClockTime
                end
            else
                lighting.ClockTime = lighting_cache.ClockTime
            end
            --
            if flags["Enable No Fog"] then
                lighting.FogEnd = 100000
                local atmosphere = lighting:FindFirstChild("Atmosphere")
                if atmosphere then
                    atmosphere.Density, atmosphere.Offset, atmosphere.Glare, atmosphere.Haze = 0, 0, 0, 0
                end
            else
                lighting.FogEnd = lighting_cache.FogEnd
                local atmosphere = lighting:FindFirstChild("Atmosphere")
                if atmosphere then
                    atmosphere.Density, atmosphere.Offset, atmosphere.Glare, atmosphere.Haze =
                    lighting_cache.Density, lighting_cache.Offset, lighting_cache.Glare, lighting_cache.Haze
                end
            end
            --
            if flags["Enable Ambient"] then
                if
                lighting.OutdoorAmbient
                        ~= (flags["Enable Ambient"] and flags["Outdoor Ambient Accent"].Color or lighting_cache.OutdoorAmbient)
                then
                    lighting.OutdoorAmbient = flags["Enable Ambient"] and flags["Outdoor Ambient Accent"].Color
                            or lighting_cache.OutdoorAmbient
                end
                if
                lighting.Ambient ~= (flags["Enable Ambient"] and flags["Ambient Accent"].Color or lighting_cache.Ambient)
                then
                    lighting.Ambient = flags["Enable Ambient"] and flags["Ambient Accent"].Color or lighting_cache.Ambient
                end
            else
                lighting.Ambient = lighting_cache.Ambient
                lighting.OutdoorAmbient = lighting_cache.OutdoorAmbient
            end
        end
        --
        do -- fov circle
            if flags["Enable FOV"] then
                fov_circle.Frame.Visible = true
                fov_circle.Stroke.Color = flags["FOV Accent"].Color
        
                if flags["FOV Filled"] then
                    fov_circle.Frame.BackgroundTransparency = 1 - (flags["FOV Fill Opacity"] / 100)
                    fov_circle.Frame.BackgroundColor3 = flags["FOV Fill Accent"].Color
                else
                    fov_circle.Frame.BackgroundTransparency = 1
                end
        
                local size = (flags["FOV Radius"] or 120) * 2 / math.tan(math.rad(camera.FieldOfView / 2))
                fov_circle.Frame.Size = UDim2.new(0, size, 0, size)
                fov_circle.Frame.Position = UDim2.new(0, uis:GetMouseLocation().X, 0, uis:GetMouseLocation().Y)
            else
                fov_circle.Frame.Visible = false
            end
        end
        -- 
        if flags["Armor Viewer"] then
            if closest_part and not entry:FindFirstChild("HumanoidRootPart") then
                info_viewer.background.Visible = true
                info_viewer.background.Position = UDim2.new(50 / 100, 0, 10 / 100, 0)
                info_viewer.icon_holder.Visible = true
                info_viewer.icon_holder.Position = UDim2.new(50 / 100, 0, 10 / 100, 45)
                info_viewer.name.Position = UDim2.new(0.5, 0, 0.5, 0)
                info_viewer.name.Visible = true
                info_viewer.name.Text = entry.DisplayName.. "'s Inventory"
        
                if last_targeted_player_name ~= entry.Name then
                    for _, child in ipairs(info_viewer.icon_holder:GetChildren()) do
                        if child:IsA("ImageLabel") then
                            child:Destroy();
                        end;
                    end;
                    last_targeted_player_name = entry.Name;
                end;
        
                local armorIcons = player_esp.functions.get_armor_icon(entry.Character)
                if armorIcons then
                    if #armorIcons > 0 then
                        for _, armorIcon in ipairs(armorIcons) do
                            local exists = false
                            for _, child in ipairs(info_viewer.icon_holder:GetChildren()) do
                                if child:IsA("ImageLabel") and child.Image == armorIcon then
                                    exists = true
                                    break
                                end
                            end
                            if not exists then
                                local newIcon = Instance.new("ImageLabel")
                                newIcon.Parent = info_viewer.icon_holder
                                newIcon.Size = UDim2.new(0, 75, 0, 75)
                                newIcon.Image = armorIcon
                                newIcon.Visible = true
                                newIcon.BackgroundTransparency = 1
                            end
                        end
                    end
                end
            else
                info_viewer.icon_holder.Visible = false;
                info_viewer.background.Visible = false;
                info_viewer.name.Visible = false;
            end;
        else
            for _, child in ipairs(info_viewer.icon_holder:GetChildren()) do
                if child:IsA("ImageLabel") then
                    child:Destroy();
                end;
            end;
            info_viewer.icon_holder.Visible = false;
            info_viewer.background.Visible = false;
            info_viewer.name.Visible = false;
        end;                     
        --
        do -- snaplines
            if (flags["Enable Aimbot"] or getgenv().silent) and flags["Enable Snaplines"] then
                local line = snap_lines.line
                if closest_part then
                    local screen_pos = camera:WorldToViewportPoint(closest_part.Position)
                    local from = Vector2.new(screen_pos.X, screen_pos.Y)
                    local to = uis:GetMouseLocation()
                    local offset = to - from
                    local middle = from + offset * 0.5
                    local distance = offset.Magnitude

                    local line = snap_lines.line
                    line.Position = UDim2.new(0, middle.X, 0, middle.Y)
                    line.Rotation = math.deg(math.atan2(offset.Y, offset.X))
                    line.Size = UDim2.new(0, math.floor(distance + 0.5), 0, 1)
                    line.BackgroundColor3 = flags["Snaplines Accent"].Color
                    line.Visible = true
                else
                    line.Visible = false
                end
            else
                snap_lines.line.Visible = false
            end
        end
    end))

    do -- object esp (this is lazy work but it works)
        local create_esp_object = LPH_NO_VIRTUALIZE(function(Name, Object, Icon, Override)
            local Box = player_esp.functions.create_drawing("Frame", { Parent = gethui(), Visible = true })
            local Label = player_esp.functions.create_drawing("TextLabel", {
                Text = "",
                Visible = false,
                Parent = Box,
                Position = UDim2.new(0.5, 0, 0, -10),
                Size = UDim2.new(0, 100, 0, -20),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 13,
                TextStrokeTransparency = 0,
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                RichText = true,
            })
            --
            do
                local Updater
                Updater = run_service.RenderStepped:Connect(function()
                    if Object and Object.Parent ~= nil and Object ~= nil then
                        local Position, Onscreen = camera:WorldToViewportPoint(Object.Position)
                        local Distance = math.floor((Object.Position - camera.CFrame.p).magnitude / 3.5714285714)
    
                        -- Text
                        if
                        Onscreen
                                and flags[string.format("Enable %s ESP", Name)]
                                and Distance <= flags["World ESP Max Distance"]
                        then
                            Label.Visible = true
                            Label.Text = string.format("%s\n[%sm]", Name, Distance)
                            Label.TextColor3 = flags[string.format("%s ESP Color", Name)].Color
                            Label.TextSize = 10
                            Label.FontFace =
                            Font.new([[rbxassetid://12187365977]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
                            Box.Position = UDim2.new(0, Position.X, 0, Position.Y)
                            Box.Position = UDim2.new(0, Position.X, 0, Position.Y)
                            Box.Size = UDim2.new(0, 0, 0, 0)
                            Box.Transparency = 1
                        else
                            Label.Visible = false
                        end
                    else
                        Label:Destroy()
                        Box:Destroy()
                        Updater:Disconnect()
                    end
                end)
            end
        end)
        --
        local Plants = workspace:FindFirstChild("Plants")
        if Plants then
            for _, Plant in pairs(Plants:GetChildren()) do
                local Main = Plant:FindFirstChild("Main")
                if Main then
                    if Plant.Name == "Wool Plant" then
                        create_esp_object("Wool", Main, "")
                    elseif Plant.Name == "Blueberry Plant" then
                        create_esp_object("Blueberry", Main, "")
                    elseif Plant.Name == "Corn Plant" then
                        create_esp_object("Corn", Main, "")
                    elseif Plant.Name == "Lemon Plant" then
                        create_esp_object("Lemon", Main, "")
                    elseif Plant.Name == "Pumpkin Plant" then
                        create_esp_object("Pumpkin", Main, "")
                    elseif Plant.Name == "Raspberry Plant" then
                        create_esp_object("Raspberry", Main, "")
                    elseif Plant.Name == "Tomato Plant" then
                        create_esp_object("Tomato", Main, "")
                    end
                end
            end
        
            Plants.ChildAdded:Connect(function(Plant)
                local Main = Plant:FindFirstChild("Main")
                if Main then
                    if Plant.Name == "Wool Plant" then
                        create_esp_object("Wool", Main, "")
                    elseif Plant.Name == "Blueberry Plant" then
                        create_esp_object("Blueberry", Main, "")
                    elseif Plant.Name == "Corn Plant" then
                        create_esp_object("Corn", Main, "")
                    elseif Plant.Name == "Lemon Plant" then
                        create_esp_object("Lemon", Main, "")
                    elseif Plant.Name == "Pumpkin Plant" then
                        create_esp_object("Pumpkin", Main, "")
                    elseif Plant.Name == "Raspberry Plant" then
                        create_esp_object("Raspberry", Main, "")
                    elseif Plant.Name == "Tomato Plant" then
                        create_esp_object("Tomato", Main, "")
                    end
                end
            end)
        end        
        --
        local Nodes = workspace:FindFirstChild("Nodes")
        if Nodes then
            for _, Plant in pairs(Nodes:GetChildren()) do
                if Plant.Name == "Stone_Node" then
                    local Main = game.FindFirstChild(Plant, "Main")
                    create_esp_object("Stone", Main, "")
                elseif Plant.Name == "Metal_Node" then
                    local Main = game.FindFirstChild(Plant, "Main")
                    create_esp_object("Metal", Main, "")
                elseif Plant.Name == "Phosphate_Node" then
                    local Main = game.FindFirstChild(Plant, "Main")
                    create_esp_object("Phosphate", Main, "")
                end
            end
            --
            Nodes.ChildAdded:Connect(function(Plant)
                if Plant.Name == "Stone_Node" then
                    local Main = game.FindFirstChild(Plant, "Main")
                    create_esp_object("Stone", Main, "")
                elseif Plant.Name == "Metal_Node" then
                    local Main = game.FindFirstChild(Plant, "Main")
                    create_esp_object("Metal", Main, "")
                elseif Plant.Name == "Phosphate_Node" then
                    local Main = game.FindFirstChild(Plant, "Main")
                    create_esp_object("Phosphate", Main, "")
                end
            end)
        end
        -- eggs
        local eggLoners = workspace:FindFirstChild("Bases") and workspace.Bases:FindFirstChild("Loners")
        if eggLoners then
            for _, eggFolder in pairs(eggLoners:GetChildren()) do
                if eggFolder.Name == "Large Egg" or eggFolder.Name == "Medium Egg" or eggFolder.Name == "Small Egg" then
                    for _, eggModel in pairs(eggFolder:GetChildren()) do
                        local Main = eggModel:FindFirstChild("Main")
                        if Main and Main:IsA("MeshPart") then
                            create_esp_object(eggFolder.Name, Main, "")
                        else
                            print("error 0x01 - make a ticket")
                        end
                    end
                    --
                    eggFolder.ChildAdded:Connect(function(eggModel)
                        local Main = eggModel:FindFirstChild("Main")
                        if Main and Main:IsA("MeshPart") then
                            create_esp_object(eggFolder.Name, Main, "")
                        else
                            error("error 0x01b - make a ticket")
                        end
                    end)
                end
            end
        end
        -- eggs
        -- btr
        local Events = workspace:FindFirstChild("Events")

        if Events then
            local BTR = Events:FindFirstChild("BTR") 
                and Events.BTR:FindFirstChild("Detail") 
                and Events.BTR.Detail:FindFirstChild("Main")

            local destroyedBTR = Events:FindFirstChild("BTR")
                and Events.BTR:FindFirstChild("destroyedBTR")
                and Events.BTR.destroyedBTR:FindFirstChild("SmokePart")

            if BTR then
                create_esp_object("BTR", BTR, "")
            elseif destroyedBTR then
                create_esp_object("BTR", destroyedBTR, "")
            end

            Events.ChildAdded:Connect(function(child)
                if child.Name == "BTR" then
                    task.wait(0.1)
                    local BTRMain = child:FindFirstChild("Detail") and child.Detail:FindFirstChild("Main")
                    local destroyedBTRSmoke = child:FindFirstChild("destroyedBTR") and child.destroyedBTR:FindFirstChild("SmokePart")

                    if BTRMain then
                        create_esp_object("BTR", BTRMain, "")
                    elseif destroyedBTRSmoke then
                        create_esp_object("BTR", destroyedBTRSmoke, "")
                    end

                    -- error fix
                    child.ChildAdded:Connect(function(grandchild)
                        if grandchild.Name == "destroyedBTR" then
                            task.wait(0.1)
                            local SmokePart = grandchild:FindFirstChild("SmokePart")
                            if SmokePart then
                                create_esp_object("BTR", SmokePart, "")
                            end
                        end
                    end)
                end
            end)
        end
        -- btr
        -- body bags
        local lonerBase = workspace:FindFirstChild("Bases") and workspace.Bases:FindFirstChild("Loners")
        if lonerBase then
            local bodyBagFolder = lonerBase:FindFirstChild("Body Bag")
            if bodyBagFolder then
                for _, bodyBag in pairs(bodyBagFolder:GetChildren()) do
                    local Main = bodyBag:FindFirstChild("Main")
                    if Main and Main:IsA("MeshPart") then
                        create_esp_object("Body Bag", Main, "")
                    end
                end

                bodyBagFolder.ChildAdded:Connect(function(bodyBag)
                    local Main = bodyBag:FindFirstChild("Main")
                    if Main and Main:IsA("MeshPart") then
                        create_esp_object("Body Bag", Main, "")
                    end
                end)
            end
        end
        -- body bags
        -- timed crate
        local lonerBase = workspace:FindFirstChild("Bases") and workspace.Bases:FindFirstChild("Loners")
        if lonerBase then
            local crateFolder = lonerBase:FindFirstChild("Timed Crate")
            if crateFolder then
                local crateModel = crateFolder:FindFirstChild("Timed Crate")
                if crateModel then
                    local Main = crateModel:FindFirstChild("Main")
                    if Main and Main:IsA("MeshPart") then
                        create_esp_object("Timed Crate", Main, "")
                    end
                end
            end
        end
        -- timed crate
        -- care packages
        local carePackageFolder = workspace:FindFirstChild("Bases")
            and workspace.Bases:FindFirstChild("Loners")
            and workspace.Bases.Loners:FindFirstChild("Care Package")

        if carePackageFolder then
            for _, carePackageModel in pairs(carePackageFolder:GetChildren()) do
                if carePackageModel.Name == "Care Package" then
                    local Main = carePackageModel:FindFirstChild("Main")
                    if Main and Main:IsA("Part") then
                        create_esp_object("Care Package", Main, "")
                    end
                end
            end
            carePackageFolder.ChildAdded:Connect(function(carePackageModel)
                if carePackageModel.Name == "Care Package" then
                    local Main = carePackageModel:FindFirstChild("Main")
                    if Main and Main:IsA("Part") then
                        create_esp_object("Care Package", Main, "")
                    end
                end
            end)
        end
        -- care packages
    end

    do -- player esp
        player_esp.update_player_ESP = function(player)
            if player.Name == lplayer_name then
                return
            end
            --
            local esp_holder =
            player_esp.functions.create_drawing("ScreenGui", { Parent = cloneref(gethui()), Name = "esp_holder" })
            local drawings = {
                -- text
                name = player_esp.functions.create_drawing("TextLabel", {
                    Visible = false,
                    Parent = esp_holder,
                    BackgroundTransparency = 1,
                    TextStrokeTransparency = 0,
                    TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                    FontFace = fonts.esp,
                    TextSize = 10,
                    TextXAlignment = Enum.TextXAlignment.Center,
                }),
                distance = player_esp.functions.create_drawing("TextLabel", {
                    Visible = false,
                    Parent = esp_holder,
                    BackgroundTransparency = 1,
                    TextStrokeTransparency = 0,
                    TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                    FontFace = fonts.esp,
                    TextSize = 10,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top,
                }),
                weapon = player_esp.functions.create_drawing("TextLabel", {
                    Visible = false,
                    Parent = esp_holder,
                    BackgroundTransparency = 1,
                    TextStrokeTransparency = 0,
                    TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                    FontFace = fonts.esp,
                    TextSize = 10,
                    TextXAlignment = Enum.TextXAlignment.Center,
                }),
    
                -- box
                box = player_esp.functions.create_drawing("Frame", {
                    Visible = false,
                    Parent = esp_holder,
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Color3.new(1, 1, 1),
                    ZIndex = -999,
                }),
                box2 = player_esp.functions.create_drawing("Frame", {
                    Visible = false,
                    Parent = esp_holder,
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Color3.new(1, 1, 1),
                    ZIndex = 999,
                }),
                Outline = player_esp.functions.create_drawing("UIStroke", {
                    Color = Color3.fromRGB(0, 0, 0),
                    Thickness = 3,
                    Transparency = 0,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Enabled = true,
                }),
                Outline2 = player_esp.functions.create_drawing("UIStroke", {
                    Thickness = 1,
                    Enabled = true,
                    LineJoinMode = Enum.LineJoinMode.Miter,
                }),
    
                -- healthbar
                BehindHealthbar = player_esp.functions.create_drawing("Frame", {
                    Visible = false,
                    Parent = esp_holder,
                    ZIndex = -1,
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    BackgroundTransparency = 0,
                    BorderSizePixel = 1,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                }),
                Healthbar = player_esp.functions.create_drawing("Frame", {
                    Visible = false,
                    Parent = esp_holder,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                }),

                HealthText = player_esp.functions.create_drawing("TextLabel", {
                    Visible = false,
                    Parent = esp_holder,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    FontFace = fonts.esp,
                    TextSize = 10,
                    BackgroundTransparency = 1,
                    TextStrokeTransparency = 0,
                    ZIndex = 999,
                    TextStrokeColor3 = Color3.new(0, 0, 0),
                }),
    
                -- icon top
                icon_top = player_esp.functions.create_drawing("ImageLabel", {
                    Image = "rbxassetid://14239914881",
                    Parent = esp_holder,
                    BackgroundTransparency = 1,
                    AnchorPoint = Vector2.new(0.5, 0.5)
                }),


                -- text strokes
                name_stroke = player_esp.functions.create_drawing("UIStroke", {
                    Thickness = 1,
                    LineJoinMode = Enum.LineJoinMode.Round,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                    Color = Color3.fromRGB(0, 0, 0),
                }),
                distance_stroke = player_esp.functions.create_drawing("UIStroke", {
                    Thickness = 1,
                    LineJoinMode = Enum.LineJoinMode.Round,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                    Color = Color3.fromRGB(0, 0, 0),
                }),
                weapon_stroke = player_esp.functions.create_drawing("UIStroke", {
                    Thickness = 1,
                    LineJoinMode = Enum.LineJoinMode.Round,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                    Color = Color3.fromRGB(0, 0, 0),
                }),
            }
            --
            local chams
            do -- create chams
                chams = Instance.new("Highlight", player.Character)
                chams.Enabled = false
            end
            --
            local linepos = function(frame, from, to, thickness, plrpos)
                local c = (from + to) / 2
                local o = to - from + Vector2.new(0, 1)
                local d = (plrpos - camera.CFrame.p).Magnitude
                frame.Position = UDim2.new(0, c.X, 0, c.Y)
                frame.Rotation = math.atan2(o.Y, o.X) * 180 / math.pi
    
                frame.Size = UDim2.new(0, o.Magnitude, 0, thickness)
            end

            --
            local function createline()
                local frame = Instance.new("Frame", esp_holder)
                frame.AnchorPoint = Vector2.new(0.5, 0.5)
                frame.ZIndex = -999
                frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                frame.BorderSizePixel = 0
                frame.Visible = false
                return frame
            end

            local torso_angle_parts = {
                createline(),
                createline()
            }
            --
            local viewangle_parts = {
                Head = createline(),
                Penis = createline(), -- troll
            }
            
            local corner_frames = {
                LeftTopFix = player_esp.functions.create_drawing("Frame", { Parent = esp_holder, Size = UDim2.new(0, 1, 0, 12), ZIndex = 999 }),
                RightTopFix = player_esp.functions.create_drawing("Frame", { Parent = esp_holder, Size = UDim2.new(0, 1, 0, 12), ZIndex = 999 }),
                BottomSideFix = player_esp.functions.create_drawing("Frame", { Parent = esp_holder, Size = UDim2.new(0, 1, 0, 6), ZIndex = 999 }),
                BottomRightSideFix = player_esp.functions.create_drawing("Frame", { Parent = esp_holder, Size = UDim2.new(0, 1, 0, 6), ZIndex = 999 }),
                
                LeftTop = player_esp.functions.create_drawing("Frame", { Parent = esp_holder, ZIndex = 3 }),
                LeftSide = player_esp.functions.create_drawing("Frame", { Parent = esp_holder }),
                RightTop = player_esp.functions.create_drawing("Frame", { Parent = esp_holder, ZIndex = 3 }),
                RightSide = player_esp.functions.create_drawing("Frame", { Parent = esp_holder }),
                BottomSide = player_esp.functions.create_drawing("Frame", { Parent = esp_holder }),
                BottomDown = player_esp.functions.create_drawing("Frame", { Parent = esp_holder }),
                BottomRightSide = player_esp.functions.create_drawing("Frame", { Parent = esp_holder }),
                BottomRightDown = player_esp.functions.create_drawing("Frame", { Parent = esp_holder })
            }
            
            for _, frame in pairs(corner_frames) do
                frame.Visible = false
                frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            end
            
            local parts = {
                UpperTorso_LowerTorso = createline(),
                UpperTorso_LeftUpperArm = createline(),
                UpperTorso_RightUpperArm = createline(),
                LeftUpperArm_LeftLowerArm = createline(),
                LeftLowerArm_LeftHand = createline(),
                LeftUpperLeg_LeftLowerLeg = createline(),
                LeftLowerLeg_LeftFoot = createline(),
                RightUpperArm_RightLowerArm = createline(),
                RightLowerArm_RightHand = createline(),
                RightUpperLeg_RightLowerLeg = createline(),
                RightLowerLeg_RightFoot = createline(),
                LowerTorso_LeftUpperLeg = createline(),
                LowerTorso_RightUpperLeg = createline(),
            }
            drawings.HealthbarGradient = library:create("UIGradient", {
                Color = rgbseq{rgbkey(0, rgb(167, 167, 167)), rgbkey(1, rgb(167, 167, 167))};
                Parent = drawings.Healthbar;
                Rotation = 90;
                Enabled = false;
            });
            --
            drawings.Outline.Parent = drawings.box
            drawings.Outline2.Parent = drawings.box2
            drawings.name_stroke.Parent = drawings.name
            drawings.distance_stroke.Parent = drawings.distance
            drawings.weapon_stroke.Parent = drawings.weapon
            --
            table.insert(player_esp.drawing_cache, {
                name = drawings.name,
                distance = drawings.distance,
                weapon = drawings.weapon,
                box = drawings.box,
                box2 = drawings.box2,
                icon_top = drawings.icon_top,
                healthbar = drawings.BehindHealthbar,
                healthbar2 = drawings.Healthbar,
                esp_holder = esp_holder,
                update_conn = nil,
                type = "Player",
                player = player,
            })
            --
    player_esp.functions.stop_underground_aa_animation = LPH_NO_VIRTUALIZE(function(player)
    if library.flags["ResolveUndergroundAA"] and player and player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.Health > 0.2 then
            for _, anim in ipairs(humanoid:GetPlayingAnimationTracks()) do
                if anim.Animation and anim.Animation.AnimationId == "rbxassetid://13435049596" then
                    anim:Stop()
                end
            end
        end
    end
end)
            --
            do -- update esp
                local died_check = false
                local tween = {
                    health_start = 0,
                    health_transition_start = 0,
                    health_transition_old = 0,
                    current_health = 0,
                }
                local WereChoppedTwinWittedRoseEmoji = {}
                --
                player_esp.update_esp = LPH_NO_VIRTUALIZE(function()
                    if flags["Max ESP Distance"] == nil then 
                        return 
                    end 
                    
    local entry, closest_part, typeplayer = player_esp.functions.get_player()
    if entry and entry ~= local_player then
        player_esp.functions.stop_underground_aa_animation(entry)
    end

                    local character = player.Character
                    local humanoid = character:FindFirstChild("Humanoid")
                    local cframe, size, position = player_esp.functions.get_boundings(character)
                    local box_style = flags["Box Style"]
    
                    do -- ESP
                        if character and humanoid then
                            local max_distance
                            if position then
                                max_distance = (position - camera.CFrame.Position).Magnitude
                            end
							local visiblity = player_esp.functions.is_visible(character)

                            local teamcheck = cache.type == "Player" and YallahCheckTeam(player) or false

                            if (max_distance and max_distance < flags["Max ESP Distance"]) and (not flags["Enable VisibleCheck"] or (flags["Enable VisibleCheck"] and visiblity)) then
                                if (humanoid.Health > 0) and (not flags["Enable TeamCheck"] or not teamcheck) then
                                    local pos, on_screen = camera:WorldToScreenPoint(position)
                                    local height = math.tan(math.rad(camera.FieldOfView / 2)) * 2 * pos.Z
                                    local scale = Vector2.new(
                                            (viewport_size.Y / height) * size.X,
                                            (viewport_size.Y / height) * size.Y
                                    )

                                    local Model = character

                                    do -- chams
                                        for Index, Value in pairs(Model and Model:GetChildren() or {}) do
                                            if not WereChoppedTwinWittedRoseEmoji[Value] then 
                                                if not Value:IsA("Folder") and Value.ClassName ~= "Model" and Value.Name ~= "HumanoidRootPart" and Value.Name ~= "HeadCollider" and Value.Name ~= "Humanoid" and Value:IsA("BasePart") then 
                                                    local Chams = {}
                                                    for i2 = 1, 1 do -- yes dont ask why i did this and now im nto gonna change it for the rest of my life
                                                        local Adornment
                                                        if Value.Name == "Head" then 
                                                            Adornment = Instance.new("CylinderHandleAdornment")
                                                            Adornment.Parent = Value
                                                            Adornment.Height = Value.Size.y + 0.2
                                                            Adornment.Radius = Value.Size.X * (0.35) + 0.2
                                                            Adornment.CFrame = CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 1, 0))
                                                        else 
                                                            Adornment = Instance.new("BoxHandleAdornment")
                                                            Adornment.Parent = Value
                                                            Adornment.Size = Value.Size + Vector3.new(0.1, 0.1, 0.1)
                                                        end
                            
                                                        Adornment.Name = "cms"
                                                        Adornment.Adornee = Value
                                                        Adornment.ZIndex = 2
                                                        Adornment.AlwaysOnTop = true
                                                        Chams[1] = Adornment
                                                    end
                            
                                                    WereChoppedTwinWittedRoseEmoji[Value] = Chams
                                                end
                                            end
                            
                                            if WereChoppedTwinWittedRoseEmoji[Value] then
                                                if flags["CHAMS gxentry SEX NIGGERS"] and on_screen then
                            
                                                    do -- Fill
                                                        WereChoppedTwinWittedRoseEmoji[Value][1].Visible = true
                                                        WereChoppedTwinWittedRoseEmoji[Value][1].Transparency = 0.5
                                                        WereChoppedTwinWittedRoseEmoji[Value][1].Color3 = flags["CHAM COLOR gxentry SEX NIGGERS"].Color
                                                    end
                                                else
                                                    WereChoppedTwinWittedRoseEmoji[Value][1].Visible = false
                                                end
                                            end
                                        end
                                    end
    
                                    do -- names
                                        if on_screen and flags["Enable Names"] then
                                            drawings.name.Visible = true
                                            drawings.name.Text = flags["Display Name"] and player.DisplayName or player.Name
                                            drawings.name.TextColor3 = drawings.name.TextColor3:Lerp(
                                                    (
                                                            flags["Highlight ESP"]
                                                                    and highlight_player == player
                                                                    and flags["Highlight Accent"].Color
                                                    )
                                                            and flags["Highlight Accent"].Color
                                                            or flags["Names Accent"].Color,
                                                    0.02
                                            )
                                            drawings.name.Position = UDim2.new(0, pos.X, 0, pos.Y - scale.Y / 2 - 6)
                                        else
                                            drawings.name.Visible = false
                                        end
                                    end
    
                                    do -- chams
                                        if on_screen and flags["Enable Chams"] then
                                            chams.Enabled = true
                                            chams.DepthMode = flags["Chams Visible Check"] == "Always Visible"
                                                    and Enum.HighlightDepthMode["AlwaysOnTop"]
                                                    or Enum.HighlightDepthMode["Occluded"]
                                            chams.FillTransparency = flags["Chams Opacity"] / 100
                                            chams.OutlineTransparency = flags["Chams Opacity"] / 100
                                            chams.FillColor = chams.FillColor:Lerp(
                                                    (
                                                            flags["Highlight ESP"]
                                                                    and highlight_player == player
                                                                    and flags["Highlight Accent"].Color
                                                    )
                                                            and flags["Highlight Accent"].Color
                                                            or flags["Chams Accent"].Color,
                                                    0.02
                                            )
                                            chams.OutlineColor = chams.OutlineColor:Lerp(
                                                    (
                                                            flags["Highlight ESP"]
                                                                    and highlight_player == player
                                                                    and flags["Highlight Accent"].Color
                                                    )
                                                            and flags["Highlight Accent"].Color
                                                            or flags["Chams Accent"].Color,
                                                    0.02
                                            )
                                        else
                                            chams.Enabled = false
                                        end
                                    end
    
                                    do -- view angle and penis angle
                                        if
                                        on_screen
                                                and (flags["Enable Viewangle"] or flags["Enable Penis ESP"])
                                                and character
                                                and character:FindFirstChild("Head")
                                                and character:FindFirstChild("LowerTorso")
                                        then
                                            -- Head view angle
                                            if flags["Enable Viewangle"] then
                                                local head_pos = camera:WorldToScreenPoint(character.Head.Position)
                                                local head_look_dir = character.Head.CFrame.LookVector
                                                local head_line_length = flags["Viewangle Length"] or 5
                                                local head_end_pos = character.Head.Position + (head_look_dir * head_line_length)
                                                local head_end_point = camera:WorldToScreenPoint(head_end_pos)
                                    
                                                local head_positions = {
                                                    Head = Vector2.new(head_pos.X, head_pos.Y),
                                                    Look = Vector2.new(head_end_point.X, head_end_point.Y),
                                                }
                                    
                                                if viewangle_parts.Head then
                                                    linepos(
                                                            viewangle_parts.Head,
                                                            head_positions.Head,
                                                            head_positions.Look,
                                                            1,
                                                            character.Head.Position
                                                    )
                                                    viewangle_parts.Head.Visible = true
                                                end
                                            else
                                                viewangle_parts.Head.Visible = false
                                            end
                                    
                                            if flags["Enable Penis ESP"] then
                                                local torso_pos = camera:WorldToScreenPoint(character.LowerTorso.Position)
                                                local torso_look_dir = character.LowerTorso.CFrame.LookVector
                                                local penis_length = flags["Penis Length"] or 5
                                                local penis_end_pos = character.LowerTorso.Position + (torso_look_dir * penis_length)
                                                local penis_end_point = camera:WorldToScreenPoint(penis_end_pos)
                                    
                                                local penis_positions = {
                                                    Torso = Vector2.new(torso_pos.X, torso_pos.Y),
                                                    Look = Vector2.new(penis_end_point.X, penis_end_point.Y),
                                                }
                                    
                                                if viewangle_parts.Penis then
                                                    linepos(
                                                            viewangle_parts.Penis,
                                                            penis_positions.Torso,
                                                            penis_positions.Look,
                                                            3,
                                                            character.LowerTorso.Position
                                                    )
                                                    viewangle_parts.Penis.Visible = true
                                                end
                                            else
                                                viewangle_parts.Penis.Visible = false
                                            end
                                    
                                            for _, part in pairs(viewangle_parts) do
                                                if part.Visible then
                                                    part.BackgroundColor3 = part.BackgroundColor3:Lerp(
                                                            (
                                                                    flags["Highlight ESP"]
                                                                            and highlight_player == player
                                                                            and flags["Highlight Accent"].Color
                                                            )
                                                                    and flags["Highlight Accent"].Color
                                                                    or flags["Viewangle Accent"].Color,
                                                            0.02
                                                    )
                                                end
                                            end
                                    
                                            if flags["Outline Skeletons/ViewAngle"] then
                                                for _, part in pairs(viewangle_parts) do
                                                    if part.Visible then
                                                        part.BorderSizePixel = 1
                                                    end
                                                end
                                            else
                                                for _, part in pairs(viewangle_parts) do
                                                    if part.Visible then
                                                        part.BorderSizePixel = 0
                                                    end
                                                end
                                            end
                                        else
                                            for _, part in pairs(viewangle_parts) do
                                                part.Visible = false
                                            end
                                        end
                                    end
    
                                    do -- skeletons
                                        if
                                        on_screen
                                                and flags["Enable Skeletons"]
                                                and character
                                                and character:FindFirstChild("UpperTorso")
                                                and character:FindFirstChild("HumanoidRootPart")
                                        then
                                            local get_parts = {
                                                "UpperTorso",
                                                "LowerTorso",
                                                "LeftUpperArm",
                                                "LeftLowerArm",
                                                "LeftHand",
                                                "RightUpperArm",
                                                "RightLowerArm",
                                                "RightHand",
                                                "LeftUpperLeg",
                                                "LeftLowerLeg",
                                                "LeftFoot",
                                                "RightUpperLeg",
                                                "RightLowerLeg",
                                                "RightFoot",
                                            }
    
                                            for _, v in pairs(get_parts) do
                                                if not character:FindFirstChild(v) then
                                                    return
                                                end
                                            end
    
                                            local positions = {}
                                            for _, v in pairs(get_parts) do
                                                local world_pos = character[v].Position
                                                local screenPos, onScreen = camera:WorldToScreenPoint(world_pos)
    
                                                if onScreen and screenPos.Z > 0 then
                                                    positions[v] = Vector2.new(screenPos.X, screenPos.Y)
                                                else
                                                    return
                                                end
                                            end
    
                                            local border_size = flags["Outline Skeletons/ViewAngle"] and 1 or 0
                                            for _, part in pairs(parts) do
                                                part.BorderSizePixel = border_size
                                                part.BackgroundColor3 = flags["Skeletons Accent"].Color
                                            end
    
                                            local root = character.HumanoidRootPart.Position
                                            linepos(
                                                    parts.UpperTorso_LowerTorso,
                                                    positions.UpperTorso,
                                                    positions.LowerTorso,
                                                    flags["Skeleton Thickness"],
                                                    root
                                            )
                                            linepos(
                                                    parts.UpperTorso_LeftUpperArm,
                                                    positions.UpperTorso,
                                                    positions.LeftUpperArm,
                                                    flags["Skeleton Thickness"],
                                                    root
                                            )
                                            linepos(
                                                    parts.LeftUpperArm_LeftLowerArm,
                                                    positions.LeftUpperArm,
                                                    positions.LeftLowerArm,
                                                    flags["Skeleton Thickness"],
                                                    root
                                            )
                                            linepos(
                                                    parts.LeftLowerArm_LeftHand,
                                                    positions.LeftLowerArm,
                                                    positions.LeftHand,
                                                    flags["Skeleton Thickness"],
                                                    root
                                            )
                                            linepos(
                                                    parts.UpperTorso_RightUpperArm,
                                                    positions.UpperTorso,
                                                    positions.RightUpperArm,
                                                    flags["Skeleton Thickness"],
                                                    root
                                            )
                                            linepos(
                                                    parts.RightUpperArm_RightLowerArm,
                                                    positions.RightUpperArm,
                                                    positions.RightLowerArm,
                                                    flags["Skeleton Thickness"],
                                                    root
                                            )
                                            linepos(
                                                    parts.RightLowerArm_RightHand,
                                                    positions.RightLowerArm,
                                                    positions.RightHand,
                                                    flags["Skeleton Thickness"],
                                                    root
                                            )
                                            linepos(
                                                    parts.LowerTorso_LeftUpperLeg,
                                                    positions.LowerTorso,
                                                    positions.LeftUpperLeg,
                                                    flags["Skeleton Thickness"],
                                                    root
                                            )
                                            linepos(
                                                    parts.LeftUpperLeg_LeftLowerLeg,
                                                    positions.LeftUpperLeg,
                                                    positions.LeftLowerLeg,
                                                    flags["Skeleton Thickness"],
                                                    root
                                            )
                                            linepos(
                                                    parts.LeftLowerLeg_LeftFoot,
                                                    positions.LeftLowerLeg,
                                                    positions.LeftFoot,
                                                    flags["Skeleton Thickness"],
                                                    root
                                            )
                                            linepos(
                                                    parts.LowerTorso_RightUpperLeg,
                                                    positions.LowerTorso,
                                                    positions.RightUpperLeg,
                                                    flags["Skeleton Thickness"],
                                                    root
                                            )
                                            linepos(
                                                    parts.RightUpperLeg_RightLowerLeg,
                                                    positions.RightUpperLeg,
                                                    positions.RightLowerLeg,
                                                    flags["Skeleton Thickness"],
                                                    root
                                            )
                                            linepos(
                                                    parts.RightLowerLeg_RightFoot,
                                                    positions.RightLowerLeg,
                                                    positions.RightFoot,
                                                    flags["Skeleton Thickness"],
                                                    root
                                            )
    
                                            for _, part in pairs(parts) do
                                                part.Visible = true
                                            end
                                        else
                                            for _, part in pairs(parts) do
                                                part.Visible = false
                                            end
                                        end
                                    end
    
                                    do -- boxes
                                        if on_screen and flags["Enable Boxes"] then
                                            local box_style = flags["Box Style"] or "Full Box"
                                            
                                            if box_style == "Full Box" then
                                                drawings.box.Size = UDim2.new(0, scale.X - 1, 0, scale.Y - 1)
                                                drawings.box2.Size = UDim2.new(0, scale.X + 1, 0, scale.Y + 1)
                                                drawings.box.Position = UDim2.new(0, pos.X - (scale.X / 2), 0, pos.Y - (scale.Y / 2) + 3)
                                                drawings.box2.Position = UDim2.new(0, pos.X - (scale.X / 2) - 1, 0, pos.Y - (scale.Y / 2) + 2)
        
                                                if flags["Boxes Filled"] then
                                                    drawings.box.BackgroundTransparency = flags["Boxes Filled Opacity"] / 100
                                                    drawings.box.BackgroundColor3 = flags["Filled Boxes Accent"].Color
                                                else
                                                    drawings.box.BackgroundTransparency = 1
                                                end
        
                                                drawings.box.Visible = true
                                                drawings.box2.Visible = true
                                                drawings.Outline2.Color = drawings.Outline2.Color:Lerp(
                                                        (
                                                                flags["Highlight ESP"]
                                                                        and highlight_player == player
                                                                        and flags["Highlight Accent"].Color
                                                        )
                                                                and flags["Highlight Accent"].Color
                                                                or flags["Boxes Accent"].Color,
                                                        0.02
                                                )
                                                
                                                for _, corner in pairs(corner_frames) do
                                                    corner.Visible = false
                                                end
                                            else
                                                drawings.box.Visible = false
                                                drawings.box2.Visible = false
                                                
                                                local positions = {
                                                    { "LeftTopFix", pos.X - scale.X / 2, pos.Y - scale.Y / 2, 1, 12 },
                                                    { "RightTopFix", pos.X + scale.X / 2 - 1, pos.Y - scale.Y / 2, 1, 12 },
                                                    { "BottomSideFix", pos.X - scale.X / 2, pos.Y + scale.Y / 2 - 6 },
                                                    { "BottomRightSideFix", pos.X + scale.X / 2 - 1, pos.Y + scale.Y / 2 - 6 },
                                                    {
                                                        "LeftTop",
                                                        pos.X - scale.X / 2,
                                                        pos.Y - scale.Y / 2,
                                                        scale.X / 3,
                                                        1,
                                                        Vector2.new(0, 0),
                                                    },
                                                    {
                                                        "LeftSide",
                                                        pos.X - scale.X / 2,
                                                        pos.Y - scale.Y / 2,
                                                        1,
                                                        scale.Y / 4,
                                                        Vector2.new(0, 0),
                                                    },
                                                    {
                                                        "RightTop",
                                                        pos.X + scale.X / 2,
                                                        pos.Y - scale.Y / 2,
                                                        scale.X / 3,
                                                        1,
                                                        Vector2.new(1, 0),
                                                    },
                                                    {
                                                        "RightSide",
                                                        pos.X + scale.X / 2 - 1,
                                                        pos.Y - scale.Y / 2,
                                                        1,
                                                        scale.Y / 4,
                                                        Vector2.new(0, 0),
                                                    },
                                                    {
                                                        "BottomSide",
                                                        pos.X - scale.X / 2,
                                                        pos.Y + scale.Y / 2,
                                                        1,
                                                        scale.Y / 4,
                                                        Vector2.new(0, 3),
                                                    },
                                                    {
                                                        "BottomDown",
                                                        pos.X - scale.X / 2,
                                                        pos.Y + scale.Y / 2,
                                                        scale.X / 3,
                                                        1,
                                                        Vector2.new(0, 1),
                                                    },
                                                    {
                                                        "BottomRightSide",
                                                        pos.X + scale.X / 2,
                                                        pos.Y + scale.Y / 2,
                                                        1,
                                                        scale.Y / 4,
                                                        Vector2.new(1, 1),
                                                    },
                                                    {
                                                        "BottomRightDown",
                                                        pos.X + scale.X / 2,
                                                        pos.Y + scale.Y / 2,
                                                        scale.X / 3,
                                                        1,
                                                        Vector2.new(1, 1),
                                                    },
                                                }
                                                
                                                for _, v in pairs(positions) do
                                                    local name, x_pos, y_pos, width, height, anchor = unpack(v)
                                                    local drawing = corner_frames[name]
                                                    
                                                    drawing.Position = UDim2.new(0, x_pos, 0, y_pos)
                                                    
                                                    if not string.find(name, "Fix") then
                                                        drawing.Size = UDim2.new(0, width, 0, height)
                                                        drawing.AnchorPoint = anchor
                                                        drawing.BorderSizePixel = 1
                                                    else
                                                        drawing.BorderSizePixel = 0
                                                    end
                                                    
                                                    drawing.Visible = true
                                                    drawing.BackgroundColor3 = drawing.BackgroundColor3:Lerp(
                                                        (flags["Highlight ESP"] and highlight_player == player and flags["Highlight Accent"].Color)
                                                            and flags["Highlight Accent"].Color
                                                            or flags["Boxes Accent"].Color,
                                                        0.02
                                                    )
                                                end
                                            end
                                        else
                                            drawings.box.Visible = false
                                            drawings.box2.Visible = false
                                            
                                            -- Hide corners too
                                            for _, corner in pairs(corner_frames) do
                                                corner.Visible = false
                                            end
                                        end
                                    end
    
                                    do -- distances
                                        if on_screen and flags["Enable Distance"] then
                                            local box_side = pos.X + (scale.X / 2)
                                            local box_top = pos.Y - (scale.Y / 2)
                                            drawings.distance.Position = UDim2.new(0, box_side + 3, 0, box_top - 1)
                                            drawings.distance.Visible = true
                                            drawings.distance.TextColor3 = drawings.distance.TextColor3:Lerp(
                                                    (
                                                            flags["Highlight ESP"]
                                                                    and highlight_player == player
                                                                    and flags["Highlight Accent"].Color
                                                    )
                                                            and flags["Highlight Accent"].Color
                                                            or flags["Distance Accent"].Color,
                                                    0.02
                                            )
                                            drawings.distance.Text = string.format("%ds", math.floor(max_distance))
                                        else
                                            drawings.distance.Visible = false
                                        end
                                    end
    
                                    do -- weapon
                                        if on_screen and flags["Enable Weapon"] then
                                            drawings.weapon.Visible = true
                                            drawings.weapon.Position = UDim2.new(0, pos.X - 2, 0, pos.Y + scale.Y / 2 + 11)
                                            drawings.weapon.TextColor3 = drawings.weapon.TextColor3:Lerp(
                                                    (
                                                            flags["Highlight ESP"]
                                                                    and highlight_player == player
                                                                    and flags["Highlight Accent"].Color
                                                    )
                                                            and flags["Highlight Accent"].Color
                                                            or flags["Weapon Accent"].Color,
                                                    0.02
                                            )
                                            drawings.weapon.Text = player_esp.functions.get_tool(character)
                                        else
                                            drawings.weapon.Visible = false
                                        end
                                    end
    
                                    do -- top icon
                                        if (on_screen) and flags["Enable Visible Icons"] then
                                            if player_esp.functions.is_visible(character) then
                                                drawings.icon_top.Image = "rbxassetid://14239914881";
                                                drawings.icon_top.ImageColor3 = drawings.icon_top.ImageColor3:Lerp(Color3.fromRGB(0, 255, 0), 0.02);
                                            else
                                                drawings.icon_top.Image = "rbxassetid://14239920245";
                                                drawings.icon_top.ImageColor3 = drawings.icon_top.ImageColor3:Lerp(flags["Visible Icon Accent"].Color, 0.02);
                                            end;
                                            drawings.icon_top.Visible = true;
                                            drawings.icon_top.Position = UDim2.new(0, pos.X, 0, pos.Y - scale.Y / 2 - 25);
                                            drawings.icon_top.Size = UDim2.new(0, 28, 0, 28);
                                        else
                                            drawings.icon_top.Visible = false;
                                        end;
                                    end;
    
                                    do -- healthbar
                                        if on_screen and flags["Enable Healthbar"] and humanoid and humanoid.Health then
                                            local health, max_health = math.floor(humanoid.Health), humanoid.MaxHealth
                                            local health_color =
                                            flags["Health3"].Color
                                                  :lerp(flags["Health2"].Color, math.clamp(health / max_health, 0, 1))
                                            health_color = health_color:lerp(
                                                flags["Health1"].Color,
                                                    math.clamp((health / max_health - 0.5) * 2, 0, 1)
                                            )
                                            
                                            do -- healthbar animation
                                                tween.health_start = tween.health_start or 0
                                                tween.health_transition_start = tween.health_transition_start or health
                                                tween.health_transition_old = tween.health_transition_old or health
                                                tween.current_health = tween.current_health or health
    
                                                if health ~= tween.health_transition_start then
                                                    tween.health_transition_old, tween.health_transition_start, tween.health_start =
                                                    tween.current_health, health, tick()
                                                end
                                            end
    
                                            for _, part in pairs(torso_angle_parts) do
                                                part.Visible = false
                                            end

                                            local progress = math.clamp((tick() - tween.health_start) / 0.2, 0, 1)
                                            tween.current_health = tween.health_transition_old
                                                    + (tween.health_transition_start - tween.health_transition_old)
                                                    * progress
    
                                            if progress >= 1 then
                                                tween.current_health, tween.health_transition_old, tween.health_transition_start, tween.health_start =
                                                health, health, health, 0
                                            end
    
                                            if flags["Enable Healthtext"] then
                                                drawings.HealthText.TextColor3 = health_color
                                                drawings.HealthText.Text, drawings.HealthText.Visible =
                                                tostring(math.floor(tween.current_health)), true
                                            else
                                                drawings.HealthText.Visible = false
                                            end
    
                                            drawings.Healthbar.Visible = true
                                            drawings.BehindHealthbar.Visible = true
                                            drawings.HealthbarGradient.Enabled = flags["Healthbar Gradient"]
                                            drawings.HealthbarGradient.Color = rgbseq{rgbkey(0, flags["Health1"].Color), rgbkey(0.5, flags["Health2"].Color), rgbkey(1, flags["Health3"].Color)}
                                            
                                            local bar_width = 1
                                            local bar_height_adjust = 3
                                            local target_height = scale.Y * (tween.current_health / max_health)
                                                    + bar_height_adjust
    
                                            local bar_offset = 5 + math.max(0, bar_width)
                                            drawings.Healthbar.Position = UDim2.new(
                                                    0,
                                                    pos.X - scale.X / 2 - bar_offset,
                                                    0,
                                                    pos.Y - scale.Y / 2 + scale.Y * (1 - tween.current_health / max_health) + 1
                                            )
                                            drawings.BehindHealthbar.Position =
                                            UDim2.new(0, pos.X - scale.X / 2 - bar_offset, 0, pos.Y - scale.Y / 2 + 1)
                                            drawings.Healthbar.Size = UDim2.new(0, bar_width, 0, target_height)
                                            drawings.BehindHealthbar.Size =
                                            UDim2.new(0, bar_width, 0, scale.Y + bar_height_adjust)
                                            local target_text_pos = UDim2.new(
                                                    0,
                                                    pos.X - scale.X / 2 - 9,
                                                    0,
                                                    pos.Y - scale.Y / 2 + scale.Y * (1 - tween.current_health / max_health) + 5
                                            ) or UDim2.new(
                                                    0,
                                                    pos.X - scale.X / 2 + scale.X * (tween.current_health / max_health),
                                                    0,
                                                    pos.Y + scale.Y / 2 + 5
                                            )
                                            drawings.HealthText.Position =
                                            drawings.HealthText.Position:Lerp(target_text_pos, progress)
                                            drawings.Healthbar.BackgroundColor3 = flags["Healthbar Gradient"] and rgb(255, 255, 255) or health_color
                                        else
                                            drawings.Healthbar.Visible = false
                                            drawings.BehindHealthbar.Visible = false
                                            drawings.HealthText.Visible = false
                                        end
                                        --
                                    end
                                else
                                    for _, v in ipairs({
                                        "name",
                                        "box",
                                        "box2",
                                        "distance",
                                        "weapon",
                                        "BehindHealthbar",
                                        "HealthText",
                                        "Healthbar",
                                        "icon_top",
                                    }) do
                                        drawings[v].Visible = false
                                    end
                                    for _, part in pairs(parts) do
                                        part.Visible = false
                                    end
                                    for _, part in pairs(viewangle_parts) do
                                        part.Visible = false
                                    end
                                    for _, corner in pairs(corner_frames) do
                                        corner.Visible = false
                                    end
                                    chams.Enabled = false
                                end
                            else
                                for _, v in ipairs({
                                    "name",
                                    "box",
                                    "box2",
                                    "distance",
                                    "weapon",
                                    "BehindHealthbar",
                                    "HealthText",
                                    "Healthbar",
                                    "icon_top"
                                }) do
                                    drawings[v].Visible = false
                                end
                                for _, part in pairs(parts) do
                                    part.Visible = false
                                end
                                for _, part in pairs(viewangle_parts) do
                                    part.Visible = false
                                end
                                for _, corner in pairs(corner_frames) do
                                    corner.Visible = false
                                end
                                chams.Enabled = false
                            end
                        end
                    end
                end)
            end
    
            local cache = player_esp.drawing_cache[#player_esp.drawing_cache]
            cache.update_conn = run_service["RenderStepped"]:Connect(player_esp.update_esp)
        end

        player_esp.remove_player_ESP = function(player)
            for _, cache in ipairs(player_esp.drawing_cache) do
                if cache.player == player then
                    if cache.update_conn then
                        cache.update_conn:Disconnect()
                    end
                    cache.esp_holder:Destroy()
                    table.remove(player_esp.drawing_cache, _)
                    break
                end
            end
        end

        player_esp.on_player_added = function(player)
            local connections = {}
            connections.character_added = player.CharacterAdded:Connect(function()
                player_esp.update_player_ESP(player)
            end)
            connections.character_removing = player.CharacterRemoving:Connect(function()
                player_esp.remove_player_ESP(player)
            end)
    
            player_esp.connection_cache = player_esp.connection_cache or {}
            table.insert(player_esp.connection_cache, { player = player, connections = connections })
    
            if player.Character then
                player_esp.update_player_ESP(player)
            end
        end

        player_esp.handle_existing_players = function()
            local player_list = players:GetPlayers()
            for i = 1, #player_list do
                local player = player_list[i]
                if player.Name ~= lplayer_name then
                    player_esp.on_player_added(player)
                end
            end
        end

        players.PlayerAdded:Connect(player_esp.on_player_added)

        players.PlayerRemoving:Connect(function(player)
            player_esp.remove_player_ESP(player)
            for i, cache in ipairs(player_esp.connection_cache) do
                if cache.player == player then
                    for _, conn in pairs(cache.connections) do
                        conn:Disconnect()
                    end
                    table.remove(player_esp.connection_cache, i)
                    break
                end
            end
        end)
        
        player_esp.handle_existing_players()
    end

local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer

local NoDamageSettings = {
    VelocityMultiplier = 32768, -- Фиксированное значение для полета
}

local DesyncTypes = {}

-- Основная логика десинхронизации
RunService.Heartbeat:Connect(function()
    if library.flags["NoDamage"] then
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Health > 0 then
            local humanoid = LocalPlayer.Character.Humanoid
            local rootPart = LocalPlayer.Character.HumanoidRootPart
            
            DesyncTypes[1] = rootPart.CFrame
            DesyncTypes[2] = rootPart.AssemblyLinearVelocity

            -- Устанавливаем временную позицию без вращения
            local SpoofThis = rootPart.CFrame

            rootPart.CFrame = SpoofThis
            rootPart.AssemblyLinearVelocity = Vector3.new(1, 1, 1) * NoDamageSettings.VelocityMultiplier

            RunService.RenderStepped:Wait()

            -- Восстанавливаем исходные значения
            rootPart.CFrame = DesyncTypes[1]
            rootPart.AssemblyLinearVelocity = DesyncTypes[2]

            task.wait(0.05) -- Небольшая задержка для плавности
        end
    end
end)

-- Хук для CFrame
LPH_NO_VIRTUALIZE(function()
    local mt = getrawmetatable(game)
    local old_index = mt.__index
    local old_newindex = mt.__newindex
    setreadonly(mt, false)

    mt.__index = function(self, prop)
        if checkcaller() then return old_index(self, prop) end

        -- Существующая логика для Third Person
        if self == camera and prop == "CFrame" and flags["Third Person"] and flags["Third Person Key"].active and not (flags["Freecam Keybind"].active and flags["Enable Freecam"]) then
            local traceback = debug.traceback()
            for _, v in pattern do
                if traceback:find(v, 1, true) then
                    local cframe_new = old_index(self, prop)
                    local look_vector = cframe_new.LookVector
                    return cframe_new + look_vector * flags["Third Person Distance"]
                end
            end
        end

        -- Новая логика десинхронизации
        if library.flags["NoDamage"] and not checkcaller() then
            if prop == "CFrame" and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Health > 0 then
                if self == LocalPlayer.Character.HumanoidRootPart then
                    return DesyncTypes[1] or CFrame.new()
                elseif self == LocalPlayer.Character.Head then
                    return DesyncTypes[1] and DesyncTypes[1] + Vector3.new(0, LocalPlayer.Character.HumanoidRootPart.Size.Y / 2 + 0.5, 0) or CFrame.new()
                end
            end
        end

        return old_index(self, prop)
    end

    -- Существующая логика для __newindex
    mt.__newindex = function(self, prop, value)
        if checkcaller() then return old_newindex(self, prop, value) end
        if self == camera and prop == "CFrame" and flags["Third Person"] and flags["Third Person Key"].active and not (flags["Freecam Keybind"].active and flags["Enable Freecam"]) then
            return old_newindex(self, prop, value + camera.CFrame.LookVector * -flags["Third Person Distance"])
        end
        return old_newindex(self, prop, value)
    end
    setreadonly(mt, true)
end)()

-- Функция переключения NoDamage
local function ToggleNoDamage(state)
    library.flags["NoDamage"] = state
    if state then
        if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("Humanoid") or LocalPlayer.Character.Humanoid.Health <= 0 then
            library.flags["NoDamage"] = false
            return
        end
    else
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.Humanoid.Health > 0 then
            LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0) -- Сбрасываем скорость
        end
    end
end

-- Обработка респавна
LocalPlayer.CharacterAdded:Connect(function(newChar)
    task.wait(0.1) -- Ждем загрузки персонажа
    if library.flags["NoDamage"] and newChar:FindFirstChild("Humanoid") and newChar.Humanoid.Health > 0 then
        ToggleNoDamage(true) -- Перезапускаем, если включено и жив
    end
end)

    LPH_NO_VIRTUALIZE(function()
        local bullet_stuff, raycast_stuff
        do
            local RefreshGC = function()
                for i, v in pairs(getgc(true)) do
                    if typeof(v) == "table" and rawget(v, "Raycast") then
                        raycast_stuff = v
                    elseif typeof(v) == "table" and rawget(v, "CreateProjectile") then
                        bullet_stuff = v
                    end
                    --
                    if typeof(v) == "function" then
                        local name = debug.getinfo(v).name

                        if name == "PlayAnimation" then-- NO CHAT THIS IS TOTALLY NOT FISHY GNG
                            local old_play_animation
                            old_play_animation = hookfunction(
                                v,
                                function(animation_name, ...)
                                    local output = { old_play_animation(animation_name, ...) }
									
                                    if (animation_name == "Bolt") and flags["Instant Bolt"] then
                                        return {
                                            Length = 0.015,
                                        }
                                    end
									
                                    return unpack(output)
                                end
                            )
                            continue
                        end
    
                        if name == "LocalHitFunction" then
                            local hitfunc; hitfunc = hookfunction(v, function(data, ...)
                                if data then
                                    local hitobj = data[1]
                                    local hitpos = data[2]
                                    local hitplayer = data[3]
                    
                                    if hitobj and hitpos then
                                        if flags["Bullet Tracers"] then
                                            local origin = workspace.CurrentCamera.CFrame.Position
                                            gxentry:CreateBeam(origin, hitpos)
                                        end
                    
                                        if table.find(gxentry.Bodyparts, hitobj.Name) then
                                            if flags["Hitmarkers"] then
                                                gxentry:CreateHitmarker(hitpos)
                                            end
    
                                            if flags["Hitsounds"] then
                                                gxentry:CreateSound()
                                            end

                                            if flags["Hitlogs"] then
                                                on_bullet_hit(hitobj)
                                            end
                                        end
                                    end
                                end
    
                                return hitfunc(data, ...)
                            end)
                        end

                        if name == "QuickStackItem" then
							table.insert(gxentry.QuickStackItems, v)
							continue
						end
                    end
                end
            end
            --
            do -- handling
                local_player.CharacterAdded:Connect(function(character)
                    local_char = character
                    --
                    task.wait(1)
                    RefreshGC()
                end)
            end
            --
            
            RefreshGC()

            if shoot_check_func then
            local old_shoot_check = shoot_check_func
            hookfunction(shoot_check_func, function(...)
                if Flags["Shoot While Jumping"] then
                    return true -- Игнорируем проверки на прыжок
                end
                return old_shoot_check(...)
            end)
        end
    
            local success, result = pcall(function()
                local rc
                rc = hookfunction(raycast_stuff.Raycast, function(...)
                    local args = { ... }
                    local calling = getcallingscript()
            
                    if getgenv().silent and getgenv().silent_key and math.random(1, 100) <= getgenv().silent_hitchance and calling and calling.Name == "ViewmodelController" then
                        local entry, closest_part = nil,nil
                        
                        local fetchSuccess, fetchError = pcall(function()
                            entry, closest_part, typeplayer = player_esp.functions.get_player()
                        end)
                    
                        if fetchSuccess and closest_part and entry and closest_part and entry ~= local_player and local_player.Character then
                            args[3] = (closest_part.Position - args[2]).Unit * 2500
                        end
                    end
            
                    return rc(unpack(args))
                end)
            end)
            
            if success then
                return result
            else
                return nil
            end
        end
    end)()
--
library:change_fontsize(12, "esp")
