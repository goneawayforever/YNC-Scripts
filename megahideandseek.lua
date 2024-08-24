local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
function Script()
    local Window = Library.CreateLib("YNC Scripts", "Synapse")
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main")

-- Script

MainSection:NewButton("ESP", "See All Players", function() -- 500 (MaxValue) | 0 (MinValue)
    local FillColor = Color3.fromRGB(175,25,255)
local DepthMode = "AlwaysOnTop"
local FillTransparency = 0.5
local OutlineColor = Color3.fromRGB(255,255,255)
local OutlineTransparency = 0
local CoreGui = game:FindService("CoreGui")
local Players = game:FindService("Players")
local lp = Players.LocalPlayer
local connections = {}
local Storage = Instance.new("Folder")
Storage.Parent = CoreGui
Storage.Name = "Highlight_Storage"
local function Highlight(plr)
    local Highlight = Instance.new("Highlight")
    Highlight.Name = plr.Name
    Highlight.FillColor = FillColor
    Highlight.DepthMode = DepthMode
    Highlight.FillTransparency = FillTransparency
    Highlight.OutlineColor = OutlineColor
    Highlight.OutlineTransparency = 0
    Highlight.Parent = Storage
local plrchar = plr.Character
if plrchar then
    Highlight.Adornee = plrchar
end

connections[plr] = plr.CharacterAdded:Connect(function(char)
    Highlight.Adornee = char
end)
end
Players.PlayerAdded:Connect(Highlight)
for i,v in next, Players:GetPlayers() do
    Highlight(v)
end
Players.PlayerRemoving:Connect(function(plr)
    local plrname = plr.Name
    if Storage[plrname] then
        Storage[plrname]:Destroy()
    end
    if connections[plr] then
        connections[plr]:Disconnect()
    end
end)
end)

    MainSection:NewSlider("Walkspeed", "Changes how fast you walk.", 250, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)


-- Credits

local Credits = Window:NewTab("Credits")
local CreditsSection = Credits:NewSection("Join Discord In Youtube Bio")

CreditsSection:NewLabel("Created by YNC Scripts")
end
if game.PlaceId == 5708035517 then
    Script()
else
    game.Players.LocalPlayer:Kick("This script is only compatible with Hide And Seek.")
end
