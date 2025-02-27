-- if not CharacterID Exit Script
if isNotCharacter(13) then
    return
end
local sdk2 = require("_SDK.sdk2")
local enums = sdk2.enums
local utils = sdk2.utils
local menu = sdk2.Menu

local myScript = sdk2.Register:New("Feng Combo","\xef\x86\xb3")
local outModule = {}

local config = {

}

myScript:onTick(function(self, enemy)

	local fa = math.abs(utils.getFa(enemy,self))
    math.randomseed(os.time())
	local autoRate = math.random(0, 100)
	if utils.isEnemyEndAttack(fa) and config.useAutomaticPunish then
		if autoRate > config.PunishChance then
			return
		end
		local IsAirborne = utils.IsAirborne(enemy)
		if IsAirborne then
			if fa == 12 or fa == 13 then
				executeMacro(0, enums.Input.L_HAND, 3, enums.InputType.KEY_PRESS)
				executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
				executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
				executeMacro(0, enums.Input.R_HAND, 5, enums.InputType.KEY_PRESS)
			end
			if fa == 14 then
				executeMacro(enums.Input.BACK, enums.Input.L_HAND + enums.Input.R_HAND, 1, enums.InputType.KEY_PRESS)
			end
			if fa == 16 then
				executeMacro(enums.Input.FORWARD + enums.Input.UP, enums.Input.R_KICK, 1, enums.InputType.KEY_PRESS)
			end
		end
		if enemy.attack_type == enums.AttackType.MID and not IsAirborne then
			--MID Attack
			if fa == 13 or fa == 14 then
				executeMacro(enums.Input.BACK, enums.Input.L_HAND + enums.Input.R_HAND, 1, enums.InputType.KEY_PRESS)
			end
			if fa == 15 then
				executeMacro(enums.Input.FORWARD + enums.Input.UP,enums.Input.R_KICK, 1, enums.InputType.KEY_PRESS)
			end
		end
		if enemy.attack_type == enums.AttackType.LOW then
			if fa == 11 and utils.IsCrouching(self) then
				executeMacro(0, enums.Input.R_HAND, 3, enums.InputType.KEY_PRESS)
				executeMacro(0, enums.Input.R_HAND, 3, enums.InputType.KEY_PRESS)
			end
			if fa == 12 and utils.IsCrouching(self) then
				executeMacro(0, enums.Input.R_KICK, 1, enums.InputType.KEY_PRESS)
			end
			if fa == 13 or fa == 14 and utils.IsCrouching(self) then
				executeMacro(0, enums.Input.L_HAND, 5, enums.InputType.KEY_PRESS)
				executeMacro(0, enums.Input.L_KICK, 5, enums.InputType.KEY_PRESS)
			end
			if fa == 15 and utils.IsCrouching(self) then
				executeMacro(0, enums.Input.L_KICK, 1, enums.InputType.KEY_PRESS)
			end
			if fa == 17 and utils.IsCrouching(self) then
				executeMacro(0, enums.Input.L_KICK, 1, enums.InputType.KEY_PRESS)
			end
		end

		print("Fa:",fa,"move_id",self.move_id,enemy.attack_type)
	end
end)

-- Window event
myScript:onMessage(function(msg, wParam, lParam)

	-- msg = 256 input
	-- msg = 257 input up
	
	if msg == 256 then
		if wParam == config.OnekeyCode then
			executeMacro(enums.Input.BACK, 0, 1, enums.InputType.KEY_PRESS)
			executeMacro(enums.Input.BACK + enums.Input.DOWN, 0, 1, enums.InputType.KEY_PRESS)
			executeMacro(enums.Input.BACK, 0, 1, enums.InputType.KEY_PRESS)
			print("Messagesb:", enums.Input.BACK)
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

    -- Auto Duck Whiff Punish Configuration
    menu.text('Punish Options')
    menu.sameLine()
    menu.help("Enable Auto Punish with a configurable chance.")
    menu.separator()
    config.useAutomaticPunish = menu.checkbox("Automatic punishment", config.useAutomaticPunish)
    config.PunishChance = menu.sliderInt("Duck Whiff Punish Chance (%)", config.PunishChance, 0, 100)

    -- One Click Combo Section
    menu.text('One Click Combo')
    menu.sameLine()
    menu.help("Assign a key for one-click combos and select the combo type.")
    
    config.OnekeyCode = menu.keySelect('One Click Combo Key', config.OnekeyCode)
    menu.separator()
	
    -- Description Section
    menu.text("This automation script helps players manage defensive and offensive strategies.")
    menu.text("It allows for automatic blocking and punishments with customizable chances.")
	
	
end)

if (not myScript:submit(outModule)) then
    return myScript:getModule(myScript.name)
end