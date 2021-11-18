getgenv().modifiedWST = false
getgenv().modifiedWS = 16
getgenv().modifiedJPT = false
getgenv().modifiedJP = 50

do
    local old; old = hookmetamethod(game, "__index", function(a,b)
        if tostring(a) == "Humanoid" and tostring(b) == "WalkSpeed" and getgenv().modifiedWST then
            return 16
        elseif tostring(a) == "Humanoid" and tostring(b) == "JumpPower" and getgenv().modifiedJPT then
            return 50
        end
            
        return old(a,b)
    end)

    local old; old = hookmetamethod(game, "__newindex", function(a,b,c)
        if a.ClassName == "Humanoid" and tostring(b) == "WalkSpeed" and getgenv().modifiedWST then
            return old(a,b,getgenv().modifiedWS)
        elseif a.ClassName == "Humanoid" and tostring(b) == "JumpPower" and getgenv().modifiedJPT then
            return old(a,b,getgenv().modifiedJP)
        end
        return old(a,b,c)
    end)
end

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
    local humanoid = char:WaitForChild("Humanoid")
    humanoid.JumpPower = 50
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/SpiritXmas/Project-Hook/main/main.lua"))()

