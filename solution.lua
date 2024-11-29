----<>----<>----<>----Whitelisting----<>----<>----<>---
local HWIDTable = loadstring(game:HttpGet("https://pastebin.com/raw/nP9cHfmG"))()
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
local isWhitelisted = false

for i, v in pairs(HWIDTable) do
    if v == HWID then
pcall(function()
repeat wait() until game:GetService("Players") and game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character
----<>----<>----<>----<>----<>----<>----<>----<>----
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()
local workspace = game:GetService("Workspace")
local repstorage = game:GetService("ReplicatedStorage")
local ts = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local runservice = game:GetService("RunService")
getgenv().SecureMode = true
----<>----<>----<>----Variables----<>----<>----<>---
local mechMod = require(repstorage.Assets.Modules.Client.Mechanics)
----<>----<>----
getgenv().TpMagsEnabled = false
getgenv().TpMagDistance = 1
----<>----<>----
getgenv().VectorMagsEnabled = true
getgenv().VectorMagDistance = 15 --// Higher = more chance of getting kicked/possibly banned
getgenv().VectorMagSpeed = 0.5 --// Higher = slower | Lower = faster
----<>----<>----
getgenv().Gravity = 196.2
getgenv().NoCatchCooldownEnabled = false
getgenv().StaminaDecreaseRateEnabled = false
getgenv().StaminaDecreaseRate = 1
local OldStam = 101
----<>----<>----
getgenv().TackleReachEnabled = false
getgenv().TackleReachDistance = 1
----<>----<>----
getgenv().AutoKickEnabled = false
----<>----<>----
getgenv().JumpPowerEnabled = false
getgenv().JumpPower = 0
----<>----<>----
getgenv().BigheadEnabled = false
getgenv().BigheadSize = 0
getgenv().CanCollideEnabled = false
getgenv().BigheadTransparency = 0
----<>----<>----<>----Functions----<>----<>----<>---
local GameMode = function()
    if game.PlaceId == 4822225642 or game.PlaceId == 13834702475 then
        return "Park"
    else
        return "Normal"
    end
end

local MiniGame = function()
    if GameMode() == "Park" then
        pcall(function()
            return workspace.MiniGames:FindFirstChild(plr.Replicated.GameID.Value).Replicated
        end)
    end
end

local TweenToBall = function(child)
    local tweenInfo = TweenInfo.new(getgenv().VectorMagSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
    local tween = ts:Create(plr.Character.HumanoidRootPart, tweenInfo, {CFrame = child.CFrame})
    tween:Play()
end

workspace.ChildAdded:Connect(function(player)
	if getgenv().BigheadEnabled then
		repeat wait() until player.Head
		local tHead = player.Head

		tHead.CanCollide = getgenv().CanCollideEnabled
		tHead.Transparency = getgenv().BigheadTransparency
		tHead.Size = Vector3.new(getgenv().BigheadSize, getgenv().BigheadSize, getgenv().BigheadSize)
	end
end)
----<>----<>----<>----<>----<>----<>----<>----<>----
local ReplicatedFolder
local HitboxFolder
local GameState
local ReEvent
if GameMode() == "Normal" then ReplicatedFolder = workspace.Games:FindFirstChild(plr.Replicated.GameID.Value).Replicated HitboxFolder = ReplicatedFolder:FindFirstChild("Hitboxes") GameState = repstorage.Games:FindFirstChild(plr.Replicated.GameID.Value).ActiveState ReEvent = repstorage.Games:FindFirstChild(plr.Replicated.GameID.Value).ReEvent end
----<>----<>----<>----<>----<>----<>----<>----<>----
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "YNC Scripts ┃ Paid ┃ TESTING",
   LoadingTitle = "IN TESTING, WE KNOW ABOUT BUGS",
   LoadingSubtitle = "This script is in testing please bare with us",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "hawghub",
      FileName = "Ultimate Football"
   },
   Discord = {
      Enabled = false,
      Invite = "yncscripts",
      RememberJoins = true
   }
})
----<>----<>----<>----<>----<>----<>----<>----<>----
local Mags = Window:CreateTab("Mags", 7733954884)
local Player = Window:CreateTab("Player", 7743875962)
local Hitbox = Window:CreateTab("Hitbox", 7733696665)
local Automatic = Window:CreateTab("Automatic", 7743873539)
local Misc = Window:CreateTab("Misc", 7733799185)
----<>----<>----<>----<>----<>----<>----<>----<>----
local MagSection = Mags:CreateSection("Mags")
local MagsEnabledToggle = Mags:CreateToggle({
    Name = "Teleport Mags Enabled",
    CurrentValue = false,
    Flag = "TeleportMagsEnabledToggleValue",
    Callback = function(Value)
    getgenv().TpMagsEnabled = Value
    
    if GameMode() == "Park" and getgenv().TpMagsEnabled then
        while getgenv().TpMagsEnabled do
			task.wait(0.1)
            for _,v in ipairs(workspace.ParkMap.Replicated.Fields:GetChildren()) do
                local part = v.Replicated:FindFirstChildOfClass("MeshPart")

				if part and (part.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= getgenv().TpMagDistance then
					part.CFrame = plr.Character.HumanoidRootPart.CFrame
				end
            end
        end

    elseif GameMode() == "Normal" then
        ReplicatedFolder.ChildAdded:Connect(function(child)
            while child.Parent == ReplicatedFolder and child:IsA("MeshPart") do
                task.wait()
				if (child.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= getgenv().TpMagDistance and not repstorage.Games:FindFirstChild(plr.Replicated.GameID.Value).GameStatus.IsFumblePlay.Value and tostring(repstorage.Games:FindFirstChild(plr.Replicated.GameID.Value).GameStatus.ActiveQuarterback.Value) ~= plr.Name and tostring(repstorage.Games:FindFirstChild(plr.Replicated.GameID.Value).GameStatus.ActiveKicker.Value) ~= plr.Name then
					child.CanCollide = false
					child.CFrame = plr.Character.CFrame
				end
            end
        end)
	end
end,
})
local MagsDistanceSlider = Mags:CreateSlider({
    Name = "Teleport Mag Distance",
    Range = {0, 20},
    Increment = 0.1,
    Suffix = "studs",
    CurrentValue = 0,
    Flag = "MagsDistanceSliderValue",
    Callback = function(Value)
        getgenv().TpMagDistance = Value
    end,
})

local VectorMagSection = Mags:CreateSection("Vector Mags")
local VectorMagsEnabledToggle = Mags:CreateToggle({
    Name = "Vector Mags Enabled",
    CurrentValue = false,
    Flag = "VectorMagsEnabledToggleValue",
    Callback = function(Value)
    getgenv().VectorMagsEnabled = Value
    
    if GameMode() == "Park" and getgenv().VectorMagsEnabled then
        while getgenv().VectorMagsEnabled do
			task.wait(0.3)
            for _,v in ipairs(workspace.ParkMap.Replicated.Fields:GetChildren()) do
                local part = v.Replicated:FindFirstChildOfClass("MeshPart")

				if part and (part.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= getgenv().VectorMagDistance then
					TweenToBall(part)
				end
            end
        end

    elseif GameMode() == "Normal" and getgenv().VectorMagsEnabled then
        ReplicatedFolder.ChildAdded:Connect(function(child)
            while getgenv().VectorMagsEnabled and child.Parent == ReplicatedFolder and child:IsA("MeshPart") do
                task.wait()
				if (child.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= getgenv().TpMagDistance and not repstorage.Games:FindFirstChild(plr.Replicated.GameID.Value).GameStatus.IsFumblePlay.Value and tostring(repstorage.Games:FindFirstChild(plr.Replicated.GameID.Value).GameStatus.ActiveQuarterback.Value) ~= plr.Name and tostring(repstorage.Games:FindFirstChild(plr.Replicated.GameID.Value).GameStatus.ActiveKicker.Value) ~= plr.Name then
					child.CanCollide = false
					TweenToBall(child)
					print("tp'd ball to char")
				end
            end
        end)
	end
end,
})
local VectorMagsDistanceSlider = Mags:CreateSlider({
    Name = "Vector Mag Distance",
    Range = {0, 5},
    Increment = 0.1,
    Suffix = "studs",
    CurrentValue = 0,
    Flag = "VectorMagsDistanceSliderValue",
    Callback = function(Value)
        getgenv().VectorMagDistance = Value
    end,
})
local VectorMagsSpeedSlider = Mags:CreateSlider({
    Name = "Vector Mag Speed (higher = slower)",
    Range = {0, 1},
    Increment = 0.01,
    Suffix = "seconds",
    CurrentValue = 0,
    Flag = "VectorMagSpeedSliderValue",
    Callback = function(Value)
        getgenv().VectorMagSpeed = Value
    end,
})
----<>----<>----<>----Player----<>----<>----<>------
local JumpingSection = Player:CreateSection("Jumping")
local NoJumpCooldownToggle = Player:CreateToggle({
    Name = "No Jump Cooldown",
    CurrentValue = false,
    Flag = "NoJumpCooldownToggleValue",
    Callback = function(Value)
        --// No jump cooldown code (find different method)
    end,
})
local JumpPowerEnabledToggle = Player:CreateToggle({
    Name = "Jump Power Enabled",
    CurrentValue = false,
    Flag = "JumpPowerEnabledToggleValue",
    Callback = function(Value)
        getgenv().JumpPowerEnabled = Value
    end,
})
local JumpPowerSlider = Player:CreateSlider({
    Name = "Jump Power",
    Range = {0, 10},
    Increment = 0.1,
    Suffix = "",
    CurrentValue = 0,
    Flag = "JumpPowerSliderValue",
    Callback = function(Value)
        getgenv().JumpPower = Value
    end,
})

local StaminaSection = Player:CreateSection("Stamina")
local StaminaDecreaseRateEnabledToggle = Player:CreateToggle({
    Name = "Stamina Decrease Rate Enabled",
    CurrentValue = false,
    Flag = "StaminaDecreaseRateEnabledToggleValue",
    Callback = function(Value)
		getgenv().StaminaDecreaseRateEnabled = Value
		
		while getgenv().StaminaDecreaseRateEnabled do
			task.wait()
			if OldStam > mechMod.Stamina then
				local OldStam = mechMod.Stamina
			
				 mechMod.Stamina = mechMod.Stamina + getgenv().StaminaDecreaseRate * 0.001 
			end
		end
    end,
})
local StaminaDecreaseRateSlider = Player:CreateSlider({
   Name = "Stam Decrease Rate (higher = slower)",
   Range = {1, 100},
   Increment = 1,
   Suffix = "",
   CurrentValue = 100,
   Flag = "StaminaDecreaseRateSliderValue",
   Callback = function(Value)
   getgenv().StaminaDecreaseRate = Value
   end,
})
local InfiniteStaminaToggle = Player:CreateToggle({
    Name = "Infinite Stamina",
    CurrentValue = false,
    Flag = "InfiniteStaminaToggleValue",
    Callback = function(Value)

        while Value do
            mechMod.Stamina = 100
            task.wait()
        end
    end,
})

local BigheadSection = Player:CreateSection("Bighead")
local BigheadEnabledToggle = Player:CreateToggle({
    Name = "Bighead Enabled",
    CurrentValue = false,
    Flag = "BigheadEnabledToggleValue",
    Callback = function(Value)
		getgenv().BigheadEnabled = Value

		if getgenv().BigheadEnabled then
			for _,player in ipairs(plrs:GetPlayers()) do
				if player ~= plr and player.Character then
					player.Character.Head.CanCollide = false
					player.Character.Head.Transparency = getgenv().BigheadTransparency
					player.Character.Head.Size = Vector3.new(getgenv().BigheadSize, getgenv().BigheadSize, getgenv().BigheadSize)
				end
			end
		elseif not getgenv().BigheadEnabled then
			for _,player in ipairs(plrs:GetPlayers()) do
				if player ~= plr and player.Character then
					player.Character.Head.CanCollide = true
					player.Character.Head.Transparency = 1
					player.Character.Head.Size = Vector3.new(1, 1, 1)
				end
			end
		end
    end,
})

local BigheadCollisionsToggle = Player:CreateToggle({
    Name = "Bighead Collisions",
    CurrentValue = false,
    Flag = "BigheadCollisionsToggleValue",
    Callback = function(Value)
		getgenv().CanCollideEnabled = Value

		if getgenv().BigheadEnabled then
			if getgenv().CanCollideEnabled == true then
				for _,player in ipairs(plrs:GetPlayers()) do
					if player ~= plr and player.Character then
						player.Character.Head.CanCollide = true
					end
				end
			elseif getgenv().CanCollideEnabled == false then
				for _,player in ipairs(plrs:GetPlayers()) do
					if player ~= plr and player.Character then
						player.Character.Head.CanCollide = false
					end
				end
			end
		end
    end,
})
local BigheadSlider = Player:CreateSlider({
    Name = "Bighead Size",
    Range = {1, 5},
    Increment = 0.1,
    Suffix = "",
    CurrentValue = 1,
    Flag = "BigheadSliderValue",
    Callback = function(Value)
		getgenv().BigheadSize = Value

		if getgenv().BigheadEnabled then
			for _,player in ipairs(plrs:GetPlayers()) do
				if player ~= plr and player.Character then
					player.Character.Head.Size = Vector3.new(getgenv().BigheadSize, getgenv().BigheadSize, getgenv().BigheadSize)
				end
			end
		end
    end,
})
local BigheadTransparencySlider = Player:CreateSlider({
    Name = "Bighead Transparency",
    Range = {0, 1},
    Increment = 0.1,
    Suffix = "",
    CurrentValue = 0,
    Flag = "BigheadTransparencySliderValue",
    Callback = function(Value)
		getgenv().BigheadTransparency = Value

		if getgenv().BigheadEnabled then
			for _,player in ipairs(plrs:GetPlayers()) do
				if player ~= plr and player.Character then
					player.Character.Head.Transparency = getgenv().BigheadTransparency
				end
			end
		end
    end,
})

local OtherSection = Player:CreateSection("Other")
local QuickTPKeybind = Player:CreateKeybind({
    Name = "Quick TP",
    CurrentKeybind = "F",
    HoldToInteract = false,
    Flag = "QuickTPKeybindValue",
    Callback = function(Keybind)
    	plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
    end,
})
local InfiniteDiveToggle = Player:CreateToggle({
    Name = "Infinite Dive",
    CurrentValue = false,
    Flag = "InfiniteDiveToggleValue",
    Callback = function(Value)

        while Value do
            task.wait(0.1)
            mechMod.PlayerDiving = false
            mechMod.PlayerCanDive = true
        end
    end,
})
--<>----<>----<>----Hitbox----<>----<>----<>----
local TackleReachSection = Hitbox:CreateSection("Tackle Reach")
local TackleReachEnabledToggle = Hitbox:CreateToggle({
    Name = "Tackle Reach Enabled",
    CurrentValue = false,
    Flag = "TackleReachEnabledToggleValue",
    Callback = function(Value)
        while Value do
            task.wait(0.1)
            for _,targetplr in ipairs(plrs:GetPlayers()) do
                if targetplr.Character then
                    for _,charpart in ipairs(targetplr.Character:GetDescendants()) do
                        if charpart.Name == "FootballGrip" and targetplr ~= plr then
                            if GameMode() == "Park" then --//  Hangout hub tackle reach
                                if string.len(plr.Replicated.GameID.Value) > 5 and targetplr.Replicated.GameID.Value == plr.Replicated.GameID.Value then
                                    local targethitbox = workspace.MiniGames:FindFirstChild(plr.Replicated.GameID.Value).Replicated.Hitboxes:FindFirstChild(targetplr.Name)

                                    if (targethitbox.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= getgenv().TackleReachDistance then
                                        targethitbox.Position = plr.Character.HumanoidRootPart.Position
                                        task.wait(0.1)
                                        targethitbox.Position = targetplr.Character.HumanoidRootPart.Position
									end
								end
                            elseif GameMode() == "Normal" then --// Normal tackle reach
                                local targethitbox = HitboxFolder:FindFirstChild(targetplr.Name)

                                if (targethitbox.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= getgenv().TackleReachDistance then
                                    targethitbox.Position = plr.Character.HumanoidRootPart.Position
                                    task.wait(0.1)
                                    targethitbox.Position = targetplr.Character.HumanoidRootPart.Position
                                end
                            end
                    	end 
                    end
            	end
            end
        end
    end,
})
local TackleReachDistanceSlider = Hitbox:CreateSlider({
    Name = "Tackle Reach Distance",
    Range = {1, 15},
    Increment = 0.1,
    Suffix = "studs",
    CurrentValue = 1,
    Flag = "TackleReachDistanceSliderValue",
    Callback = function(Value)
        getgenv().TackleReachDistance = Value
    end,
})
--<>----<>----<>--Automatic----<>----<>----<>---
local KickingSection = Automatic:CreateSection("Kicking")
if GameMode() == "Normal" then --// No park autokick
    local AutoKickToggle = Automatic:CreateToggle({
        Name = "Auto Kick",
        CurrentValue = false,
        Flag = "AutoKickToggleValue",
        Callback = function(Value)
            getgenv().AutoKickEnabled = Value
        end,
    })
end
local AntiAFK = Automatic:CreateButton({
    Name = "Anti-AFK",
    Callback = function()
        repeat wait() until game:IsLoaded()

        if getconnections then
            for _, v in next, getconnections(plr.Idled) do
                v:Disable()
            end
        end
    end,
})
--<>----<>----<>----<>----Misc-<>----<>----<>----<>-
local SpinningSection = Misc:CreateSection("Spinning")
local SpinLeftKeybind = Misc:CreateKeybind({
    Name = "Spin Left",
    CurrentKeybind = "R",
    HoldToInteract = false,
    Flag = "SpinRightKeybindValue",
    Callback = function(Keybind)
        local p1 = game.Players.LocalPlayer
        local v1 = game.ReplicatedStorage.Assets.Storage.Animations:FindFirstChild("UF_SpinMoveLeft")
        local v2 = p1.Character.Humanoid:LoadAnimation(v1)
        local l__HumanoidRootPart__4 = p1.Character.HumanoidRootPart
        local p3 = 1.5
        local p4 = CFrame.new(-13, 0, -6)
        local p5 = Vector3.new()

        if not v2.IsPlaying and (p1.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.FallingDown and p1.Character.Humanoid.PlatformStand == false) then
            local v5 = v2.Length / p3
            local v6 = ((l__HumanoidRootPart__4.CFrame * p4 + p5).Position - l__HumanoidRootPart__4.CFrame.Position) / v5
            local v7 = Instance.new("Attachment")
            v7.Parent = l__HumanoidRootPart__4
            v7.WorldPosition = l__HumanoidRootPart__4.AssemblyCenterOfMass
            p1.Character.Humanoid.AutoRotate = false
            local v8 = Instance.new("LinearVelocity")
            v8.Attachment0 = v7
            v8.Parent = l__HumanoidRootPart__4
            v8.MaxForce = 10000
            v8.VelocityConstraintMode = Enum.VelocityConstraintMode.Plane
            v8.PrimaryTangentAxis = Vector3.new(1, 0, 0)
            v8.SecondaryTangentAxis = Vector3.new(0, 0, 1)
            v8.RelativeTo = Enum.ActuatorRelativeTo.World
            v8.PlaneVelocity = Vector2.new(math.floor(v6.X + 0.5), (math.floor(v6.Z + 0.5)))
            v8.Enabled = true
            v2:Play(nil, nil, p3)
            task.delay(v5, function()
                p1.Character.Humanoid.AutoRotate = true
                v8:Destroy()
                v7:Destroy()
            end)
        end
    end,
})
local SpinRightKeybind = Misc:CreateKeybind({
    Name = "Spin Right",
    CurrentKeybind = "T",
    HoldToInteract = false,
    Flag = "SpinRightKeybindValue",
    Callback = function(Keybind)
        local p1 = game.Players.LocalPlayer
        local v1 = game.ReplicatedStorage.Assets.Storage.Animations:FindFirstChild("UF_SpinMoveLeft")
        local v2 = p1.Character.Humanoid:LoadAnimation(v1)
        local l__HumanoidRootPart__4 = p1.Character.HumanoidRootPart
        local p3 = 1.5
        local p4 = CFrame.new(13, 0, -6)
        local p5 = Vector3.new()

        if not v2.IsPlaying and (p1.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.FallingDown and p1.Character.Humanoid.PlatformStand == false) then
            local v5 = v2.Length / p3
            local v6 = ((l__HumanoidRootPart__4.CFrame * p4 + p5).Position - l__HumanoidRootPart__4.CFrame.Position) / v5
            local v7 = Instance.new("Attachment")
            v7.Parent = l__HumanoidRootPart__4
            v7.WorldPosition = l__HumanoidRootPart__4.AssemblyCenterOfMass
            p1.Character.Humanoid.AutoRotate = false
            local v8 = Instance.new("LinearVelocity")
            v8.Attachment0 = v7
            v8.Parent = l__HumanoidRootPart__4
            v8.MaxForce = 10000
            v8.VelocityConstraintMode = Enum.VelocityConstraintMode.Plane
            v8.PrimaryTangentAxis = Vector3.new(1, 0, 0)
            v8.SecondaryTangentAxis = Vector3.new(0, 0, 1)
            v8.RelativeTo = Enum.ActuatorRelativeTo.World
            v8.PlaneVelocity = Vector2.new(math.floor(v6.X + 0.5), (math.floor(v6.Z + 0.5)))
            v8.Enabled = true
            v2:Play(nil, nil, p3)
            task.delay(v5, function()
                p1.Character.Humanoid.AutoRotate = true
                v8:Destroy()
                v7:Destroy()
            end)
        end
    end,
})
----<>----<>----<>----<>----<>----<>----<>----<>----
if PlaceId ~= 13834702475 then --// Exclude park
	plr.PlayerGui.Mechanics.Base.KickingMeter:GetPropertyChangedSignal("Visible"):Connect(function()
        if getgenv().AutoKickEnabled then
            if game.PlaceId == 4822225642 then --// Hangout hub autokick
                if string.len(GameID.Value) > 5 then
                    local KickEvent = game.ReplicatedStorage.MiniGames:FindFirstChild(GameID.Value).ReEvent
                    KickEvent:FireServer("Mechanics", "KickHiked", 60, 0.1, 1)
            	end
            else --// Normal autokick
                ReEvent:FireServer("Mechanics", "KickHiked", 60, 0.1, 1)
            end
        end
    end)
end

--// Jump power
local get = function(x) return game:GetService(x) end

local players = get('Players')
local ws = get('Workspace')
local rs = get('ReplicatedStorage')
local rus = get('RunService')
local uis = get('UserInputService')
local coregui = get('CoreGui')
local http = get('HttpService')
local ts = get('TeleportService')
local lighting = get('Lighting')

local plr = players.LocalPlayer
local char = (plr and (plr.Character or plr.CharacterAdded:Wait()) or nil)
local hrp = plr and (char:WaitForChild('HumanoidRootPart')) or nil
local hum = plr and (char:WaitForChild('Humanoid')) or nil

--// Check if player exists and connect CharacterAdded event
if plr then
    plr.CharacterAdded:Connect(function(c)
        char = c
        hrp = c:WaitForChild('HumanoidRootPart')
        hum = c:WaitForChild('Humanoid')
    end)
end

--// Shortcuts
local cf = CFrame
local v3 = Vector3
local ud2 = UDim2
local c3 = Color3
local rgb = c3.fromRGB

--// Events
local step = rus.Stepped
local rstep = rus.RenderStepped
local heartbeat = rus.Heartbeat

--// JSON Functions
local JSON = {
    stringify = function(...) return http:JSONEncode(...) end,
    parse = function(...) return http:JSONDecode(...) end,
}

--// BodyForce
local bf = Instance.new("BodyForce", hrp)
bf.Name = 'FFmover'

--// Jump Power Loop
spawn(function()
    while step:wait() do
        local JP = getgenv().JumpPower / 100 * 80
        if getgenv().JumpPowerEnabled then
            if not bf then
                bf = Instance.new("BodyForce", hrp)
                bf.Name = 'FFmover'
            end
            bf.Force = v3.new(0, JP * 50, 0)
        else
            if bf then
                bf:Destroy()
                bf = nil
            end
        end
    end
end)
----<>----<>----<>----<>----<>----<>----<>----<>----
Rayfield:LoadConfiguration()
end)
        isWhitelisted = true
        break
    end    
end

-- If not whitelisted, kick the player
if not isWhitelisted then
    game.Players.LocalPlayer:Kick("You are not whitelisted!")
end
----<>----<>----<>----Functions----<>----<>----<>---
