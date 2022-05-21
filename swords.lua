local f = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheLolik/sb-script/main/functions.lua"))()

local file = {}
function file:start(lib,win)
    local tab = win:Tab("Swords")
    local req = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request
    local lsa = false
    local kills = nil
    local phase = nil

    tab:Label("All Swords.")
    tab:Button("Use sword ability.", function()
        f:fire("ability")
    end)

    tab:Toggle("Loop-use sword ability.",false, function(t)
        lsa = t
        while lsa == true and game.RunService.RenderStepped:Wait() do
            f:fire("ability")
        end
    end)
  
    tab:Label("Canny-uncanny sword.")
  
    tab:Dropdown("Phase.",{"10","9","8","7","6","5","4","3","2","1","-1","-2","-3","-4","-5","-6","-7","-8","-9","-10"},function(x)
        phase = x
    end)

    tab:Button("Get phase.", function()
        if phase == nil then
            return lib:Notification("Notify","Reedem kills you want to get.","Ok")
        end
        pcall(function()
            local args = {[1] = "ability",[2] = tonumber(phase)}
            f:fire(args)
        end)
    end)
    
    tab:Label("Kill-streak sword.")
    tab:Textbox("Count of kills",false,function(t)
        kills = t
    end)

    tab:Button("Get killstreak kills.", function()
        if kills == nil then
            return lib:Notification("Notify","Reedem kills you want to get.","Ok")
        end
        pcall(function()
            local args = {[1] = "stealkills",[2] = tonumber(kills)}
            f:fire(args)
        end)
    end)
end

return file
