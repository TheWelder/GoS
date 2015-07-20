-- CONSTANTS
require('Inspired')
local RANGE_Q = 700
local RANGE_W = 900
local RANGE_E = 425
local RANGE_R = 1000


local myHero = nil
local myHeroPos = nil
local target = nil
local Graves = nil
local myHeroR = nil
local TargetPos = nil

function AfterObjectLoopEvent(myHer0)
	myHero = myHer0
	local champname = GetObjectName(myHero)
	target = GetCurrentTarget()
	myHeroPos = GetOrigin(myHero)
	if EnemiesAround(myHeroPos, 5000) > 0 then
		local hero_origin = myHeroPos
		local myscreenpos = WorldToScreen(1,hero_origin.x,hero_origin.y,hero_origin.z)
			if myscreenpos.flag then
				if EnemiesAround(myHeroPos, 5000) > 2 then
				DrawText(string.format("GANK ALERT!!!! = %s", EnemiesAround(myHeroPos, 5000)),24,myscreenpos.x-100,myscreenpos.y,0xffffff00)
				else
				DrawText(string.format("ENEMIES = %s", EnemiesAround(myHeroPos, 5000)),24,myscreenpos.x-100,myscreenpos.y,0xff00ff00)
				end
			end
	end		
		if "Graves" == GetObjectName(myHer0) then
			DrawText(string.format("%s by TheWelder Loaded ", GetObjectName(myHero)),24,750,50,0xff00ff00);
			DrawDmgOverHpBar(target,GetCurrentHP(target),120,60,0xffffffff);
				if KeyIsDown(0x20) then 
					if ValidTarget(target, 700) then
						local QPred = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target),1875,250,700,55,true,true)
						if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
							CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
						end
					end
					if ValidTarget(target, 900) then
						local WPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1875,250,900,55,true,true)
						if CanUseSpell(myHero,_W) == READY and WPred.HitChance == 1 then
							CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
						end
					if ValidTarget(target,1000) then
						local mousePos = GetMousePos()
						if CanUseSpell(myHero,1000) == READY then
							CastSkillShot(_E,mousePos.x,mousePos.y,mousePos.z)
						end
						
					end	
					if ValidTarget(target,1000) then
					TargetPos = GetOrigin(target)
					local GetTheKILL = GetMaxHP(target)/4
					if GetCurrentHP(target) < GetTheKILL then
						local RPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1875,250,1000,55,true,true)
							CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
						end
					end
				end
			end
		else
			DrawText(string.format("%s not suported", GetObjectName(myHero)),24,750,50,0xffffff00)
		end
	
end





	

