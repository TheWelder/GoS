require('Inspired')

local upv = "If you like UpVote!"
local sig = "Made by TheWelder"
local ver = "1.0.0.5 12:23AM 3/08/2015"
local info = "KarmaPlugin Loaded"
--textTable = {info,upv,sig,ver} 
--PrintChat(textTable[1])
--PrintChat(textTable[2])
--PrintChat(textTable[3])
--PrintChat(textTable[4])

OnLoop(function(Object,myHero)
local myHero = GetMyHero()
local myHeroPos = GetOrigin(myHero)
local QRange = GetCastRange(myHero,_Q)
local WRange = GetCastRange(myHero,_W)
local ERange = GetCastRange(myHero,_E)
local RRange = GetCastRange(myHero,_R)
local target = GetCurrentTarget()
local myAttackRange = GetRange(myHero)
local tarAttackRange = GetRange(target)
local Obj_Type = GetObjectType(Object)
	if "Karma" == GetObjectName(myHero) then
		if ValidTarget(target,QRange) and IsInDistance(target,QRange) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,QRange,55,true,true)
			if CanUseSpell(myHero,_Q) == READY then
				CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,WRange) then
			if CanUseSpell(myHero,_W) == READY then
				CastSpell(_W)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,myAttackRange) then
			if CanUseSpell(myHero,_E) == READY then
				CastTargetSpell(target,_E)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,QRange) then
			if CanUseSpell(myHero,_R) == READY then
				CastSpell(_R)
				AttackUnit(target)
			end
		end
	
	
	
			if GetItemSlot(myHero,2003) == 0 or GetItemSlot(myHero,2003) < 3 then
					BuyItem(2003)
			end
		------------------------------------------------------------------------- Sorcerer's Shoes Sequence
			-- Boots of Speed
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
					BuyItem(1001)
				end
			end
			-- Sorcerer's Shoes
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				BuyItem(3020)
			end
		------------------------------------------------------------------------- Liandry's Torment Sequence
			--Ruby Crystal
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1028) == 0 or GetItemSlot(myHero,1028) < 1 then
						BuyItem(1028)
					end
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Blasting Wand
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,1026) == 0 or GetItemSlot(myHero,1026) < 1 then
					BuyItem(1026)
				end
			end
			--Liandry's Torment
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				BuyItem(3151)
			end
		------------------------------------------------------------------------- Athene's Unholy Grail Sequence
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3028) == 0 or GetItemSlot(myHero,3028) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Null-Magic Mantle
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1033) == 0 or GetItemSlot(myHero,1033) < 1 then
					BuyItem(1033)
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Athene's Unholy Grail
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				BuyItem(2700)
			end
		------------------------------------------------------------------------- Morellonomicon Sequence

			--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Forbidden Idol
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					BuyItem(3114)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Morellonomicon
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				BuyItem(3165)
			end
			------------------------------------------------------------------------- Twin Shadows Sequence
			
			--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
						BuyItem(1052)
					end
				end
			end
			-- Aether Wisp
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
					BuyItem(3113)
				end
			end
			-- Twin Shadows
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				BuyItem(3023)
			end
	end
	if "Shen" == GetObjectName(myHero) then
		if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
			if CanUseSpell(myHero,_Q) == READY then
				CastTargetSpell(target,_Q)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,WRange) and IsInDistance(myHero,WRange) then
			if CanUseSpell(myHero,_W) == READY then
				CastSpell(_W)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,ERange,55,true,true)
			if CanUseSpell(myHero,_E) == READY then
				CastSkillShot(_E,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
			if CanUseSpell(myHero,_R) == READY then
				CastSpell(_R)
				AttackUnit(target)
			end
		end
	if GetItemSlot(myHero,3047) == 0 or GetItemSlot(myHero,3047) < 1 then
		if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
			BuyItem(1001)
		end
	end
	if GetItemSlot(myHero,1001) == 1 or GetItemSlot(myHero,1001) > 1 then
		if GetItemSlot(myHero,3047) == 0 or GetItemSlot(myHero,3047) < 1 then
			BuyItem(3047)
		end
	end
	if GetItemSlot(myHero,3143) == 0 or GetItemSlot(myHero,3143) < 1 then
		BuyItem(3143)
	end
	if GetItemSlot(myHero,3068) == 0 or GetItemSlot(myHero,3068) < 1 then
		BuyItem(3068)
	end
	if GetItemSlot(myHero,3065) == 0 or GetItemSlot(myHero,3065) < 1 then
		BuyItem(3065)
	end
	if GetItemSlot(myHero,3091) == 0 or GetItemSlot(myHero,3091) < 1 then
		BuyItem(3091)
	end
		
	end
	if "Twitch" == GetObjectName(myHero) then
			local Rspeed = 7*GetAttackSpeed(myHero)
			local Rdmg = ((GetBaseDamage(myHero)+(GetCastLevel(myHero,_R)*8)+12))*Rspeed
				--DrawText(string.format("RA-TA %s ", GetObjectName(myHero)),24,750,50,0xff00ff00);
				DrawDmgOverHpBar(target,GetCurrentHP(target),120,60,0xffffffff);
					--if Config.Combo and IsObjectAlive(target) then
						if ValidTarget(target, 3000) then
							--if Config.Q then
								if CanUseSpell(myHero, _Q) == READY then
									CastTargetSpell(myHero,_Q)
								end
							--end
						end
						if ValidTarget(target, 950) then
							local WPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,950,55,true,true)
							--if Config.W then
								if CanUseSpell(myHero,_W) == READY and WPred.HitChance == 1 then
									CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
								end
							--end
						end
						if ValidTarget(target,1200) then
							--if Config.E then
								local Edmg = (GetCastLevel(myHero,_E)*10)+5+(GotBuff(GetCurrentTarget(),"twitchdeadlyvenom")*(5+(GetBaseDamage(myHero)*(GotBuff(GetCurrentTarget(),"twitchdeadlyvenom")*0.20))))
								if CalcDamage(myHero, target, Edmg) > GetCurrentHP(target) + GetHPRegen(target) then
									if CanUseSpell(myHero,_E) == READY then
										CastTargetSpell(myHero,_E)
									end
								end
							--end

						--if Config.sE then
							if GotBuff(GetCurrentTarget(),"twitchdeadlyvenom") == 6 then
								if CanUseSpell(myHero,_E) == READY then
									CastTargetSpell(myHero,_E)
								end
							end
						--end
						end	
						if ValidTarget(target,850) then
							if CalcDamage(myHero, target, Rdmg) > GetCurrentHP(target) + GetHPRegen(target) then
								if CanUseSpell(myHero,_R) == READY then
									--if Config.R then
										CastTargetSpell(myHero,_R)
									--end
								end
							end
						end
					--end
			if GetItemSlot(myHero,3006) == 0 or GetItemSlot(myHero,3006) < 1 then
				if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
					BuyItem(1001)
				end
			end
			if GetItemSlot(myHero,1001) == 1 or GetItemSlot(myHero,1001) > 1 then
				if GetItemSlot(myHero,3006) == 0 or GetItemSlot(myHero,3006) < 1 then
				BuyItem(3006)
				end
			end
			if GetItemSlot(myHero,2003) == 0 or GetItemSlot(myHero,2003) < 3 then
					BuyItem(2003)
			end
			if GetItemSlot(myHero,3031) == 0 or GetItemSlot(myHero,3031) < 1 then
				BuyItem(3031)
			end
			if GetItemSlot(myHero,3153) == 0 or GetItemSlot(myHero,3153) < 1 then
				BuyItem(3153)
			end
			if GetItemSlot(myHero,3035) == 0 or GetItemSlot(myHero,3035) < 1 then
				BuyItem(3035)
			end
			if GetItemSlot(myHero,3046) == 0 or GetItemSlot(myHero,3046) < 1 then
				BuyItem(3046)
			end
		end
	if "Blitzcrank" == GetObjectName(myHero) then
		local target = GetTarget(900, DAMAGE_MAGIC)
		if ValidTarget(target, 900) then
			local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1800,250,900,70,true,true)
			if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and ValidTarget(target, GetCastRange(myHero,_Q)) and Config.Q then
				CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
			end
			  
			if CanUseSpell(myHero, _W) == READY and not IsInDistance(target, 150) and IsInDistance(target, 700) and Config.W then
				CastSpell(_W)
			end

			if CanUseSpell(myHero, _E) == READY and ValidTarget(target, 250) and IsInDistance(target, 250) and Config.E then
			CastSpell(_E)
			end
		  
			if CanUseSpell(myHero, _R) == READY and ValidTarget(target, GetCastRange(myHero,_R)) and IsInDistance(target, 550) and Config.R then
				CastSpell(_R)
			end
					  
		end
		
		if GetItemSlot(myHero,2003) == 0 or GetItemSlot(myHero,2003) < 3 then
			BuyItem(2003)
		end
		------------------------------------------------------------------------- Sorcerer's Shoes Sequence
		-- Boots of Speed
		if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
			if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
				BuyItem(1001)
			end
		end
		-- Sorcerer's Shoes
		if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
			BuyItem(3020)
		end
	------------------------------------------------------------------------- Liandry's Torment Sequence
		--Ruby Crystal
		if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
			if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
				if GetItemSlot(myHero,1028) == 0 or GetItemSlot(myHero,1028) < 1 then
					BuyItem(1028)
				end
			end
		end
		--Amplifying Tome
		if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
			if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
		end
		--Blasting Wand
		if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
			if GetItemSlot(myHero,1026) == 0 or GetItemSlot(myHero,1026) < 1 then
				BuyItem(1026)
			end
		end
		--Liandry's Torment
		if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
			BuyItem(3151)
		end
	------------------------------------------------------------------------- Athene's Unholy Grail Sequence
		--Amplifying Tome
		if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
			if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(1052)
				end
			end
		end
		--Fiendish Codex
		if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
			if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
				BuyItem(3108)
			end
		end
		-- Faerie Charm
		if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
			if GetItemSlot(myHero,3028) == 0 or GetItemSlot(myHero,3028) < 1 then
				if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
					BuyItem(1004)
				end
			end
		end
		-- Null-Magic Mantle
		if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
			if GetItemSlot(myHero,1033) == 0 or GetItemSlot(myHero,1033) < 1 then
				BuyItem(1033)
			end
		end
		--Amplifying Tome
		if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
			if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
				BuyItem(1052)
			end
		end
		-- Athene's Unholy Grail
		if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
			BuyItem(2700)
		end
	------------------------------------------------------------------------- Morellonomicon Sequence

		--Amplifying Tome
		if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
			if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(1052)
				end
			end
		end
		--Fiendish Codex
		if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
			if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
				BuyItem(3108)
			end
		end
		-- Faerie Charm
		if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
			if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
				if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
					BuyItem(1004)
				end
			end
		end
		-- Forbidden Idol
		if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
			if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
				BuyItem(3114)
			end
		end
			--Amplifying Tome
		if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
			if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
				BuyItem(1052)
			end
		end
		-- Morellonomicon
		if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
			BuyItem(3165)
		end
		------------------------------------------------------------------------- Twin Shadows Sequence
		
		--Amplifying Tome
		if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
			if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(1052)
				end
			end
		end
		--Fiendish Codex
		if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
			if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
				BuyItem(3108)
			end
		end
			--Amplifying Tome
		if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
			if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
				if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
					BuyItem(1052)
				end
			end
		end
		-- Aether Wisp
		if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
			if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
				BuyItem(3113)
			end
		end
		-- Twin Shadows
		if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
			BuyItem(3023)
		end
		
			
			
		if GetLevel(myHero) == 1 then
			LevelSpell(_Q)
		end
		if GetLevel(myHero) == 2 then
			LevelSpell(_W)
		end
		if GetLevel(myHero) == 3 then
			LevelSpell(_Q)
		end
		 
		if GetLevel(myHero) == 4 then
			LevelSpell(_E)
		end
		 if GetLevel(myHero) == 5 then
			LevelSpell(_W)
		end
		 if GetLevel(myHero) == 6 then
			LevelSpell(_R)
		end
		 if GetLevel(myHero) == 7 then
			LevelSpell(_Q)
		end
		 if GetLevel(myHero) == 8 then
			LevelSpell(_W)
		end
		 if GetLevel(myHero) == 9 then
			LevelSpell(_Q)
		end
		 if GetLevel(myHero) == 10 then
			LevelSpell(_E)
		end
		 if GetLevel(myHero) == 11 then
			LevelSpell(_R)
		end
		 if GetLevel(myHero) == 12 then
			LevelSpell(_Q)
		end
		 if GetLevel(myHero) == 13 then
			LevelSpell(_W)
		end
		 if GetLevel(myHero) == 14 then
			LevelSpell(_E)
		end
		 if GetLevel(myHero) == 15 then
			LevelSpell(_W)
		end
		 if GetLevel(myHero) == 16 then
			LevelSpell(_R)
		end
		 if GetLevel(myHero) == 17 then
			LevelSpell(_E)
		end
		 if GetLevel(myHero) == 18 then
			LevelSpell(_E)
		end
	end
	if "MasterYi" == GetObjectName(myHero) then
						if ValidTarget(target, QRange) then
								if CanUseSpell(myHero, _Q) == READY then
									CastTargetSpell(myHero,_Q)
								end
						end
								if CanUseSpell(myHero,_W) == READY then
									CastSpell(_W)
								end
						if ValidTarget(target,myAttackRange) then
									if CanUseSpell(myHero,_E) == READY then
										CastTargetSpell(myHero,_E)
									end
						end	
						if ValidTarget(target,QRange) then
								if CanUseSpell(myHero,_R) == READY then
										CastSpell(_R)
								end
						end
			if GetItemSlot(myHero,3006) == 0 or GetItemSlot(myHero,3006) < 1 then
				if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
					BuyItem(1001)
				end
			end
			if GetItemSlot(myHero,1001) == 1 or GetItemSlot(myHero,1001) > 1 then
				if GetItemSlot(myHero,3006) == 0 or GetItemSlot(myHero,3006) < 1 then
				BuyItem(3006)
				end
			end
			if GetItemSlot(myHero,2003) == 0 or GetItemSlot(myHero,2003) < 3 then
					BuyItem(2003)
			end
			if GetItemSlot(myHero,3031) == 0 or GetItemSlot(myHero,3031) < 1 then
				BuyItem(3031)
			end
			if GetItemSlot(myHero,3153) == 0 or GetItemSlot(myHero,3153) < 1 then
				BuyItem(3153)
			end
			if GetItemSlot(myHero,3035) == 0 or GetItemSlot(myHero,3035) < 1 then
				BuyItem(3035)
			end
			if GetItemSlot(myHero,3046) == 0 or GetItemSlot(myHero,3046) < 1 then
				BuyItem(3046)
			end
		end
	if "LeeSin" == GetObjectName(myHero) then
	local allDMG = GetBonusDmg(myHero)+GetBaseDamage(myHero)
	local perc90 = (allDMG*90)/100
	local Qdmg = (GetCastLevel(myHero,_Q)*30)+50+perc90
	local Edmg =(GetCastLevel(myHero,_E)*35)+25+allDMG
	local Rdmg = (GetCastLevel(myHero,_R)*200)+(allDMG*2)

	local minionPos = GetOrigin(minion)
	local hero_origin = myHeroPos
	local targetPos = GetOrigin(target)
		if IsObjectAlive(target) then
				if ValidTarget(target,1000) then
					local FQpred = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target),2000,250,900,50,true,true)
					if CanUseSpell(myHero,_Q) == READY and FQpred.HitChance == 1 then
						CastSkillShot(_Q,FQpred.PredPos.x,FQpred.PredPos.y,FQpred.PredPos.z)
					end
				end
				if ValidTarget(target,350) then
					local FQpred = GetPredictionForPlayer(myHero,target,GetMoveSpeed(target),2000,250,350,50,true,true)
					if CanUseSpell(myHero,_E) == READY then
						CastSkillShot(_E,FQpred.PredPos.x,FQpred.PredPos.y,FQpred.PredPos.z)
						CastTargetSpell(target,GetItemSlot(myHero,3077))
						CastTargetSpell(target,GetItemSlot(myHero,3074))
						CastTargetSpell(target,GetItemSlot(myHero,3143))
					else end
				end
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
				if ValidTarget(target,375) then
					if CalcDamage(myHero, target, Rdmg) > GetCurrentHP(target) + GetHPRegen(target) then
						if CanUseSpell(myHero,_R) == READY then
							CastTargetSpell(target,_R)
						end
					end
				end
				
			if GetItemSlot(myHero,3047) == 0 or GetItemSlot(myHero,3047) < 1 then
				if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
					BuyItem(1001)
				end
			end
			if GetItemSlot(myHero,1001) == 1 or GetItemSlot(myHero,1001) > 1 then
				if GetItemSlot(myHero,3047) == 0 or GetItemSlot(myHero,3047) < 1 then
					BuyItem(3047)
				end
			end
			if GetItemSlot(myHero,3143) == 0 or GetItemSlot(myHero,3143) < 1 then
				BuyItem(3143)
			end
			if GetItemSlot(myHero,3068) == 0 or GetItemSlot(myHero,3068) < 1 then
				BuyItem(3068)
			end
			if GetItemSlot(myHero,3065) == 0 or GetItemSlot(myHero,3065) < 1 then
				BuyItem(3065)
			end
			if GetItemSlot(myHero,3091) == 0 or GetItemSlot(myHero,3091) < 1 then
				BuyItem(3091)
			end
		end
	end
	if "Elise" == GetObjectName(myHero) then
		if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
			if CanUseSpell(myHero,_Q) == READY then
				CastTargetSpell(target,_Q)
			end
		end
		if ValidTarget(target,WRange) and IsInDistance(myHero,WRange) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,WRange,55,true,true)
			if CanUseSpell(myHero,_W) == READY then
				CastSkillShot(_W,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
			end
		end
		if ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
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
	
	
	
			if GetItemSlot(myHero,2003) == 0 or GetItemSlot(myHero,2003) < 3 then
					BuyItem(2003)
			end
		------------------------------------------------------------------------- Sorcerer's Shoes Sequence
			-- Boots of Speed
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
					BuyItem(1001)
				end
			end
			-- Sorcerer's Shoes
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				BuyItem(3020)
			end
		------------------------------------------------------------------------- Liandry's Torment Sequence
			--Ruby Crystal
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1028) == 0 or GetItemSlot(myHero,1028) < 1 then
						BuyItem(1028)
					end
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Blasting Wand
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,1026) == 0 or GetItemSlot(myHero,1026) < 1 then
					BuyItem(1026)
				end
			end
			--Liandry's Torment
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				BuyItem(3151)
			end
		------------------------------------------------------------------------- Athene's Unholy Grail Sequence
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3028) == 0 or GetItemSlot(myHero,3028) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Null-Magic Mantle
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1033) == 0 or GetItemSlot(myHero,1033) < 1 then
					BuyItem(1033)
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Athene's Unholy Grail
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				BuyItem(2700)
			end
		------------------------------------------------------------------------- Morellonomicon Sequence

			--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Forbidden Idol
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					BuyItem(3114)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Morellonomicon
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				BuyItem(3165)
			end
			------------------------------------------------------------------------- Twin Shadows Sequence
			
			--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
						BuyItem(1052)
					end
				end
			end
			-- Aether Wisp
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
					BuyItem(3113)
				end
			end
			-- Twin Shadows
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				BuyItem(3023)
			end
