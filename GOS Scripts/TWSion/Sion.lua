require('Inspired')
require('IAC')
require('twgank')
myIAC = IAC()
Config = scriptConfig("sion", "TWSion")
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
local RRange = GetCastRange(myHero,_E)
local target = GetCurrentTarget()
local targetPos = GetOrigin(target)
local myAttackRange = GetRange(myHero)
local tarAttackRange = GetRange(target)
	if "Sion" == GetObjectName(myHero) then
		if Config.Combo and IsObjectAlive(target) then
			if Config.Q and ValidTarget(target,600) and IsInDistance(myHero,600) then
				local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,600,55,true,true)
				if CanUseSpell(myHero,_Q) == READY then--and GotBuff(target,"sioneslow") > 0 then
					CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				end
					local p1, nextTick = GetOrigin(target), GetTickCount()
					if GetTickCount() > nextTick + 1000 and p1.x == GetOrigin(target).x then
					PrintChat(string.format("<font color='#1244EA'>[CloudAIO]</font> <font color='#FFFFFF'>Gnar Loaded</font>"))
						CastSkillShot2(_Q)
				end
			end
			if Config.W and ValidTarget(target,WRange) and IsInDistance(myHero,WRange) then
				if CanUseSpell(myHero,_W) == READY then
					CastSpell(_W)
				end
			end
			if Config.E and ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
				local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,ERange,55,true,true)
				if CanUseSpell(myHero,_E) == READY then
					CastSkillShot(_E,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				end
			end
			if Config.R and ValidTarget(target,1000) then
				local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,1000,55,true,true)
				if CanUseSpell(myHero,_R) == READY then--and GotBuff(target,"sioneslow") > 0 then
					MoveToXYZ(targetPos.x,targetPos.z,targetPos.y)
					CastSkillShot(_R,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				end
			end
		end
	end

end)