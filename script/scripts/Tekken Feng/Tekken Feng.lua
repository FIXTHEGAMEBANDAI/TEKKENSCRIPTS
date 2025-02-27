-- if not CharacterID Exit Script
if isNotCharacter(13) then
    return
end
local sdk2 = require("_SDK.sdk2")
local enums = sdk2.enums
local utils = sdk2.utils
local menu = sdk2.Menu

local myScript = sdk2.Register:New("Tekken Feng","\xef\x91\xb0")
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
				if FrameAdvantage >= 24 then
					executeMacro(enums.Input.FORWARD, 0, 5, enums.InputType.KEY_DOWN)
					executeMacro(enums.Input.FORWARD, enums.Input.L_KICK, 5, enums.InputType.KEY_DOWN)
					executeMacro(0, enums.Input.L_KICK + enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage >= 19 then
					executeMacro(enums.Input.BACK, enums.Input.L_HAND+enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage >= 17 then
					executeMacro(enums.Input.UP	 + enums.Input.FORWARD, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 16 then
					executeMacro(enums.Input.FORWARD + enums.Input.DOWN, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 15 then
					executeMacro(enums.Input.FORWARD + enums.Input.UP, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 13 or FrameAdvantage == 14 then
					executeMacro(enums.Input.BACK, enums.Input.L_HAND+enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 12 then
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 6, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 8, enums.InputType.KEY_PRESS)
					return
				end
			end
			if AttackType == enums.AttackType.LOW then
				--
				if FrameAdvantage >= 20 then
					executeMacro(enums.Input.UP, 0, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
					return
				end
				--OK
				if FrameAdvantage == 18 then
					executeMacro(enums.Input.DOWN + enums.Input.FORWARD, enums.Input.R_HAND, 10, enums.InputType.KEY_PRESS)
					return
				end
				if FrameAdvantage == 17 then
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.R_KICK, 10, enums.InputType.KEY_PRESS)
					return
				end
				--OK	
				if FrameAdvantage == 16 or FrameAdvantage == 15 or FrameAdvantage == 14 or FrameAdvantage == 13 then
					executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
					executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
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


	if config.AutoCombo62Dmg and enemy.SimpleMoveState == enums.SimpleMoveType.JUGGLED then
	
		local ActionTimer = self.Recovery- self.MoveTimer
		local isActionEnd = ActionTimer <= 1 and ActionTimer >= 0

		--Damge62
		if self.MoveID == 1754 and isActionEnd then
			executeMacro(enums.Input.FORWARD + enums.Input.DOWN, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
			executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
		end
		if self.MoveID == 1734 and isActionEnd then
			executeMacro(enums.Input.FORWARD + enums.Input.DOWN, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
			executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
			executeMacro(0, enums.Input.L_HAND+enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
		end
		if self.MoveID == 1736 and isActionEnd then
			executeMacro(enums.Input.FORWARD, 0, 1, enums.InputType.KEY_PRESS)
			executeMacro(enums.Input.FORWARD, 0, 10, enums.InputType.KEY_PRESS)
			executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
			executeMacro(0, enums.Input.L_HAND+enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
		end
	end

	if config.AutoCombo62Dmg and enemy.SimpleMoveState == enums.SimpleMoveType.JUGGLED then
	
		local ActionTimer = self.Recovery- self.MoveTimer
		local isActionEnd = ActionTimer <= 1 and ActionTimer >= 0

		--Damge62
		if self.MoveID == 1754 and isActionEnd then
			executeMacro(enums.Input.FORWARD + enums.Input.DOWN, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
			executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
		end
		if self.MoveID == 1734 and isActionEnd then
			executeMacro(enums.Input.FORWARD + enums.Input.DOWN, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
			executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
			executeMacro(0, enums.Input.L_HAND+enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
		end
		if self.MoveID == 1736 and isActionEnd then
			executeMacro(enums.Input.FORWARD, 0, 1, enums.InputType.KEY_PRESS)
			executeMacro(enums.Input.FORWARD, 0, 10, enums.InputType.KEY_PRESS)
			executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
			executeMacro(0, enums.Input.L_HAND+enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
		end
	end

	if config.AutoCombo42Dmg and enemy.SimpleMoveState == enums.SimpleMoveType.JUGGLED then
	
		local ActionTimer = self.Recovery- self.MoveTimer
		local isActionEnd = ActionTimer <= 1 and ActionTimer >= 0

		--Damge42
		if self.MoveID == 1537 and isActionEnd then
			executeMacro(enums.Input.FORWARD , enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
			executeMacro(0, enums.Input.R_KICK, 5, enums.InputType.KEY_PRESS)
		end
		if self.MoveID == 1694 and isActionEnd then
			executeMacro(enums.Input.FORWARD , enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
			executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
			executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
		end
	end
end)

-- Window event
myScript:onMessage(function(msg, wParam, lParam)

	-- msg = 256 input
	-- msg = 257 input up

	if msg == 257 then
		if wParam == config.AutoCombo62DmgCode then
			asyncExecuteMacro(enums.Input.DOWN, 0, 10, enums.InputType.KEY_DOWN)
			asyncExecuteMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
		end
		if wParam == config.AutoCombo42DmgCode then
			asyncExecuteMacro(enums.Input.FORWARD + enums.Input.UP, enums.Input.R_KICK, 10, enums.InputType.KEY_PRESS)
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
    menu.text('Feng Combo Test Script Demo')
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
	
    config.AutoCombo62Dmg = menu.checkbox('Auto Combo (62 Dmg)', config.AutoCombo62Dmg)
	menu.sameLine()
    config.AutoCombo42Dmg = menu.checkbox('Auto Combo (42 Dmg)', config.AutoCombo42Dmg)

	config.AutoCombo62DmgCode = menu.keySelect('Auto Combo (62 Dmg) Key', config.AutoCombo62DmgCode)
	menu.sameLine()
	config.AutoCombo42DmgCode = menu.keySelect('Auto Combo (42 Dmg) Key', config.AutoCombo42DmgCode)
    menu.sameLine()
    -- One Click Combo Section

	menu.separator()
    -- Description Section
    menu.text("This automation script helps players manage defensive and offensive strategies.")
    menu.text("It allows for automatic blocking, counterattacks, and punishments with customizable chances.")
	
end)

if (not myScript:submit(outModule)) then
    return myScript:getModule(myScript.name)
end