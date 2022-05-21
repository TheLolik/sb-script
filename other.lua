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
