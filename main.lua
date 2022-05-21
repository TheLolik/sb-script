-- Do not copy or skid scripts from this repo without giving credits to pix_dev
local function load(file,lib,win)
  local loaded = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheLolik/sb-script/main/"..file..".lua"))()
  loaded:start(lib,win)
end

local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/TheLolik/vape-lite-update/main/lib.lua")()
local win = lib:Window("PREVIEW",Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)
load("swords",lib,win)
wait()
load("players",lib,win)
wait()
load("other",lib,win)
