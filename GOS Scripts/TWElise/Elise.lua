require('Inspired')
require('twgank')
require('IAC')
myIAC = IAC()
Config = scriptConfig("elise", "TWElise")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
Config.addParam("AB", "AutoBuy", SCRIPT_PARAM_ONOFF, true)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

OnLoop(function(myHero)
local myHero = GetMyHero()
local myHeroPos = GetOrigin(myHero)
local QRange = GetCastRange(myHero,_Q)
local WRange = GetCastRange(myHero,_W)
local ERange = GetCastRange(myHero,_E)
local target = GetCurrentTarget()
local myAttackRange = GetRange(myHero)
local tarAttackRange = GetRange(target)


	if "Elise" == GetObjectName(myHero) then
		if Config.Combo and IsObjectAlive(target) then
			if Config.Q and ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
				if CanUseSpell(myHero,_Q) == READY then
					CastTargetSpell(target,_Q)
				end
			end
			if Config.W and ValidTarget(target,WRange) and IsInDistance(myHero,WRange) then
				local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,WRange,55,true,true)
				if CanUseSpell(myHero,_W) == READY then
					CastSkillShot(_W,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				end
			end
			if Config.E and ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
				local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,ERange,55,true,true)
				if CanUseSpell(myHero,_E) == READY then
					CastSkillShot(_E,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				end
			end
			if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
				if CanUseSpell(myHero,_R) == READY and CanUseSpell(myHero,_Q) == ONCOOLDOWN and CanUseSpell(myHero,_W) == ONCOOLDOWN then
					CastSpell(_R)
				end
			end
		end
			if Config.AB then
				if GetItemSlot(myHero,2003) == 0 or GetItemSlot(myHero,2003) < 3 then
					BuyItem(2003)
				end
		------------------------------------------------------------------------- Sorcerer's Shoes Sequence
			-- Boots of Speed
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
					BuyItem(1001)
				end
			end
			-- Sorcerer's Shoes
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				BuyItem(3020)
			end
		------------------------------------------------------------------------- Liandry's Torment Sequence
			--Ruby Crystal
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1028) == 0 or GetItemSlot(myHero,1028) < 1 then
						BuyItem(1028)
					end
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Blasting Wand
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,1026) == 0 or GetItemSlot(myHero,1026) < 1 then
					BuyItem(1026)
				end
			end
			--Liandry's Torment
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				BuyItem(3151)
			end
		------------------------------------------------------------------------- Athene's Unholy Grail Sequence
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3028) == 0 or GetItemSlot(myHero,3028) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Null-Magic Mantle
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1033) == 0 or GetItemSlot(myHero,1033) < 1 then
					BuyItem(1033)
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Athene's Unholy Grail
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				BuyItem(2700)
			end
		------------------------------------------------------------------------- Morellonomicon Sequence

			--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Forbidden Idol
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					BuyItem(3114)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Morellonomicon
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				BuyItem(3165)
			end
			------------------------------------------------------------------------- Twin Shadows Sequence
			
			--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
						BuyItem(1052)
					end
				end
			end
			-- Aether Wisp
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
					BuyItem(3113)
				end
			end
			-- Twin Shadows
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				BuyItem(3023)
			end
		end
	end

end)