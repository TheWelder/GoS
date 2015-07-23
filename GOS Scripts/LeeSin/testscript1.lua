require('Inspired')

--ver 1.0.0.0
--api 0.0.4
--Made by TheWelder

local myHero = nil
local champName = nil
local target = nil

--Menu Values
AddInfo("leesin", "LeStar:")
AddButton("Q", "Use Q", true)
--AddButton("W", "Use W", true)
AddButton("E", "Use E", true)
AddButton("R", "Use R", true)
AddInfo("util", "Utilities")
AddButton("Gank","GankAlert",true)

OnLoop(function(myHero)
myHero = GetMyHero()
myHeroPos = GetOrigin(GetMyHero())
champName = GetObjectName(myHero)
target = GetCurrentTarget()
local targetPos = GetOrigin(target)
local Obj_Type = GetObjectType(target)

--local getMinionInsec = ClosestMinion(heroToMinion,MINION_ALLY)
--local heroToMinion = GetDistance(GetOrigin(MINION_ALLY),GetOrigin(myHero))

--Damage Calculations
local allDMG = GetBonusDmg(myHero)+GetBaseDamage(myHero)
local perc90 = (allDMG*90)/100
local Qdmg = (GetCastLevel(myHero,_Q)*30)+50+perc90
local Edmg =(GetCastLevel(myHero,_E)*35)+25+allDMG
local Rdmg = (GetCastLevel(myHero,_R)*200)+(allDMG*2)

	if GetButtonValue("Gank") then
--Enemie Count
		if EnemiesAround(myHeroPos, 5000) > 0 then
			local hero_origin = myHeroPos
			local myscreenpos = WorldToScreen(1,hero_origin.x,hero_origin.y,hero_origin.z)
			if myscreenpos.flag then
				if EnemiesAround(myHeroPos, 5000) < 3 then
				DrawText(string.format("ENEMIES = %s", EnemiesAround(myHeroPos, 5000)),24,myscreenpos.x-100,myscreenpos.y,0xff00ff00)

					else 
					DrawText(string.format("CAREFULL = %s", EnemiesAround(myHeroPos, 5000)),24,myscreenpos.x-100,myscreenpos.y,0xffff0000)
				end
			end
		end	
	end

	--Champion Checker
	if champName == "LeeSin" then
		DrawText(string.format("%s LE STAR", GetObjectName(myHero)),24,750,50,0xff00ff00);
		if KeyIsDown(0x20) then
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
			--if GetButtonValue("W") then
			--local minion = ClosestMinion(myHeroPos,MINION_ALLY)
				--if minion and GetOrigin(minion) then
					--if GetDistance(minion, myHero) <= 700 and CanUseSpell(myHero,_W) == READY then                  
						--CastTargetSpell(minion,_W)
					--end	
				--end
			--end
			if GetButtonValue("E") then
				if ValidTarget(target,350) then
					local FQpred = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target),2000,250,350,50,true,true)
					if CanUseSpell(myHero,_E) == READY then
						CastSkillShot(_E,FQpred.PredPos.x,FQpred.PredPos.y,FQpred.PredPos.z)
						CastSkillShot(GetItemSlot(myHero,3077),FQpred.PredPos.x,FQpred.PredPos.y,FQpred.PredPos.z)
						CastSkillShot(GetItemSlot(myHero,3074),FQpred.PredPos.x,FQpred.PredPos.y,FQpred.PredPos.z)
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