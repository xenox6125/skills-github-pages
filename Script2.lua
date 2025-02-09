local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:FindFirstChildOfClass("Humanoid")

local function MoneyFarm()
    local args = {
        [1] = "Buy",
        [2] = game:GetService("Workspace").Stores.LandStore.Sales["Basic Land"],
        [3] = 1
    }
    game:GetService("ReplicatedStorage").PurchaseItem:FireServer(unpack(args))
end

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

local function Teleport(position)
    if Character and Character:FindFirstChild("HumanoidRootPart") then
        Character:MoveTo(position)
    end
end

local function AutoChop()
    for _, tree in pairs(game:GetService("Workspace").Trees:GetChildren()) do
        if tree:IsA("Model") and tree:FindFirstChild("WoodSection") then
            local tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool") or LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then
                tool.Parent = Character
                tool:Activate()
                wait(0.5)
            end
        end
    end
end

local function DupeWood()
    local wood = game:GetService("Workspace").PlayerWood:FindFirstChild(LocalPlayer.Name)
    if wood then
        local clone = wood:Clone()
        clone.Parent = game:GetService("Workspace").PlayerWood
    end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")

local function CreateButton(text, position, callback)
    local button = Instance.new("TextButton")
    button.Parent = ScreenGui
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = position
    button.Text = text
    button.BackgroundColor3 = Color3.new(0, 0, 0)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.MouseButton1Click:Connect(callback)
end

CreateButton("💰 Money Farm", UDim2.new(0, 10, 0, 10), MoneyFarm)
CreateButton("🔱 God Mode", UDim2.new(0, 10, 0, 70), GodMode)
CreateButton("✈️ Fly", UDim2.new(0, 10, 0, 130), Fly)
CreateButton("🪓 Auto Chop", UDim2.new(0, 10, 0, 190), AutoChop)
CreateButton("🔁 Dupe Wood", UDim2.new(0, 10, 0, 250), DupeWood)
