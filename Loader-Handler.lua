-- loader

local ouxie = {
    ["required-functions"] = {
        [1] = getsynasset;
        [2] = identifyexecutor;
    };
    ["games"] = {
        [14822302723] = "gun ball";
        [16480898254] = "Eat the World";
    };
    ["projects"] = {
        ["developer-console"] = {
            ["version"] = 1.2;
            ["source"] = "loadstring(game:HttpGet(\"https://source-raw\"))()";
            ["params"] = "/raw/YZr1dBG3";
        }
    };
    ["supported"] = {
        ["Arceus X"] = true;
        ["Krampus"] = true;
        ["Evon"] = true;
        ["Codex"] = false;
        ["Synapse X"] = false;
    };
    ["credits"] = {
        ["Creator"] = "Skire";
    };
    ["using"] = "github";
    ["base"] = "https://github.com/Skirefr/Ouxie";
    ["executor"] = identifyexecutor();
}

function ouxie:load(script)
    for i,v in pairs(ouxie["required-functions"]) do
        if v == nil then
            warn("unsupported function:", i, "(required-functions table)")
        end
    end
    local function get(script, type)
        if type == "game" then
            if ouxie.using == "github" then
                local src = string.gsub(ouxie.base.."OuxieHub/Games/"..ouxie.games[script]," ","%%20")
                print(src)
            else
                warn("lol no.")
            end
        end
    end
    if ouxie.executor ~= "Synapse X" then
        if ouxie.games[script] then
            get(script, "game")
        elseif ouxie.projects[script] then
            get(script, "project")
        else
            print("Unsupported (game) // Invalid (project)")
        end
    else
        warn("You cant spoof your executor like dat fr (not gunna load)")
    end
end

return ouxie
