counter = 0
getgenv().modifiedWST = false
getgenv().modifiedWS = 16
getgenv().modifiedJPT = false
getgenv().modifiedJP = 50

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

do
    local old; old = hookmetamethod(game, "__index", function(a,b)
        if tostring(a) == "Humanoid" and tostring(b) == "JumpPower" and getgenv().modifiedJPT then
            return 50
        end
        return old(a,b)
    end)

    local old; old = hookmetamethod(game, "__newindex", function(a,b,c)
        if a.ClassName == "Humanoid" and tostring(b) == "JumpPower" and getgenv().modifiedJPT then
            return old(a,b,getgenv().modifiedJP)
        end
        return old(a,b,c)
    end)

    game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
        wait(.1)
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 50
    end)
end

spawn(function()
    while counter ~= 3 do
        if getgenv().ragdollFunc ~= nil then wait(.1)
            hookfunction(getgenv().ragdollFunc, function(...) end)
            counter += 1
            getgenv().ragdollFunc = nil
        end
        
        if getgenv().jumpFunc ~= nil then wait(.1)
            hookfunction(getgenv().jumpFunc, function(...) return true end)
            counter += 1
            getgenv().jumpFunc = nil
        end
        
        if getgenv().airFunc ~= nil then wait(.1)
            hookfunction(getgenv().airFunc, function(...) end)
            counter += 1
            getgenv().airFunc = nil
        end
        
        wait(.25)
    end
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/Project-Hook/main/main.lua"))()
