require('Inspired')
require('twgank')

--ver 1.0.0.1
--api 0.0.4
--Made by TheWelder



local myHero = nil
local myHeroPos = nil
local target = nil
local Graves = nil
local myHeroR = nil
local TargetPos = nil

AddInfo("twitch", "Ra-Ta-Twitch:")
AddButton("Q", "Use Q", true)
AddButton("W", "Use W", true)
AddButton("E", "Smart E", true)
AddButton("sE", "Spam E", false)
AddButton("R", "Use R", true)

OnLoop(function(myHero)
		myHero = GetMyHero()
		target = GetCurrentTarget()
		myHeroPos = GetOrigin(myHero)
			if "Twitch" == GetObjectName(myHero) then
				DrawText(string.format("LeStronk %s ", GetObjectName(myHero)),24,750,50,0xff00ff00);
				DrawDmgOverHpBar(target,GetCurrentHP(target),120,60,0xffffffff);
					if KeyIsDown(0x20) and IsObjectAlive(target) then
						if ValidTarget(target, 3000) then
							if GetButtonValue("Q") then
								if CanUseSpell(myHero, _Q) == READY then
									CastTargetSpell(myHero,_Q)
								end
							end
						end
						if ValidTarget(target, 950) then
							local WPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,950,55,true,true)
							if GetButtonValue("W") then
								if CanUseSpell(myHero,_W) == READY and WPred.HitChance == 1 then
									CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
								end
							end
						end
						if ValidTarget(target,1200) then
							if GetButtonValue("E") then
								local allDMG = GetBonusDmg(myHero)
								local allDMGperc = allDMG/100
								local EdmgCalc = 100+allDMGperc/6
								local Edmg = GotBuff(GetCurrentTarget(),"twitchdeadlyvenom")*EdmgCalc
								if CalcDamage(myHero, target, Edmg) > GetCurrentHP(target) + GetHPRegen(target) then
									if CanUseSpell(myHero,_E) == READY then
										CastTargetSpell(myHero,_E)
									end
								end
							end

						if GetButtonValue("sE") then
							if GotBuff(GetCurrentTarget(),"twitchdeadlyvenom") == 6 then
								if CanUseSpell(myHero,_E) == READY then
									CastTargetSpell(myHero,_E)
								end
							end
						end
						end	
						if ValidTarget(target,850) then
							if CanUseSpell(myHero,_R) == READY then
								if GetButtonValue("R") then
									CastTargetSpell(myHero,_R)
								end
							end
						end
					end
			else
				DrawText(string.format("%s not suported", GetObjectName(myHero)),24,750,50,0xffffff00)
			end
end)

