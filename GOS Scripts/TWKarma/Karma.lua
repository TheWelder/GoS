require('Inspired')
require('IAC')
require('twgank')
myIAC = IAC()
local upv = "If you like UpVote!"
local sig = "Made by TheWelder"
local ver = "1.0.0.5 12:23AM 3/08/2015"
local info = "TWKarma Loaded"
textTable = {info,upv,sig,ver} 
--PrintChat(textTable[1])
--PrintChat(textTable[2])
--PrintChat(textTable[3])
--PrintChat(textTable[4])

Config = scriptConfig("karma", "TWKarma")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

OnLoop(function(myHero)
local myHero = GetMyHero()
local myHeroPos = GetOrigin(myHero)
local QRange = GetCastRange(myHero,_Q)
local WRange = GetCastRange(myHero,_W)
local ERange = GetCastRange(myHero,_E)
local target = GetCurrentTarget()
local myAttackRange = GetRange(myHero)
local tarAttackRange = GetRange(target)
	if "Karma" == GetObjectName(myHero) then
		if Config.Combo then
			if Config.Q then
				if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
					local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,QRange,55,true,true)
					if CanUseSpell(myHero,_Q) == READY and QPred.HitChance == 1 then
						CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						AttackUnit(target)
					end
				end
			end
			if Config.W then
				if ValidTarget(target,WRange) and IsInDistance(myHero,WRange) then
					if CanUseSpell(myHero,_W) == READY then
						CastTargetSpell(target,_W)
						AttackUnit(target)
					end
				end
			end
			if Config.E then
				if ValidTarget(target,myAttackRange) and IsInDistance(myHero,tarAttackRange) then
					if CanUseSpell(myHero,_E) == READY then
						CastSpell(_E)
						AttackUnit(target)
					end
				end
			end
			if Config.R then 
				if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
					if CanUseSpell(myHero,_R) == READY then
						CastSpell(_R)
						AttackUnit(target)
					end
				end
			end
		end
	else
		--DrawText(string.format("%s not suported", GetObjectName(myHero)),24,750,50,0xffffff00)
	end
end)