require('Inspired')
require('AFPlugins')
alliedHeroes = {}
finishedAllies = false
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
	if not startTick then startTick = GetTickCount() end
	if not finishedAllies then
		local allyCount = #alliedHeroes
		if GetObjectType(Object) == Obj_AI_Hero and GetTeam(Object) == GetTeam(myHero) then
			if not alliedHeroes[GetNetworkID(Object)] then
				alliedHeroes[GetNetworkID(Object)] = Object
			end
			if startTick + 1000 < GetTickCount() then finishedAllies = true end
		end
	end
local myHero = GetMyHero()
local Obj_Type = GetObjectType(Object)
local myHeroPos = GetOrigin(myHero)
local myHP = GetMaxHP(myHero)/GetCurrentHP(myHero)
	if Obj_Type == Obj_AI_Hero then
		if GetTeam(Object) == GetTeam(myHero) then 
		local Ally = Object
			if IsObjectAlive(Ally) then
				local ClosestAlli = ClosestAlly(myHeroPos)
				local getAlly = GetOrigin(ClosestAlli)
				if GetRange(Ally) > 450 and IsInDistance(Ally,900) then
					local hero_origin = GetOrigin(Ally)
					if GetDistance(Ally,myHero) > 500 then
						MoveToXYZ(hero_origin.x-170,hero_origin.y,hero_origin.z+100)
					end	
				else
					if GetDistance(ClosestAlli,myHero) > 500 then
						MoveToXYZ(getAlly.x-170,getAlly.y,getAlly.z+100)
					end
				end
			end
		end
		
	elseif Obj_Type == Obj_AI_Hero then
		if GetTeam(Object) == GetTeam(myHero) then
		local Ally = Object
			if IsObjectAlive(Ally) and myHP < 30 then
				local hero_origin = GetOrigin(Ally)
				MoveToXYZ(hero_origin.x-170,hero_origin.y,hero_origin.z+100)
			end
		end
		
	elseif Obj_Type == Obj_AI_Hero then
		if GetTeam(Object) ~= GetTeam(myHero) then 
			local Enemy = Object
			if IsObjectAlive(Enemy) and IsInDistance(Enemy,500) then
				AttackUnit(Enemy)
			end
		end
		
	elseif Obj_Type == Obj_AI_Minion then
		if GetTeam(Object) ~= GetTeam(myHero) then
			local minion = Object
			if GetObjectBaseName(minion) ~= "Poo" then
				if IsObjectAlive(minion) and IsInDistance(minion,600) then
					if GetBaseDamage(myHero) > GetCurrentHP(minion) then
						AttackUnit(minion)
					else
						AttackUnit(minion)
					end
				end
			end
		end
		
	elseif Obj_Type == Obj_AI_Turret then
		if GetTeam(Object) ~= GetTeam(myHero) then
			local turret = Object
			if IsObjectAlive(turret) and IsInDistance(turret,600) then
				AttackUnit(turret)
			end
		end
	end
end)

function ClosestAlly(pos)
    local allied = nil
    for k,v in pairs(GetAlliedHeroes()) do 
        if not allied and v then allied = v end
		if allied and v and GetDistanceSqr(GetOrigin(allied),pos) > GetDistanceSqr(GetOrigin(v),pos) and IsObjectAlive(allied) then
			allied = v
		end
    end
    return allied
end

function GetAlliedHeroes()
	return alliedHeroes
end

OnLoop(function(myHero)

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