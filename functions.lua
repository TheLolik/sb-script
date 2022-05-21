local f = {}
local function f:fire(args,tool)
    if game.Players.LocalPlayer.Character then
        if tool == nil then
            if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                return game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
            elseif game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool") then
                return game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
            end
        else
            if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                if game.Players.LocalPlayer.Character:FindFirstChild(tool) then
                    return game:GetService("Players").LocalPlayer.Character:FindFirstChild(tool).RemoteEvent:FireServer(unpack(args))
                end
            elseif game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool") then
                if game.Players.LocalPlayer.Backpack:FindFirstChild(tool) then
                    return game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(tool).RemoteEvent:FireServer(unpack(args))
                end
            end
        end
    end
    return false
end
return f
