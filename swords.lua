local f = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheLolik/sb-script/main/functions.lua"))()

local file = {}
function file:start(lib,win)
    local tab = win:Tab("Swords")
    local req = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request
    local lsa = false
    local gid = nil
    local kills = 0

    tab:Textbox("Gamepass id.",false, function(t)
        gid = t
    end)

    tab:Button("Get gamepass swords.",function()
        if gid == nil then
            return lib:Notification("Notify","Reedem your gamepass id.","Ok")
        end
        for _,v in pairs(game.Players.LocalPlayer.PlayerGui.Selection.RequiresGamepass.ScrollingFrame:GetChildren()) do
            if v:IsA("Frame") then
                pcall(function()
                    v.GPId.Value = gid
                end)
            end
        end
    end)

    tab:Button("Get badges.", function()
        local requ = req({Url="https://api.roblox.com/universes/get-universe-containing-place?placeid="..tostring(game.PlaceId),Type="GET"})
        local uid = game:GetService("HttpService"):JSONDecode(requ.Body).UniverseId
        local badges = game:GetService("HttpService"):JSONDecode(req({Url="https://badges.roblox.com/v1/universes/"..tostring(uid).."/badges?limit=100&sortOrder=Asc",Type="GET"}).Body)
        for _,v in pairs(badges.data) do
            game.ReplicatedStorage.GiveBadge:FireServer(v.id)
        end
    end)
    
    tab:Label("Abilities")

    tab:Button("Use sword ability.", function()
        f:fire("ability")
    end)

    tab:Toggle("Loop-use sword ability.",false, function(t)
        lsa = t
        while lsa == true and game.RunService.RenderStepped:Wait() do
            f:fire("ability")
        end
    end)
    
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
