getgenv().modifiedWST = false
getgenv().modifiedWS = 16

do
    local old; old = hookmetamethod(game, "__index", function(a,b)
        if tostring(a) == "Humanoid" and tostring(b) == "WalkSpeed" and getgenv().modifiedWST then
            return 16
        end
            
        return old(a,b)
    end)

    local old; old = hookmetamethod(game, "__newindex", function(a,b,c)
        if a.ClassName == "Humanoid" and tostring(b) == "WalkSpeed" and getgenv().modifiedWST then
            return old(a,b,getgenv().modifiedWS)
        end
        return old(a,b,c)
    end)
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/Project-Hook/main/main.lua"))()

