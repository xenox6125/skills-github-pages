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

local
