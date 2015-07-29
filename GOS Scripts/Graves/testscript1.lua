require('Inspired')
require('twgank')

local info = "StronkGraves Loaded"
local upv = "If you like UpVote!"
local sig = "Made by TheWelder"
local ver = "1.0.0.4"
textTable = {info,upv,sig,ver} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4]) 

Config = scriptConfig("graves", "StronkGraves")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

OnLoop(function(myHero)
		local myHero = GetMyHero()
		local target = GetCurrentTarget()
		local myHeroPos = GetOrigin(myHero)
			if "Graves" == GetObjectName(myHero) then
				DrawText(string.format("LeStronk %s ", GetObjectName(myHero)),24,750,50,0xff00ff00);
				DrawDmgOverHpBar(target,GetCurrentHP(target),120,60,0xffffffff);
					if Config.Combo and IsObjectAlive(target) then
						if ValidTarget(target, 700) then
							local QPred = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target),1875,250,700,55,true,true)
							if Config.Q then
								if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
									CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
								end
							end
						end
						if ValidTarget(target, 900) then
							local WPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1875,250,900,55,true,true)
							if Config.W then
								if CanUseSpell(myHero,_W) == READY and WPred.HitChance == 1 then
									CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
								end
							end
						end
						if ValidTarget(target,1000) then
							local mousePos = GetMousePos()
							if Config.E then
								if CanUseSpell(myHero,_E) == READY then
									CastSkillShot(_E,mousePos.x,mousePos.y,mousePos.z)
								end
							end
						end	
						if ValidTarget(target,1000) then
						local TargetPos = GetOrigin(target)
						local bonusaddmg = GetBonusDmg(myHero)/2
						local ultipred = GetCastLevel(myHero,_R)*250+(bonusaddmg*3)
						local addmg = ultipred + GetHPRegen(target)
						if GetCurrentHP(target) < CalcDamage(myHero, target, addmg) then
							if Config.R then
								local RPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1875,250,1000,55,true,true)
									CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
								end
							end
						end
					end
				
			else
				DrawText(string.format("%s not suported", GetObjectName(myHero)),24,750,50,0xffffff00)
			end
end)

