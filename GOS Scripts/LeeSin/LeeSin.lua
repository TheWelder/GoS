require('Inspired')
require('IAC')
require('WardJump')
myIAC = IAC()
local upv = "If you like UpVote!"
local sig = "Made by TheWelder"
local ver = "1.0.0.5 12:23AM 3/08/2015"
minionTable = {}
--wardTable = {}
local info = "LeStar LeeSin"
--textTable = {info,upv,sig,ver} 
--PrintChat(textTable[1])
--PrintChat(textTable[2])
--PrintChat(textTable[3])
--PrintChat(textTable[4])

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

local minionPos = GetOrigin(minion)
local hero_origin = myHeroPos
local targetPos = GetOrigin(target)

--local ward1 = GetItemSlot(myHero,2045),GetItemSlot(myHero,2044),GetItemSlot(myHero,2049),GetItemSlot(myHero,2043)

	if champName == "LeeSin" then
		--DrawText(string.format("%s LeStar", GetObjectName(myHero)),24,750,50,0xff00ff00);
		--if KeyIsDown(0x20) and IsObjectAlive(target) then
		if Config.Combo and IsObjectAlive(target) then
			if Config.Q then
				if ValidTarget(target,1000) then
					local FQpred = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target),2000,250,900,50,true,true)
					if CanUseSpell(myHero,_Q) == READY and FQpred.HitChance == 1 then
						CastSkillShot(_Q,FQpred.PredPos.x,FQpred.PredPos.y,FQpred.PredPos.z)
						CastTargetSpell(target,GetItemSlot(myHero,3153))
						CastTargetSpell(target,GetItemSlot(myHero,3144))
					else end
				end
			end		
			if Config.E then
				if ValidTarget(target,350) then
					local FQpred = GetPredictionForPlayer(myHero,target,GetMoveSpeed(target),2000,250,350,50,true,true)
					if CanUseSpell(myHero,_E) == READY then
						CastSkillShot(_E,FQpred.PredPos.x,FQpred.PredPos.y,FQpred.PredPos.z)
						CastTargetSpell(target,GetItemSlot(myHero,3077))
						CastTargetSpell(target,GetItemSlot(myHero,3074))
						CastTargetSpell(target,GetItemSlot(myHero,3143))
					else end
				end
			end
			if Config.W then
				if IsInDistance(target,1300) and IsObjectAlive(target) then
					--if GetDistance(minion,target) < GetDistance(myHero,target) and GetDistance(myHero,target) > 200 then 
					local minion = XlosestMinion(myHeroPos,MINION_ALLY)
					if minion and GetOrigin(minion) ~= nil then
						if GetDistance(minion,target) < GetDistance(myHero,target) and GetDistance(myHero,target) > 200 then 
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
	--DrawText(string.format("%s not suported", GetObjectName(myHero)),24,750,50,0xffffff00)
	end
end)

--[[OnProcessSpell(function(target,spell)

	if target and target == myHero and spell then
		if spell.name:lower():find("itemghostward") then
			waitTickCount = GetTickCount() + 13500
		end
	end

end)]]

--Credits to Inspired

function XlosestMinion(pos, team)
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

function GetAllMinions(team)
  local result = {}
  for _,k in pairs(minionTable) do
    if k and not IsDead(k) then
      if not team or GetTeam(k) == team then
        result[_] = k
      end
    else
      minionTable[_] = nil
    end
  end
  return result
end

