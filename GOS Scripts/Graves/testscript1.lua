-- CONSTANTS
require('Inspired')

local myHero = nil
local myHeroPos = nil
local target = nil
local Graves = nil
local myHeroR = nil
local TargetPos = nil

AddInfo("graves", "Graves:")
AddButton("Q", "Use Q", true)
AddButton("W", "Use W", true)
AddButton("E", "Use E", true)
AddButton("R", "Use R", true)
AddInfo("util", "Utilities")
AddButton("Gank","GankAlert",true)

OnLoop(function(myHero)
		myHero=GetMyHero()
		local champname = GetObjectName(myHero)
		target = GetCurrentTarget()
		targetPos = GetOrigin(target)
		myHeroPos = GetOrigin(myHero)
		if GetButtonValue("Gank") then
			if EnemiesAround(myHeroPos, 5000) > 0 then
				local hero_origin = myHeroPos
				local myscreenpos = WorldToScreen(1,hero_origin.x,hero_origin.y,hero_origin.z)
					if myscreenpos.flag then
						if EnemiesAround(myHeroPos, 5000) < 3 then
						DrawText(string.format("ENEMIES = %s", EnemiesAround(myHeroPos, 5000)),18,myscreenpos.x-100,myscreenpos.y,0xff00ff00)

							else 
							DrawText(string.format("CAREFULL = %s", EnemiesAround(myHeroPos, 5000)),18,myscreenpos.x-100,myscreenpos.y,0xffff0000)
						end
					end
			end		
		end
			if "Graves" == GetObjectName(myHero) then
				--DrawText(string.format("%s by TheWelder Loaded ", GetObjectName(myHero)),24,750,50,0xff00ff00);
				DrawDmgOverHpBar(target,GetCurrentHP(target),120,60,0xffffffff);
					if KeyIsDown(0x20) then
						if ValidTarget(target, 950) then
							local QPred = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target),1875,250,900,55,false,true)
							if GetButtonValue("Q") then
								if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
									CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
									AttackUnit(target)
								end
							end
						end
							if ValidTarget(target, 1000) then
								local WPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1875,250,950,55,false,true)
								if GetButtonValue("W") then
									if CanUseSpell(myHero,_W) == READY and WPred.HitChance == 1 then
										CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
										AttackUnit(target)
									end
								end
						end
								if ValidTarget(target, 1000) then
								local mousePos = GetMousePos()
								if GetButtonValue("E") then
									if CanUseSpell(myHero,_E) == READY then
										CastSkillShot(_E,mousePos.x,mousePos.y,mousePos.z)
										AttackUnit(target)
									end
								end
							end
									if ValidTarget(target, 1000) then
						TargetPos = GetOrigin(target)
						local bonusaddmg = GetBonusDmg(myHero)/2
						local ultipred = GetCastLevel(myHero,_R)*250+(bonusaddmg*3)
						local addmg = ultipred + GetHPRegen(target)
							if GetCurrentHP(target) < CalcDamage(myHero, target, addmg) then
								if GetButtonValue("R") then
									local RPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1875,250,1000,55,false,true)
										CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
										AttackUnit(target)
								end			
							end
						end
					end
				
			else
				DrawText(string.format("%s not suported", GetObjectName(myHero)),24,750,50,0xffffff00)
			end
end)


