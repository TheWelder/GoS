require('Inspired')

--ver 1.0.0.1
--API 0.0.4
--Made By TheWelder

AddButton("Gank","GankAlert",true)

OnLoop(function(myHero)
local myHero = GetMyHero()
local myHeroPos = GetOrigin(myHero)
	if GetButtonValue("Gank") then
		if EnemiesAround(myHeroPos, 5000) > 0 then
			local hero_origin = myHeroPos
			local myscreenpos = WorldToScreen(1,hero_origin.x,hero_origin.y,hero_origin.z)
			if myscreenpos.flag then
				if EnemiesAround(myHeroPos, 5000) < 3 then
				DrawText(string.format("ENEMIES = %s", EnemiesAround(myHeroPos, 5000)),24,myscreenpos.x-100,myscreenpos.y,0xff00ff00)
					else 
					DrawText(string.format("CAREFULL = %s", EnemiesAround(myHeroPos, 5000)),24,myscreenpos.x-100,myscreenpos.y,0xffff0000)
				end
			end
		end	
	end
end)