-- if not CharacterID Exit Script
if isNotCharacter(8) then
    return
end
local sdk2 = require("_SDK.sdk2")
local enums = sdk2.enums
local utils = sdk2.utils
local menu = sdk2.Menu

local myScript = sdk2.Register:New("Tekken KAZUYA","\xef\x93\x9a")
local outModule = {}

local config = {

}
local AutoCombo64DmgFlag = false

function PEWG()
DisableKeyboardInput()
executeMacro(enums.Input.FORWARD, 0, 1, enums.InputType.KEY_PRESS)
executeMacro(enums.Input.FORWARD, 0, 1, enums.InputType.KEY_PRESS)
local randDelay = getRandomInt(5, 8) 
executeMacro(enums.Input.DOWN, 0, 1, enums.InputType.KEY_DOWN)
executeMacro(enums.Input.FORWARD + enums.Input.DOWN, enums.Input.R_HAND, randDelay, enums.InputType.KEY_DOWN)
executeMacro(enums.Input.FORWARD + enums.Input.DOWN, 0, 1, enums.InputType.KEY_PRESS)
EnableKeyboardInput()
end

function COMBO_64()
DisableKeyboardInput()
delayFrames(30)
executeMacro(0,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(11)
executeMacro(0,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
delayFrames(60)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(6)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,enums.Input.R_HAND,16,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(50)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(enums.Input.FORWARD,0,11,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(1)
executeMacro(enums.Input.BACK,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(10)
executeMacro(0,enums.Input.L_HAND + enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
EnableKeyboardInput()
end

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
				--OK
				if rameAdvantage == 12 or FrameAdvantage == 11 or FrameAdvantage == 10 then
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 6, enums.InputType.KEY_PRESS)
					return
				end
			end
			if AttackType == enums.AttackType.MID then
				--OK
				if FrameAdvantage >= 17 then
					delayFrames(math.floor(FrameAdvantage / 1.5))
					PEWG()
					AutoCombo64DmgFlag = true
					return
				end
				--OK
				if FrameAdvantage == 16 then
					executeMacro(enums.Input.FORWARD + enums.Input.DOWN, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 15 then
					executeMacro(enums.Input.FORWARD, 0, 5, enums.InputType.KEY_DOWN)
					executeMacro(enums.Input.FORWARD + enums.Input.DOWN, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 13 or FrameAdvantage == 14 or FrameAdvantage == 12 then
					executeMacro(enums.Input.BACK, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
			end
			if AttackType == enums.AttackType.LOW then
				--OK
				if FrameAdvantage >= 17 then
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 16 or FrameAdvantage == 15 then
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 13 or FrameAdvantage == 14 then
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 12 then
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
			end
		end
	end
	if config.AutoCombo and enemy.SimpleMoveState == enums.SimpleMoveType.JUGGLED then
		if AutoCombo64DmgFlag then
			AutoCombo64DmgFlag = false
			COMBO_64()
		end

	end
end)

-- Window event
myScript:onMessage(function(msg, wParam, lParam)

	if msg == 257 then
		if wParam == config.AutoCombo64DmgCode then
			asyncExecuteMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_PRESS)
			asyncExecuteMacro(enums.Input.DOWN,0,1,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
			asyncExecuteMacro(enums.Input.DOWN+enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
			asyncExecuteMacro(enums.Input.DOWN+enums.Input.FORWARD,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
			AutoCombo64DmgFlag = true
		end
	end

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
    menu.text('KAZUYA Combo Test Script Demo')
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
    menu.text('Combo')
    menu.sameLine()
    menu.help("Assign a key for one-click combos and select the combo type.")
	
    config.AutoCombo = menu.checkbox('Auto Combo', config.AutoCombo)
	config.AutoCombo64DmgCode = menu.keySelect('Auto Combo (64 Dmg) Key ', config.AutoCombo64DmgCode)
	--menu.sameLine()
    -- Description Section
    menu.text("This automation script helps players manage defensive and offensive strategies.")
    menu.text("It allows for automatic blocking, counterattacks, and punishments with customizable chances.")
	
	
end)

if (not myScript:submit(outModule)) then
    return myScript:getModule(myScript.name)
end