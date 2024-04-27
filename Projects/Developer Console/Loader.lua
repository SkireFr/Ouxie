local output = {}

function output:load(config)
    -- Instances: 41 | Scripts: 6 | Modules: 0
    local G2L = {};

    -- StarterGui.Output
    G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
    G2L["1"]["IgnoreGuiInset"] = true;
    G2L["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
    G2L["1"]["Name"] = [[Output]];
    G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
    G2L["1"]["ResetOnSpawn"] = false;

    -- StarterGui.Output.UI
    G2L["2"] = Instance.new("Frame", G2L["1"]);
    G2L["2"]["BorderSizePixel"] = 0;
    G2L["2"]["BackgroundColor3"] = Color3.fromRGB(47, 47, 47);
    G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["2"]["Size"] = config.Size
    G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
    G2L["2"]["AutomaticSize"] = Enum.AutomaticSize.Y;
    G2L["2"]["Name"] = [[UI]];

    -- StarterGui.Output.UI.UICorner
    G2L["3"] = Instance.new("UICorner", G2L["2"]);
    G2L["3"]["CornerRadius"] = UDim.new(0, 3);

    -- StarterGui.Output.UI.UIStroke
    G2L["4"] = Instance.new("UIStroke", G2L["2"]);
    G2L["4"]["Color"] = Color3.fromRGB(61, 61, 61);
    G2L["4"]["Thickness"] = 3;

    -- StarterGui.Output.UI.topbar
    G2L["5"] = Instance.new("Frame", G2L["2"]);
    G2L["5"]["BorderSizePixel"] = 0;
    G2L["5"]["BackgroundColor3"] = Color3.fromRGB(54, 54, 54);
    G2L["5"]["Size"] = UDim2.new(1, 0, 0, 27);
    G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["5"]["Name"] = [[topbar]];

    -- StarterGui.Output.UI.topbar.UICorner
    G2L["6"] = Instance.new("UICorner", G2L["5"]);
    G2L["6"]["CornerRadius"] = UDim.new(0, 4);

    -- StarterGui.Output.UI.topbar.UIStroke
    G2L["7"] = Instance.new("UIStroke", G2L["5"]);
    G2L["7"]["Color"] = Color3.fromRGB(61, 61, 61);

    -- StarterGui.Output.UI.topbar.Close
    G2L["8"] = Instance.new("ImageButton", G2L["5"]);
    G2L["8"]["BorderSizePixel"] = 0;
    G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["8"]["Size"] = UDim2.new(0, 27, 0, 27);
    G2L["8"]["Name"] = [[Close]];
    G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["8"]["Position"] = UDim2.new(1.0049999952316284, -29, 0, 0);
    G2L["8"]["BackgroundTransparency"] = 1;

    -- StarterGui.Output.UI.topbar.Close.Frame
    G2L["9"] = Instance.new("Frame", G2L["8"]);
    G2L["9"]["BorderSizePixel"] = 0;
    G2L["9"]["BackgroundColor3"] = Color3.fromRGB(54, 54, 54);
    G2L["9"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["9"]["Size"] = UDim2.new(0.6000000238418579, 0, 0.6000000238418579, 0);
    G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["9"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    -- StarterGui.Output.UI.topbar.Close.Frame.LocalScript
    G2L["a"] = Instance.new("LocalScript", G2L["9"]);


    -- StarterGui.Output.UI.topbar.Close.ImageLabel
    G2L["b"] = Instance.new("ImageLabel", G2L["8"]);
    G2L["b"]["BorderSizePixel"] = 0;
    G2L["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["b"]["Image"] = [[rbxassetid://7072725342]];
    G2L["b"]["Size"] = UDim2.new(0.5, 0, 0.5, 0);
    G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["b"]["BackgroundTransparency"] = 1;
    G2L["b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    -- StarterGui.Output.UI.topbar.Close.LocalScript
    G2L["c"] = Instance.new("LocalScript", G2L["8"]);


    -- StarterGui.Output.UI.topbar.Label
    G2L["d"] = Instance.new("TextLabel", G2L["5"]);
    G2L["d"]["BorderSizePixel"] = 0;
    G2L["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    G2L["d"]["TextSize"] = 14;
    G2L["d"]["TextColor3"] = Color3.fromRGB(161, 161, 161);
    G2L["d"]["Size"] = UDim2.new(1, 0, 1, 0);
    G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["d"]["Text"] = [[Output v1.2]];
    G2L["d"]["Name"] = [[Label]];
    G2L["d"]["BackgroundTransparency"] = 1;

    -- StarterGui.Output.UI.optionsbar
    G2L["e"] = Instance.new("Frame", G2L["2"]);
    G2L["e"]["BorderSizePixel"] = 0;
    G2L["e"]["BackgroundColor3"] = Color3.fromRGB(47, 47, 47);
    G2L["e"]["BackgroundTransparency"] = 0.6000000238418579;
    G2L["e"]["Size"] = UDim2.new(1, 0, 0, 27);
    G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["e"]["Position"] = UDim2.new(0, 0, 0, 25);
    G2L["e"]["Name"] = [[optionsbar]];

    -- StarterGui.Output.UI.optionsbar.UIStroke
    G2L["f"] = Instance.new("UIStroke", G2L["e"]);
    G2L["f"]["Color"] = Color3.fromRGB(31, 31, 31);

    -- StarterGui.Output.UI.optionsbar.Clear
    G2L["10"] = Instance.new("ImageButton", G2L["e"]);
    G2L["10"]["BorderSizePixel"] = 0;
    G2L["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["10"]["Size"] = UDim2.new(0, 27, 0, 27);
    G2L["10"]["Name"] = [[Clear]];
    G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["10"]["Position"] = UDim2.new(1.0049999952316284, -29, 0, 0);
    G2L["10"]["BackgroundTransparency"] = 1;

    -- StarterGui.Output.UI.optionsbar.Clear.Frame
    G2L["11"] = Instance.new("Frame", G2L["10"]);
    G2L["11"]["BorderSizePixel"] = 0;
    G2L["11"]["BackgroundColor3"] = Color3.fromRGB(54, 54, 54);
    G2L["11"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["11"]["Size"] = UDim2.new(0.6000000238418579, 0, 0.6000000238418579, 0);
    G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["11"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    -- StarterGui.Output.UI.optionsbar.Clear.Frame.LocalScript
    G2L["12"] = Instance.new("LocalScript", G2L["11"]);


    -- StarterGui.Output.UI.optionsbar.Clear.ImageLabel
    G2L["13"] = Instance.new("ImageLabel", G2L["10"]);
    G2L["13"]["BorderSizePixel"] = 0;
    G2L["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["13"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["13"]["Image"] = [[rbxassetid://7072725208]];
    G2L["13"]["Size"] = UDim2.new(0.5, 0, 0.5, 0);
    G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["13"]["BackgroundTransparency"] = 1;
    G2L["13"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    -- StarterGui.Output.UI.optionsbar.Filter
    G2L["14"] = Instance.new("Frame", G2L["e"]);
    G2L["14"]["BorderSizePixel"] = 0;
    G2L["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["14"]["BackgroundTransparency"] = 1;
    G2L["14"]["Size"] = UDim2.new(1, 0, 1, 0);
    G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["14"]["Name"] = [[Filter]];

    -- StarterGui.Output.UI.optionsbar.Filter.Filter
    G2L["15"] = Instance.new("Frame", G2L["14"]);
    G2L["15"]["BorderSizePixel"] = 0;
    G2L["15"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
    G2L["15"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["15"]["Size"] = UDim2.new(1, 0, 0.7300000190734863, 0);
    G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["15"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
    G2L["15"]["Name"] = [[Filter]];

    -- StarterGui.Output.UI.optionsbar.Filter.Filter.UIStroke
    G2L["16"] = Instance.new("UIStroke", G2L["15"]);
    G2L["16"]["Color"] = Color3.fromRGB(21, 21, 21);

    -- StarterGui.Output.UI.optionsbar.Filter.Filter.Box
    G2L["17"] = Instance.new("TextBox", G2L["15"]);
    G2L["17"]["CursorPosition"] = -1;
    G2L["17"]["PlaceholderColor3"] = Color3.fromRGB(191, 191, 191);
    G2L["17"]["BorderSizePixel"] = 0;
    G2L["17"]["TextSize"] = 13;
    G2L["17"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    G2L["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["17"]["TextColor3"] = Color3.fromRGB(191, 191, 191);
    G2L["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    G2L["17"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["17"]["BackgroundTransparency"] = 1;
    G2L["17"]["PlaceholderText"] = [[Filter...]];
    G2L["17"]["Size"] = UDim2.new(0.9800000190734863, 0, 1, 0);
    G2L["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["17"]["Text"] = [[]];
    G2L["17"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
    G2L["17"]["Name"] = [[Box]];

    -- StarterGui.Output.UI.optionsbar.Filter.Filter.Box.LocalScript
    G2L["18"] = Instance.new("LocalScript", G2L["17"]);


    -- StarterGui.Output.UI.optionsbar.Filter.UIPadding
    G2L["19"] = Instance.new("UIPadding", G2L["14"]);
    G2L["19"]["PaddingRight"] = UDim.new(0, 30);
    G2L["19"]["PaddingLeft"] = UDim.new(0, 5);

    -- StarterGui.Output.UI.Dragify
    G2L["1a"] = Instance.new("LocalScript", G2L["2"]);
    G2L["1a"]["Name"] = [[Dragify]];

    -- StarterGui.Output.UI.Function
    G2L["1b"] = Instance.new("LocalScript", G2L["2"]);
    G2L["1b"]["Name"] = [[Function]];

    -- StarterGui.Output.UI.Function.Message
    G2L["1c"] = Instance.new("Frame", G2L["1b"]);
    G2L["1c"]["BorderSizePixel"] = 0;
    G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["1c"]["BackgroundTransparency"] = 1;
    G2L["1c"]["Size"] = UDim2.new(1, 0, 0, 0);
    G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["1c"]["Position"] = UDim2.new(-4.19970511700285e-08, 0, 0, 0);
    G2L["1c"]["AutomaticSize"] = Enum.AutomaticSize.Y;
    G2L["1c"]["Name"] = [[Message]];

    -- StarterGui.Output.UI.Function.Message.Content
    G2L["1d"] = Instance.new("TextLabel", G2L["1c"]);
    G2L["1d"]["TextWrapped"] = true;
    G2L["1d"]["BorderSizePixel"] = 0;
    G2L["1d"]["TextYAlignment"] = Enum.TextYAlignment.Top;
    G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["1d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    G2L["1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
    G2L["1d"]["TextSize"] = 14;
    G2L["1d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["1d"]["AutomaticSize"] = Enum.AutomaticSize.Y;
    G2L["1d"]["Size"] = UDim2.new(1, 0, 0, 0);
    G2L["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["1d"]["Text"] = [[message fr]];
    G2L["1d"]["Name"] = [[Content]];
    G2L["1d"]["BackgroundTransparency"] = 1;

    -- StarterGui.Output.UI.Function.Message.Content.UIPadding
    G2L["1e"] = Instance.new("UIPadding", G2L["1d"]);
    G2L["1e"]["PaddingTop"] = UDim.new(0, 5);
    G2L["1e"]["PaddingLeft"] = UDim.new(0, 60);

    -- StarterGui.Output.UI.Function.Message.Timestamp
    G2L["1f"] = Instance.new("TextLabel", G2L["1c"]);
    G2L["1f"]["BorderSizePixel"] = 0;
    G2L["1f"]["TextYAlignment"] = Enum.TextYAlignment.Top;
    G2L["1f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["1f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    G2L["1f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
    G2L["1f"]["TextSize"] = 14;
    G2L["1f"]["TextColor3"] = Color3.fromRGB(121, 121, 121);
    G2L["1f"]["Size"] = UDim2.new(0, 50, 1, 0);
    G2L["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["1f"]["Text"] = [[60:60:60]];
    G2L["1f"]["Name"] = [[Timestamp]];
    G2L["1f"]["BackgroundTransparency"] = 1;

    -- StarterGui.Output.UI.Function.Message.Timestamp.UIPadding
    G2L["20"] = Instance.new("UIPadding", G2L["1f"]);
    G2L["20"]["PaddingTop"] = UDim.new(0, 5);
    G2L["20"]["PaddingLeft"] = UDim.new(0, 5);

    -- StarterGui.Output.UI.Function.Message.UIPadding
    G2L["21"] = Instance.new("UIPadding", G2L["1c"]);
    G2L["21"]["PaddingBottom"] = UDim.new(0, 7);

    -- StarterGui.Output.UI.Console
    G2L["22"] = Instance.new("Frame", G2L["2"]);
    G2L["22"]["BorderSizePixel"] = 0;
    G2L["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["22"]["BackgroundTransparency"] = 1;
    G2L["22"]["Size"] = UDim2.new(1, 0, 0, 155);
    G2L["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["22"]["Position"] = UDim2.new(0, 0, 0, 51);
    G2L["22"]["Name"] = [[Console]];

    -- StarterGui.Output.UI.Console.Console
    G2L["23"] = Instance.new("ScrollingFrame", G2L["22"]);
    G2L["23"]["Active"] = true;
    G2L["23"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
    G2L["23"]["BorderSizePixel"] = 0;
    G2L["23"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
    G2L["23"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["23"]["AnchorPoint"] = Vector2.new(0.5, 0);
    G2L["23"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
    G2L["23"]["BackgroundTransparency"] = 1;
    G2L["23"]["Size"] = UDim2.new(0.9900000095367432, 0, 1, 0);
    G2L["23"]["ScrollBarImageColor3"] = Color3.fromRGB(71, 71, 71);
    G2L["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["23"]["ScrollBarThickness"] = 7;
    G2L["23"]["Position"] = UDim2.new(0.5, 0, 0, 0);
    G2L["23"]["Name"] = [[Console]];

    -- StarterGui.Output.UI.Console.Console.UIListLayout
    G2L["24"] = Instance.new("UIListLayout", G2L["23"]);
    G2L["24"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

    -- StarterGui.Output.UI.cmdr
    G2L["25"] = Instance.new("Frame", G2L["2"]);
    G2L["25"]["BorderSizePixel"] = 0;
    G2L["25"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
    G2L["25"]["Size"] = UDim2.new(1, 0, 0, 27);
    G2L["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["25"]["Position"] = UDim2.new(0, 0, 0, 217);
    G2L["25"]["Name"] = [[cmdr]];

    -- StarterGui.Output.UI.cmdr.UIStroke
    G2L["26"] = Instance.new("UIStroke", G2L["25"]);
    G2L["26"]["Color"] = Color3.fromRGB(31, 31, 31);

    -- StarterGui.Output.UI.cmdr.cmd
    G2L["27"] = Instance.new("Frame", G2L["25"]);
    G2L["27"]["BorderSizePixel"] = 0;
    G2L["27"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
    G2L["27"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["27"]["BackgroundTransparency"] = 1;
    G2L["27"]["Size"] = UDim2.new(1, 0, 0.7300000190734863, 0);
    G2L["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["27"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
    G2L["27"]["Name"] = [[cmd]];

    -- StarterGui.Output.UI.cmdr.cmd.UIStroke
    G2L["28"] = Instance.new("UIStroke", G2L["27"]);
    G2L["28"]["Color"] = Color3.fromRGB(21, 21, 21);

    -- StarterGui.Output.UI.cmdr.cmd.Box
    G2L["29"] = Instance.new("TextBox", G2L["27"]);
    G2L["29"]["CursorPosition"] = -1;
    G2L["29"]["PlaceholderColor3"] = Color3.fromRGB(191, 191, 191);
    G2L["29"]["BorderSizePixel"] = 0;
    G2L["29"]["TextSize"] = 13;
    G2L["29"]["TextXAlignment"] = Enum.TextXAlignment.Left;
    G2L["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["29"]["TextColor3"] = Color3.fromRGB(191, 191, 191);
    G2L["29"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    G2L["29"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["29"]["BackgroundTransparency"] = 1;
    G2L["29"]["PlaceholderText"] = [[Run a command]];
    G2L["29"]["Size"] = UDim2.new(0.9800000190734863, 0, 1, 0);
    G2L["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["29"]["Text"] = [[]];
    G2L["29"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
    G2L["29"]["Name"] = [[Box]];

    -- StarterGui.Output.UI.topbar.Close.Frame.LocalScript
    local function C_a()
    local script = G2L["a"];
        script.Parent.MouseEnter:Connect(function()
            script.Parent.BackgroundColor3 = Color3.fromRGB(90,90,90)
        end)
        script.Parent.MouseLeave:Connect(function()
            script.Parent.BackgroundColor3 = Color3.fromRGB(53,53,53)
        end)
    end;
    task.spawn(C_a);
    -- StarterGui.Output.UI.topbar.Close.LocalScript
    local function C_c()
    local script = G2L["c"];
        script.Parent.MouseButton1Click:Connect(function()
            script:FindFirstAncestor("UI"):Destroy()
        end)
    end;
    task.spawn(C_c);
    -- StarterGui.Output.UI.optionsbar.Clear.Frame.LocalScript
    local function C_12()
    local script = G2L["12"];
        script.Parent.MouseEnter:Connect(function()
            script.Parent.BackgroundColor3 = Color3.fromRGB(90,90,90)
        end)
        script.Parent.MouseLeave:Connect(function()
            script.Parent.BackgroundColor3 = Color3.fromRGB(53,53,53)
        end)
    end;
    task.spawn(C_12);
    -- StarterGui.Output.UI.optionsbar.Filter.Filter.Box.LocalScript
    local function C_18()
    local script = G2L["18"];
        local selected = false
        script.Parent.MouseEnter:Connect(function()
            if selected ~= true then
                script.Parent.Parent.UIStroke.Color = Color3.fromRGB(70,70,70)
            end
        end)
        script.Parent.MouseLeave:Connect(function()
            if selected ~= true then
                script.Parent.Parent.UIStroke.Color = Color3.fromRGB(20,20,20)
            end
        end)
        script.Parent.Focused:Connect(function()
            selected = true
            script.Parent.Parent.UIStroke.Color = Color3.fromRGB(85, 170, 255)
        end)
        script.Parent.FocusLost:Connect(function()
            selected = false
            script.Parent.Parent.UIStroke.Color = Color3.fromRGB(70,70,70)
        end)
    end;
    task.spawn(C_18);
    -- StarterGui.Output.UI.Dragify
    local function C_1a()
    local script = G2L["1a"];
        local UserInputService = game:GetService("UserInputService")
        
        local gui = script.Parent
        
        local dragging
        local dragInput
        local dragStart
        local startPos
        
        local function update(input)
            local delta = input.Position - dragStart
            gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
        
        gui.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = gui.Position
        
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        
        gui.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end)
    end;
    task.spawn(C_1a);
    -- StarterGui.Output.UI.Function
    local function C_1b()
    local script = G2L["1b"];
        latest = {
            name = "",
            output = "",
            count = 1 -- Initialize count to 1 for the first occurrence
        }
        
        local colors = {
            [Enum.MessageType.MessageOutput] = Color3.new(1, 1, 1), -- White
            [Enum.MessageType.MessageInfo] = Color3.fromRGB(0, 162, 255), -- Bright blue
            [Enum.MessageType.MessageWarning] = Color3.fromRGB(255, 255, 0), -- Bright yellow
            [Enum.MessageType.MessageError] = Color3.fromRGB(255, 0, 0) -- Bright red
        }
        
        game:GetService("LogService").MessageOut:Connect(function(output, messageType)
            if output == latest.output then
                latest.count = latest.count + 1 -- Increment count for repeated messages
                local existingMessage = script.Parent.Console.Console:FindFirstChild(tostring(latest.name))
                if existingMessage then
                    existingMessage.Content.Text = output .. " (x" .. latest.count .. ")"
                end
            else
                latest.count = 1 -- Reset count for new message
                local newLine = script.Message:Clone()
                local messageColor = colors[messageType] or Color3.new(1, 1, 1) -- Default to white if messageType not found
                newLine.Content.TextColor3 = messageColor
                newLine.Content.Text = output
                newLine.Name = tostring(tick())
                newLine.Timestamp.Text = tostring(os.date("%H:%M:%S", os.time()))
                newLine.Parent = script.Parent.Console.Console
                latest.name = newLine.Name
                latest.output = output
            end
            wait(.1)
        end)
        
        local function clear()
            for _, child in ipairs(script.Parent.Console.Console:GetChildren()) do
                if child:IsA("Frame") then
                    child:Destroy()
                end
            end
            script.Parent.Console.Console.CanvasPosition = Vector2.new(0,0)
        end
        
        local function search()
            local searchText = script.Parent.optionsbar.Filter.Filter.Box.Text
            local chars = #searchText
            for _, frame in ipairs(script.Parent.Console.Console:GetChildren()) do
                if frame:IsA("Frame") then
                    local content = frame.Content.Text
                    local lastChars = content:sub(#content - chars + 1, #content)
                    if searchText == "" or lastChars == searchText then
                        frame.Visible = true
                    else
                        frame.Visible = false
                    end
                end
            end
        end
        
        local function runcmd()
            local code = script.Parent.cmdr.cmd.Box.Text
            print(">", script.Parent.cmdr.cmd.Box.Text)
            loadstring(code)
        end
        
        script.Parent.cmdr.cmd.Box.FocusLost:Connect(runcmd)
        script.Parent.optionsbar.Filter.Filter.Box.Changed:Connect(search)
        script.Parent.optionsbar.Clear.MouseButton1Click:Connect(clear)
        
    end;
    task.spawn(C_1b);

    return G2L["1"], require;
end

return output
