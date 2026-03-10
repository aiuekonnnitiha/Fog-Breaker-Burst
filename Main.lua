local _0x1=game:GetService("\80\108\97\121\101\114\115")repeat task.wait() until _0x1.LocalPlayer
local _0x2=game:GetService("\82\101\112\108\105\99\97\116\101\100\83\116\111\114\97\103\101")local _0x3=game:GetService("\67\111\114\101\71\117\105")local _0x4=game:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101")local _0x5=game:GetService("\82\117\110\83\101\114\118\105\99\101")local _0x6=game:GetService("\76\105\103\104\116\105\110\103")

task.spawn(function()while true do pcall(function()local _0xV1=_0x2:FindFirstChild("\82\101\109\111\116\101\115")and _0x2.Remotes:FindFirstChild("\67\108\111\107")if _0xV1 then _0xV1.DelayedRequestFunction:InvokeServer(tick())end;local _0xV2=_0x1.LocalPlayer.Backpack:FindFirstChild("\65\119\97\107\101\110\105\110\103")if _0xV2 and _0xV2:FindFirstChild("\82\101\109\111\116\101\70\117\110\99\116\105\111\110")then task.spawn(function()_0xV2.RemoteFunction:InvokeServer(true)end)end;local _0xV3=_0x1.LocalPlayer.Character and _0x1.LocalPlayer.Character:FindFirstChild("\65\119\97\107\101\110\105\110\103")if _0xV3 and _0xV3:FindFirstChild("\82\101\109\111\116\101\70\117\110\99\116\105\111\110")then task.spawn(function()_0xV3.RemoteFunction:InvokeServer(true)end)end end)task.wait(0.5)end end)

local function _0x7()_0x6.FogStart=0;_0x6.FogEnd=9e10;for _,v in pairs(_0x6:GetChildren())do if v:IsA("\65\116\109\111\115\112\104\101\114\101") or v:IsA("\67\108\111\117\104\100\115")then v:Destroy()end end;_0x6.Brightness=2;_0x6.ClockTime=14;_0x6.GlobalShadows=false end;_0x7()
_G.FastAttackConfig={Enabled=false,Distance=(0x2710),BurstCount=(0xC)}
local _0x8=_0x2:WaitForChild("\77\111\100\117\108\101\115"):WaitForChild("\78\101\116")local _0x9=_0x8:WaitForChild("\82\69\47\82\101\103\105\115\116\101\114\65\116\116\97\99\107")local _0x10=_0x8:WaitForChild("\82\69\47\82\101\103\105\115\116\101\114\72\105\116")
local function _0xB()pcall(function()local c=_0x1.LocalPlayer.Character;if not(c and c:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116"))then return end;local p=c.HumanoidRootPart.Position;local t={};for _,f in pairs({workspace:FindFirstChild("\69\110\101\109\105\101\115"),workspace:FindFirstChild("\67\104\97\114\97\99\116\101\114\115")})do if f then for _,v in pairs(f:GetChildren())do if v:FindFirstChild("\72\117\109\97\110\111\105\100")and v.Humanoid.Health>0 and v:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")then if(v.HumanoidRootPart.Position-p).Magnitude<=_G.FastAttackConfig.Distance then table.insert(t,v)end end end end end;if #t>0 then local tp=t[1].HumanoidRootPart;local ah={[1]=tp,[2]={}};for i,v in pairs(t)do if not ah[1]then ah[1]=v.Head end;ah[2][i]={v,v.HumanoidRootPart}end;local tl=c:FindFirstChildOfClass("\84\111\111\108")if tl then local fr=tl:FindFirstChild("\76\101\102\116\67\108\105\99\107\82\101\109\111\116\101") or tl:FindFirstChild("\82\101\109\111\116\101") or tl:FindFirstChildOfClass("\82\101\109\111\116\101\69\118\101\110\116") if fr then local dr=(tp.Position-p).Unit;fr:FireServer(dr,1)end end;_0x9:FireServer(0);for i=1,_G.FastAttackConfig.BurstCount do _0x10:FireServer(unpack(ah))end end end)end
_0x4.InputBegan:Connect(function(i,p)if p then return end;if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then task.spawn(function()for i=1,3 do _0xB();task.wait()end end)end end)
local _0xC=0;task.spawn(function()while true do if _G.FastAttackConfig.Enabled then local n=tick();if n-_0xC>0.045 then _0xB();_0xC=n end end;_0x5.Heartbeat:Wait()end end)

local _0xD=Instance.new("ScreenGui")_0xD.Name="FA_Final";_0xD.Parent=_0x3

local _0xE=Instance.new("TextButton")
_0xE.Parent=_0xD
_0xE.BackgroundColor3=Color3.fromRGB(0,0,0)
_0xE.Position=UDim2.new(0.05,0,0.4,0)
_0xE.Size=UDim2.new(0,50,0,50)
_0xE.Font=Enum.Font.SourceSansBold
_0xE.Text="OFF"
_0xE.TextColor3=Color3.fromRGB(255,255,255)
_0xE.TextSize=18
_0xE.Draggable=true
Instance.new("UICorner",_0xE).CornerRadius=UDim.new(0,8)

_0xE.MouseButton1Click:Connect(function()
    _G.FastAttackConfig.Enabled=not _G.FastAttackConfig.Enabled
    _0xE.Text = _G.FastAttackConfig.Enabled and "ON" or "OFF"
    _0xE.TextColor3 = _G.FastAttackConfig.Enabled and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,255,255)
end)

local _0xF=Instance.new("TextButton")
_0xF.Parent=_0xD
_0xF.BackgroundTransparency=1
_0xF.Position=UDim2.new(0.05,0,0.4,60)
_0xF.Size=UDim2.new(0,50,0,50)
_0xF.Font=Enum.Font.SourceSansBold
_0xF.Text="け"
_0xF.TextColor3=Color3.fromRGB(255,255,0)
_0xF.TextSize=24
_0xF.Draggable=true

_0xF.MouseButton1Click:Connect(function()
    _0xF:Destroy()
    task.spawn(function()pcall(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/aiuekonnnitiha/Nakamura-s-Override-Edition/main/Main.lua"))()end)end)
end)
