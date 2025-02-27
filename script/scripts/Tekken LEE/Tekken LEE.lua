-- if not CharacterID Exit Script
if isNotCharacter(22) then
    return
end
local sdk2 = require("_SDK.sdk2")
local enums = sdk2.enums
local utils = sdk2.utils
local menu = sdk2.Menu

local myScript = sdk2.Register:New("Tekken LEE","\xef\x93\x9a")
local outModule = {}

local config = {

}

myScript:onTick(function(self, enemy)
	if not utils.CanRun(self) then
		return
	end
	local AttackType = getOpponentLastAttackType()

	if self.Distance < 2000.00 then
		FrameAdvantage = getLocalFrameAdvantage()
		if isCounterAttackPossible(FrameAdvantage) then
			local autoRate = getRandomInt(0, 100)
			-- Not Use
			if config.CounterattackChance < autoRate or not config.useAutomaticCounterattack then
				return
			end
			if AttackType == 0 then
				AttackType = utils.GetEnemyAttackTypeNotZero()
			end
			local Delayed = enemy.EndFrame - enemy.MoveTimer
			print(utils.getAttackTypeString(AttackType),FrameAdvantage)
			if AttackType == enums.AttackType.HIGH then

			end
			if AttackType == enums.AttackType.MID then
				--OK
				if FrameAdvantage >= 18 then
					executeMacro(enums.Input.FORWARD,0, 10, enums.InputType.KEY_DOWN)
					executeMacro(enums.Input.FORWARD, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 17 or FrameAdvantage == 16 or FrameAdvantage == 15 then
					executeMacro(enums.Input.UP, 0, 5, enums.InputType.KEY_DOWN)
					executeMacro(enums.Input.UP + enums.Input.FORWARD, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 14 then
					executeMacro(enums.Input.FORWARD, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 12 or FrameAdvantage == 13 then
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
			end
			if AttackType == enums.AttackType.LOW then
				--OK
				if FrameAdvantage >= 18 then
					executeMacro(enums.Input.UP + enums.Input.FORWARD, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 17 then
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 10, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 16 or FrameAdvantage == 15 then
					executeMacro(enums.Input.UP + enums.Input.FORWARD, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 13 or FrameAdvantage == 14 then
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 12 then
					executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
			end
		end
	end

end)

-- Window event
myScript:onMessage(function(msg, wParam, lParam)

	-- msg = 256 input
	-- msg = 257 input up

    -- Process the msg, wParam, and lParam if necessary
    -- For example:
    --print("Message:", msg)
    --print("wParam:", wParam)
    --print("lParam:", lParam)

end)

myScript:onMenu(function()
    -- Script Introduction Section
    menu.text('LEE Combo Test Script Demo')
    menu.sameLine()
    menu.help("This is a demo script for Tekken 8 automation.")

    -- Counterattack Options Configuration
    menu.text('Counterattack Options')
    menu.sameLine()
    menu.help("Enable automatic counterattacks with a configurable chance.")
    menu.separator()
    config.useAutomaticCounterattack = menu.checkbox("Automatic Counterattack", config.useAutomaticCounterattack)
    config.CounterattackChance = menu.sliderInt("Counterattack Chance (%)", config.CounterattackChance, 0, 100)

	menu.separator()
    -- Description Section
    menu.text("This automation script helps players manage defensive and offensive strategies.")
    menu.text("It allows for automatic blocking, counterattacks, and punishments with customizable chances.")
	
	
end)

if (not myScript:submit(outModule)) then
    return myScript:getModule(myScript.name)
end