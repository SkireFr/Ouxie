local data = {}

local t = tick()
function data:load(config)
    local url = config.track
    local args = string.split(url, "/")
    local id = args[5]
    local request = http_request or request or (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request)

    local args = string.split(config.track, "/")
    if args[4] == "playlist" then
        local function getData(id)
            local host = "https://api.spotifydown.com/download/"..id
            local d = request({
                Url = host,
                Method = "GET",
                Headers = {
                    ["Origin"] = "https://spotifydown.com";
                    ["Referer"] = "https://spotifydown.com/";
                }
            })
            return game:GetService("HttpService"):JSONDecode(d.Body)
        end
        local function getList(id)
            local host = "https://api.spotifydown.com/trackList/playlist/"..id
            local d = request({
                Url = host,
                Method = "GET",
                Headers = {
                    ["Origin"] = "https://spotifydown.com";
                    ["Referer"] = "https://spotifydown.com/";
                }
            })
            return game:GetService("HttpService"):JSONDecode(d.Body)
        end
        local data = getList(id)
        if data.success == true then
            print("Successfully got playlist, Getting data.")
            local tracks = {}
            for i,v in pairs(data.trackList) do
                local trackData = getData(v.id) -- Create a new table for each track
                tracks[trackData.metadata.title] = {
                    ["id"] = trackData.metadata.id,
                    ["title"] = trackData.metadata.title,
                    ["artists"] = trackData.metadata.artists,
                    ["cover"] = trackData.metadata.cover,
                    ["track"] = trackData.link
                }
                print("Getting", tracks[trackData.metadata.title].title)
            end
            print("Finished getting data, downloading... (could take up to 20s)")
            if isfolder(t.."_Spotify") then else makefolder(t.."_Spotify") end
            loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireFr/Ouxie/main/Projects/Spotify%20Player/assets/Spotify%20UI.lua"))():load({
                Scale = 1,
                Version = "1.0.0",
                Tick = t,
                file = t.."_Spotify",
                Tracks = tracks
            })
        else
            warn("Failed to get playlist, check the id")
        end
    elseif args[4] == "track" then

        local function getData(id)
            local host = "https://api.spotifydown.com/download/"..id
            local d = request({
                Url = host,
                Method = "GET",
                Headers = {
                    ["Origin"] = "https://spotifydown.com";
                    ["Referer"] = "https://spotifydown.com/";
                }
            })
            return game:GetService("HttpService"):JSONDecode(d.Body)
        end
        local data = getData(id)
        if data.success == true then
            print("Successfully got track, Getting data.")
            local tracks = {}
                local trackData = data
                tracks[trackData.metadata.title] = {
                    ["id"] = trackData.metadata.id,
                    ["title"] = trackData.metadata.title,
                    ["artists"] = trackData.metadata.artists,
                    ["cover"] = trackData.metadata.cover,
                    ["track"] = trackData.link
                }
                print("Finished getting data, downloading... (wait a sec)")
                if isfolder(t.."_Spotify") then else makefolder(t.."_Spotify") end
                loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireFr/Ouxie/main/Projects/Spotify%20Player/assets/Spotify%20UI.lua"))():load({
                    Scale = 1,
                    Version = "1.0.0",
                    Tick = t,
                    file = t.."_Spotify",
                    Tracks = tracks
                })
                print("Getting", tracks[trackData.metadata.title].title)
            end
        end
end

return data
