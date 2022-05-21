local f = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheLolik/sb-script/main/functions.lua"))()

local file = {}
function file:start(lib,win)
    local options = {
        av = false,
        everyone = false,
        others = false,
        me = false
    }
    local players = {}
    for _,v in pairs(game:GetService("Players"):GetPlayers()) do table.insert(players,v.Name) end

    local kills = win:Tab("Players")
	kills:Toggle("Anti-void",false,function(x)
		options.av = x
		if options.av == true then
			local pos
			local ca = game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(child)
			    if child.Name == "VoidScreen" then
				child:Destroy()
				if game.Players.LocalPlayer.Character then
				    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
				    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
				end
			    end
			end)

			while options.av == true and wait() do
			    if game.Players.LocalPlayer.Character then
				pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			    end
			end
			repeat wait() until options.av == false
			ca:Disconnect()
		end
	end)

    kills:Label("God-Mode.")
    kills:Toggle("God-mode everyone",false,function(x)
        options.everyone = x
        while options.everyone == true and wait() do
            for _,v in pairs(game.Players:GetChildren()) do
                if v.Character then
                    local args = {[1] = "hitplr",[2] = v.Character,[3] = -1000}
                    f:fire(args)
                end
            end
        end
    end)

    kills:Toggle("God-mode others",false,function(x)
        options.others = x
        while options.others == true and wait() do
            for _,v in pairs(game.Players:GetChildren()) do
                if (v.Character) and (v.Name ~= game.Players.LocalPlayer.Name) then
                    local args = {[1] = "hitplr",[2] = v.Character,[3] = -1000}
                    f:fire(args)
                end
            end
        end
    end)

    kills:Toggle("God-mode your self",false,function(x)
        options.me = x
        while options.me == true and wait() do
            if game.Players.LocalPlayer.Character then
                local args = {[1] = "hitplr",[2] = game.Players.LocalPlayer.Character,[3] = -1000}
                f:fire(args)
                wait()
            end
        end
    end)


    kills:Label("Healing.")
    kills:Button("Heal everyone",function()
        for _,v in pairs(game.Players:GetChildren()) do
            if (v.Character) then
                local args = {[1] = "hitplr",[2] = v.Character,[3] = -1000}
                f:fire(args)
            end
        end
    end)

    kills:Button("Heal others",function()
        for _,v in pairs(game.Players:GetChildren()) do
            if (v.Character) and (v.Name ~= game.Players.LocalPlayer.Name) then
                local args = {[1] = "hitplr",[2] = v.Character,[3] = -1000}
                f:fire(args)
            end
        end
    end)

    kills:Button("Heal your self",function()
        if game.Players.LocalPlayer.Character then
            local args = {[1] = "hitplr",[2] = game.Players.LocalPlayer.Character,[3] = -1000}
            f:fire(args)
        end
    end)

    local hp = kills:Dropdown("Heal Player",players,function(x)
        if game.Players:FindFirstChild(x) then
            if game.Players[x].Character then
                local args = {[1] = "hitplr",[2] = game.Players[x].Character,[3] = -1000}
                f:fire(args)
            end
        end
    end)

    kills:Label("Killing.")
    kills:Button("Get some kills.", function()
        for _=1,1000 do
        game.RunService.RenderStepped:Wait()
            local args = {[1] = "hitplr",[2] = game:GetService("Players").LocalPlayer.Character,[3] = 100}
            f:fire(args)
        end
    end)

    kills:Label("Touching for On-hit swords.")
    kills:Button("Touch everyone",function()
        for _,v in pairs(game.Players:GetChildren()) do
            if (v.Character) then
                local args = {[1] = "hitplr",[2] = v.Character,[3] = 0}
                f:fire(args)
            end
        end
    end)

    kills:Button("Touch others",function()
        for _,v in pairs(game.Players:GetChildren()) do
            if (v.Character) and (v.Name ~= game.Players.LocalPlayer.Name) then
                local args = {[1] = "hitplr",[2] = v.Character,[3] = 0}
                f:fire(args)
            end
        end
    end)

    kills:Button("Touch your self",function()
        if game.Players.LocalPlayer.Character then
            local args = {[1] = "hitplr",[2] = game.Players.LocalPlayer.Character,[3] = 0}
            f:fire(args)
        end
    end)

    local tp = kills:Dropdown("Touch Player",players,function(x)
        if game.Players:FindFirstChild(x) then
            if game.Players[x].Character then
                local args = {[1] = "hitplr",[2] = game.Players[x].Character,[3] = 0}
                f:fire(args)
            end
        end
    end)

    game.Players.PlayerAdded:Connect(function()
        local players = {}
        for _,v in pairs(game:GetService("Players"):GetPlayers()) do
            table.insert(players,v.Name)
        end
        hp:refresh(players)
        tp:refresh(players)
    end)

    game.Players.PlayerRemoving:Connect(function()
        local players = {}
        for _,v in pairs(game:GetService("Players"):GetPlayers()) do
            table.insert(players,v.Name)
        end
        hp:refresh(players)
        tp:refresh(players)
    end)
end

return file
