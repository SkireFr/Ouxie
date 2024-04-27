![N|Solid](https://media.discordapp.net/attachments/1218910662923911332/1232944717113851954/Banner.png?ex=662defbf&is=662c9e3f&hm=8d92313889c1b986d227fd08e91aaf25bee662353abc70a862f788eaf550c5ee&=&format=webp&quality=lossless&width=1024&height=357)
# OUXIE HUB
by skire
Open sourced script hub / projects
version 1.2

## Project Loader:
replace "_PROJECTNAME_" with the project name
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireFr/Ouxie/main/Loader-Handler.lua"))():load(_PROJECTNAME_, config)
```
## Game Loader:
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireFr/Ouxie/main/Loader-Handler.lua"))():load(game.PlaceId)
```

## Supported Executors (or recommended):
some functions in ouxie are exclusive to some executers, heres a list of some:
| executor | success |
| ------ | ------ |
| Arceus X | 100% / true |
| Evon | 90-80% / i think |
| Krampus | 80-70% / maybe some (executecode is nil) |
| Codex | 50-40% / crappy fr (missing alot of functions) |
| Others | idk dm if it works on your exploit (list the script) |

## Requied Functions
some functions are nil for some executers, heres a list of some:
| function name | (args: type): returns |
| ------ | ------ |
| getsynasset | getsynasset(asset: string): string |
| identifyexecutor | identifyexecutor(): string |
| executecode | executecode(code: string): string |

## execute this code to see if you will be supported:
(unc tester)
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/unified-naming-convention/NamingStandard/main/UNCCheckEnv.lua"))()
```
