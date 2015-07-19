local myHero = nil
 
function ObjectLoopEvent(Object,myHero)
        --DrawText(string.format("%s by TheWelder Loaded ", GetObjectName(myHero)),24,750,50,0xff00ff00);
        local Obj_Type = GetObjectType(Object);
        if Obj_Type == Obj_AI_Hero then
                if IsObjectAlive(Object) then
                        local hero_origin = GetOrigin(Object);
                        MoveToXYZ(hero_origin.x-100,hero_origin.y-100,hero_origin.z-100)
                end
        end
end