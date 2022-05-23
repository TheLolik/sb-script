local f = {}

function f:getplr(plr)
    if plr == nil then
        return game.Players.LocalPlayer
    else
        if game.Players[plr] then
            return game.Players[plr]
        end
    end
    return nil
end

function f:getsword(tool,plr)
    if f:getplr(plr).Character then
        if tool == nil then
            if f:getplr(plr).Character:FindFirstChildOfClass("Tool") then
                return f:getplr(plr).Character:FindFirstChildOfClass("Tool")
            elseif f:getplr(plr).Backpack:FindFirstChildOfClass("Tool") then
                return f:getplr(plr).Backpack:FindFirstChildOfClass("Tool")
            end
        else
            if f:getplr(plr).Character:FindFirstChild(tool) then
                return f:getplr(plr).Character:FindFirstChild(tool)
            elseif f:getplr(plr).Backpack:FindFirstChild(tool) then
                return f:getplr(plr).Backpack:FindFirstChild(tool)
            end
        end
    end
    return nil
end

function f:fire(args,tool,plr)
    if f:getplr(plr).Character then
        if f:getsword(tool,plr) then
            if typeof(args) == "table" then
                return f:getsword(tool,plr).RemoteEvent:FireServer(unpack(args))
            else
                return f:getsword(tool,plr).RemoteEvent:FireServer(args)
            end
        end
    end
    return nil
end

return f
