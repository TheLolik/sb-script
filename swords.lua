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
  local tab = win:Tab("Swords")
  local lsa = false
  local gid = nil

  tab:Textbox("Gamepass id.",false, function(t)
      gid = t
  end)

  tab:Button("Get gamepass swords.",function()
      if gid == nil then
          return lib:Notification("Notify","Reedem your gamepass id.","Ok")
      end
      for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Selection.RequiresGamepass.ScrollingFrame:GetChildren()) do
          if v:IsA("Frame") then
              pcall(function()
                  v.GPId.Value = gid
              end)
          end
      end
  end)

  tab:Button("Get badges.", function()
    local req = request({Url="https://api.roblox.com/universes/get-universe-containing-place?placeid="..tostring(game.PlaceId),Type="GET"})
    local uid = game:GetService("HttpService"):JSONDecode(req.Body).UniverseId
    local badges = game:GetService("HttpService"):JSONDecode(request({Url="https://badges.roblox.com/v1/universes/"..tostring(uid).."/badges?limit=100&sortOrder=Asc",Type="GET"}).Body)
    for _,v in pairs(badges.data) do
      game.ReplicatedStorage.GiveBadge:FireServer(v.id)
    end
  end)

  tab:Button("Use sword ability.", function()
    local c = sc()
    if c == 1 then
      game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer("ability")
    elseif c == 2 then
      game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool").RemoteEvent:FireServer("ability")
    end
  end)

  tab:Toggle("Loop-use sword ability.",false, function(t)
    lsa = t
    while lsa == true and game.RunService.RenderStepped:Wait() do
      local c = sc()
      if c == 1 then
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer("ability")
      elseif c == 2 then
        game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool").RemoteEvent:FireServer("ability")
      end
    end
  end)
end

return file
