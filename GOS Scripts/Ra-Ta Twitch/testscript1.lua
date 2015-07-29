require('Inspired')
require('twgank')

local info = "Ra-Ta Twich Loaded"
local upv = "If you like UpVote!"
local sig = "Made by TheWelder"
local ver = "1.0.0.2 29/07/2015 6:22PM"
textTable = {info,upv,sig,ver} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4])

local myHero = nil
local myHeroPos = nil
local target = nil
local myHeroR = nil
local TargetPos = nil

Config = scriptConfig("twitch", "Ra-Ta-Twitch")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Smart E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("sE", "Spam E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

OnLoop(function(myHero)
		myHero = GetMyHero()
		target = GetCurrentTarget()
		myHeroPos = GetOrigin(myHero)
		local Rdmg = ((GetBaseDamage(myHero)+(GetCastLevel(myHero,_R)*8)+12)/GetAttackSpeed(myHero))*7
		local Edmg = (GetCastLevel(myHero,_E)*15)+5+(GotBuff(GetCurrentTarget(),"twitchdeadlyvenom")*(5+(GetBaseDamage(myHero)/1.25)))
			if "Twitch" == GetObjectName(myHero) then
				DrawText(string.format("RA-TA %s ", GetObjectName(myHero)),24,750,50,0xff00ff00);
				DrawDmgOverHpBar(target,GetCurrentHP(target),120,60,0xffffffff);
					if Config.Combo and IsObjectAlive(target) then
						if ValidTarget(target, 3000) then
							if Config.Q then
								if CanUseSpell(myHero, _Q) == READY then
									CastTargetSpell(myHero,_Q)
								end
							end
						end
						if ValidTarget(target, 950) then
							local WPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,950,55,true,true)
							if Config.W then
								if CanUseSpell(myHero,_W) == READY and WPred.HitChance == 1 then
									CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
								end
							end
						end
						if ValidTarget(target,1200) then
							if Config.E then
								if CalcDamage(myHero, target, Edmg) > GetCurrentHP(target) + GetHPRegen(target) then
									if CanUseSpell(myHero,_E) == READY then
										CastTargetSpell(myHero,_E)
									end
								end
							end

						if Config.sE then
							if GotBuff(GetCurrentTarget(),"twitchdeadlyvenom") == 6 then
								if CanUseSpell(myHero,_E) == READY then
									CastTargetSpell(myHero,_E)
								end
							end
						end
						end	
						if ValidTarget(target,850) then
							if CalcDamage(myHero, target, Rdmg) > GetCurrentHP(target) + GetHPRegen(target) then
								if CanUseSpell(myHero,_R) == READY then
									if Config.R then
										CastTargetSpell(myHero,_R)
									end
								end
							end
						end
					end
			else
				DrawText(string.format("%s not suported", GetObjectName(myHero)),24,750,50,0xffffff00)
			end
end)

