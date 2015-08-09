require('Inspired')
require('IAC')
require('twgank')
myIAC = IAC()
Config = scriptConfig("nautilus", "TWNautilus")
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
	if "Nautilus" == GetObjectName(myHero) then
		if Config.Combo and IsObjectAlive(target) then
			if Config.Q and ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
				local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,QRange,55,true,true)
				if CanUseSpell(myHero,_Q) == READY then
					CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
					AttackUnit(target)
				end
			end
			if Config.W and ValidTarget(target,myAttackRange) and IsInDistance(myHero,myAttackRange) then
				if CanUseSpell(myHero,_W) == READY then
					CastSpell(_W)
					AttackUnit(target)
				end
			end
			if Config.E and ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
				if CanUseSpell(myHero,_E) == READY then
					CastSpell(_E)
					AttackUnit(target)
				end
			end
			if Config.R and ValidTarget(target,RRange) and IsInDistance(myHero,RRange) then
				if CanUseSpell(myHero,_R) == READY then
					CastTargetSpell(target,_R)
				end
			end
		end	
	end

end)