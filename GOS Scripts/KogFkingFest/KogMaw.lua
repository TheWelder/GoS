require('Inspired')
require('twgank')
require('IAC')
myIAC = IAC()
local upv = "If you like UpVote!"
local sig = "Made by TheWelder"
local ver = "1.0.0.5 12:23AM 3/08/2015"
local info = "KogFkingMaw Loaded"

textTable = {info,upv,sig,ver} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4]) 

Config = scriptConfig("kogmaw", "KogFkingMaw")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

OnLoop(function(myHero)
local Rrange = GetCastRange(myHero,_R)
local WRange = GetCastRange(myHero,_W)
		local myHero = GetMyHero()
		local target = GetCurrentTarget()
		local myHeroPos = GetOrigin(myHero)
		local ManaPer = GetCurrentMana(myHero)/GetMaxMana(myHero)
			if "KogMaw" == GetObjectName(myHero) then
				DrawText(string.format("KogFkingMaw %s ", GetObjectName(myHero)),24,750,50,0xff00ff00);
				DrawDmgOverHpBar(target,GetCurrentHP(target),120,60,0xffffffff);
					if Config.Combo and IsObjectAlive(target) then
						if ValidTarget(target, 1000) then
							if Config.R then
								local RPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1875,600,1000,55,true,true)
								if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 then
									if ManaPer > 0.40 then
									CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
									else end
								end
							end
						end
						if ValidTarget(target, 600) then
							local WPred = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target),2000,0,600,55,true,true)
							if Config.W then
								if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 then
									CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
								end
							end
						end
						if ValidTarget(target, 1000) then
							local QPred = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target),1875,250,1000,55,true,true)
							if Config.Q then
								if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
									CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
								end
							end
						end
						if ValidTarget(target, 1000) then
							local EPred = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target),1875,250,1000,55,true,true)
							if Config.E then
								if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 then
									CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
								end
							end
						end	
					end
				
			else
				DrawText(string.format("%s not suported", GetObjectName(myHero)),24,750,50,0xffffff00)
			end
end)

