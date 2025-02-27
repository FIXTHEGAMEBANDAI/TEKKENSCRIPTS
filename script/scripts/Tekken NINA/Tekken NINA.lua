--utils.getDistance()
-- if not CharacterID Exit Script
if isNotCharacter(21) then
    return
end
local sdk2 = require("_SDK.sdk2")
local enums = sdk2.enums
local utils = sdk2.utils
local menu = sdk2.Menu

local myScript = sdk2.Register:New("Tekken NINA","\xef\x93\x9a")
local outModule = {}
local AutoCombo84DmgFlag = false
local AutoCombo74DmgFlag = false
local AutoCombo64DmgFlag = false
local config = {

}

function COUTER_COMBO1()
DisableKeyboardInput()
executeMacro(enums.Input.BACK+enums.Input.DOWN, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
delayFrames(50)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(2)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
delayFrames(45)
executeMacro(enums.Input.BACK,enums.Input.L_KICK + enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0, enums.Input.L_KICK,5,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
delayFrames(40)
executeMacro(enums.Input.DOWN,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(40)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.DOWN,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(10)
executeMacro(0,enums.Input.L_HAND + enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
EnableKeyboardInput()
end


function COMBO_64()
DisableKeyboardInput()
delayFrames(30)
executeMacro(enums.Input.UP+enums.Input.FORWARD,enums.Input.L_KICK,1,enums.InputType.KEY_PRESS)
delayFrames(40)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(2)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(2)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
delayFrames(45)
executeMacro(enums.Input.BACK,enums.Input.L_KICK + enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(1)
executeMacro(enums.Input.BACK,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(3)
executeMacro(0,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(80)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(enums.Input.FORWARD,0,10,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(1)
executeMacro(enums.Input.DOWN,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(10)
executeMacro(0,enums.Input.L_HAND + enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
EnableKeyboardInput()
end

function COMBO_74()
DisableKeyboardInput()
delayFrames(20)
executeMacro(enums.Input.UP+enums.Input.FORWARD,enums.Input.R_KICK,1,enums.InputType.KEY_PRESS)
delayFrames(45)
executeMacro(enums.Input.UP+enums.Input.FORWARD,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.UP+enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
delayFrames(39)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(2)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(2)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(45)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.BACK,enums.Input.L_KICK + enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(1)
executeMacro(enums.Input.BACK,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(3)
executeMacro(0,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
delayFrames(80)
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(enums.Input.FORWARD,0,10,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(1)
executeMacro(enums.Input.DOWN,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.FORWARD,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
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

			end
			if AttackType == enums.AttackType.MID then
				--OK
				if FrameAdvantage >= 17 then
					executeMacro(enums.Input.FORWARD, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					if utils.IsGettingHit(self) then
						AutoCombo84DmgFlag = true
					else
						AutoCombo74DmgFlag = true
					end
					return
				end
				--OK
				if FrameAdvantage == 16 then
					executeMacro(enums.Input.BACK, enums.Input.L_HAND + enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
				end
				--OK
				if FrameAdvantage == 15 then
					executeMacro(enums.Input.DOWN + enums.Input.FORWARD, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					AutoCombo64DmgFlag = true
				end
				--OK
				if FrameAdvantage == 14 or FrameAdvantage == 13 or FrameAdvantage == 12 then
					executeMacro(enums.Input.BACK, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					if utils.IsGettingHit(self) then
						AutoCombo84DmgFlag = true
					end
				end
			end
			if AttackType == enums.AttackType.LOW then
				--OK
				if FrameAdvantage >= 15 then
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					AutoCombo84DmgFlag = true
					return
				end
				--OK
				if FrameAdvantage == 14 or FrameAdvantage == 13 then
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_HAND + enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
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

	if config.AutoComboDmg and enemy.SimpleMoveState == enums.SimpleMoveType.JUGGLED then
		local ActionTimer = self.Recovery- self.MoveTimer
		local isActionEnd = ActionTimer <= 1 and ActionTimer >= 0
		if AutoCombo84DmgFlag then
			COUTER_COMBO1()
			AutoCombo84DmgFlag = false
		end
		if AutoCombo74DmgFlag then
			COMBO_74()
			AutoCombo74DmgFlag = false
		end
		if AutoCombo64DmgFlag then
			COMBO_64()
			AutoCombo64DmgFlag = false
		end
	end
end)

-- Window event
myScript:onMessage(function(msg, wParam, lParam)

	-- msg = 274 input
	-- msg = 257 input up

	if msg == 257 then
		if wParam == config.AutoCombo64DmgCode then
			asyncExecuteMacro(enums.Input.FORWARD + enums.Input.DOWN, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
			AutoCombo64DmgFlag = true
		end
		if wParam == config.AutoCombo74DmgCode then
			asyncExecuteMacro(enums.Input.DOWN+enums.Input.FORWARD, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
			AutoCombo74DmgFlag = true
			
		end
		if wParam == config.AutoCombo84DmgCode then
			asyncExecuteMacro(enums.Input.FORWARD, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
			AutoCombo84DmgFlag = true
		end
	end
	
    -- Process the msg, wParam, and lParam if necessary
    -- For example:
    --print("Message:", msg)
    --print("wParam:", wParam)
    --print("lParam:", lParam)

end)

myScript:onMenu(function()
    -- Script Introduction Section
    menu.text('NINA Combo Test Script Demo')
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

	config.AutoCombo64DmgCode = menu.keySelect('Auto Combo (64 Dmg) Key', config.AutoCombo64DmgCode)
	menu.sameLine()
	config.AutoCombo74DmgCode = menu.keySelect('Auto Combo (74 Dmg) Key', config.AutoCombo74DmgCode)
    menu.sameLine()
	config.AutoCombo84DmgCode = menu.keySelect('Auto Combo (84 Counter Dmg) Key', config.AutoCombo84DmgCode)
    menu.sameLine()

	menu.separator()
    -- Description Section
    menu.text("This automation script helps players manage defensive and offensive strategies.")
    menu.text("It allows for automatic blocking, counterattacks, and punishments with customizable chances.")
	
	
end)

if (not myScript:submit(outModule)) then
    return myScript:getModule(myScript.name)
end