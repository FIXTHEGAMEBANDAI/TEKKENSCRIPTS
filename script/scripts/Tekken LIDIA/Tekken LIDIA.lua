-- if not CharacterID Exit Script
if isNotCharacter(34) then
    return
end
local sdk2 = require("_SDK.sdk2")
local enums = sdk2.enums
local utils = sdk2.utils
local menu = sdk2.Menu

local myScript = sdk2.Register:New("Tekken LIDIA","\xef\x93\x9a")
local outModule = {}
local AutoComboDmg74Flag = false
local AutoComboDmg55Flag = false

local config = {

}

function COMBO55()
DisableKeyboardInput()
delayFrames(25)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(4)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(40)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(10)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(71)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(1)
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(10)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.DOWN,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(6)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(15)
executeMacro(0,enums.Input.L_HAND + enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
EnableKeyboardInput()
end

function COMBO74()
DisableKeyboardInput()
delayFrames(20)
executeMacro(enums.Input.FORWARD,enums.Input.L_KICK + enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(20)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.FORWARD,0,10,enums.InputType.KEY_PRESS)
executeMacro(0,enums.Input.R_HAND,5,enums.InputType.KEY_PRESS)
delayFrames(30)
executeMacro(enums.Input.BACK,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(2)
executeMacro(enums.Input.BACK,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(7)
executeMacro(0,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(45)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(1)
executeMacro(enums.Input.FORWARD,0,8,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(15)
executeMacro(0,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(15)
executeMacro(0,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(65)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(1)
executeMacro(enums.Input.FORWARD,0,10,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
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
				--OK
				if FrameAdvantage >= 19 then
					executeMacro(0,enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					executeMacro(0,enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					AutoComboDmg74Flag = true
					return
				end
				--OK
				if FrameAdvantage == 18 or FrameAdvantage == 17 or FrameAdvantage == 16 or FrameAdvantage == 15 then
					executeMacro(enums.Input.UP+enums.Input.FORWARD,enums.Input.R_KICK,5,enums.InputType.KEY_DOWN)
					executeMacro(0, 0, 0, enums.InputType.KEY_UP)
					AutoComboDmg74Flag = true
					return
				end
				--OK
				if FrameAdvantage == 14 or FrameAdvantage == 13 then
					executeMacro(enums.Input.FORWARD, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 12 then
					executeMacro(enums.Input.FORWARD , enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end

			end
			if AttackType == enums.AttackType.LOW then
				--OK
				if FrameAdvantage >= 16 then
					executeMacro(0,enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					AutoComboDmg55Flag = true
					return
				end
				--OK
				if FrameAdvantage == 14 then
					executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 13 then
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 12 then
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
			end
		end
	end
	if config.AutoComboDmg and enemy.SimpleMoveState == enums.SimpleMoveType.JUGGLED then

		if AutoComboDmg74Flag then
			AutoComboDmg74Flag = false
			COMBO74()
		end
		if AutoComboDmg55Flag then
			AutoComboDmg55Flag = false
			COMBO55()
		end

	end
end)

-- Window event
myScript:onMessage(function(msg, wParam, lParam)
	if msg == 257 then
		if wParam == config.AutoCombo74DmgCode then
			asyncExecuteMacro(0,enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
			asyncExecuteMacro(0,enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
			AutoComboDmg74Flag = true
		end
		if wParam == config.AutoCombo55DmgCode then
			asyncExecuteMacro(enums.Input.DOWN,0, 10, enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0,enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
			AutoComboDmg55Flag = true
		end
		if wParam == config.Hit10ComboKey then
			asyncExecuteMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
			asyncDelayFrames(5)
			asyncExecuteMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
			asyncDelayFrames(5)
			asyncExecuteMacro(0,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
			asyncDelayFrames(25)
			asyncExecuteMacro(0,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
			asyncDelayFrames(26)
			asyncExecuteMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
			asyncDelayFrames(25)
			asyncExecuteMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
			asyncDelayFrames(25)
			asyncExecuteMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
			asyncDelayFrames(25)
			asyncExecuteMacro(0,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
			asyncDelayFrames(5)
			asyncExecuteMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
			asyncDelayFrames(25)
			asyncExecuteMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
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

myScript:onMenu(function()
    -- Script Introduction Section
    menu.text('LIDA Combo Test Script Demo')
    menu.sameLine()
    menu.help("This is a demo script for Tekken 8 automation.")

    -- Counterattack Options Configuration
    menu.text('Counterattack Options')
    menu.sameLine()
    menu.help("Enable automatic counterattacks with a configurable chance.")
    menu.separator()
    config.useAutomaticCounterattack = menu.checkbox("Automatic Counterattack", config.useAutomaticCounterattack)
    config.CounterattackChance = menu.sliderInt("Counterattack Chance (%)", config.CounterattackChance, 0, 100)
	
    menu.text('Combo')
    menu.sameLine()
    menu.help("Assign a key for one-click combos and select the combo type.")
	
    config.AutoComboDmg = menu.checkbox('Auto Combo', config.AutoComboDmg)

	menu.sameLine()
	config.Hit10ComboKey = menu.keySelect('10 Hit Combo Key', config.Hit10ComboKey)
	menu.sameLine()
	
	config.AutoCombo55DmgCode = menu.keySelect('Auto Combo 55DMG(LOW) Key', config.AutoCombo55DmgCode)
	menu.sameLine()

	config.AutoCombo74DmgCode = menu.keySelect('Auto Combo 74DMG(MID) Key', config.AutoCombo74DmgCode)


	menu.separator()
    -- Description Section
    menu.text("This automation script helps players manage defensive and offensive strategies.")
    menu.text("It allows for automatic blocking, counterattacks, and punishments with customizable chances.")
	
	
end)

if (not myScript:submit(outModule)) then
    return myScript:getModule(myScript.name)
end