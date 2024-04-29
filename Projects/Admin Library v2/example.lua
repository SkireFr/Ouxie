local admin = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireFr/Ouxie/main/Loader-Handler.lua"))():load("admin-library",{
    name = "cool admin"; --> admin name
	prefix = ";"; --> admin prefix
	key = Enum.KeyCode.Semicolon; --> prefix KeyCode (required) | (https://create.roblox.com/docs/reference/engine/enums/KeyCode)
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
