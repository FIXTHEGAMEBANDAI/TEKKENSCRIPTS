-- if not CharacterID Exit Script
if isNotCharacter(7) then
    return
end
local sdk2 = require("_SDK.sdk2")
local enums = sdk2.enums
local utils = sdk2.utils
local menu = sdk2.Menu

local myScript = sdk2.Register:New("Tekken Bryan","\xef\x93\xbe")
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
				if FrameAdvantage >= 19 then
					executeMacro(enums.Input.FORWARD, 0, 2, enums.InputType.KEY_PRESS)
					executeMacro(enums.Input.FORWARD, 0, 6, enums.InputType.KEY_DOWN)
					executeMacro(enums.Input.FORWARD, enums.Input.R_HAND, 10, enums.InputType.KEY_DOWN)
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 18 then
					executeMacro(enums.Input.FORWARD, 0, 5, enums.InputType.KEY_DOWN)
					executeMacro(enums.Input.FORWARD, enums.Input.R_KICK, 5, enums.InputType.KEY_DOWN)
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 17 then
					executeMacro(enums.Input.FORWARD, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 14 or FrameAdvantage == 15 or FrameAdvantage == 16 then
					executeMacro(enums.Input.FORWARD, 0, 3, enums.InputType.KEY_PRESS)
					executeMacro(enums.Input.BACK, enums.Input.R_HAND, 3, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 13 then
					executeMacro(enums.Input.UP + enums.Input.FORWARD, enums.Input.R_HAND, 2, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 3, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 6, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 6, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_KICK, 10, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 12 then
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
			end
			if AttackType == enums.AttackType.LOW then
				--OK
				if FrameAdvantage >= 23 then
					executeMacro(enums.Input.UP, 0, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				if FrameAdvantage == 20 then
					executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 18 then
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 17 then
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 10, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 16 or FrameAdvantage == 15 or FrameAdvantage == 14 then
					executeMacro(enums.Input.DOWN + enums.Input.FORWARD, 0, 2, enums.InputType.KEY_DOWN)
					executeMacro(enums.Input.DOWN + enums.Input.FORWARD, enums.Input.R_HAND, 2, enums.InputType.KEY_DOWN)
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 13 then
					executeMacro(enums.Input.DOWN+enums.Input.FORWARD, enums.Input.R_HAND, 3, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_HAND, 3, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_HAND, 3, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 12 then
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
				end

			end
		end
	end

end)

myScript:onMenu(function()
    -- Script Introduction Section
    menu.text('Bryan Combo Script Core')
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

if (not myScript:submit(outModule)) then
    return myScript:getModule(myScript.name)
end