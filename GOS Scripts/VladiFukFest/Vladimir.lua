require('Inspired')
--require('twgank')
require('IAC')
myIAC = IAC()
local upv = "If you like UpVote!"
local sig = "Made by TheWelder"
local ver = "1.0.0.5 12:23AM 3/08/2015"
local info = "VladiFukFest Loaded"

textTable = {info,upv,sig,ver} 
--PrintChat(textTable[1])
--PrintChat(textTable[2])
--PrintChat(textTable[3])
--PrintChat(textTable[4]) 

Config = scriptConfig("vladimir", "VladiFukFest")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

OnLoop(function(myHero)
		local myHero = GetMyHero()
		local target = GetCurrentTarget()
		local myHeroPos = GetOrigin(myHero)
			if "Vladimir" == GetObjectName(myHero) then
				--DrawText(string.format("VladiFukFest %s", GetObjectName(myHero)),24,750,50,0xff00ff00);
				DrawDmgOverHpBar(target,GetCurrentHP(target),120,60,0xffffffff);
					if Config.Combo and IsObjectAlive(target) then
						if ValidTarget(target, 600) then
							if Config.Q then
								if CanUseSpell(myHero, _Q) == READY then
									CastTargetSpell(target,_Q)
								end
							end
						end
						if ValidTarget(target, 150) then
							if Config.W then
								if CanUseSpell(myHero, _W) == READY then
									CastTargetSpell(myHero,_W)
								end
							end
						end
						if ValidTarget(target, 610) then
							if Config.E then
								if CanUseSpell(myHero, _E) == READY then
									CastTargetSpell(myHero,_E)
								end
							end
						end	
						if ValidTarget(target,700) then
							if Config.R then
								local Rdmg = (GetCastLevel(myHero,_R)*112+56)+(GetBonusAP(myHero)*0.78)
								local RPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1875,250,700,55,true,true)
								if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 then
									if CalcDamage(myHero, target, Rdmg) > GetCurrentHP(target) + GetHPRegen(target)*5 then
										CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
									end
								end
							end
						end
					end
				
			else
				--DrawText(string.format("%s not suported", GetObjectName(myHero)),24,750,50,0xffffff00)
			end
end)
