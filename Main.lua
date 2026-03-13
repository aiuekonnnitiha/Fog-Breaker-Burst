local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local P = Players.LocalPlayer
local R = ReplicatedStorage

local function ClearFog()
    Lighting.FogStart = 0
    Lighting.FogEnd = 90000000000
    for _, obj in pairs(Lighting:GetChildren()) do
        if obj:IsA("Atmosphere") or obj:IsA("Clouds") then
            obj:Destroy()
        end
    end
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
    Lighting.GlobalShadows = false
end
ClearFog()

_G.FastAttackConfig = {
    Enabled = true,
    Distance = 10000,
    BurstCount = 12
}

local Net = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")
local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = Net:WaitForChild("RE/RegisterHit")

local function ExecuteBurst()
    pcall(function()
        local char = P.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local myPos = char.HumanoidRootPart.Position
        local targets = {}
        for _, folder in pairs({workspace:FindFirstChild("Enemies"), workspace:FindFirstChild("Characters")}) do
            if folder then
                for _, v in pairs(folder:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
                        if (v.HumanoidRootPart.Position - myPos).Magnitude <= _G.FastAttackConfig.Distance then
                            table.insert(targets, v)
                        end
                    end
                end
            end
        end
        if #targets > 0 then
            local targetPart = targets[1].HumanoidRootPart
            local argsHit = {[1] = targetPart, [2] = {}}
            for i, v in pairs(targets) do
                if not argsHit[1] then argsHit[1] = v.Head end
                argsHit[2][i] = {v, v.HumanoidRootPart}
            end
            local tool = char:FindFirstChildOfClass("Tool")
            if tool then
                local fruitRemote = tool:FindFirstChild("LeftClickRemote") or tool:FindFirstChild("Remote") or tool:FindFirstChildOfClass("RemoteEvent")
                if fruitRemote then
                    local dir = (targetPart.Position - myPos).Unit
                    fruitRemote:FireServer(dir, 1)
                end
            end
            RegisterAttack:FireServer(0)
            for i = 1, _G.FastAttackConfig.BurstCount do
                RegisterHit:FireServer(unpack(argsHit))
            end
        end
    end)
end

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        task.spawn(function()
            for i = 1, 3 do
                ExecuteBurst()
                task.wait()
            end
        end)
    end
end)

task.spawn(function()
    local lastAttack = 0
    while true do
        if _G.FastAttackConfig.Enabled then
            local now = tick()
            if now - lastAttack > 0.045 then
                ExecuteBurst()
                lastAttack = now
            end
        end
        RunService.Heartbeat:Wait()
    end
end)

task.spawn(function()
    while true do
        pcall(function()
            local clock = R:FindFirstChild("Remotes") and R.Remotes:FindFirstChild("Clock")
            if clock then
                clock.DelayedRequestFunction:InvokeServer(tick())
            end
            
            local v4Item = P.Backpack:FindFirstChild("Awakening")
            if v4Item and v4Item:FindFirstChild("RemoteFunction") then
                task.spawn(function()
                    v4Item.RemoteFunction:InvokeServer(true)
                end)
            end
            
            local charV4 = P.Character and P.Character:FindFirstChild("Awakening")
            if charV4 and charV4:FindFirstChild("RemoteFunction") then
                task.spawn(function()
                    charV4.RemoteFunction:InvokeServer(true)
                end)
            end
        end)
        task.wait(0.5)
    end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Okamoto_Integrated_UI"
ScreenGui.Parent = CoreGui

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.Position = UDim2.new(0.05, 0, 0.4, 0)
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.Text = "ON"
ToggleButton.TextColor3 = Color3.fromRGB(0, 255, 0)
ToggleButton.TextSize = 18
ToggleButton.Draggable = true
Instance.new("UICorner", ToggleButton)

ToggleButton.MouseButton1Click:Connect(function()
    _G.FastAttackConfig.Enabled = not _G.FastAttackConfig.Enabled
    if _G.FastAttackConfig.Enabled then
        ToggleButton.Text = "ON"
        ToggleButton.TextColor3 = Color3.fromRGB(0, 255, 0)
    else
        ToggleButton.Text = "OFF"
        ToggleButton.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

local TriggerBtn = Instance.new("TextButton")
TriggerBtn.Parent = ScreenGui
TriggerBtn.BackgroundTransparency = 1
TriggerBtn.Position = UDim2.new(0.05, 0, 0.4, 60)
TriggerBtn.Size = UDim2.new(0, 50, 0, 50)
TriggerBtn.Font = Enum.Font.SourceSansBold
TriggerBtn.Text = "け"
TriggerBtn.TextColor3 = Color3.fromRGB(255, 255, 0)
TriggerBtn.TextSize = 30
TriggerBtn.Draggable = true

TriggerBtn.MouseButton1Click:Connect(function()
    task.spawn(function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/aiuekonnnitiha/Nakamura-s-Override-Edition/main/Main.lua"))()
        end)
    end)
    task.spawn(function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/aiuekonnnitiha/Okamoto-PhantomGlide/main/Main.lua"))()
        end)
    end)
    TriggerBtn:Destroy()
end)
