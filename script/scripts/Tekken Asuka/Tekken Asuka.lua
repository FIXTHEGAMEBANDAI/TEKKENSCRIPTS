-- if not CharacterID Exit Script
if isNotCharacter(11) then
    return
end
local sdk2 = require("_SDK.sdk2")
local enums = sdk2.enums
local utils = sdk2.utils
local menu = sdk2.Menu

local myScript = sdk2.Register:New("Tekken Asuka","\xee\x94\xab")
local outModule = {}
local AutoCombo63DmgFlag = false
local AutoCombo70DmgFlag = false
local config = {

}

function DMG_70_MID()
DisableKeyboardInput()
delayFrames(10)
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(enums.Input.FORWARD,0,10,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
delayFrames(65)
executeMacro(enums.Input.DOWN+enums.Input.BACK,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(3)
executeMacro(enums.Input.DOWN+enums.Input.BACK,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(1)
executeMacro(0,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(65)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.FORWARD,0,5,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(6)
executeMacro(enums.Input.FORWARD,0,6,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,enums.Input.R_KICK,8,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,0,2,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(30)
executeMacro(enums.Input.FORWARD,0,4,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.FORWARD,0,10,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,enums.Input.R_HAND,7,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,0,6,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,enums.Input.L_HAND,7,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
EnableKeyboardInput()
end

function DMG_63_WS()
DisableKeyboardInput()
delayFrames(30)
executeMacro(enums.Input.UP+enums.Input.FORWARD,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(1)
executeMacro(enums.Input.UP+enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(38)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.DOWN+enums.Input.BACK,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(2)
executeMacro(enums.Input.DOWN+enums.Input.BACK,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(2)
executeMacro(0,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(70)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(10)
executeMacro(enums.Input.UP+enums.Input.FORWARD,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(40)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(10)
executeMacro(enums.Input.DOWN,enums.Input.L_HAND + enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
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

			end
			if AttackType == enums.AttackType.MID then
				if FrameAdvantage >= 17 then
					executeMacro(enums.Input.FORWARD, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					delayFrames(30)
					AutoCombo70DmgFlag = true
					return
				end
				if FrameAdvantage == 14 or FrameAdvantage == 15 or FrameAdvantage == 16 then
					executeMacro(enums.Input.DOWN + enums.Input.FORWARD, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					AutoCombo70DmgFlag = true
					return
				end
				if FrameAdvantage == 13 then
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_KICK, 10, enums.InputType.KEY_PRESS)
					return
				end
				if FrameAdvantage == 12 then
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_KICK, 10, enums.InputType.KEY_PRESS)
					return
				end
			end
			if AttackType == enums.AttackType.LOW then
				if FrameAdvantage >= 18 then
					executeMacro(0, enums.Input.L_KICK, 1, enums.InputType.KEY_PRESS)
					AutoCombo63DmgFlag = true
					return
				end
				if FrameAdvantage == 17 or FrameAdvantage == 16 or FrameAdvantage == 15 or FrameAdvantage == 14 then
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				if FrameAdvantage == 13 then
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_DOWN)
					executeMacro(0, enums.Input.L_HAND+enums.Input.R_HAND, 8, enums.InputType.KEY_PRESS)
					return
				end
				if FrameAdvantage == 12 then
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
			end
		end
	end

	if config.AutoCombo and enemy.SimpleMoveState == enums.SimpleMoveType.JUGGLED then
		if AutoCombo63DmgFlag then
			AutoCombo63DmgFlag = false
			DMG_63_WS()
		end
		if AutoCombo70DmgFlag then
			AutoCombo70DmgFlag = false
			DMG_70_MID()
		end
	end
end)

myScript:onMenu(function()
    -- Script Introduction Section
    menu.text('Asuka Combo Script Core')
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
	config.AutoCombo63DmgCode = menu.keySelect('Auto Combo (63 Dmg) Key ', config.AutoCombo63DmgCode)
	menu.sameLine()
	config.AutoCombo70DmgCode = menu.keySelect('Auto Combo (70 Dmg) Key ', config.AutoCombo70DmgCode)

    -- Description Section
    menu.text("This automation script helps players manage defensive and offensive strategies.")
    menu.text("It allows for automatic blocking, counterattacks, and punishments with customizable chances.")
	
	
end)

-- Window event
myScript:onMessage(function(msg, wParam, lParam)
	if msg == 257 then
		if wParam == config.AutoCombo63DmgCode then
			AutoCombo63DmgFlag = true
			asyncExecuteMacro(enums.Input.DOWN,0,20,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
			asyncDelayFrames(1)
			asyncExecuteMacro(0,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
		end
		if wParam == config.AutoCombo70DmgCode then
			AutoCombo70DmgFlag = true
			asyncExecuteMacro(enums.Input.DOWN+enums.Input.FORWARD,enums.Input.R_HAND,3,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
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

if (not myScript:submit(outModule)) then
    return myScript:getModule(myScript.name)
end