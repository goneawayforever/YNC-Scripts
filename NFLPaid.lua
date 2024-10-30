--[[ 
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "KeySystem", HidePremium = true, SaveConfig = true, ConfigFolder = "OrionTest"})

OrionLib:MakeNotification({
	Name = "Hello!",
	Content = "You Were Invited To The Diddy Party",
	Image = "rbxassetid://4483345998",
	Time = 5
})

_G.Key = "kaZQ?ZhfxHgw4;++E@}Z:B&+UUHVX,.&A3YQH8b|fb;WV1B*g*>uU=,XVm4" -- You Put Your Key Here
_G.KeyInput = "string"

function MakeScriptHub()
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/goneawayforever/YNC-Scripts/refs/heads/main/paid.lua"), true))() -- You Put Your Script Here

     game:GetService("StarterGui"):SetCore("SendNotification",{
         Title = "Correct Key!",
         Text = "Welcome To The Diddy Halloween PARTY :D", 
         Button1 = "Ok",
         Duration = 30 
     })

	OrionLib:Destroy()
end

function CorrectKeyNotifications()
    OrionLib:MakeNotification({
        Name = "Correct Key",
        Content = "Welcome To The Diddy Halloween PARTY :D",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

function WrongKeyNotifications()
    OrionLib:MakeNotification({
        Name = "Wrong Key",
        Content = "You're Not on The List Kid",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

local Tab = Window:MakeTab({
	Name = "Key Room",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddTextbox({
	Name = "Enter Key",
	Default = "Delete Me",
	TextDisappear = true,
	Callback = function(Value)
        _G.KeyInput = Value
	end	  
})

Tab:AddButton({
	Name = "Check Key!",
	Callback = function()
        if _G.KeyInput == _G.Key then
            MakeScriptHub()
            CorrectKeyNotifications()
        else
            WrongKeyNotifications()
        end
	end
})

Tab:AddLabel("Enter your key from paidkeys in discord channel!")