end
	if "Kalista" == GetObjectName(myHero)then
	
	 -- iterate through all enemy heroes
  for _,target in pairs(GetEnemyHeroes()) do
    -- is the current target is a valid target
    if ValidTarget(target, 1500) then
      -- our total ad
      local TotalDmg = GetBonusDmg(myHero)+GetBaseDamage(myHero)
      -- out e damage, taken stack count into calc
      local dmgE = (GotBuff(target,"kalistaexpungemarker") > 0 and (10 + (10 * GetCastLevel(myHero,_E)) + (TotalDmg * 0.6)) + (GotBuff(target,"kalistaexpungemarker")-1) * (kalE(GetCastLevel(myHero,_E)) + (0.175 + 0.025 * GetCastLevel(myHero,_E))*TotalDmg) or 0)
      -- calculates damage on enemy, with armor taken into calc
      -- CalcDamage(source, target, addmg, apdmg)
      local dmg = CalcDamage(myHero, target, dmgE)
      -- hp of target
      local hp = GetCurrentHP(target)
      -- get target position
      local targetPos = GetOrigin(target)
      -- make draw position
      local drawPos = WorldToScreen(1,targetPos.x,targetPos.y,targetPos.z)
      -- if we do some dmg
      if dmg > 0 then 
        -- if our dmg is greater than target hp
        if hp > 0 and dmg >= hp and ValidTarget(target, 1000) then
          -- cast e
          CastTargetSpell(myHero, _E) 
        end
      end
    end
  end
  -- if we dont press spacebar we do nothing
  -- grab best target in 1175 range
  local target = GetTarget(1175)
  -- if the target is valid and (still) in 1175 range
	if target then
    -- following line is used to predict enemy position
    -- GetPredictionForPlayer(startPosition, targettarget, targettargetMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
    local QPred = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target),1750,250,1150,70,true,true)
    -- is q ready? is hitchance high enough?
		if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
      -- cast q towards position where enemy will be!
      CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
		end
	end
	


