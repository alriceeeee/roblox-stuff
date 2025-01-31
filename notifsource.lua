local notifmodule = {}

local tweenservice = game:GetService("TweenService")
local uis = game:GetService("UserInputService")

local icons = {
    info = "rbxassetid://11401835376",
    warn = "rbxassetid://11401835376",
    error = "rbxassetid://11401835376",
    success = "rbxassetid://11401835376"
}

local colors = {
    info = Color3.fromRGB(25, 25, 25),
    warn = Color3.fromRGB(255, 155, 0),
    error = Color3.fromRGB(255, 0, 0),
    success = Color3.fromRGB(0, 255, 0)
}

function notifmodule:createnoti(params)
    local title = params.title or "Notification"
    local description = params.description or ""
    local duration = params.duration or 5
    local type = params.type or "info"
    local customcolor = params.color
    local customicon = params.icon
    local titlecolor = params.titlecolor or Color3.fromRGB(255, 255, 255)
    local descriptioncolor = params.descriptioncolor or Color3.fromRGB(180, 180, 180)
    
    local screengui = Instance.new("ScreenGui")
    screengui.Parent = game.CoreGui
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 100)
    frame.Position = UDim2.new(1, 10, 0.8, 0)
    frame.BackgroundTransparency = 0.2
    frame.BackgroundColor3 = customcolor or colors[type]
    frame.BorderSizePixel = 0
    frame.Parent = screengui
    
    local blureffect = Instance.new("BlurEffect", frame)
    blureffect.Size = 20
    
    local uicorner = Instance.new("UICorner")
    uicorner.CornerRadius = UDim.new(0, 8)
    uicorner.Parent = frame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = frame.BackgroundColor3:Lerp(Color3.new(1,1,1), 0.2)
    stroke.Thickness = 1.5
    stroke.Parent = frame
    
    local icon = Instance.new("ImageLabel")
    icon.Size = UDim2.new(0, 30, 0, 30)
    icon.Position = UDim2.new(0, 10, 0, 5)
    icon.BackgroundTransparency = 1
    icon.Image = customicon or icons[type]
    icon.Parent = frame
    
    local titletext = Instance.new("TextLabel")
    titletext.Size = UDim2.new(1, -50, 0, 30)
    titletext.Position = UDim2.new(0, 45, 0, 5)
    titletext.BackgroundTransparency = 1
    titletext.TextColor3 = titlecolor
    titletext.TextSize = 16
    titletext.Font = Enum.Font.GothamBold
    titletext.Text = title
    titletext.TextXAlignment = Enum.TextXAlignment.Left
    titletext.Parent = frame
    
    local desctext = Instance.new("TextLabel")
    desctext.Size = UDim2.new(1, -20, 0, 50)
    desctext.Position = UDim2.new(0, 10, 0, 40)
    desctext.BackgroundTransparency = 1
    desctext.TextColor3 = descriptioncolor
    desctext.TextSize = 14
    desctext.Font = Enum.Font.Gotham
    desctext.Text = description
    desctext.TextXAlignment = Enum.TextXAlignment.Left
    desctext.TextWrapped = true
    desctext.Parent = frame
    
    local slidein = tweenservice:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Position = UDim2.new(1, -310, 0.8, 0)})
    local slideout = tweenservice:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Position = UDim2.new(1, 10, 0.8, 0)})
    
    slidein:Play()
    
    task.wait(duration)
    
    slideout:Play()
    
    task.wait(0.5)
    blureffect:Destroy()
    screengui:Destroy()
end

function notifmodule:notify(title, description, duration)
    self:createnoti({
        title = title,
        description = description,
        duration = duration,
        type = "info"
    })
end

function notifmodule:warn(title, description, duration)
    self:createnoti({
        title = title,
        description = description,
        duration = duration,
        type = "warn"
    })
end

function notifmodule:error(title, description, duration)
    self:createnoti({
        title = title,
        description = description,
        duration = duration,
        type = "error"
    })
end

function notifmodule:success(title, description, duration)
    self:createnoti({
        title = title,
        description = description,
        duration = duration,
        type = "success"
    })
end

function notifmodule:custom(params)
    self:createnoti(params)
end

return notifmodule
