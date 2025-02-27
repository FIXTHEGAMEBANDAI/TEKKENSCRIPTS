-- if not CharacterID Exit Script
if isNotCharacter(6) then
    return
end
local sdk2 = require("_SDK.sdk2")
local stage = require("_SDK.stage")
local enums = sdk2.enums
local utils = sdk2.utils
local menu = sdk2.Menu

local myScript = sdk2.Register:New("Tekken JIN","\xef\x93\x9a")
local outModule = {}
local AutoComboDmg61Flag = false
local AutoComboDmg72Flag = false

local config = {

}

function COMBO72_MID()
DisableKeyboardInput()
delayFrames(30)
executeMacro(enums.Input.BACK,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(40)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.BACK,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(3)
executeMacro(enums.Input.BACK,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(3)
executeMacro(enums.Input.FORWARD,0,15,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(10)
executeMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
delayFrames(40)
executeMacro(enums.Input.BACK,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(3)
executeMacro(enums.Input.BACK,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(1)
executeMacro(enums.Input.FORWARD,0,15,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(15)
executeMacro(enums.Input.UP,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(62)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.BACK,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(3)
executeMacro(enums.Input.BACK,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(1)
executeMacro(enums.Input.FORWARD,0,15,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(15)
executeMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
EnableKeyboardInput()
end

function COMBO61()
DisableKeyboardInput()
delayFrames(15)
executeMacro(enums.Input.BACK,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(3)
executeMacro(enums.Input.BACK,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(36)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.BACK,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(1)
executeMacro(enums.Input.FORWARD,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(1)
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(3)
executeMacro(0,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(25)
executeMacro(enums.Input.FORWARD,0,15,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(10)
executeMacro(enums.Input.UP,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(56)
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
executeMacro(enums.Input.BACK,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(enums.Input.FORWARD,0,16,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(10)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
EnableKeyboardInput()
end

myScript:onTick(function(self, enemy)
--print(stage.wall_distance())

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
					executeMacro(enums.Input.BACK, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 18 then
					executeMacro(0, enums.Input.L_KICK + enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 17 or FrameAdvantage == 16 or FrameAdvantage == 15 then
					executeMacro(enums.Input.DOWN, enums.Input.L_KICK + enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					AutoComboDmg72Flag = true
					return
				end
				--OK
				if FrameAdvantage == 14 then
					executeMacro(enums.Input.FORWARD, enums.Input.L_HAND + enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 12 or FrameAdvantage == 13 then
					executeMacro(enums.Input.BACK, enums.Input.L_HAND, 5, enums.InputType.KEY_DOWN)
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
			end
			if AttackType == enums.AttackType.LOW then
				--OK
				if FrameAdvantage >= 20 then
					executeMacro(enums.Input.UP, 0, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					AutoComboDmg61Flag = true
					return
				end
				--OK
				if FrameAdvantage == 18 then
					executeMacro(0, enums.Input.R_HAND, 10, enums.InputType.KEY_PRESS)
					AutoComboDmg61Flag = true
					return
				end
				--OK
				if FrameAdvantage == 17 or FrameAdvantage == 16 or FrameAdvantage == 15 then
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					AutoComboDmg61Flag = true
					return
				end
				--OK
				if FrameAdvantage == 13 or FrameAdvantage == 14 then
					executeMacro(0, enums.Input.L_HAND, 6, enums.InputType.KEY_PRESS)
                    delayFrames(4)
                    executeMacro(0, enums.Input.L_KICK, 7, enums.InputType.KEY_PRESS)
                    delayFrames(3)
                    executeMacro(0, enums.Input.R_HAND, 8, enums.InputType.KEY_PRESS)
                    delayFrames(3)
			        executeMacro(0, enums.Input.L_HAND, 4, enums.InputType.KEY_PRESS)
                    executeMacro(0, enums.Input.R_KICK, 6, enums.InputType.KEY_PRESS)
                    executeMacro(0, enums.Input.R_HAND, 8, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 12 then
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
			end
		end
		
	end

	
	
	if config.AutoComboDmg and enemy.SimpleMoveState == enums.SimpleMoveType.JUGGLED then
		--下段61DMG
		if AutoComboDmg61Flag then
			AutoComboDmg61Flag = false
			COMBO61()
		end
		--中段15-17帧 72伤害连招
		if AutoComboDmg72Flag then
			AutoComboDmg72Flag = false
			COMBO72_MID()
		end
	end
end)

-- Window event
myScript:onMessage(function(msg, wParam, lParam)

	if msg == 257 then
		if wParam == config.AutoCombo61DmgCode then
			asyncExecuteMacro(enums.Input.DOWN,0,20,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
			asyncDelayFrames(1)
			asyncExecuteMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, 0, 0, enums.InputType.KEY_UP)
			AutoComboDmg61Flag = true
		end
		if wParam == config.AutoCombo72DmgCode then
			asyncExecuteMacro(enums.Input.DOWN, enums.Input.L_KICK + enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
			AutoComboDmg72Flag = true
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
    menu.text('JIN Combo Test Script Demo')
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

	config.AutoCombo61DmgCode = menu.keySelect('Auto Combo 61DMG(LOW) Key', config.AutoCombo61DmgCode)
	menu.sameLine()
	config.AutoCombo72DmgCode = menu.keySelect('Auto Combo 72DMG(MID) Key', config.AutoCombo72DmgCode)

	menu.separator()
    -- Description Section
    menu.text("This automation script helps players manage defensive and offensive strategies.")
    menu.text("It allows for automatic blocking, counterattacks, and punishments with customizable chances.")
	
	
end)

if (not myScript:submit(outModule)) then
    return myScript:getModule(myScript.name)
end