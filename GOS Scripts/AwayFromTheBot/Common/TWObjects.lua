require('Inspired')
alliedHeroes = {}
enemyHeroes = {}
alliedTurrets = {}
enemyTurrets = {}
alliedMinions = {}
enemyMinions = {}
spawnPoints = {}
local upv = "If you like UpVote!"
local sig = "Made by TheWelder"
local ver = "1.0.0.5 1:08AM 6/08/2015"
local info = "AFBot Loaded"
textTable = {info,upv,sig,ver} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4])


OnObjectLoop(function(Object,myHero)
local TurrStart 
local myHero = GetMyHero()
local Obj_Type = GetObjectType(Object)
local myHeroPos = GetOrigin(myHero)
	if GetObjectType(Object) == Obj_AI_Hero and GetTeam(Object) == GetTeam(myHero) then
		alliedHeroes[GetNetworkID(Object)] = Object
	end
	if GetObjectType(Object) == Obj_AI_Hero and GetTeam(Object) ~= GetTeam(myHero) then
		enemyHeroes[GetNetworkID(Object)] = Object
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
	if GetObjectType(Object) == Obj_AI_Barracks and GetTeam(Object) == GetTeam(myHero) then
		spawnPoints[GetNetworkID(Object)] = Object
	end
end)


function closestAllyHero(pos)
    local allied = nil
    for k,v in pairs(GetAlliedHeroes()) do 
        if not allied and v then allied = v end
		if allied and v and GetDistanceSqr(GetOrigin(allied),pos) > GetDistanceSqr(GetOrigin(v),pos) then --IsObjectAlive(allied) then
			allied = v
		end
    end
	return allied
end

function closestEnemyHero(pos)
    local enemy = nil
    for k,v in pairs(GetEnemyHeroes()) do 
        if not enemy and v then enemy = v end
		if enemy and v and GetDistanceSqr(GetOrigin(enemy),pos) > GetDistanceSqr(GetOrigin(v),pos) then --IsObjectAlive(allied) then
			enemy = v
		end
    end
	return enemy
end

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

function closestSpawnPoint(pos)
    local spawnPoint = nil
    for k,v in pairs(GetEnemyMinions()) do 
        if not spawnPoint and v then spawnPoint = v end
		if spawnPoint and v and GetDistanceSqr(GetOrigin(spawnPoint),pos) > GetDistanceSqr(GetOrigin(v),pos) then --IsObjectAlive(allied) then
			spawnPoint = v
		end
    end
	return spawnPoint
end

function GetAlliedHeroes()
	return alliedHeroes
end

function GetEnemyHeroes()
	return enemyHeroes
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

function GetSpawnPoints()
	return spawnPoints
end

