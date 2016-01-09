require('Inspired')
validallys = {}
alliedTurrets = {}
enemyTurrets = {}
alliedMinions = {}
enemyMinions = {}
itemTable = {2003,3020,3151,2700,3165,3023}
skillsLevel = {_Q,_W,_E,_Q,_W,_R,_Q,_W,_E,_Q,_R,_W,_E,_Q,_E,_R,_W,_E}
smartClick = {10,20,-30,15,-15}
local upv = "If you like UpVote!"
local sig = "Made by TheWelder"
local ver = "2.0.0.2 02:08AM 09/01/2016"
local info = "AFBot Loaded"
textTable = {info,upv,sig,ver} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4])
PrintChat(GetCastName(myHero, SUMMONER_1))
PrintChat(GetCastName(myHero, SUMMONER_2))
local myHeropos = myHeroPos()
OnObjectLoop(function(Object,myHero)
local Obj_Type = GetObjectType(Object)
	if GetObjectType(Object) == Obj_AI_Hero and GetTeam(Object) == GetTeam(myHero) then
		if GetCastName(Object, SUMMONER_1) ~= "summonersmite" or "summonersmiteduel" and GetCastName(Object, SUMMONER_1) ~= "summonersmite" or "summonersmiteduel"  then
			validallys[GetNetworkID(Object)] = Object
		end
	end
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
local myHP = GetPercentHP(myHero)
local myMaxHp = GetMaxHP(myHero)
local getAllyHero = GetOrigin(closestValidAlly(point))--GetOrigin(ClosestAlly(point))
local getAllyTurret = GetOrigin(ClosestAllyTurret(myHeroPos))
local getAllyMinion = GetOrigin(ClosestAllyMinion(myHeroPos))
local getEnemyHero = GetOrigin(ClosestEnemy(myHeroPos))
local getEnemyTurret = GetOrigin(closestEnemyTurret(myHeroPos))
local getEnemyMinion = GetOrigin(closestEnemyMinion(myHeroPos))
point = {x = 12000,y = myHeroPos.y,z = 3000}
			DrawText(string.format("%f", GetGameTimer()),12,0,300,0xff00ff00);
			DrawText(string.format("x,y,z = %f; %f; %f", myHeroPos.x, myHeroPos.y, myHeroPos.z),12,0,400,0xff00ff00);

			if GetOrigin(myHero).y >= 115 then
				MoveToXYZ(12000,myHeroPos.y,3000)
				PrintChat("going to Start Position")
			end
			if IsObjectAlive(closestValidAlly(point)) and GetDistance(getAllyTurret,myHero) > 500 and myHP < 50 then
				MoveToXYZ(getAllyTurret.x,getAllyTurret.y,getAllyTurret.z)
				PrintChat("Going to AllyTurret")
			end
			if myHP < 50 then
				if GetDistance(ClosestAllyTurret(myHeroPos),myHero) < 400 then
					HoldPosition()
					PrintChat("Going Back!")
					CastSpell(RECALL)
				end
			end 
			if IsObjectAlive(closestValidAlly(point)) and GetDistance(closestValidAlly(point),myHero) > 500 and myHP > 50 then
					MoveToXYZ(getAllyHero.x-170,getAllyHero.y,getAllyHero.z+100)
					PrintChat("Following the Bitch")
					PrintChat(GetCastName(closestValidAlly(point), SUMMONER_1))
					PrintChat(GetCastName(closestValidAlly(point), SUMMONER_2))
					PrintChat(GetObjectName(closestValidAlly(point)))
			end
			if GetOrigin(myHero).y < 115 and IsObjectAlive(closestValidAlly(point)) and AlliesAround(myHeroPos, 5000) <= 0 and myHP > 50 then
				MoveToXYZ(getAllyHero.x-170,getAllyHero.y,getAllyHero.z+100)
			end
			if UnderTurret(myHeroPos, enemyTurret) then 
				MoveToXYZ(getAllyHero.x-170,getAllyHero.y,getAllyHero.z+100)
				PrintChat("DANGER!")
			end
			if myHP > 50 and GetGameTimer() > 125 and AlliesAround(myHeroPos,700) > 0 and IsObjectAlive(closestValidAlly(point)) then
				if UnderTurret(myHeroPos, enemyTurret) == false then
					if IsInDistance(ClosestEnemy(myHeroPos),700) then
						AttackUnit(ClosestEnemy(myHeroPos))
						PrintChat("LETS HAVE SOME FUN!")
					end
				elseif IsObjectAlive(closestEnemyTurret(myHeroPos)) and IsInDistance(closestEnemyTurret(myHeroPos),950) and GetDistance(ClosestAllyMinion(myHeroPos),closestEnemyTurret(myHeroPos)) < 100 then
					PrintChat("Attacking Turret")
					AttackUnit(closestEnemyTurret(myHeroPos))
				-- elseif GetObjectBaseName(closestEnemyMinion(myHeroPos)) ~= "Poo" then
					-- if IsObjectAlive(closestEnemyMinion(myHeroPos)) and IsInDistance(closestEnemyMinion(myHeroPos),700) and GetDistance(closestEnemyMinion(myHeroPos),closestEnemyTurret(myHeroPos)) > 1000 then
						-- AttackUnit(closestEnemyMinion(myHeroPos))
					-- end
				end
			end
end)

OnTick(function(Object,myHero)
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
local myHP = GetPercentHP(myHero)
local myHPo = GetCurrentHP(myHero)/GetMaxHP(myHero)
local myMaxHp = GetMaxHP(myHero)
	if "Soraka" == GetObjectName(myHero) then
			LevelSpell(skillsLevel[GetLevel(myHero)])

	for k,v in pairs(itemTable) do
		if GetItemSlot(myHero,v) == 0 then
			BuyItem(v)
		end
	end
		if GetDistance(closestEnemyTurret(myHeroPos),myHero) > 950 and myHP > 50 and AlliesAround(myHeroPos, 425) > 0 then
			if ValidTarget(target,QRange) and IsInDistance(target,QRange) then
				local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,QRange,55,true,true)
				if CanUseSpell(myHero,_Q) == READY then
					CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				end
			end
			if ValidTarget(target,ERange) and IsInDistance(target,ERange) then
				local EPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,ERange,55,true,true)
				if CanUseSpell(myHero,_E) == READY then
					CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
				end
			end
		end
			if myHP > 50 and GetPercentHP(ClosestAlly()) < 40 and IsInDistance(ClosestAlly(myHeroPos),500) then
				if CanUseSpell(myHero,_W) == READY then
					CastTargetSpell(ClosestAlly(myHeroPos),_W)
				end
			end
			if myHP <= 30 then
				if CanUseSpell(myHero,_R) == READY then
					CastSpell(_R)
				end
			end
	end
end)

function ClosestAllyTurret(pos)
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

function ClosestAllyMinion(pos)
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

function closestValidAlly(pos)
    local ValidAlly = nil
    for k,v in pairs(GetValidAllys()) do 
        if not ValidAlly and v then ValidAlly = v end
		if ValidAlly and v and GetDistanceSqr(GetOrigin(ValidAlly),pos) > GetDistanceSqr(GetOrigin(v),pos) then --IsObjectAlive(allied) then
			ValidAlly = v
		end
    end
	return ValidAlly
end

function GetValidAllys()
	return validallys
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