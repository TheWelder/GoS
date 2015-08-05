require('Inspired')
require('AFKarma')

local upv = "If you like UpVote!"
local sig = "Made by TheWelder"
local ver = "1.0.0.5 3:23AM 5/08/2015"
local info = "AFBot Loaded"
textTable = {info,upv,sig,ver} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4])

OnObjectLoop(function(Object,myHero)
local champName = GetObjectName(Object)
local Obj_Type = GetObjectType(Object)
local target = GetCurrentTarget()
local myRange = GetRange(myHero)
	if Obj_Type == Obj_AI_Hero then
		if GetTeam(Object) == GetTeam(myHero) then
			if IsObjectAlive(Object) and IsInDistance(myHero,3000) then
				if GetRange(Object) > 450 then
						local hero_origin = GetOrigin(Object)
						MoveToXYZ(hero_origin.x-200,hero_origin.y-100,hero_origin.z-100)
				end
			end
		end
	end
end)	

OnLoop(function(myHero)

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
------------------------------------------------------------------------- Frost Queen's Claim Sequence
	--FrostFang
	if GetItemSlot(myHero,3092) == 0 or GetItemSlot(myHero,3092) < 1 then
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
end)