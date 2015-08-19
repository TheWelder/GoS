require('Inspired')
require('twgank')
require('IAC')

myIAC = IAC()
minionTable = {}

local upv = "If you like UpVote!"
local sig = "Made by TheWelder"
local ver = "1.0.0.1 23:10AM 18/08/2015"
local info = "TWAIO Loaded!"
textTable = {info,upv,sig,ver} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4])

Config = scriptConfig("TW", "TheWelderAIO")
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
	if "Elise" == GetObjectName(myHero) then
		if Config.Combo and IsObjectAlive(target) then
			if Config.Q and ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
				if CanUseSpell(myHero,_Q) == READY then
					CastTargetSpell(target,_Q)
				end
			end
			if Config.W and ValidTarget(target,WRange) and IsInDistance(myHero,WRange) then
				local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,WRange,55,true,true)
				if CanUseSpell(myHero,_W) == READY then
					CastSkillShot(_W,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				end
			end
			if Config.E and ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
				local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,ERange,55,true,true)
				if CanUseSpell(myHero,_E) == READY then
					CastSkillShot(_E,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				end
			end
			if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
				if CanUseSpell(myHero,_R) == READY and CanUseSpell(myHero,_Q) == ONCOOLDOWN and CanUseSpell(myHero,_W) == ONCOOLDOWN then
					CastSpell(_R)
				end
			end
		end
	elseif "Graves" == GetObjectName(myHero) then
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
	elseif "Heimerdinger" == GetObjectName(myHero) then
		if Config.Combo then
				if Config.Q and ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
					local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,QRange,55,true,true)
					if CanUseSpell(myHero,_Q) == READY then
						CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
					end
				end
				if Config.W and ValidTarget(target,WRange) and IsInDistance(myHero,WRange) then
					local WPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,WRange,55,true,true)
					if CanUseSpell(myHero,_Q) == READY then
						CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
					end
				end
				if Config.E and ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
					local EPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,ERange,55,true,true)
					if CanUseSpell(myHero,_E) == READY then
						CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
					end
				end
				if Config.R and ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
					if CanUseSpell(myHero,_R) == READY then
						CastSpell(_R)
					end
				end
			end
	elseif "Karma" == GetObjectName(myHero) then
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
	elseif "KogMaw" == GetObjectName(myHero) then
		if Config.Combo and IsObjectAlive(target) then
			if ValidTarget(target, 1000) then
				if Config.R then
					local RPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1875,600,1000,55,true,true)
					if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 then
						if ManaPer > 0.40 then
						CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
						end
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
	elseif "LeeSin" == GetObjectName(myHero) then
	local allDMG = GetBonusDmg(myHero)+GetBaseDamage(myHero)
	local perc90 = (allDMG*90)/100
	local Qdmg = (GetCastLevel(myHero,_Q)*30)+50+perc90
	local Edmg =(GetCastLevel(myHero,_E)*35)+25+allDMG
	local Rdmg = (GetCastLevel(myHero,_R)*200)+(allDMG*2)
	local minionPos = GetOrigin(minion)
	local hero_origin = myHeroPos
	local targetPos = GetOrigin(target)
			if Config.Combo and IsObjectAlive(target) then
				if Config.Q then
					if ValidTarget(target,1000) then
						local FQpred = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target),2000,250,900,50,true,true)
						if CanUseSpell(myHero,_Q) == READY and FQpred.HitChance == 1 then
							CastSkillShot(_Q,FQpred.PredPos.x,FQpred.PredPos.y,FQpred.PredPos.z)
							CastTargetSpell(target,GetItemSlot(myHero,3153))
							CastTargetSpell(target,GetItemSlot(myHero,3144))
						else end
					end
				end		
				if Config.E then
					if ValidTarget(target,350) then
						local FQpred = GetPredictionForPlayer(myHero,target,GetMoveSpeed(target),2000,250,350,50,true,true)
						if CanUseSpell(myHero,_E) == READY then
							CastSkillShot(_E,FQpred.PredPos.x,FQpred.PredPos.y,FQpred.PredPos.z)
							CastTargetSpell(target,GetItemSlot(myHero,3077))
							CastTargetSpell(target,GetItemSlot(myHero,3074))
							CastTargetSpell(target,GetItemSlot(myHero,3143))
						else end
					end
				end
				if Config.W then
					if IsInDistance(target,1300) and IsObjectAlive(target) then
						local minion = XlosestMinion(myHeroPos,MINION_ALLY)
						if minion and GetOrigin(minion) ~= nil then
							if GetDistance(minion,target) < GetDistance(myHero,target) and GetDistance(myHero,target) > 200 then 
								if CanUseSpell(myHero,_W) == READY then
									CastTargetSpell(minion,_W)	
								end
							end
						end
						else
						if GetDistance(myHero,target) < 200 then 
							if CanUseSpell(myHero,_W) == READY then
								CastTargetSpell(myHero,_W)	
							end
						end
					end
				end
				if Config.R then
					if ValidTarget(target,375) then
						if CalcDamage(myHero, target, Rdmg) > GetCurrentHP(target) + GetHPRegen(target) then
							if CanUseSpell(myHero,_R) == READY then
								CastTargetSpell(target,_R)
							end
						end
					end
				end
			end
	elseif "Nautilus" == GetObjectName(myHero) then
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
	elseif "Sion" == GetObjectName(myHero) then
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
	elseif "Twitch" == GetObjectName(myHero) then
	local Rspeed = 7*GetAttackSpeed(myHero)
	local Rdmg = ((GetBaseDamage(myHero)+(GetCastLevel(myHero,_R)*8)+12))*Rspeed
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
					local Edmg = (GetCastLevel(myHero,_E)*10)+5+(GotBuff(GetCurrentTarget(),"twitchdeadlyvenom")*(5+(GetBaseDamage(myHero)*(GotBuff(GetCurrentTarget(),"twitchdeadlyvenom")*0.20))))
					if CalcDamage(myHero, target, Edmg) > GetCurrentHP(target) + GetHPRegen(target) then
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
		if GotBuff(GetCurrentTarget(),"twitchdeadlyvenom") == 6 then
			if CanUseSpell(myHero,_E) == READY then
				CastTargetSpell(myHero,_E)
			end
		end
	elseif "Vladimir" == GetObjectName(myHero) then
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
	elseif "Zilean" == GetObjectName(myHero) then
		if Config.Combo and IsObjectAlive(target) then
			if Config.Q and ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
				local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,QRange,55,true,true)
				if CanUseSpell(myHero,_Q) == READY then
					CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				end
			end
			if Config.W and ValidTarget(target,myAttackRange) and IsInDistance(myHero,myAttackRange) then
				if CanUseSpell(myHero,_Q) == ONCOOLDOWN or CanUseSpell(myHero,_E) == ONCOOLDOWN then
					if CanUseSpell(myHero,_W) == READY then
						CastSpell(_W)
					end
				end
			end
			if Config.E and ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
				if CanUseSpell(myHero,_E) == READY then
					CastSpell(_E)
				end
			end
			if Config.R then
				if GetCurrentHP(myHero)*100/GetMaxHP(myHero) < 20 then 
					if CanUseSpell(myHero,_R) == READY then
						CastTargetSpell(myHero,_R)
					end
				end
			end
		end
	elseif GetObjectName(myHero) == "Anivia" then
		if Config.Combo and IsObjectAlive(target) then
			if Config.Q and ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
				local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,QRange,55,true,true)
				if CanUseSpell(myHero,_Q) == READY then
					CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				end
			end
			if Config.W and ValidTarget(target,WRange) and IsInDistance(myHero,WRange) then
				local WPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,WRange,55,true,true)
				if CanUseSpell(myHero,_Q) == READY then
					CastSkillShot(_Q,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
				end
			end
			if Config.E and ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
				if CanUseSpell(myHero,_E) == READY then
					CastTargetSpell(_E)
				end
			end
			if Config.R and ValidTarget(target,RRange) and IsInDistance(myHero,RRange) then
				local RPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,RRange,55,true,true)
				if CanUseSpell(myHero,_R) == READY then
					CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
				end
			end
		end
	elseif GetObjectName(myHero) == "MasterYi" then
	local baseAS = GetAttackSpeed(myHero)
	local baseDMG = GetBaseDamage(myHero)
	local RskillAS = 0.65 * (GetAttackSpeed(myHero) + 0.65 * ((GetCastLevel(myHero,_R)*0.25)+0.05))
	local Rdmg = (10*RskillAS)*baseDMG 
		if Config.Combo and IsObjectAlive(target) then
			if Config.Q and ValidTarget(target, QRange) then
				if CanUseSpell(myHero, _Q) == READY then
					CastTargetSpell(myHero,_Q)
				end
			end
			if Config.W and GetCurrentHP(myHero)/GetMaxHP(myHero) < 20 then 
				if CanUseSpell(myHero,_W) == READY then
					CastSpell(_W)
				end
			end
			if Config.E and ValidTarget(target,myAttackRange) then
				if CanUseSpell(myHero,_E) == READY then
					CastTargetSpell(myHero,_E)
				end
			end	
			if Config.R and ValidTarget(target,myAttackRange) then
				if CalcDamage(myHero, target, Rdmg) > GetCurrentHP(target) + GetHPRegen(target) then
					if CanUseSpell(myHero,_R) == READY and CanUseSpell(myHero,_E) == READY then
						CastSpell(_R)
					end
				end
			end
		end
	elseif "Fizz" == GetObjectName(myHero) then
		if Config.Combo and IsObjectAlive(target) then
			if Config.Q and ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
				local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,ERange,55,true,true)
				if CanUseSpell(myHero,_E) == READY then
					CastSkillShot(_E,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				end
			end
			if Config.W and ValidTarget(target,myAttackRange) and IsInDistance(myHero,myAttackRange) then
				if CanUseSpell(myHero,_W) == READY then
					CastSpell(_W)
				end
			end
			if Config.E and ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
				if CanUseSpell(myHero,_Q) == READY then
					CastTargetSpell(target,_Q)
				end
			end
			if Config.R and ValidTarget(target,RRange) and IsInDistance(myHero,RRange) then
				local RPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,RRange,55,true,true)
				if CanUseSpell(myHero,_R) == READY then
					CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
				end
			end
		end
	elseif "Annie" == GetObjectName(myHero) then
		if Config.Combo and IsObjectAlive(target) then
			if Config.Q and ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
				if CanUseSpell(myHero,_Q) == READY then
					CastTargetSpell(target,_Q)
				end
			end
			if Config.W and ValidTarget(target,WRange) and IsInDistance(myHero,WRange) then
			local WPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,WRange,55,true,true)
				if CanUseSpell(myHero,_W) == READY then
					CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
				end
			end
			if Config.R and ValidTarget(target,RRange) and IsInDistance(myHero,RRange) then
				local RPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,RRange,55,true,true)
				if CanUseSpell(myHero,_R) == READY then
					CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
				end
			end
		end
		if Config.E then
			if CanUseSpell(myHero,_E) == READY and GotBuff(myHero,"pyromania") ~= 0 then
				CastSpell(_E)
			end
		end
	else
	DrawText(string.format("%s not suported", GetObjectName(myHero)),24,750,50,0xffffff00)
	end
end)

function XlosestMinion(pos, team)
    local minion = nil
    for k,v in pairs(GetAllMinions()) do 
        local objTeam = GetTeam(v)
        if not minion and v and objTeam == team then minion = v end
        if minion and v and objTeam == team and GetDistanceSqr(GetOrigin(minion),pos) > GetDistanceSqr(GetOrigin(v),pos) then
            minion = v
        end
    end
    return minion
end

function GetAllMinions(team)
  local result = {}
  for _,k in pairs(minionTable) do
    if k and not IsDead(k) then
      if not team or GetTeam(k) == team then
        result[_] = k
      end
    else
      minionTable[_] = nil
    end
  end
  return result
end