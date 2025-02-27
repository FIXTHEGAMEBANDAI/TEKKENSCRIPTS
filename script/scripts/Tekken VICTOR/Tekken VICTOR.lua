-- if not CharacterID Exit Script
if isNotCharacter(30) then
    return
end
local sdk2 = require("_SDK.sdk2")
local enums = sdk2.enums
local utils = sdk2.utils
local menu = sdk2.Menu

local myScript = sdk2.Register:New("Tekken VICTOR","\xef\x93\x9a")
local outModule = {}
local AutoCombo69DmgFlag = false
local AutoCombo80DmgFlag = false
local AutoCombo78DmgFlag = false
local config = {

}

function WaitingHit()
	for i = 0, 100 do
		local CharacterState = getCharacterState(0)
		if CharacterState.enemy.ComplexMoveState == 16 then
			break
		else
			delayFrames(1)
		end
	end
end
function COMBO_69()
DisableKeyboardInput()
delayFrames(40)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(66)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(80)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(4)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(66)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(10)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
EnableKeyboardInput()
end

function WS_COMBO_78(Delayed)
delayFrames(Delayed)
--STEP1
executeMacro(enums.Input.FORWARD,0,5,enums.InputType.KEY_DOWN)
executeMacro(enums.Input.FORWARD,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
--STEP2
delayFrames(55)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(0,enums.Input.R_KICK,3,enums.InputType.KEY_PRESS)
delayFrames(35)
--STEP3
executeMacro(enums.Input.DOWN + enums.Input.BACK,enums.Input.L_HAND,5,enums.InputType.KEY_DOWN)
executeMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_PRESS)
executeMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_PRESS)
delayFrames(30)
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
delayFrames(20)
--STEP3
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(10)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(10)
executeMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(50)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
--STEP4
executeMacro(enums.Input.FORWARD,0,5,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(enums.Input.FORWARD,0,10,enums.InputType.KEY_DOWN)
executeMacro(enums.Input.FORWARD,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_PRESS)
delayFrames(50)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
--STEP5
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(2)
executeMacro(enums.Input.FORWARD,0,10,enums.InputType.KEY_DOWN)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(4)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(70)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(10)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
EnableKeyboardInput()
end

function WS_COMBO_80(Delayed)
DisableKeyboardInput()
delayFrames(Delayed)
--STEP1
executeMacro(0,enums.Input.L_KICK + enums.Input.R_KICK,5,enums.InputType.KEY_PRESS)
--STEP2
delayFrames(25)
--STEP3
executeMacro(0,enums.Input.R_KICK,6,enums.InputType.KEY_PRESS)
executeMacro(0,enums.Input.R_HAND,7,enums.InputType.KEY_PRESS)
delayFrames(60)
--STEP4
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,enums.Input.L_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(10)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(75)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
--STEP5
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(enums.Input.FORWARD,0,20,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(1)
executeMacro(enums.Input.DOWN,0,2,enums.InputType.KEY_DOWN)
executeMacro(enums.Input.DOWN+enums.Input.FORWARD,0,3,enums.InputType.KEY_DOWN)
executeMacro(enums.Input.FORWARD,enums.Input.R_HAND,5,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(5)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(45)
--STEP6
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(0,enums.Input.R_KICK,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
delayFrames(10)
executeMacro(0,enums.Input.R_HAND,1,enums.InputType.KEY_DOWN)
executeMacro(0, 0, 0, enums.InputType.KEY_UP)
--STEP7
delayFrames(75)
if getCharacterState(0).enemy.SimpleMoveState ~= enums.SimpleMoveType.JUGGLED then
	EnableKeyboardInput()
	return
end
executeMacro(enums.Input.DOWN + enums.Input.BACK,enums.Input.L_HAND,5,enums.InputType.KEY_DOWN)
executeMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_PRESS)
executeMacro(0,enums.Input.L_HAND,1,enums.InputType.KEY_PRESS)
delayFrames(30)
executeMacro(enums.Input.FORWARD,0,1,enums.InputType.KEY_DOWN)
executeMacro(enums.Input.FORWARD,enums.Input.L_KICK,3,enums.InputType.KEY_DOWN)
executeMacro(enums.Input.FORWARD,0,2,enums.InputType.KEY_PRESS)
executeMacro(0,enums.Input.L_KICK,1,enums.InputType.KEY_PRESS)
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
				--
				if FrameAdvantage >= 19 then
					executeMacro(enums.Input.DOWN + enums.Input.FORWARD , enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--
				if FrameAdvantage == 18 then
					executeMacro(enums.Input.FORWARD+enums.Input.DOWN,enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--
				if FrameAdvantage == 17 or FrameAdvantage == 16 then
					executeMacro(enums.Input.FORWARD+enums.Input.DOWN,enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
				end
				--
				if FrameAdvantage == 15 then
					executeMacro(enums.Input.FORWARD+enums.Input.DOWN,  enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
				end
				--
				if FrameAdvantage == 14 then
					executeMacro(enums.Input.FORWARD, enums.Input.R_KICK + enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
				end
				--
				if FrameAdvantage == 13 or FrameAdvantage == 12 then
					executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_HAND + enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
				end
			end
			if AttackType == enums.AttackType.LOW then
				--
				if FrameAdvantage >= 18 or FrameAdvantage == 17 or FrameAdvantage == 16 then
					executeMacro(0, enums.Input.L_HAND , 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_HAND , 5, enums.InputType.KEY_PRESS)
					if config.AutoCombo then
						local autoRate = getRandomInt(1, 2)
						WaitingHit()
						if autoRate == 1 then
							WS_COMBO_78(50)
						else
							WS_COMBO_80(50)
							
						end
					end
					return
				end
				--
				if FrameAdvantage == 15 then
					executeMacro(0, enums.Input.R_HAND , 5, enums.InputType.KEY_PRESS)
					return
				end
				--
				if FrameAdvantage == 14 or FrameAdvantage == 13 then
					executeMacro(enums.Input.FORWARD +enums.Input.UP, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)

					return
				end
				if FrameAdvantage == 12 then
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
				end
				
			end
		end
	end
	
	if enemy.SimpleMoveState == enums.SimpleMoveType.JUGGLED then

		if AutoCombo69DmgFlag then
			AutoCombo69DmgFlag = false
			COMBO_69()
		end
		
		if AutoCombo80DmgFlag then
			AutoCombo80DmgFlag = false
			WS_COMBO_80(30)
		end
		
		if AutoCombo78DmgFlag then
			AutoCombo78DmgFlag = false
			WS_COMBO_78(30)
		end
	end

end)

-- Window event
myScript:onMessage(function(msg, wParam, lParam)
	if msg == 257 then

		if wParam == config.AutoCombo69DmgCode then
			AutoCombo69DmgFlag = true
			asyncExecuteMacro(enums.Input.DOWN,0,10,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0,enums.Input.L_HAND,5,enums.InputType.KEY_PRESS)
		end
		if wParam == config.AutoCombo80DmgCode then
			AutoCombo80DmgFlag = true
			asyncExecuteMacro(enums.Input.DOWN,0,10,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0,enums.Input.L_HAND,5,enums.InputType.KEY_PRESS)
		end
		if wParam == config.AutoCombo78DmgCode then
			AutoCombo78DmgFlag = true
			asyncExecuteMacro(enums.Input.DOWN,0,10,enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0,enums.Input.L_HAND,5,enums.InputType.KEY_PRESS)
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
    menu.text('VICTOR Combo Test Script Demo')
    menu.sameLine()
    menu.help("This is a demo script for Tekken 8 automation.")

    -- Counterattack Options Configuration
    menu.text('Counterattack Options')
    menu.sameLine()
    menu.help("Enable automatic counterattacks with a configurable chance.")
    menu.separator()
    config.useAutomaticCounterattack = menu.checkbox("Automatic Counterattack", config.useAutomaticCounterattack)
    config.CounterattackChance = menu.sliderInt("Counterattack Chance (%)", config.CounterattackChance, 0, 100)
    config.AutoCombo = menu.checkbox('Enable Auto Combo', config.AutoCombo)

	config.AutoCombo69DmgCode = menu.keySelect('Auto Combo (69 Dmg) Key ', config.AutoCombo69DmgCode)
	menu.sameLine()
	config.AutoCombo78DmgCode = menu.keySelect('Auto Combo (78 Dmg) Key ', config.AutoCombo78DmgCode)
	menu.sameLine()
	config.AutoCombo80DmgCode = menu.keySelect('Auto Combo (80 Dmg) Key ', config.AutoCombo80DmgCode)
	
    -- Description Section
    menu.text("This automation script helps players manage defensive and offensive strategies.")
    menu.text("It allows for automatic blocking, counterattacks, and punishments with customizable chances.")
	
	
end)

if (not myScript:submit(outModule)) then
    return myScript:getModule(myScript.name)
end