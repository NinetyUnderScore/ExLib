LP = game.Players.LocalPlayer
Char = LP.Character

function Player(PartialName)
    for i,v in pairs(game.Players:GetPlayers()) do
    	if string.lower(v.DisplayName):sub(1, #PartialName) == string.lower(PartialName) then
    		return v
    	end
    end
end

function Character(PartialName)
    return Player(PartialName).Character
end

function GetUA()
    UA = {}
    for i,v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") or v.ClassName == "MeshPart" then
           if isnetworkowner(v) and v.Parent ~= Char and v.Parent.Parent ~= Char then
                table.insert(UA, v)
            end
        end
    end
    return UA
end

function LaunchUA(Vec3, Force, Loops)
    for count = 0, Loops do
        for i,v in pairs(GetUA()) do
            v.Velocity = ((Vec3 - v.Position).Unit) * Force
        end
        wait()
    end
end

function VelocityUA(Vec3, Loops)
    for count = 0, Loops do
        for i,v in pairs(GetUA()) do
            v.Velocity = Vec3
        end
        wait()
    end
end
