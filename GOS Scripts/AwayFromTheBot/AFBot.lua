require('Inspired')
require('AFPlugins')
require('TWObjects')

OnDraw(function(myHero)
local myHero = GetMyHero()
local myHeroPos = GetOrigin(myHero)
local myHP = GetCurrentHP(myHero)/GetMaxHP(myHero)
local myMaxHp = GetMaxHP(myHero)
local getAllyHero = GetOrigin(closestAllyHero(myHeroPos))
local getAllyTurret = GetOrigin(closestAllyTurret(myHeroPos))
local getAllyMinion = GetOrigin(closestAllyMinion(myHeroPos))
local getEnemyHero = GetOrigin(closestEnemyHero(myHeroPos))
local getEnemyTurret = GetOrigin(closestEnemyTurret(myHeroPos))
local getEnemyMinion = GetOrigin(closestEnemyMinion(myHeroPos))

DrawText(string.format("%f", GetGameTimer()),12,0,300,0xff00ff00);
DrawText(string.format("x,y,z = %f; %f; %f", myHeroPos.x, myHeroPos.y, myHeroPos.z),12,0,400,0xff00ff00);
local tictac, timerpos = GetGameTimer(), myHeroPos.x
			
			if GetGameTimer() < 65 then
				MoveToXYZ(12000,myHeroPos.y,3000)
			end
			if GetGameTimer() > 65 and GetGameTimer() < 125 then
				MoveToXYZ(getAllyTurret.x,getAllyTurret.y,getAllyTurret.z)
			end
			if myHP < 0.5 then
				if GetDistance(closestAllyTurret(myHeroPos),myHero) < 400 then
					CastSpell(RECALL)
					HoldPosition()
				end
			end 
			if GetDistance(closestAllyTurret(myHeroPos),myHero) > 500 and myHP < 0.5 then
				MoveToXYZ(getAllyTurret.x,getAllyTurret.y,getAllyTurret.z)
			end
			if GetGameTimer() > 125 and myHP > 0.5 then
				if GetGameTimer() > tictac+15 and myHeroPos.x == timerpos then
					MoveToXYZ(getAllyMinion.x,getAllyMinion.y,getAllyMinion.z)
				elseif GetDistance(closestAllyHero(myHeroPos),myHero) > 500 and IsDead(closestAllyHero(myHeroPos)) == false then
					MoveToXYZ(getAllyHero.x-170,getAllyHero.y,getAllyHero.z+100)
				elseif GetDistance(closestEnemyTurret(myHeroPos),closestEnemyHero(myHeroPos)) > 700 then
					if IsInDistance(closestEnemyHero(myHeroPos),700) then
						AttackUnit(closestEnemyHero(myHeroPos))
					end
				elseif IsDead(closestEnemyTurret(myHeroPos)) == false and IsInDistance(closestEnemyTurret(myHeroPos),700) and GetDistance(closestAllyMinion(myHeroPos),closestEnemyTurret(myHeroPos)) < 100 then
					AttackUnit(closestEnemyTurret(myHeroPos))
				elseif GetObjectBaseName(closestEnemyMinion(myHeroPos)) ~= "Poo" then
					if IsDead(closestEnemyMinion(myHeroPos)) == false and IsInDistance(closestEnemyMinion(myHeroPos),700) and GetDistance(closestEnemyMinion(myHeroPos),closestEnemyTurret(myHeroPos)) > 1000 then
						AttackUnit(closestEnemyMinion(myHeroPos))
					end
				end
			end
end)

OnDraw(function(myHero)

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

end)