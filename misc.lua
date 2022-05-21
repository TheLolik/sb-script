local f = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheLolik/sb-script/main/functions.lua"))()

local file = {}
function file:start(lib,win)
    local tab = win:Tab("Main")
    local req = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request
    local gid = nil
    local kills = 0
    
    tab:Button("No camera shake.",function()
        game:GetService("Players").LocalPlayer.CameraShake:Destroy()    
    end)

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
end

return file
