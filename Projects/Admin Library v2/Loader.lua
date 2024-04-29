local main = {}

VS = "2.0.0"

if getgenv().ADMIN then
	return
end

pcall(function() getgenv().ADMIN = true end)

local ui = loadstring(game:HttpGet("https://pastebin.com/raw/mpDnrrNP"))()
local script = ui.func
local UIS = game:GetService("UserInputService")
local TN = game:GetService("TweenService")
local cmdr = script.Parent.cmdr
local terminal = script.Parent.windows.terminal
local cmds = script.Parent.windows.commands
local Players = game:GetService("Players")

function main:load(config)
    local admin = {
        Prefix = config.prefix;
        Key = config.key;
        Name = config.name;
    }
    local commands = {}
    local function open(ui)
        local opening = true
        if ui==cmdr then
            if cmdr.Visible then
                opening = false
            end
            if opening then
                cmdr.Visible = true
                cmdr.Size = UDim2.new(0,0,0,0)
                cmdr.cmdr.Box.TextTransparency = 1
                TN:Create(cmdr, TweenInfo.new(0.2, Enum.EasingStyle.Linear), { Size = UDim2.new(0.936, 0,0.091, 0) }):Play()
                task.wait(0.2)
                TN:Create(cmdr.cmdr.Box, TweenInfo.new(0.2, Enum.EasingStyle.Linear), { TextTransparency = 0 }):Play()
            else
                TN:Create(cmdr.cmdr.Box, TweenInfo.new(0.2, Enum.EasingStyle.Linear), { TextTransparency = 1 }):Play()
                task.wait(0.2)
                TN:Create(cmdr, TweenInfo.new(0.2, Enum.EasingStyle.Linear), { Size = UDim2.new(0, 0,0, 0) }):Play()
                task.wait(0.2)
                cmdr.Visible = false	
            end
        elseif ui==terminal then
            if terminal.Visible then
                opening = false
            end
            if opening then
                terminal.Visible = true
                terminal.Size = UDim2.new(0,0,0,0)
                for i,v in pairs(terminal.list:GetChildren()) do
                    if v:IsA("TextLabel") then
                        v.TextTransparency = 1
                    end
                end
                TN:Create(terminal, TweenInfo.new(0.2, Enum.EasingStyle.Linear), { Size = UDim2.new(0.936, 0,0.822, 0) }):Play()
                task.wait(0.2)
                for i,v in pairs(terminal.list:GetDescendants()) do
                    if v:IsA("TextLabel") then
                        TN:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear), { TextTransparency = 0 }):Play()
                        task.wait(0.02)
                    end
                end
            else
                for i,v in pairs(terminal.list:GetDescendants()) do
                    if v:IsA("TextLabel") then
                        TN:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear), { TextTransparency = 1 }):Play()
                        task.wait(0.02)
                    end
                end
                task.wait(0.2)
                TN:Create(terminal, TweenInfo.new(0.2, Enum.EasingStyle.Linear), { Size = UDim2.new(0,0,0,0) }):Play()
                task.wait(0.2)
                terminal.Visible = false	
            end
        elseif ui==cmds then
            if cmds.Visible then
                opening = false
            end
            if opening then
                cmds.Visible = true
                cmds.Size = UDim2.new(0,0,0,0)
                cmds.Position = UDim2.new(0.5, 0,0.5, 0)
                cmds.topbar.TextLabel.TextTransparency = 1
                for i,v in pairs(cmds.list.cmds:GetDescendants()) do
                    if v:IsA("TextLabel") then
                        v.TextTransparency = 1
                    end
                end
                TN:Create(cmds, TweenInfo.new(0.2, Enum.EasingStyle.Linear), { Size = UDim2.new(0.307, 0,0.523, 0) }):Play()
                task.wait(0.2)
                TN:Create(cmds.topbar.TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Linear), { TextTransparency = 0 }):Play()
                task.wait(0.2)
                for i,v in pairs(cmds.list.cmds:GetDescendants()) do
                    if v:IsA("TextLabel") then
                        TN:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear), { TextTransparency = 0 }):Play()
                        task.wait(0.02)
                    end
                end
            else
                for i,v in pairs(cmds.list.cmds:GetDescendants()) do
                    if v:IsA("TextLabel") then
                        TN:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear), { TextTransparency = 1 }):Play()
                        task.wait(0.02)
                    end
                end
                task.wait(0.2)
                TN:Create(cmds.topbar.TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Linear), { TextTransparency = 1 }):Play()
                task.wait(0.2)
                TN:Create(cmds, TweenInfo.new(0.2, Enum.EasingStyle.Linear), { Size = UDim2.new(0,0,0,0) }):Play()
                task.wait(0.2)
                cmds.Visible = false
            end
        end
    end
    function admin:addcmd(keywords, callback)
        for _, keyword in ipairs(keywords) do
            commands[keyword] = callback
            local new = script.Parent.assets.commands.cmd:Clone()
            new.Name = keyword
            new.name.Text = keyword
            new.Visible = true
            new.Parent = cmds.list.cmds
        end
    end
    function admin:error(msg)
        local new = script.Parent.assets.terminal.error:Clone()
        new.Parent = terminal.list
        new.message.Text = msg
        new.Visible = true
    end
    function admin:info(msg)
        local new = script.Parent.assets.terminal.info:Clone()
        new.Parent = terminal.list
        new.message.Text = msg
        new.Visible = true
    end
    function admin:success(msg)
        local new = script.Parent.assets.terminal.success:Clone()
        new.Parent = terminal.list
        new.message.Text = msg
        new.Visible = true
    end
    function admin:system(msg)
        local new = script.Parent.assets.terminal.system:Clone()
        new.Parent = terminal.list
        new.message.Text = msg
        new.Visible = true
    end
    local function sendcmd(cmd)
        local args = string.split(cmd, " ")
        local command = args[1]:lower()
        if commands[command] then
            local success, output = pcall(function()
                commands[command](unpack(args, 2))
            end)
            if not success then
                admin:error(output)
            end
        else
            admin:error("Invalid command, use `cmds` for a list of avaible cmds")
        end
    end
    cmdr.cmdr.Box.FocusLost:Connect(function()
        sendcmd(cmdr.cmdr.Box.Text)
        task.wait(0.2)
        cmdr.cmdr.Box.Text = ""
    end)
    cmdr.cmdr.Box.Changed:Connect(function()
        local args = string.split(cmdr.cmdr.Box.Text, " ")
        local command = args[1]:lower()
        if commands[command] then
            TN:Create(cmdr.cmdr.Box, TweenInfo.new(0.2, Enum.EasingStyle.Linear), { TextColor3 = Color3.fromRGB(34,255,34) }):Play()
        else
            TN:Create(cmdr.cmdr.Box, TweenInfo.new(0.2, Enum.EasingStyle.Linear), { TextColor3 = Color3.fromRGB(255,34,34) }):Play()
        end
    end)
    admin:addcmd({"hide"}, function()
        open(cmdr)
        if terminal.Visible then open(terminal) end
        if cmds.Visible then open(cmds) end
    end)
    admin:addcmd({"print"}, function(msg)
        admin:system(msg)
    end)
    admin:addcmd({"terminal"}, function(option)
        if option == "clear" then
            for i,v in pairs(terminal.list:GetDescendants()) do
                if v:IsA("TextLabel") then
                    TN:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear), { TextTransparency = 1 }):Play()
                    task.wait(0.02)
                    v:Destroy()
                end
            end
            for i,v in pairs(terminal.list:GetDescendants()) do
                if v:IsA("Frame") then
                    v:Destroy()
                end
            end
        else
            open(terminal)
        end
    end)
    admin:addcmd({"commands", "cmds"}, function()
        open(cmds)
    end)
    UIS.InputBegan:Connect(function(key)
        if key.KeyCode == admin.Key and UIS:GetFocusedTextBox() == nil and not cmdr.Visible then
            open(cmdr)
            if cmdr.Visible then cmdr.cmdr.Box:CaptureFocus() end
        elseif  key.KeyCode == admin.Key and UIS:GetFocusedTextBox() == nil and cmdr.Visible then
            wait(0.1)
            cmdr.cmdr.Box:CaptureFocus()
        end
    end)
    script.Parent.Toggle.button.MouseButton1Click:Connect(function()
        if UIS:GetFocusedTextBox() == nil and not cmdr.Visible then
            open(cmdr)
            if cmdr.Visible then cmdr.cmdr.Box:CaptureFocus() end
        elseif UIS:GetFocusedTextBox() == nil and cmdr.Visible then
            wait(0.1)
            cmdr.cmdr.Box:CaptureFocus()
        end
    end)
    return admin
end

return main
