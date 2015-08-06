require('Inspired')
require('AFKarma')
--require('AFTwitch')

local upv = "If you like UpVote!"
local sig = "Made by TheWelder"
local ver = "1.0.0.5 1:08AM 6/08/2015"
local info = "AFBot Loaded"
textTable = {info,upv,sig,ver} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4])
local isChampion = Obj_Type == Obj_AI_Hero 
local Ally = GetTeam(Object) == GetTeam(myHero)
OnObjectLoop(function(Object,myHero)
local champName = GetObjectName(Object)
local Obj_Type = GetObjectType(Object)
local target = GetCurrentTarget()
local myRange = GetRange(myHero)
local myHeroPos = GetOrigin(myHero)
local myHP = GetMaxHP(myHero)/GetCurrentHP(myHero)
	if Obj_Type == Obj_AI_Hero then
		if GetTeam(Object) == GetTeam(myHero) then 
			local Ally = Object
				if IsObjectAlive(Ally) then
					if GetRange(Ally) > 450 and GetBaseDamage(Ally) > 55 and IsInDistance(Ally,10000) then 
							local hero_origin = GetOrigin(Ally)
							if GetDistance(hero_origin,myHeroPos) > 500 then
								MoveToXYZ(hero_origin.x-170,hero_origin.y,hero_origin.z+100)
							end	
					else 
						if IsInDistance(Ally,2000) then 
							local hero_origin = GetOrigin(Ally)
							if GetDistance(hero_origin,myHeroPos) > 500 then
								MoveToXYZ(hero_origin.x-170,hero_origin.y,hero_origin.z+100)
							end
						end
					end
				end
		end
	elseif Obj_Type == Obj_AI_Hero then
		if GetTeam(Object) == GetTeam(myHero) then
		local Ally = Object
			if myHP < 30 then
				local hero_origin = GetOrigin(Ally)
				MoveToXYZ(hero_origin.x-170,hero_origin.y,hero_origin.z+100)
			end
		end
	elseif Obj_Type == Obj_AI_Hero then
		if GetTeam(Object) ~= GetTeam(myHero) then 
			local Enemy = Object
			if IsInDistance(Enemy,500) and myHP > 40 then
				AttackUnit(Enemy)
			end
		end
	elseif Obj_Type == Obj_AI_Minion then
		if GetTeam(Object) ~= GetTeam(myHero) then
			local minion = Object
			if IsInDistance(minion,600) then
				AttackUnit(minion)
			end
		end
	elseif Obj_Type == Obj_AI_Turret then
		if GetTeam(Object) ~= GetTeam(myHero) then
			local turret = Object
			if IsInDistance(turret,600) then
				AttackUnit(turret)
			end
		end
	end
end)	


OnLoop(function(myHero)
if "Karma" == GetObjectName(myHero) then
	--[[--SpellThief's Edge
	if GetItemSlot(myHero,3092) == 0 or GetItemSlot(myHero,3092) < 1 then
		if GetItemSlot(myHero,3303) == 0 or GetItemSlot(myHero,3303) < 1 then
			if GetItemSlot(myHero,3098) == 0 or GetItemSlot(myHero,3098) < 1 then
				BuyItem(3303)
			end
		end
	end]]
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
------------------------------------------------------------------------- Frost Queen's Claim Sequence --> THIS ITEM HAS BEEN REMOVED BY RIOT
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

if GetLevel(myHero) == 1 then
	LevelSpell(_Q)
end
if GetLevel(myHero) == 2 then
	LevelSpell(_W)
end
if GetLevel(myHero) == 3 then
	LevelSpell(_E)
end
 
if GetLevel(myHero) == 4 then
	LevelSpell(_Q)
end
 if GetLevel(myHero) == 5 then
	LevelSpell(_W)
end
 if GetLevel(myHero) == 6 then
	LevelSpell(_R)
end
 if GetLevel(myHero) == 7 then
	LevelSpell(_Q)
end
 if GetLevel(myHero) == 8 then
	LevelSpell(_W)
end
 if GetLevel(myHero) == 9 then
	LevelSpell(_Q)
end
 if GetLevel(myHero) == 10 then
	LevelSpell(_E)
end
 if GetLevel(myHero) == 11 then
	LevelSpell(_R)
end
 if GetLevel(myHero) == 12 then
	LevelSpell(_Q)
end
 if GetLevel(myHero) == 13 then
	LevelSpell(_W)
end
 if GetLevel(myHero) == 14 then
	LevelSpell(_E)
end
 if GetLevel(myHero) == 15 then
	LevelSpell(_W)
end
 if GetLevel(myHero) == 16 then
	LevelSpell(_R)
end
 if GetLevel(myHero) == 17 then
	LevelSpell(_E)
end
 if GetLevel(myHero) == 18 then
	LevelSpell(_E)
end

end)