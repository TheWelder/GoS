require('Inspired')
require('IAC')
require('twgank')
myIAC = IAC()
local upv = "If you like UpVote!"
local sig = "Made by TheWelder"
local ver = "1.0.0.5 12:23AM 3/08/2015"
local info = "TWKarma Loaded"
textTable = {info,upv,sig,ver} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4])

Config = scriptConfig("karma", "TWKarma")
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
	if Config.AB then
		AutoBuy()
	end
	if "Karma" == GetObjectName(myHero) then
	DrawText(string.format("TW %s Loaded", GetObjectName(myHero)),24,750,50,0xff00ff00)
		if Config.Combo then
			if Config.Q then
				if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
					local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,QRange,55,true,true)
					if CanUseSpell(myHero,_Q) == READY and QPred.HitChance == 1 then
						CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						AttackUnit(target)
					end
				end
			end
			if Config.W then
				if ValidTarget(target,WRange) and IsInDistance(myHero,WRange) then
					if CanUseSpell(myHero,_W) == READY then
						CastTargetSpell(target,_W)
						AttackUnit(target)
					end
				end
			end
			if Config.E then
				if ValidTarget(target,myAttackRange) and IsInDistance(myHero,tarAttackRange) then
					if CanUseSpell(myHero,_E) == READY then
						CastSpell(_E)
						AttackUnit(target)
					end
				end
			end
			if Config.R then 
				if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
					if CanUseSpell(myHero,_R) == READY then
						CastSpell(_R)
						AttackUnit(target)
					end
				end
			end
		end
	else
		DrawText(string.format("%s not suported", GetObjectName(myHero)),24,750,50,0xffffff00)
	end
end)

function AutoBuy()


	--SpellThief's Edge
	if GetItemSlot(myHero,3092) == 0 or GetItemSlot(myHero,3092) < 1 then
		if GetItemSlot(myHero,3303) == 0 or GetItemSlot(myHero,3303) < 1 then
			if GetItemSlot(myHero,3098) == 0 or GetItemSlot(myHero,3098) < 1 then
				BuyItem(3303)
			end
		end
	end
------------------------------------------------------------------------- Health Pot's
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
------------------------------------------------------------------------- Frost Queen's Claim Sequence --> THIS ITEM HAS BEEN DISABLED BY RIOT
	--FrostFang
	--[[if GetItemSlot(myHero,3092) == 0 or GetItemSlot(myHero,3092) < 1 then
		if GetItemSlot(myHero,3098) == 0 or GetItemSlot(myHero,3098) < 1 then
			BuyItem(3098)
		end
	end
	--Amplifying Tome
	if GetItemSlot(myHero,3092) == 0 or GetItemSlot(myHero,3092) < 1 then
		if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
			if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
				BuyItem(1052)
			end
		end
	end
	--Fiendish Codex
	if GetItemSlot(myHero,3092) == 0 or GetItemSlot(myHero,3092) < 1 then
		if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
			BuyItem(3108)
		end
	end
	--Frost Queen's Claim
	if GetItemSlot(myHero,3092) == 0 or GetItemSlot(myHero,3092) < 1 then
		BuyItem(3092)
	end]]
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