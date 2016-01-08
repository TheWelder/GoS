require('Inspired')
--require('AFPlugins')
--require('TWObjects')
alliedTurrets = {}
enemyTurrets = {}
alliedMinions = {}
enemyMinions = {}
local upv = "If you like UpVote!"
local sig = "Made by TheWelder"
local ver = "2.0.0.1 17:53 PM 08/01/2016"
local info = "AFBot Loaded"
textTable = {info,upv,sig,ver} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4])


OnObjectLoop(function(Object,myHero)
local Obj_Type = GetObjectType(Object)
	if GetObjectType(Object) == Obj_AI_Turret and GetTeam(Object) == GetTeam(myHero) then
		alliedTurrets[GetNetworkID(Object)] = Object
	end
	if GetObjectType(Object) == Obj_AI_Turret and GetTeam(Object) ~= GetTeam(myHero) then
		enemyTurrets[GetNetworkID(Object)] = Object
	end
	if GetObjectType(Object) == Obj_AI_Minion and GetTeam(Object) == GetTeam(myHero) then
		alliedMinions[GetNetworkID(Object)] = Object
	end
	if GetObjectType(Object) == Obj_AI_Minion and GetTeam(Object) ~= GetTeam(myHero) then
		enemyMinions[GetNetworkID(Object)] = Object
	end
end)

OnDraw(function(myHero)
local myHero = GetMyHero()
local myHeroPos = GetOrigin(myHero)
local myHP = GetCurrentHP(myHero)/GetMaxHP(myHero)
local myMaxHp = GetMaxHP(myHero)
local getAllyHero = GetOrigin(ClosestAlly(myHeroPos))
local getAllyTurret = GetOrigin(closestAllyTurret(myHeroPos))
local getAllyMinion = GetOrigin(closestAllyMinion(myHeroPos))
local getEnemyHero = GetOrigin(ClosestEnemy(myHeroPos))
local getEnemyTurret = GetOrigin(closestEnemyTurret(myHeroPos))
local getEnemyMinion = GetOrigin(closestEnemyMinion(myHeroPos))

			DrawText(string.format("%f", GetGameTimer()),12,0,300,0xff00ff00);
			DrawText(string.format("x,y,z = %f; %f; %f", myHeroPos.x, myHeroPos.y, myHeroPos.z),12,0,400,0xff00ff00);

			if GetOrigin(myHero).y >= 115 then
				MoveToXYZ(12000,myHeroPos.y,3000)
			end
			if GetDistance(getAllyTurret,myHero) > 500 and myHP < 0.5 then
				MoveToXYZ(getAllyTurret.x,getAllyTurret.y,getAllyTurret.z)
			end
			if myHP < 0.5 then
				if GetDistance(closestAllyTurret(myHeroPos),myHero) < 400 then
					CastSpell(RECALL)
					HoldPosition()
				end
			end 
			if IsDead(ClosestAlly(myHeroPos)) == false and GetDistance(ClosestAlly(myHeroPos),myHero) > 500 and IsDead(ClosestAlly(myHeroPos)) == false and myHP > 0.5 then
					MoveToXYZ(getAllyHero.x-170,getAllyHero.y,getAllyHero.z+100)
			end
			if GetOrigin(myHero).y < 115 and IsDead(ClosestAlly(myHeroPos)) == false and AlliesAround(myHeroPos, 5000) <= 0 and myHP < 0.5 then
				MoveToXYZ(getAllyHero.x-170,getAllyHero.y,getAllyHero.z+100)
			end
			if UnderTurret(myHeroPos, enemyTurret) then 
				MoveToXYZ(getAllyHero.x-170,getAllyHero.y,getAllyHero.z+100)
			end
			if GetGameTimer() > 125 and myHP > 0.5 and AlliesAround(myHeroPos, 700) > 0 and IsDead(ClosestAlly(myHeroPos)) == false then
				if GetDistance(closestEnemyTurret(myHeroPos),ClosestEnemy(myHeroPos)) > 1000 then
					if IsInDistance(ClosestEnemy(myHeroPos),1000) then
						AttackUnit(ClosestEnemy(myHeroPos))
					end
				elseif IsDead(closestEnemyTurret(myHeroPos)) == false and IsInDistance(closestEnemyTurret(myHeroPos),1000) and GetDistance(closestAllyMinion(myHeroPos),closestEnemyTurret(myHeroPos)) < 100 then
					AttackUnit(closestEnemyTurret(myHeroPos))
				elseif GetObjectBaseName(closestEnemyMinion(myHeroPos)) ~= "Poo" then
					if IsDead(closestEnemyMinion(myHeroPos)) == false and IsInDistance(closestEnemyMinion(myHeroPos),700) and GetDistance(closestEnemyMinion(myHeroPos),closestEnemyTurret(myHeroPos)) > 1000 then
						AttackUnit(closestEnemyMinion(myHeroPos))
					end
				end
			end
end)

