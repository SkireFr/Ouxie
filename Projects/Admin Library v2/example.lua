local admin = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireFr/Ouxie/main/Loader-Handler.lua"))():load("admin-library",{
    name = "cool admin"; -- admin name !!!
	prefix = ";"; -- prefix !!!
	key = Enum.KeyCode.Semicolon; -- prefix key code !!! (https://create.roblox.com/docs/reference/engine/enums/KeyCode)
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
