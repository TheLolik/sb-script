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
  local oth = win:Tab("Other")
  oth:Colorpicker("Change UI Color",Color3.fromRGB(44, 120, 224), function(t)
      lib:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255))
  end)

  oth:Label("Made by pix_dev")

  oth:Button("Destroy UI", function()
    game.CoreGui.ui:Destroy()
  end)
end

return file
