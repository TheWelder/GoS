--27/07/2015
--ver 1.0.0.2
--api 0.0.4
--Made by TheWelder

Config = scriptConfig("afbot", "AFBot")
Config.addParam("active", "Active AFBot", SCRIPT_PARAM_ONOFF, true)
 
OnLoop(function(myHero)
	local myHero
        --DrawText(string.format("%s by TheWelder Loaded ", GetObjectName(myHero)),24,750,50,0xff00ff00);
		if Config.active then
			local Obj_Type = GetObjectType(Object);
			if Obj_Type == Obj_AI_Hero then
					if IsObjectAlive(Object) then
							local hero_origin = GetOrigin(Object);
							MoveToXYZ(hero_origin.x-100,hero_origin.y-100,hero_origin.z-100)
					end
			end
		end
end)