OnDraw(function(Object,myHero)
local myHero = GetMyHero()
local myHeroPos = GetOrigin(myHero)
local QRange = GetCastRange(myHero,_Q)
local WRange = GetCastRange(myHero,_W)
local ERange = GetCastRange(myHero,_E)
local RRange = GetCastRange(myHero,_R)
local target = GetCurrentTarget()
local myAttackRange = GetRange(myHero)
local tarAttackRange = GetRange(target)
local Obj_Type = GetObjectType(Object)
local myHp = GetCurrentHP(myHero)
local myHPo = GetCurrentHP(myHero)/GetMaxHP(myHero)
local myMaxHp = GetMaxHP(myHero)
	if "Soraka" == GetObjectName(myHero) then
		if GetDistance(closestEnemyTurret(myHeroPos),myHero) > 2000 and myHPo > 0.5 and AlliesAround(myHeroPos, 1000) > 0 then
			if ValidTarget(target,QRange) and IsInDistance(target,QRange) then
				local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,QRange,55,true,true)
				if CanUseSpell(myHero,_Q) == READY then
					CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				end
			end
			if myHp/myMaxHp > 0.3 and GetCurrentHP(ClosestAlly(myHeroPos))/GetMaxHP(ClosestAlly(myHeroPos)) < 0.6 and IsInDistance(ClosestAlly(myHeroPos),500) and not IsInDistance(closestEnemyTurret(myHeroPos),700) then
				if CanUseSpell(myHero,_W) == READY then
					CastTargetSpell(ClosestAlly(myHeroPos),_W)
				end
			end
			if ValidTarget(target,ERange) and IsInDistance(target,ERange) then
				local EPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,ERange,55,true,true)
				if CanUseSpell(myHero,_E) == READY then
					CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
				end
			end
		end
		if myHp <= myMaxHp/4 then
			if CanUseSpell(myHero,_R) == READY then
				CastSpell(_R)
			end
		end
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
end)

OnTick(function(myHero)

if GetLevel(myHero) == 1 then
	LevelSpell(_Q)
end
if GetLevel(myHero) == 2 then
	LevelSpell(_W)
end
if GetLevel(myHero) == 3 then
	LevelSpell(_Q)
end
 
if GetLevel(myHero) == 4 then
	LevelSpell(_E)
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

function closestAllyTurret(pos)
    local alliedTurret = nil
    for k,v in pairs(GetAlliedTurrets()) do 
        if not alliedTurret and v then alliedTurret = v end
		if alliedTurret and v and GetDistanceSqr(GetOrigin(alliedTurret),pos) > GetDistanceSqr(GetOrigin(v),pos) then --IsObjectAlive(allied) then
			alliedTurret = v
		end
    end
	return alliedTurret
end

function closestEnemyTurret(pos)
    local enemyTurret = nil
    for k,v in pairs(GetEnemyTurrets()) do 
        if not enemyTurret and v then enemyTurret = v end
		if enemyTurret and v and GetDistanceSqr(GetOrigin(enemyTurret),pos) > GetDistanceSqr(GetOrigin(v),pos) then --IsObjectAlive(allied) then
			enemyTurret = v
		end
    end
	return enemyTurret
end

function closestAllyMinion(pos)
    local alliedMinion = nil
    for k,v in pairs(GetAlliedMinions()) do 
        if not alliedMinion and v then alliedMinion = v end
		if alliedMinion and v and GetDistanceSqr(GetOrigin(alliedMinion),pos) > GetDistanceSqr(GetOrigin(v),pos) then --IsObjectAlive(allied) then
			alliedMinion = v
		end
    end
	return alliedMinion
end

function closestEnemyMinion(pos)
    local enemyMinion = nil
    for k,v in pairs(GetEnemyMinions()) do 
        if not enemyMinion and v then enemyMinion = v end
		if enemyMinion and v and GetDistanceSqr(GetOrigin(enemyMinion),pos) > GetDistanceSqr(GetOrigin(v),pos) then --IsObjectAlive(allied) then
			enemyMinion = v
		end
    end
	return enemyMinion
end

function GetAlliedTurrets()
	return alliedTurrets
end

function GetEnemyTurrets()
	return enemyTurrets
end

function GetAlliedMinions()
	return alliedMinions
end

function GetEnemyMinions()
	return enemyMinions
end