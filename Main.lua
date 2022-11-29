local module = {}

module.LP = game.Players.LocalPlayer
module.Char = LP.Character

function module.Player(PartialName)
    local foundPlayer
    local Players = game.Players:GetChildren()
    for i = 1, #Players do
    	local CurrentPlayer = Players[i]
    	if string.lower(CurrentPlayer.Name):sub(1, #PartialName) == string.lower(PartialName) then
    		foundPlayer = CurrentPlayer
    		break
    	end
    end
    return foundPlayer
end

function module.Character(PartialName)
    return Player(PartialName).Character
end

function module.LaunchUA(Vec3, Force, Loops)
    for count = 0, Loops do
        for i,v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                if isnetworkowner(v) and v.Parent ~=  Char and v.Parent.Parent ~= Char then
                    v.Orientation = Vector3.new(0,0,0)
                    v.Velocity = ((Vec3 - v.Position).Unit) * Vector3.new(Force,Force,Force)
                end
            end
        end
        wait()
    end
end

return module
