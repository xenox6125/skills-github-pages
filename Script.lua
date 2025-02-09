local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:FindFirstChildOfClass("Humanoid")

local function GodMode()
    if Humanoid then
        Humanoid.MaxHealth = math.huge
        Humanoid.Health = math.huge
    end
end

local function Fly()
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    if HumanoidRootPart then
        local BodyVelocity = Instance.new("BodyVelocity", HumanoidRootPart)
        BodyVelocity.Velocity = Vector3.new(0, 50, 0)
        BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    end
end

local function KillAll()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.Health = 0
            end
        end
    end
end

local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))

local function CreateButton(text, position, callback)
    local button = Instance.new("TextButton")
    button.Parent = ScreenGui
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = position
    button.Text = text
    button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.MouseButton1Click:Connect(callback)
end

CreateButton("God Mode + Fly", UDim2.new(0, 20, 0, 100), function()
    GodMode()
    Fly()
end)

CreateButton("Kill All", UDim2.new(0, 20, 0, 160), function()
    KillAll()
end)
