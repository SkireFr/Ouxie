local admin = loadstring(game:HttpGet("https://pastebin.com/raw/WPq8Cx9f"))():create({
    ["name"] = "cool admin";
	["prefix"] = ";"; -- prefix !!!
	["key"] = Enum.KeyCode.Semicolon; -- prefix key code !!! (https://create.roblox.com/docs/reference/engine/enums/KeyCode)
})

-- admin:addcmd(keywords, callback)
admin:addcmd({"say","print"}, function(msg)
    admin:system(msg)
end)

admin:addcmd({"re","kill","reset"}, function(user)
    user = game:GetService("Players")[user]
    user.Character.Head:Destroy()
    admin:system("killed", user.DisplayName)
end)