-- recursively calculates stackdmg
	function kalE(x) if x <= 1 then return 10 else return kalE(x-1) + 2 + x end end
	
			if GetItemSlot(myHero,3006) == 0 or GetItemSlot(myHero,3006) < 1 then
				if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
					BuyItem(1001)
				end
			end
			if GetItemSlot(myHero,1001) == 1 or GetItemSlot(myHero,1001) > 1 then
				if GetItemSlot(myHero,3006) == 0 or GetItemSlot(myHero,3006) < 1 then
				BuyItem(3006)
				end
			end
			if GetItemSlot(myHero,2003) == 0 or GetItemSlot(myHero,2003) < 3 then
					BuyItem(2003)
			end
			if GetItemSlot(myHero,3031) == 0 or GetItemSlot(myHero,3031) < 1 then
				BuyItem(3031)
			end
			if GetItemSlot(myHero,3153) == 0 or GetItemSlot(myHero,3153) < 1 then
				BuyItem(3153)
			end
			if GetItemSlot(myHero,3035) == 0 or GetItemSlot(myHero,3035) < 1 then
				BuyItem(3035)
			end
			if GetItemSlot(myHero,3046) == 0 or GetItemSlot(myHero,3046) < 1 then
				BuyItem(3046)
			end
	
	
	end
	if "Graves" == GetObjectName(myHero) then
		if IsObjectAlive(target) then
			if ValidTarget(target, 700) then
				local QPred = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target),1875,250,700,55,true,true)
				--if Config.Q then
					if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
						CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
					end
				--end
			end
			if ValidTarget(target, 900) then
				local WPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1875,250,900,55,true,true)
				--if Config.W then
					if CanUseSpell(myHero,_W) == READY and WPred.HitChance == 1 then
						CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
					end
				--end
			end
			if ValidTarget(target,1000) then
				local mousePos = GetMousePos()
				--if Config.E then
					if CanUseSpell(myHero,_E) == READY then
						CastSkillShot(_E,mousePos.x,mousePos.y,mousePos.z)
					end
				--end
			end	
			if ValidTarget(target,1000) then
			local TargetPos = GetOrigin(target)
			local bonusaddmg = GetBonusDmg(myHero)/2
			local ultipred = GetCastLevel(myHero,_R)*250+(bonusaddmg*3)
			local addmg = ultipred + GetHPRegen(target)
			if GetCurrentHP(target) < CalcDamage(myHero, target, addmg) then
				--if Config.R then
					local RPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1875,250,1000,55,true,true)
						CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
					end
				--end
			end
		end
	
		if GetItemSlot(myHero,3006) == 0 or GetItemSlot(myHero,3006) < 1 then
			if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
				BuyItem(1001)
			end
		end
		if GetItemSlot(myHero,2003) == 0 or GetItemSlot(myHero,2003) < 3 then
				BuyItem(2003)
		end
		if GetItemSlot(myHero,1001) == 1 or GetItemSlot(myHero,1001) > 1 then
			if GetItemSlot(myHero,3006) == 0 or GetItemSlot(myHero,3006) < 1 then
				BuyItem(3006)
			end
		end
		if GetItemSlot(myHero,3031) == 0 or GetItemSlot(myHero,3031) < 1 then
			BuyItem(3031)
		end
		if GetItemSlot(myHero,3153) == 0 or GetItemSlot(myHero,3153) < 1 then
			BuyItem(3153)
		end
		if GetItemSlot(myHero,3035) == 0 or GetItemSlot(myHero,3035) < 1 then
			BuyItem(3035)
		end
		if GetItemSlot(myHero,3046) == 0 or GetItemSlot(myHero,3046) < 1 then
			BuyItem(3046)
		end
	end
	if "Sion" == GetObjectName(myHero) then
		if ValidTarget(target,600) and IsInDistance(myHero,600) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,600,55,true,true)
			if CanUseSpell(myHero,_Q) == READY then
				CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,WRange) and IsInDistance(myHero,WRange) then
			if CanUseSpell(myHero,_W) == READY then
				CastSpell(_W)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,ERange,55,true,true)
			if CanUseSpell(myHero,_E) == READY then
				CastSkillShot(_E,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,900) and IsInDistance(myHero,900) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,900,55,true,true)
			if CanUseSpell(myHero,_R) == READY then
				CastSkillShot(_R,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				AttackUnit(target)
			end
		end
		if GetItemSlot(myHero,3047) == 0 or GetItemSlot(myHero,3047) < 1 then
			if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
				BuyItem(1001)
			end
		end
		if GetItemSlot(myHero,1001) == 1 or GetItemSlot(myHero,1001) > 1 then
			if GetItemSlot(myHero,3047) == 0 or GetItemSlot(myHero,3047) < 1 then
				BuyItem(3047)
			end
		end
		if GetItemSlot(myHero,3143) == 0 or GetItemSlot(myHero,3143) < 1 then
			BuyItem(3143)
		end
		if GetItemSlot(myHero,3068) == 0 or GetItemSlot(myHero,3068) < 1 then
			BuyItem(3068)
		end
		if GetItemSlot(myHero,3065) == 0 or GetItemSlot(myHero,3065) < 1 then
			BuyItem(3065)
		end
		if GetItemSlot(myHero,3091) == 0 or GetItemSlot(myHero,3091) < 1 then
			BuyItem(3091)
		end
		
	end
	if "Gangplank" == GetObjectName(myHero) then
		if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
			if CanUseSpell(myHero,_Q) == READY then
				CastTargetSpell(target,_Q)
			end
		end
		if ValidTarget(target,WRange) and IsInDistance(myHero,WRange) then
			if CanUseSpell(myHero,_W) == READY then
				CastSpell(_W)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,ERange,55,true,true)
			if CanUseSpell(myHero,_E) == READY then
				CastSkillShot(_E,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,900) and IsInDistance(myHero,900) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,900,55,true,true)
			if CanUseSpell(myHero,_R) == READY then
				CastSkillShot(_R,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				AttackUnit(target)
			end
		end
	if GetItemSlot(myHero,3006) == 0 or GetItemSlot(myHero,3006) < 1 then
		if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
			BuyItem(1001)
		end
	end
	if GetItemSlot(myHero,1001) == 1 or GetItemSlot(myHero,1001) > 1 then
		if GetItemSlot(myHero,3006) == 0 or GetItemSlot(myHero,3006) < 1 then
			BuyItem(3006)
		end
	end
	if GetItemSlot(myHero,3031) == 0 or GetItemSlot(myHero,3031) < 1 then
		BuyItem(3031)
	end
	if GetItemSlot(myHero,3153) == 0 or GetItemSlot(myHero,3153) < 1 then
		BuyItem(3153)
	end
	if GetItemSlot(myHero,3035) == 0 or GetItemSlot(myHero,3035) < 1 then
		BuyItem(3035)
	end
	if GetItemSlot(myHero,3046) == 0 or GetItemSlot(myHero,3046) < 1 then
		BuyItem(3046)
	end
		
	end
	if "Heimerdinger" == GetObjectName(myHero) then
		if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,QRange,55,true,true)
			if CanUseSpell(myHero,_Q) == READY then
				CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,WRange) and IsInDistance(myHero,WRange) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,WRange,55,true,true)
			if CanUseSpell(myHero,_Q) == READY then
				CastSkillShot(_W,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,ERange,55,true,true)
			if CanUseSpell(myHero,_E) == READY then
				CastSkillShot(_E,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
			if CanUseSpell(myHero,_R) == READY then
				CastSpell(_R)
				AttackUnit(target)
			end
		end
	
	
	
			if GetItemSlot(myHero,2003) == 0 or GetItemSlot(myHero,2003) < 3 then
					BuyItem(2003)
			end
		------------------------------------------------------------------------- Sorcerer's Shoes Sequence
			-- Boots of Speed
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
					BuyItem(1001)
				end
			end
			-- Sorcerer's Shoes
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				BuyItem(3020)
			end
		------------------------------------------------------------------------- Liandry's Torment Sequence
			--Ruby Crystal
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1028) == 0 or GetItemSlot(myHero,1028) < 1 then
						BuyItem(1028)
					end
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Blasting Wand
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,1026) == 0 or GetItemSlot(myHero,1026) < 1 then
					BuyItem(1026)
				end
			end
			--Liandry's Torment
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				BuyItem(3151)
			end
		------------------------------------------------------------------------- Athene's Unholy Grail Sequence
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3028) == 0 or GetItemSlot(myHero,3028) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Null-Magic Mantle
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1033) == 0 or GetItemSlot(myHero,1033) < 1 then
					BuyItem(1033)
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Athene's Unholy Grail
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				BuyItem(2700)
			end
		------------------------------------------------------------------------- Morellonomicon Sequence

			--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Forbidden Idol
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					BuyItem(3114)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Morellonomicon
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				BuyItem(3165)
			end
			------------------------------------------------------------------------- Twin Shadows Sequence
			
			--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
						BuyItem(1052)
					end
				end
			end
			-- Aether Wisp
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
					BuyItem(3113)
				end
			end
			-- Twin Shadows
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				BuyItem(3023)
			end
	end
	if "Katarina" == GetObjectName(myHero) then
		  if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
			if CanUseSpell(myHero,_Q) == READY then
				CastTargetSpell(target,_Q)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,WRange) and IsInDistance(myHero,WRange) then
			if CanUseSpell(myHero,_W) == READY then
				CastSpell(_W)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,myAttackRange) and IsInDistance(myHero,tarAttackRange) then
			if CanUseSpell(myHero,_E) == READY then
				CastTargetSpell(target,_E)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,RRange) and IsInDistance(myHero,RRange) then
			if CanUseSpell(myHero,_R) == READY then
				HoldPosition()
				CastSpell(_R)
			end
		end
		  if GetItemSlot(myHero,2003) == 0 or GetItemSlot(myHero,2003) < 3 then
					BuyItem(2003)
			end
		------------------------------------------------------------------------- Sorcerer's Shoes Sequence
			-- Boots of Speed
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
					BuyItem(1001)
				end
			end
			-- Sorcerer's Shoes
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				BuyItem(3020)
			end
		------------------------------------------------------------------------- Liandry's Torment Sequence
			--Ruby Crystal
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1028) == 0 or GetItemSlot(myHero,1028) < 1 then
						BuyItem(1028)
					end
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Blasting Wand
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,1026) == 0 or GetItemSlot(myHero,1026) < 1 then
					BuyItem(1026)
				end
			end
			--Liandry's Torment
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				BuyItem(3151)
			end
		------------------------------------------------------------------------- Athene's Unholy Grail Sequence
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3028) == 0 or GetItemSlot(myHero,3028) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Null-Magic Mantle
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1033) == 0 or GetItemSlot(myHero,1033) < 1 then
					BuyItem(1033)
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Athene's Unholy Grail
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				BuyItem(2700)
			end
		------------------------------------------------------------------------- Morellonomicon Sequence

			--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Forbidden Idol
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					BuyItem(3114)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Morellonomicon
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				BuyItem(3165)
			end
			------------------------------------------------------------------------- Twin Shadows Sequence
			
			--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
						BuyItem(1052)
					end
				end
			end
			-- Aether Wisp
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
					BuyItem(3113)
				end
			end
			-- Twin Shadows
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				BuyItem(3023)
			end
		  
	
	end
	if "Fizz" == GetObjectName(myHero) then
		if ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,ERange,55,true,true)
			if CanUseSpell(myHero,_E) == READY then
				CastSkillShot(_E,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,myAttackRange) and IsInDistance(myHero,myAttackRange) then
			if CanUseSpell(myHero,_W) == READY then
				CastSpell(_W)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
			if CanUseSpell(myHero,_Q) == READY then
				CastTargetSpell(target,_Q)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,RRange) and IsInDistance(myHero,RRange) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,RRange,55,true,true)
			if CanUseSpell(myHero,_R) == READY then
				CastSkillShot(_R,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				AttackUnit(target)
			end
		end
	
	
	
			if GetItemSlot(myHero,2003) == 0 or GetItemSlot(myHero,2003) < 3 then
					BuyItem(2003)
			end
		------------------------------------------------------------------------- Sorcerer's Shoes Sequence
			-- Boots of Speed
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
					BuyItem(1001)
				end
			end
			-- Sorcerer's Shoes
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				BuyItem(3020)
			end
		------------------------------------------------------------------------- Liandry's Torment Sequence
			--Ruby Crystal
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1028) == 0 or GetItemSlot(myHero,1028) < 1 then
						BuyItem(1028)
					end
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Blasting Wand
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,1026) == 0 or GetItemSlot(myHero,1026) < 1 then
					BuyItem(1026)
				end
			end
			--Liandry's Torment
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				BuyItem(3151)
			end
		------------------------------------------------------------------------- Athene's Unholy Grail Sequence
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3028) == 0 or GetItemSlot(myHero,3028) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Null-Magic Mantle
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1033) == 0 or GetItemSlot(myHero,1033) < 1 then
					BuyItem(1033)
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Athene's Unholy Grail
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				BuyItem(2700)
			end
		------------------------------------------------------------------------- Morellonomicon Sequence

			--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Forbidden Idol
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					BuyItem(3114)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Morellonomicon
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				BuyItem(3165)
			end
			------------------------------------------------------------------------- Twin Shadows Sequence
			
			--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
						BuyItem(1052)
					end
				end
			end
			-- Aether Wisp
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
					BuyItem(3113)
				end
			end
			-- Twin Shadows
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				BuyItem(3023)
			end
	end
	if "Galio" == GetObjectName(myHero) then
		if ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,ERange,55,true,true)
			if CanUseSpell(myHero,_E) == READY then
				CastSkillShot(_E,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,myAttackRange) and IsInDistance(myHero,myAttackRange) then
			if CanUseSpell(myHero,_W) == READY then
				CastSpell(_W)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,QRange,55,true,true)
			if CanUseSpell(myHero,_Q) == READY then
				CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,RRange) and IsInDistance(myHero,RRange) then
			if CanUseSpell(myHero,_R) == READY then
				CastSpell(_R)
			end
		end
			if GetItemSlot(myHero,2003) == 0 or GetItemSlot(myHero,2003) < 3 then
					BuyItem(2003)
			end
		------------------------------------------------------------------------- Sorcerer's Shoes Sequence
			-- Boots of Speed
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
					BuyItem(1001)
				end
			end
			-- Sorcerer's Shoes
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				BuyItem(3020)
			end
		------------------------------------------------------------------------- Liandry's Torment Sequence
			--Ruby Crystal
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1028) == 0 or GetItemSlot(myHero,1028) < 1 then
						BuyItem(1028)
					end
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Blasting Wand
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,1026) == 0 or GetItemSlot(myHero,1026) < 1 then
					BuyItem(1026)
				end
			end
			--Liandry's Torment
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				BuyItem(3151)
			end
		------------------------------------------------------------------------- Athene's Unholy Grail Sequence
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3028) == 0 or GetItemSlot(myHero,3028) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Null-Magic Mantle
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1033) == 0 or GetItemSlot(myHero,1033) < 1 then
					BuyItem(1033)
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Athene's Unholy Grail
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				BuyItem(2700)
			end
		------------------------------------------------------------------------- Morellonomicon Sequence

			--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Forbidden Idol
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					BuyItem(3114)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Morellonomicon
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				BuyItem(3165)
			end
			------------------------------------------------------------------------- Twin Shadows Sequence
			
			--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
						BuyItem(1052)
					end
				end
			end
			-- Aether Wisp
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
					BuyItem(3113)
				end
			end
			-- Twin Shadows
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				BuyItem(3023)
			end
	end
	if "Nautilus" == GetObjectName(myHero) then
		if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,QRange,55,true,true)
			if CanUseSpell(myHero,_Q) == READY then
				CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,myAttackRange) and IsInDistance(myHero,myAttackRange) then
			if CanUseSpell(myHero,_W) == READY then
				CastSpell(_W)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
			if CanUseSpell(myHero,_E) == READY then
				CastSpell(_E)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,RRange) and IsInDistance(myHero,RRange) then
			if CanUseSpell(myHero,_R) == READY then
				CastTargetSpell(target,_R)
			end
		end
		if GetItemSlot(myHero,3047) == 0 or GetItemSlot(myHero,3047) < 1 then
			if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
				BuyItem(1001)
			end
		end
		if GetItemSlot(myHero,1001) == 1 or GetItemSlot(myHero,1001) > 1 then
			if GetItemSlot(myHero,3047) == 0 or GetItemSlot(myHero,3047) < 1 then
				BuyItem(3047)
			end
		end
		if GetItemSlot(myHero,3143) == 0 or GetItemSlot(myHero,3143) < 1 then
			BuyItem(3143)
		end
		if GetItemSlot(myHero,3068) == 0 or GetItemSlot(myHero,3068) < 1 then
			BuyItem(3068)
		end
		if GetItemSlot(myHero,3065) == 0 or GetItemSlot(myHero,3065) < 1 then
			BuyItem(3065)
		end
		if GetItemSlot(myHero,3091) == 0 or GetItemSlot(myHero,3091) < 1 then
			BuyItem(3091)
		end
	end	
	if "TwistedFate" == GetObjectName(myHero) then
		if ValidTarget(target,900) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,900,55,true,true)
			if CanUseSpell(myHero,_Q) == READY then
				CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,myAttackRange) and IsInDistance(myHero,myAttackRange) then
			if CanUseSpell(myHero,_W) == READY then
				CastSpell(_W)
				AttackUnit(target)
			end
		end
		if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
			if CanUseSpell(myHero,_R) == READY then
				CastSpell(_R)
				AttackUnit(target)
			end
		end
	
	
	
			if GetItemSlot(myHero,2003) == 0 or GetItemSlot(myHero,2003) < 3 then
					BuyItem(2003)
			end
		------------------------------------------------------------------------- Sorcerer's Shoes Sequence
			-- Boots of Speed
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
					BuyItem(1001)
				end
			end
			-- Sorcerer's Shoes
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				BuyItem(3020)
			end
		------------------------------------------------------------------------- Liandry's Torment Sequence
			--Ruby Crystal
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1028) == 0 or GetItemSlot(myHero,1028) < 1 then
						BuyItem(1028)
					end
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Blasting Wand
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,1026) == 0 or GetItemSlot(myHero,1026) < 1 then
					BuyItem(1026)
				end
			end
			--Liandry's Torment
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				BuyItem(3151)
			end
		------------------------------------------------------------------------- Athene's Unholy Grail Sequence
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3028) == 0 or GetItemSlot(myHero,3028) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Null-Magic Mantle
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1033) == 0 or GetItemSlot(myHero,1033) < 1 then
					BuyItem(1033)
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Athene's Unholy Grail
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				BuyItem(2700)
			end
		------------------------------------------------------------------------- Morellonomicon Sequence

			--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Forbidden Idol
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					BuyItem(3114)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Morellonomicon
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				BuyItem(3165)
			end
			------------------------------------------------------------------------- Twin Shadows Sequence
			
			--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
						BuyItem(1052)
					end
				end
			end
			-- Aether Wisp
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
					BuyItem(3113)
				end
			end
			-- Twin Shadows
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				BuyItem(3023)
			end
	end
	if "Zilean" == GetObjectName(myHero) then
		if IsObjectAlive(target) then
			if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
				local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,QRange,55,true,true)
				if CanUseSpell(myHero,_Q) == READY then
					CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				end
			end
			if ValidTarget(target,myAttackRange) and IsInDistance(myHero,myAttackRange) then
				if CanUseSpell(myHero,_Q) == ONCOOLDOWN or CanUseSpell(myHero,_E) == ONCOOLDOWN then
					if CanUseSpell(myHero,_W) == READY then
						CastSpell(_W)
					end
				end
			end
			if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
				if CanUseSpell(myHero,_E) == READY then
					CastSpell(_E)
				end
			end
			if Config.R and ValidTarget(target,myAttackRange) and IsInDistance(myHero,myAttackRange) then
				if GetCurrentHP(myHero)*100/GetMaxHP(myHero) < 20 then
					if CanUseSpell(myHero,_R) == READY then
						CastSpell(_R)
					end
				end
			end
		end
		if GetItemSlot(myHero,2003) == 0 or GetItemSlot(myHero,2003) < 3 then
					BuyItem(2003)
			end
		------------------------------------------------------------------------- Sorcerer's Shoes Sequence
			-- Boots of Speed
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
					BuyItem(1001)
				end
			end
			-- Sorcerer's Shoes
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				BuyItem(3020)
			end
		------------------------------------------------------------------------- Liandry's Torment Sequence
			--Ruby Crystal
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1028) == 0 or GetItemSlot(myHero,1028) < 1 then
						BuyItem(1028)
					end
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Blasting Wand
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,1026) == 0 or GetItemSlot(myHero,1026) < 1 then
					BuyItem(1026)
				end
			end
			--Liandry's Torment
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				BuyItem(3151)
			end
		------------------------------------------------------------------------- Athene's Unholy Grail Sequence
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3028) == 0 or GetItemSlot(myHero,3028) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Null-Magic Mantle
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1033) == 0 or GetItemSlot(myHero,1033) < 1 then
					BuyItem(1033)
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Athene's Unholy Grail
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				BuyItem(2700)
			end
		------------------------------------------------------------------------- Morellonomicon Sequence

			--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Forbidden Idol
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					BuyItem(3114)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Morellonomicon
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				BuyItem(3165)
			end
			------------------------------------------------------------------------- Twin Shadows Sequence
			
			--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
						BuyItem(1052)
					end
				end
			end
			-- Aether Wisp
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
					BuyItem(3113)
				end
			end
			-- Twin Shadows
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				BuyItem(3023)
			end
		
		
	
	end
	if "Nami" == GetObjectName(myHero) then
		if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
			local QPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,QRange,55,true,true)
			if CanUseSpell(myHero,_Q) == READY then
				CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
			end
		end
		if GetCurrentHP(myHero)*100/GetMaxHP(myHero) < 70 then
			if CanUseSpell(myHero,_W) == READY then
				CastTargetSpell(myHero,_W)
			end
		end
		if GetCurrentHP(myHero)*100/GetMaxHP(myHero) < 70 then
			if CanUseSpell(myHero,_E) == READY then
				CastTargetSpell(myHero,_E)
			end
		end
		if ValidTarget(target,RRange) and IsInDistance(myHero,RRange) then
			local RPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,RRange,55,true,true)
			if CanUseSpell(myHero,_R) == READY then
				CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
			end
		end
	
	
	
			if GetItemSlot(myHero,2003) == 0 or GetItemSlot(myHero,2003) < 3 then
					BuyItem(2003)
			end
		------------------------------------------------------------------------- Sorcerer's Shoes Sequence
			-- Boots of Speed
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
					BuyItem(1001)
				end
			end
			-- Sorcerer's Shoes
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				BuyItem(3020)
			end
		------------------------------------------------------------------------- Liandry's Torment Sequence
			--Ruby Crystal
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1028) == 0 or GetItemSlot(myHero,1028) < 1 then
						BuyItem(1028)
					end
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Blasting Wand
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,1026) == 0 or GetItemSlot(myHero,1026) < 1 then
					BuyItem(1026)
				end
			end
			--Liandry's Torment
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				BuyItem(3151)
			end
		------------------------------------------------------------------------- Athene's Unholy Grail Sequence
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3028) == 0 or GetItemSlot(myHero,3028) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Null-Magic Mantle
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1033) == 0 or GetItemSlot(myHero,1033) < 1 then
					BuyItem(1033)
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Athene's Unholy Grail
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				BuyItem(2700)
			end
		------------------------------------------------------------------------- Morellonomicon Sequence

			--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Forbidden Idol
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					BuyItem(3114)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Morellonomicon
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				BuyItem(3165)
			end
			------------------------------------------------------------------------- Twin Shadows Sequence
			
			--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
						BuyItem(1052)
					end
				end
			end
			-- Aether Wisp
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
					BuyItem(3113)
				end
			end
			-- Twin Shadows
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				BuyItem(3023)
			end
	end
	if "Annie" == GetObjectName(myHero) then
		if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
			if CanUseSpell(myHero,_Q) == READY then
				CastTargetSpell(target,_Q)
			end
		end
		if ValidTarget(target,QRange) and IsInDistance(myHero,QRange) then
			if CanUseSpell(myHero,_E) == READY then
				CastSpell(myHero,_E)
			end
		end
		if ValidTarget(target,ERange) and IsInDistance(myHero,ERange) then
			local EPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,ERange,55,true,true)
			if CanUseSpell(myHero,_E) == READY then
				CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
			end
		end
		if ValidTarget(target,RRange) and IsInDistance(myHero,RRange) then
			local RPred = GetPredictionForPlayer(myHeroPos, target,GetMoveSpeed(target),1400,250,RRange,55,true,true)
			if CanUseSpell(myHero,_R) == READY then
				CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
			end
		end
	
	
	
			if GetItemSlot(myHero,2003) == 0 or GetItemSlot(myHero,2003) < 3 then
					BuyItem(2003)
			end
		------------------------------------------------------------------------- Sorcerer's Shoes Sequence
			-- Boots of Speed
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				if GetItemSlot(myHero,1001) == 0 or GetItemSlot(myHero,1001) < 1 then
					BuyItem(1001)
				end
			end
			-- Sorcerer's Shoes
			if GetItemSlot(myHero,3020) == 0 or GetItemSlot(myHero,3020) < 1 then
				BuyItem(3020)
			end
		------------------------------------------------------------------------- Liandry's Torment Sequence
			--Ruby Crystal
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1028) == 0 or GetItemSlot(myHero,1028) < 1 then
						BuyItem(1028)
					end
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,3136) == 0 or GetItemSlot(myHero,3136) < 1 then
					if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Blasting Wand
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				if GetItemSlot(myHero,1026) == 0 or GetItemSlot(myHero,1026) < 1 then
					BuyItem(1026)
				end
			end
			--Liandry's Torment
			if GetItemSlot(myHero,3151) == 0 or GetItemSlot(myHero,3151) < 1 then
				BuyItem(3151)
			end
		------------------------------------------------------------------------- Athene's Unholy Grail Sequence
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,3028) == 0 or GetItemSlot(myHero,3028) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Null-Magic Mantle
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1033) == 0 or GetItemSlot(myHero,1033) < 1 then
					BuyItem(1033)
				end
			end
			--Amplifying Tome
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Athene's Unholy Grail
			if GetItemSlot(myHero,2700) == 0 or GetItemSlot(myHero,2700) < 1 then
				BuyItem(2700)
			end
		------------------------------------------------------------------------- Morellonomicon Sequence

			--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
			-- Faerie Charm
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					if GetItemSlot(myHero,1004) == 0 or GetItemSlot(myHero,1004) < 2 then
						BuyItem(1004)
					end
				end
			end
			-- Forbidden Idol
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,3114) == 0 or GetItemSlot(myHero,3114) < 1 then
					BuyItem(3114)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					BuyItem(1052)
				end
			end
			-- Morellonomicon
			if GetItemSlot(myHero,3165) == 0 or GetItemSlot(myHero,3165) < 1 then
				BuyItem(3165)
			end
			------------------------------------------------------------------------- Twin Shadows Sequence
			
			--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
						BuyItem(1052)
					end
				end
			end
			--Fiendish Codex
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3108) == 0 or GetItemSlot(myHero,3108) < 1 then
					BuyItem(3108)
				end
			end
				--Amplifying Tome
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,1052) == 0 or GetItemSlot(myHero,1052) < 1 then
					if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
						BuyItem(1052)
					end
				end
			end
			-- Aether Wisp
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				if GetItemSlot(myHero,3113) == 0 or GetItemSlot(myHero,3113) < 1 then
					BuyItem(3113)
				end
			end
			-- Twin Shadows
			if GetItemSlot(myHero,3023) == 0 or GetItemSlot(myHero,3023) < 1 then
				BuyItem(3023)
			end
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