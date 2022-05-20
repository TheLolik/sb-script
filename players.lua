local function sc()
	if game.Players.LocalPlayer.Character then
		if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
			return 1
		elseif game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool") then
			return 2
		end
	end
	return false
end

local file = {}
function file:start(lib,win)
  local kills = win:Tab("Players")
  kills:Label("God-Mode.")
  local everyone = false
  local others = false
  local me = false
  kills:Toggle("God-mode everyone",false,function(x)
      everyone = x
      while everyone == true and wait() do
          for _,v in pairs(game.Players:GetChildren()) do
              if v.Character then
                  local c = sc()
                  local args = {[1] = "hitplr",[2] = v.Character,[3] = -1000}
                  if c == 1 then
                      game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
                  elseif c == 2 then
                      game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
                  end
              end
          end
      end
  end)

  kills:Toggle("God-mode others",false,function(x)
      others = x
      while others == true and wait() do
          for _,v in pairs(game.Players:GetChildren()) do
              if (v.Character) and (v.Name ~= game.Players.LocalPlayer.Name) then
                  local c = sc()
                  local args = {[1] = "hitplr",[2] = v.Character,[3] = -1000}
                  if c == 1 then
                      game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
                  elseif c == 2 then
                      game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
                  end
              end
          end
      end
  end)

  kills:Toggle("God-mode your self",false,function(x)
      me = x
      while me == true and wait() do
          if game.Players.LocalPlayer.Character then
              local c = sc()
              local args = {[1] = "hitplr",[2] = game.Players.LocalPlayer.Character,[3] = -1000}
              if c == 1 then
                  game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
              elseif c == 2 then
                  game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
              end
              wait()
          end
      end
  end)


  kills:Label("Healing.")
  kills:Button("Heal everyone",function()
      for _,v in pairs(game.Players:GetChildren()) do
          if (v.Character) then
              local c = sc()
              local args = {[1] = "hitplr",[2] = v.Character,[3] = -1000}
              if c == 1 then
                  game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
              elseif c == 2 then
                  game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
              end
          end
      end
  end)

  kills:Button("Heal others",function()
      for _,v in pairs(game.Players:GetChildren()) do
          if (v.Character) and (v.Name ~= game.Players.LocalPlayer.Name) then
              local c = sc()
              local args = {[1] = "hitplr",[2] = v.Character,[3] = -1000}
              if c == 1 then
                  game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
              elseif c == 2 then
                  game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
              end
          end
      end
  end)

  kills:Button("Heal your self",function()
    if game.Players.LocalPlayer.Character then
          local c = sc()
          local args = {[1] = "hitplr",[2] = game.Players.LocalPlayer.Character,[3] = -1000}
          if c == 1 then
              game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
          elseif c == 2 then
              game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
          end
      end
  end)

  local hp = kills:Dropdown("Heal Player",game:GetService("Players"):GetPlayers(),function(x)
      if game.Players:FindFirstChild(x) then
          if game.Players[x].Character then
              local c = sc()
              local args = {[1] = "hitplr",[2] = game.Players[x].Character,[3] = -1000}
              if c == 1 then
                  game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
              elseif c == 2 then
                  game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
              end
          end
      end
  end)

  kills:Label("Killing.")
  kills:Button("Get some kills.", function()
    for _=1,1000 do
      game.RunService.RenderStepped:Wait()
          local c = sc()
      local args = {[1] = "hitplr",[2] = game:GetService("Players").LocalPlayer.Character,[3] = 100}
          if c == 1 then
              game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
          elseif c == 2 then
              game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
          end
    end
  end)

  kills:Label("Touching for On-hit swords.")
  kills:Button("Touch everyone",function()
      for _,v in pairs(game.Players:GetChildren()) do
          if (v.Character) then
              local c = sc()
              local args = {[1] = "hitplr",[2] = v.Character,[3] = 0}
              if c == 1 then
                  game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
              elseif c == 2 then
                  game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
              end
          end
      end
  end)

  kills:Button("Touch others",function()
      for _,v in pairs(game.Players:GetChildren()) do
          if (v.Character) and (v.Name ~= game.Players.LocalPlayer.Name) then
              local c = sc()
              local args = {[1] = "hitplr",[2] = v.Character,[3] = 0}
              if c == 1 then
                  game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
              elseif c == 2 then
                  game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
              end
          end
      end
  end)

  kills:Button("Touch your self",function()
    if game.Players.LocalPlayer.Character then
          local c = sc()
          local args = {[1] = "hitplr",[2] = game.Players.LocalPlayer.Character,[3] = 0}
          if c == 1 then
              game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
          elseif c == 2 then
              game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
          end
      end
  end)

  local tp = kills:Dropdown("Touch Player",game:GetService("Players"):GetPlayers(),function(x)
      if game.Players:FindFirstChild(x) then
          if game.Players[x].Character then
              local c = sc()
              local args = {[1] = "hitplr",[2] = game.Players[x].Character,[3] = 0}
              if c == 1 then
                  game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
              elseif c == 2 then
                  game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool").RemoteEvent:FireServer(unpack(args))
              end
          end
      end
  end)

  game.Players.PlayerAdded:Connect(function()
      hp:refresh(game:GetService("Players"):GetPlayers())
      tp:refresh(game:GetService("Players"):GetPlayers())
  end)

  game.Players.PlayerRemoving:Connect(function()
      hp:refresh(game:GetService("Players"):GetPlayers())
      tp:refresh(game:GetService("Players"):GetPlayers())
  end)
end

return file
