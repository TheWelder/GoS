require('Inspired')
require('twgank')

--ver 1.0.0.2, added GetCloserIsnecToMinion
--api 0.0.4
--Made by TheWelder

--ItemGhostWard aka sightstone 2049
--sightward aka ward 2044

local myHero = nil
local champName = nil
local target = nil

AddInfo("leesin", "LeStar:")
AddButton("Q", "Use Q", true)
AddButton("W", "Use W", true)
AddButton("E", "Use E", true)
AddButton("R", "Use R", true)

OnLoop(function(myHero)
myHero = GetMyHero()
myHeroPos = GetOrigin(GetMyHero())
champName = GetObjectName(myHero)
target = GetCurrentTarget()

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

local ward1 = GetItemSlot(myHero,2045),GetItemSlot(myHero,2044),GetItemSlot(myHero,2049),GetItemSlot(myHero,2043)

	if champName == "LeeSin" then
		DrawText(string.format("%s LeStar", GetObjectName(myHero)),24,750,50,0xff00ff00);
		if KeyIsDown(0x20) and IsObjectAlive(target) then
			if GetButtonValue("Q") then
				if ValidTarget(target,1000) then
					local FQpred = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target),2000,250,900,50,true,true)
					if CanUseSpell(myHero,_Q) == READY and FQpred.HitChance == 1 then
						CastSkillShot(_Q,FQpred.PredPos.x,FQpred.PredPos.y,FQpred.PredPos.z)
						CastTargetSpell(target,GetItemSlot(myHero,3153))
						CastTargetSpell(target,GetItemSlot(myHero,3144))
					end
				end
			end		
			if GetButtonValue("E") then
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
			if GetButtonValue("W") then
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
			if GetButtonValue("R") then
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
