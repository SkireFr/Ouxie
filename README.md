![N|Solid](https://media.discordapp.net/attachments/1218910662923911332/1232944717113851954/Banner.png?ex=662defbf&is=662c9e3f&hm=8d92313889c1b986d227fd08e91aaf25bee662353abc70a862f788eaf550c5ee&=&format=webp&quality=lossless&width=1024&height=357)
# OUXIE HUB
by skire
Open sourced script hub / projects
version 1.2

## Game Loader:
replace "_PROJECTNAME_" with the project name
```luau
loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireFr/Ouxie/main/Loader-Handler.lua"))():load(_PROJECTNAME_)
```
## Project Loader:
```luau
loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireFr/Ouxie/main/Loader-Handler.lua"))():load(game.PlaceId)
```
