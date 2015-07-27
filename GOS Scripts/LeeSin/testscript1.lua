require('Inspired')
require('twgank')

wardTable = {}
--ver 1.0.0.2, added GetCloserIsnecToMinion
--api 0.0.4
--Made by TheWelder

--ItemGhostWard aka sightstone 2049
--sightward aka ward 2044

Config = scriptConfig("leesin", "LeStar:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

OnLoop(function(myHero)

local myHero = GetMyHero()
local myHeroPos = GetOrigin(myHero)
local champName = GetObjectName(myHero)
local target = GetCurrentTarget()
local targetPos = GetOrigin(target)

local allDMG = GetBonusDmg(myHero)+GetBaseDamage(myHero)
local perc90 = (allDMG*90)/100
local Qdmg = (GetCastLevel(myHero,_Q)*30)+50+perc90
local Edmg =(GetCastLevel(myHero,_E)*35)+25+allDMG
local Rdmg = (GetCastLevel(myHero,_R)*200)+(allDMG*2)

local minion = ClosestMinion(myHeroPos,MINION_ALLY)
local minionPos = GetOrigin(minion)
local hero_origin = myHeroPos
local targetPos = GetOrigin(target)
local myscreenpos = WorldToScreen(1,hero_origin.x,hero_origin.y,hero_origin.z)

--local ward1 = GetItemSlot(myHero,2045),GetItemSlot(myHero,2044),GetItemSlot(myHero,2049),GetItemSlot(myHero,2043)

	if champName == "LeeSin" then
		DrawText(string.format("%s LeStar", GetObjectName(myHero)),24,750,50,0xff00ff00);
		--if KeyIsDown(0x20) and IsObjectAlive(target) then
		if Config.Combo then
			if Config.Q then
				if ValidTarget(target,1000) then
					local FQpred = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target),2000,250,900,50,true,true)
					if CanUseSpell(myHero,_Q) == READY and FQpred.HitChance == 1 then
						CastSkillShot(_Q,FQpred.PredPos.x,FQpred.PredPos.y,FQpred.PredPos.z)
						CastTargetSpell(target,GetItemSlot(myHero,3153))
						CastTargetSpell(target,GetItemSlot(myHero,3144))
					end
				end
			end		
			if Config.E then
				if ValidTarget(target,350) then
					local FQpred = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target),2000,250,350,50,true,true)
					if CanUseSpell(myHero,_E) == READY then
						CastSkillShot(_E,FQpred.PredPos.x,FQpred.PredPos.y,FQpred.PredPos.z)
						CastTargetSpell(target,GetItemSlot(myHero,3077))
						CastTargetSpell(target,GetItemSlot(myHero,3074))
						CastTargetSpell(target,GetItemSlot(myHero,3143))

					end
				end
			end
			if Config.W then
				if IsInDistance(target,1300) and IsObjectAlive(target) then
					if GetDistance(minion,target) < GetDistance(myHero,target) and GetDistance(myHero,target) > 200 then 
						if minion and GetOrigin(minion) then
							if CanUseSpell(myHero,_W) == READY then
								CastTargetSpell(minion,_W)	
							end
						end
					end
					else
					if GetDistance(myHero,target) < 200 then 
						if CanUseSpell(myHero,_W) == READY then
							CastTargetSpell(myHero,_W)	
						end
					end
				end
			end
			if Config.R then
				if ValidTarget(target,375) then
					if CalcDamage(myHero, target, Rdmg) > GetCurrentHP(target) + GetHPRegen(target) then
						if CanUseSpell(myHero,_R) == READY then
							CastTargetSpell(target,_R)
						end
					end
				end
			end
		end
	else
	DrawText(string.format("%s not suported", GetObjectName(myHero)),24,750,50,0xffffff00)
	end
end)

OnProcessSpell(function(target,spell)

	if target and target == myHero and spell then
		if spell.name:lower():find("itemghostward") then
			waitTickCount = GetTickCount() + 13500
		end
	end

end)

--Credits to Inspired

function ClosestMinion(pos, team)
    local minion = nil
    for k,v in pairs(GetAllMinions()) do 
        local objTeam = GetTeam(v)
        if not minion and v and objTeam == team then minion = v end
        if minion and v and objTeam == team and GetDistanceSqr(GetOrigin(minion),pos) > GetDistanceSqr(GetOrigin(v),pos) then
            minion = v
        end
    end
    return minion
end

function GetDistanceSqr(p1,p2)
    p2 = p2 or GetMyHeroPos()
    local dx = p1.x - p2.x
    local dz = (p1.z or p1.y) - (p2.z or p2.y)
    return dx*dx + dz*dz
end

function ClosestAlly(pos, team)
    local minion = nil
    for k,v in pairs(GetAllMinions()) do 
        local objTeam = GetTeam(v)
        if not minion and v and objTeam == team then minion = v end
        if minion and v and objTeam == team and GetDistanceSqr(GetOrigin(minion),pos) > GetDistanceSqr(GetOrigin(v),pos) then
            minion = v
        end
    end
    return minion

function GetWards(team)
  local result = {}
  for _,k in pairs(wardTable) do
    if k then
      if not team or GetTeam(k) == team then
        result[_] = k
      end
    else
      wardTable[_] = nil
    end
  end
  return result
end

