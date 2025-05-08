repeat
    task.wait()
 until game:IsLoaded()
 
 -- Menu/UI Creation
if not isfile("untitled.wtf") then
    makefolder("untitled.wtf")
end

if isfile("menu_plex.font") then
	delfile("menu_plex.font")
end
writefile("ProggyClean.ttf", game:HttpGet("https://github.com/chrissimpkins/codeface/raw/refs/heads/master/fonts/proggy-clean/ProggyClean.ttf"))

 local menu = game:GetObjects("rbxassetid://17171194056")[1] 
 local tabholder = menu.bg.bg.bg.bg.bg.bg.main.group;
 local tabviewer = menu.bg.bg.bg.bg.bg.bg.tabbuttons;
 for _, obj in pairs(menu:GetDescendants()) do
    if obj.Name:lower():find('userlabel') then
        obj.Text = 'active user: <font color="rgb(200, 40, 40)">' .. game.Players.LocalPlayer.Name .. '</font>'
    end
    if obj.Name:lower():find('buildlabel') then
        obj.Text = 'build: <font color="rgb(200, 40, 40)">Public</font>'
    end
 end
 
 --vars
 local CloneCore = gethui() or cloneref(game:GetService("CoreGui"))
 local CloneScreenGui = cloneref(Instance.new("ScreenGui"))
 local RunService = game:GetService("RunService")
 local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
 local InputService = game:GetService("UserInputService")
 local TweenService = game:GetService("TweenService")
 local HttpService = cloneref(game:GetService("HttpService"))
 
 --// LPH
 if not LPH_OBFUSCATED then
    LPH_JIT = function(...) return ... end
    LPH_JIT_MAX = function(...) return ... end
    LPH_JIT_ULTRA = function(...) return ... end
    LPH_NO_VIRTUALIZE = function(...) return ... end
    LPH_NO_UPVALUES = function(f) return(function(...) return f(...) end) end
    LPH_ENCSTR = function(...) return ... end
    LPH_STRENC = function(...) return ... end
    LPH_HOOK_FIX = function(...) return ... end
    LPH_CRASH = function() return print(debug.traceback()) end
 end
 
 -- custom fonts
 local Fonts = {}
 function Fonts:Register_Font(Name, Weight, Style, Asset)
	if not isfile(Asset.Id) then writefile(Asset.Id, Asset.Font) end
	if isfile(Name .. ".font") then delfile(Name .. ".font") end
	local Data = {
		name = Name,
		faces = {
			{
				name = "Regular",
				weight = Weight,
				style = Style,
				assetId = getcustomasset(Asset.Id),
			},
		},
	}
	writefile(Name .. ".font", game:GetService("HttpService"):JSONEncode(Data))
	return getcustomasset(Name .. ".font");
end
 
local base64Font = crypt.base64.encode(readfile("ProggyClean.ttf"))

 Fonts.ProggyTiny = Font.new(Library:Register_Font("!", 200, "normal", {
	Id = "proggyclean.ttf",
	Font = crypt.base64.decode(base64Font),
}))
 
 --keybinds
 local Keybinds = CloneScreenGui
 local Background = Instance.new("Frame", Keybinds)
 local Gradient = Instance.new("Frame", Background)
 local KeybindGradient = Instance.new("UIGradient", Gradient)
 local Tab = Instance.new("Frame", Background)
 local Name = Instance.new("TextLabel", Background)
 local Element = Instance.new("Frame", Background)
 local UIListLayout = Instance.new("UIListLayout", Tab)
 local Name_2 = Instance.new("TextLabel", Tab)
 
 Keybinds.Name = "Keybinds"
 Keybinds.Parent = CloneCore
 Keybinds.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 Keybinds.ResetOnSpawn = false
 
 Background.Name = "Background"
 Background.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
 Background.BorderColor3 = Color3.fromRGB(25, 25, 25)
 Background.Position = UDim2.new(0.01, 0, 0.488, 0)
 Background.Size = UDim2.new(0, 180, 0, 24)
 Background.Visible = false
 
 Gradient.Name = "Gradient"
 Gradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 Gradient.BorderColor3 = Color3.fromRGB(0, 0, 0)
 Gradient.BorderSizePixel = 0
 Gradient.Position = UDim2.new(0, 0, 0, 1)
 Gradient.Size = UDim2.new(0, 180, 0, 1)
 
 KeybindGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(200, 40, 40)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
 
 Name.Name = "Name"
 Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 Name.BackgroundTransparency = 1.000
 Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
 Name.BorderSizePixel = 0
 Name.Size = UDim2.new(0, 175, 0, 28)
 Name.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
 Name.Text = "[<font color=\"rgb(200, 40, 40)\">Keybinds</font>]"
 Name.TextColor3 = Color3.fromRGB(255, 255, 255)
 Name.TextSize = 10
 Name.RichText = true
 Name.BorderSizePixel = 1
 
 Element.Name = "Element"
 Element.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
 Element.BorderColor3 = Color3.fromRGB(0, 0, 0)
 Element.BorderSizePixel = 0
 Element.Position = UDim2.new(0, 0, 1, 0)
 Element.Size = UDim2.new(0, 140, 0, 1)
 
 Tab.Name = "Tab"
 Tab.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
 Tab.BackgroundTransparency = 0
 Tab.BorderSizePixel = 1
 Tab.BorderMode = "Inset"
 Tab.BorderColor3 = Color3.fromRGB(25, 25, 25)
 Tab.Position = UDim2.new(-0.007, 0, 1.833, 0)
 Tab.Size = UDim2.new(1.01199996, 0, 0, -20)
 
 UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
 UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
 
 Name_2.Name = "Name"
 Name_2.AnchorPoint = Vector2.new(0.5, 0.5)
 Name_2.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
 Name_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
 Name_2.BorderSizePixel = 0
 Name_2.Position = UDim2.new(0.5, 0, -1.85000002, 0)
 Name_2.Size = UDim2.new(1, 0, 1, 0)
 Name_2.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
 Name_2.Text = "Silent Aim: <font color=\"rgb(200, 40, 40)\">[MB1]</font>"
 Name_2.TextColor3 = Color3.fromRGB(125, 125, 125)
 Name_2.TextSize = 10
 Name_2.BorderSizePixel = 1
 Name_2.RichText = true
 Name_2.Visible = false
 
 local dragging
 local dragInput
 local dragStart
 local startPos
 
 Background.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
       dragging = true
       dragStart = input.Position
       startPos = Background.Position
 
       input.Changed:Connect(function()
          if input.UserInputState == Enum.UserInputState.End then
             dragging = false
          end
       end)
    end
 end)
 
 Background.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
       dragInput = input
    end
 end)
 
 game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
       local delta = input.Position - dragStart
       Background.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
 end)
 
 local function createWatermark()
    local Watermark = {}
 
    local WatermarkGui = CloneScreenGui
    local WatermarkFrame = Instance.new("Frame", WatermarkGui)
    local WaterMarkLabel = Instance.new("TextLabel", WatermarkFrame)
    local WatermarkGradient = Instance.new("UIGradient", WatermarkFrame)
    local WatermarkStroke = Instance.new("UIStroke", WatermarkFrame)
 
    WatermarkGui.Parent = CloneCore
    WatermarkGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    WatermarkFrame.Parent = WatermarkGui
    WatermarkFrame.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    WatermarkFrame.BorderColor3 = Color3.fromRGB(200, 40, 40)
    WatermarkFrame.BorderSizePixel = 2
    WatermarkFrame.Position = UDim2.new(0.0452012382, 33, 0.0223325081, -48)
    WatermarkFrame.Size = UDim2.new(0, 200, 0, 20)
    WatermarkFrame.Visible = false
    
    WaterMarkLabel.Parent = WatermarkFrame
    WaterMarkLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WaterMarkLabel.BackgroundTransparency = 1.000
    WaterMarkLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    WaterMarkLabel.BorderSizePixel = 0
    WaterMarkLabel.Position = UDim2.new(0, 0, 0, 0)
    WaterMarkLabel.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
    WaterMarkLabel.RichText = true
    WaterMarkLabel.Text = "Build: Private"
    WaterMarkLabel.TextColor3 = Color3.fromRGB(152, 152, 152)
    WaterMarkLabel.TextSize = 10
    WaterMarkLabel.TextWrapped = false
    
    WaterMarkLabel:GetPropertyChangedSignal("TextBounds"):Connect(function()
       local textSize = WaterMarkLabel.TextBounds
       local width = textSize.X + 10
       WatermarkFrame.Size = UDim2.new(0, width, 0, 20) 
       WaterMarkLabel.Size = UDim2.new(1, 0, 1, 0)
    end)
    
    WatermarkStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    WatermarkStroke.Color = Color3.fromRGB(71, 71, 71)
    WatermarkStroke.Thickness = 1
    WatermarkStroke.Parent = WatermarkFrame
    
    WatermarkGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(11, 11, 11)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(230, 230, 230))}
    WatermarkGradient.Rotation = 180
    WatermarkGradient.Parent = WatermarkFrame
    
    local function rotateGradient()
       local rotationAngle = WatermarkGradient.Rotation + 1
       WatermarkGradient.Rotation = rotationAngle
    end
 
    function Watermark:SetVisible(Visible)
       WatermarkFrame.Visible = Visible
    end
 
    function Watermark:Color(Color)
       WatermarkGradient.Color = ColorSequence.new{
           ColorSequenceKeypoint.new(0.00, Color3.fromRGB(11, 11, 11)),
           ColorSequenceKeypoint.new(1.00, Color)
       }
    end  
 
    local dragging
    local dragInput
    local dragStart
    local startPos
 
    WatermarkFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = WatermarkFrame.Position
 
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
 
    WatermarkFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
 
    game:GetService("UserInputService").InputChanged:Connect(function(input)
       if input == dragInput and dragging then
          local delta = input.Position - dragStart
          WatermarkFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
       end
    end)
 
    task.spawn(function()
       while task.wait() do
         rotateGradient()
         local time = os.date("%X", os.time())
         local ping = string.format('%.0f', game.Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
         local uid = "1"
         local fpsValue = string.split(game.Stats.Workspace.Heartbeat:GetValueString(), ".")[1]
         WaterMarkLabel.Text = 'untitled.<font color="rgb(200, 40, 40)">wtf</font> - uid: <font color="rgb(200, 40, 40)">' .. uid .. '</font> / fps: <font color="rgb(200, 40, 40)">' .. fpsValue .. '</font> / ping: <font color="rgb(200, 40, 40)">' .. ping .. '</font> / time: <font color="rgb(200, 40, 40)">' .. time .. '</font>'
       end
    end)
    return Watermark
 end
 
 local library = {
    Title = 'untitled.<font color="rgb(200, 40, 40)">wtf</font> || south bronx',
    keybind = Enum.KeyCode.RightShift,
    Watermark = createWatermark(),
       Colors = {
          libColor = Color3.fromRGB(200, 40, 40),
          riskyColor = Color3.fromRGB(255, 0, 0),
          FontColor = Color3.fromRGB(255, 255, 255),
          MainColor = Color3.fromRGB(14, 14, 14),
          AccentColor = Color3.fromRGB(200, 40, 40),
          OutlineColor = Color3.fromRGB(15, 15, 15),
       },
       Enabled = true,
       colorpicking = false,
       scrolling = true,
       multiZindex = 200,
       blacklisted = {
          Enum.KeyCode.W,
          Enum.KeyCode.A,
          Enum.KeyCode.S,
          Enum.KeyCode.D,
          Enum.UserInputType.MouseMovement
       },
       tabbuttons = {},
       tabs = {},
       options = {},
       flags = {},
       toInvis = {},
       Registry = {},
       RegistryMap = {},
       HudRegistry = {}
    }
    local keynames = {
       [Enum.KeyCode.LeftAlt] = 'LALT',
       [Enum.KeyCode.RightAlt] = 'RALT',
       [Enum.KeyCode.LeftControl] = 'LCTRL',
       [Enum.KeyCode.RightControl] = 'RCTRL',
       [Enum.KeyCode.LeftShift] = 'LSHIFT',
       [Enum.KeyCode.RightShift] = 'RSHIFT',
       [Enum.KeyCode.Underscore] = '_',
       [Enum.KeyCode.Minus] = '-',
       [Enum.KeyCode.Plus] = '+',
       [Enum.KeyCode.Period] = '.',
       [Enum.KeyCode.Slash] = '/',
       [Enum.KeyCode.BackSlash] = '\\',
       [Enum.KeyCode.Question] = '?',
       [Enum.UserInputType.MouseButton1] = 'MB1',
       [Enum.UserInputType.MouseButton2] = 'MB2',
       [Enum.UserInputType.MouseButton3] = 'MB3'
    }
    
    menu.bg.Position = UDim2.new(0.5,-menu.bg.Size.X.Offset/2,0.5,-menu.bg.Size.Y.Offset/2)
    menu.Parent = CloneCore
    menu.Name = "untitled_gui"
    local ProtectGui = protectgui or (syn and syn.protect_gui) or (function() end)
    local CloneScreenGui = cloneref(Instance.new("ScreenGui"))
    ProtectGui(CloneScreenGui)   
    CloneScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    CloneScreenGui.Parent = CloneCore
    CloneScreenGui.Name = "untitled_gui"
 
    local menu_text_label = Instance.new("TextLabel", menu.bg)
    menu_text_label.Name = "pre"
    menu_text_label.RichText = true
    menu_text_label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    menu_text_label.BackgroundTransparency = 1.000
    menu_text_label.Position = UDim2.new(0, 4, 0, -43)
    menu_text_label.Size = UDim2.new(0, 802, 0, 24)
    menu_text_label.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
    menu_text_label.Text = library.Title
    menu_text_label.TextColor3 = Color3.fromRGB(75, 75, 75)
    menu_text_label.TextSize = 10
    menu_text_label.TextStrokeTransparency = 0.000
 
    local BottomBar = Instance.new("Frame", menu.bg)
    local BuildLabel = Instance.new("TextLabel", BottomBar)
    local ActiveUserLabel = Instance.new("TextLabel", BottomBar)
 
    BottomBar.Name = "BottomBar"
    BottomBar.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    BottomBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    BottomBar.BorderSizePixel = 0
    BottomBar.Position = UDim2.new(0.00487692887, 1, 0.973760962, -25)
    BottomBar.Size = UDim2.new(1.02570701, -2, -0.00615911139, 24)
 
    BuildLabel.Name = "BuildLabel"
    BuildLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BuildLabel.BackgroundTransparency = 1.000
    BuildLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    BuildLabel.BorderSizePixel = 0
    BuildLabel.Position = UDim2.new(0.0005, 1, 0, -10)
    BuildLabel.Size = UDim2.new(-0.00151476054, 200, 2.14484048, -1)
    BuildLabel.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
    BuildLabel.RichText = true
    BuildLabel.Text = "build: <font color=\"rgb(200, 40, 40)\">public</font>"
    BuildLabel.TextColor3 = Color3.fromRGB(74, 74, 74)
    BuildLabel.TextSize = 10
    BuildLabel.TextWrapped = true
    BuildLabel.TextXAlignment = Enum.TextXAlignment.Left
 
    ActiveUserLabel.Name = "ActiveUserLabel"
    ActiveUserLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ActiveUserLabel.BackgroundTransparency = 1.000
    ActiveUserLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ActiveUserLabel.BorderSizePixel = 0
    ActiveUserLabel.Position = UDim2.new(1.0055, -204, -1.46925938, 1)
    ActiveUserLabel.Size = UDim2.new(0.00125635799, 200, 4.04341888, -1)
    ActiveUserLabel.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
    ActiveUserLabel.RichText = true
    ActiveUserLabel.Text = "active user: <font color=\"rgb(200, 40, 40)\">7d</font>"
    ActiveUserLabel.TextColor3 = Color3.fromRGB(74, 74, 74)
    ActiveUserLabel.TextSize = 10
    ActiveUserLabel.TextXAlignment = Enum.TextXAlignment.Right
 
    for _, obj in pairs(menu:GetDescendants()) do
        if obj.Name:lower():find('name_esp') then
           obj.Text = '<font color="rgb(200, 40, 40)">' .. game.Players.LocalPlayer.Name .. '</font>'
        end
    end
    function library:visualize(state)
        Background.Visible = state
    end
    function library:keybind_color(Color)
     KeybindGradient.Color = ColorSequence.new{
         ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), 
         ColorSequenceKeypoint.new(0.50, Color), 
         ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))
        }
    end  
 
    function library:AddToRegistry(Instance, Properties, IsHud)
        local Idx = #library.Registry + 3
        local Data = {Instance = Instance; Properties = Properties; Idx = Idx}
        table.insert(library.Registry, Data)
        library.RegistryMap[Instance] = Data
        if IsHud then table.insert(library.HudRegistry, Data) end
    end
    
    function library:CreateLabel(Properties, IsHud)
        local _Instance = library:Create('TextLabel', {BackgroundTransparency = 1; FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular); TextColor3 = library.Colors.FontColor; TextSize = 10; TextStrokeTransparency = 0})
        library:AddToRegistry(_Instance, {TextColor3 = 'FontColor'}, IsHud)
        return library:Create(_Instance, Properties)
    end
    
    function library:GetTextBounds(Text, FontFace, Size, Resolution)
        local Bounds = game:GetService('TextService'):GetTextSize(Text, Size, FontFace, Resolution or Vector2.new(1920, 1080))
        return Bounds.X, Bounds.Y
    end
    
    function library:Create(Class, Properties)
        if not library.Enabled then return end
        local _Instance = type(Class) == 'string' and Instance.new(Class) or Class
        for Property, Value in next, Properties do
            _Instance[Property] = Value
        end
        return _Instance
    end
    
    library.NotificationArea = library:Create('Frame', {BackgroundTransparency = 1; Position = UDim2.new(0.003, 0, 0, 40); Size = UDim2.new(0, 300, 0, 200); ZIndex = 100; Parent = CloneScreenGui})
    library:Create('UIListLayout', {Padding = UDim.new(0, 4); FillDirection = Enum.FillDirection.Vertical; SortOrder = Enum.SortOrder.LayoutOrder; Parent = library.NotificationArea})
    
        function library:Notify(Text, Time)
            local XSize, YSize = library:GetTextBounds(Text, Enum.Font.Code, 9); YSize = YSize + 8
            local NotifyOuter = library:Create('Frame', {BorderColor3 = Color3.new(200, 40, 40); Position = UDim2.new(0, 100, 0, 10); Size = UDim2.new(0, 0, 0, YSize); ClipsDescendants = true; Transparency = 0; ZIndex = 100; Parent = library.NotificationArea})
            library:Create('UIGradient', {Color = ColorSequence.new{ColorSequenceKeypoint.new(0, library.Colors.MainColor), ColorSequenceKeypoint.new(0.1, library.Colors.MainColor), ColorSequenceKeypoint.new(0.6, library.Colors.MainColor), ColorSequenceKeypoint.new(1, library.Colors.MainColor)}, Rotation = -120; Parent = NotifyOuter})
            local NotifyInner = library:Create('Frame', {BackgroundColor3 = library.Colors.MainColor; BorderColor3 = library.Colors.OutlineColor; BorderMode = Enum.BorderMode.Inset; Size = UDim2.new(1, 0, 1, 0); ZIndex = 101; Parent = NotifyOuter})
            local InnerFrame = library:Create('Frame', {BackgroundColor3 = Color3.new(1, 1, 1); BorderSizePixel = 0; Position = UDim2.new(0, 1, 0, 1); Size = UDim2.new(1, -2, 1, -2); ZIndex = 102; Parent = NotifyInner})
            local Line = library:Create('Frame', {BackgroundColor3 = library.Colors.AccentColor; BorderSizePixel = 0; Position = UDim2.new(1, 0, 0.97, 0); Size = UDim2.new(-0.999, -0.5, 0, 1.9); ZIndex = 102; Parent = NotifyInner})
            local LeftColor = library:Create('Frame', {BackgroundColor3 = library.Colors.AccentColor; BorderSizePixel = 0; Position = UDim2.new(0, -1, 0, 22); Size = UDim2.new(0, 2, -1.2, 0); ZIndex = 104; Parent = NotifyOuter})
            local Gradient = library:Create('UIGradient', {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, library.Colors.MainColor), ColorSequenceKeypoint.new(1, library.Colors.MainColor)}); Rotation = -90; Parent = InnerFrame})
            library:AddToRegistry(NotifyInner, {BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor';}, true)
            library:AddToRegistry(Gradient, {Color = function() return ColorSequence.new({ColorSequenceKeypoint.new(0, library.Colors.MainColor), ColorSequenceKeypoint.new(1, library.Colors.MainColor)}); end})
            library:CreateLabel({Position = UDim2.new(0, 6, 0, 0); Size = UDim2.new(1, -4, 1, 0); Text = Text; TextXAlignment = Enum.TextXAlignment.Left; TextSize = 10; ZIndex = 103; Parent = InnerFrame})
            pcall(NotifyOuter.TweenSize, NotifyOuter, UDim2.new(0, XSize + 42 + 4, 0, YSize), 'Out', 'Quad', 0.6, true)
            pcall(LeftColor.TweenSize, LeftColor, UDim2.new(0, 2, 0, 0), 'Out', 'Linear', 1, true)
            wait(0.9)
            pcall(Line.TweenSize, Line, UDim2.new(0, 0, 0, 2), 'Out', 'Linear', Time, true)
                task.spawn(function()
                    wait(Time or 5)
                    pcall(NotifyOuter.TweenSize, NotifyOuter, UDim2.new(0, 0, 0, YSize), 'Out', 'Quad', 0.4, true)
                    wait(0.4)
                    NotifyOuter:Destroy()
                end)
            end    
 
            function draggable(frame)
                local userInputService = game:GetService("UserInputService")
                local isDragging = false
                local startPosition
                local startOffset
                local lastInput
 
                local function onMouseInput(input)
                    if not library.colorpicking then
                        local delta = input.Position - startPosition
                        local newPosition = UDim2.new(startOffset.X.Scale, startOffset.X.Offset + delta.X,
                                                    startOffset.Y.Scale, startOffset.Y.Offset + delta.Y)
                        frame.Position = newPosition
                    end
                end
                
                frame.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or
                        input.UserInputType == Enum.UserInputType.Touch then
                        isDragging = true
                        startPosition = input.Position
                        startOffset = frame.Position
                        lastInput = input
                        input.Changed:Connect(function()
                            if input.UserInputState == Enum.UserInputState.End then
                                isDragging = false
                            end
                        end)
                    end
                end)
                
                frame.InputChanged:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement or
                        input.UserInputType == Enum.UserInputType.Touch then
                        lastInput = input
                    end
                end)
                
                userInputService.InputChanged:Connect(function(input)
                    if input == lastInput and isDragging then
                        onMouseInput(input)
                    end
                end)
            end           
 
            draggable(menu.bg)
                InputService.MouseIconEnabled = false
                local Cursor = Drawing.new('Triangle');Cursor.Thickness = 1;Cursor.Filled = true;Cursor.Visible = true;Cursor.ZIndex = math.huge;local CursorOutline = Drawing.new('Triangle');CursorOutline.Thickness = 1;CursorOutline.Filled = false;CursorOutline.Color = Color3.new(0, 0, 0);CursorOutline.Visible = true;CursorOutline.ZIndex = math.huge
                function cursorupdate()
                    local mPos = InputService:GetMouseLocation();
                    Cursor.Color = library.Colors.libColor;Cursor.PointA = Vector2.new(mPos.X, mPos.Y);Cursor.PointB = Vector2.new(mPos.X + 16, mPos.Y + 6);Cursor.PointC = Vector2.new(mPos.X + 6, mPos.Y + 16) CursorOutline.PointA = Cursor.PointA;CursorOutline.PointB = Cursor.PointB;CursorOutline.PointC = Cursor.PointC;RunService.RenderStepped:Wait() end task.spawn(function() while true do cursorupdate() end
                end)
                InputService.InputEnded:Connect(function(key)
                if key.KeyCode == library.keybind then 
                    menu.Enabled = not menu.Enabled;library.scrolling = false;
                    library.colorpicking = false;
                    Cursor.Visible = not Cursor.Visible;
                    InputService.MouseIconEnabled = not InputService.MouseIconEnabled;
                    CursorOutline.Visible = not CursorOutline.Visible; 
                    for i,v in next, 
                        library.toInvis 
                        do v.Visible = false 
                        end 
                    end
                end)
 
                LPH_NO_VIRTUALIZE(function()
                function library:Tween(...) TweenService:Create(...):Play() end
                    function library:addTab(name,image)
                        local newTab = tabholder.tab:Clone()
                        local newButton = tabviewer.button:Clone()
 
                        table.insert(library.tabs,newTab)
                        newTab.Parent = tabholder
                        newTab.Visible = false
 
                        table.insert(library.tabbuttons,newButton)
                        newButton.Parent = tabviewer
                        newButton.Modal = true
                        newButton.Visible = true
                        newButton.Image = image
                        newButton.text.Text = name
 
                        for i, v in next, library.tabbuttons do
                        v.ImageColor3 = Color3.fromRGB(25, 25, 25)
                        end
 
                        newButton.MouseButton1Click:Connect(function()
                        for i,v in next, library.tabs do v.Visible = v == newTab end
                        for i,v in next, library.toInvis do v.Visible = false end
                        for i,v in next, library.tabbuttons do
                        local state = v == newButton
                        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
                        local imageTweenStart = TweenService:Create(v, tweenInfo, {ImageColor3 = Color3.fromRGB(200, 40, 40)})
                        local textTweenStart = TweenService:Create(v.text, tweenInfo, {TextColor3 = Color3.fromRGB(200, 40, 40)})
                        local imageTweenEnd = TweenService:Create(v, tweenInfo, {ImageColor3 = Color3.fromRGB(25,25,25)})
                        local textTweenEnd = TweenService:Create(v.text, tweenInfo, {TextColor3 = Color3.fromRGB(125, 125, 125)})
                        if state then
                            imageTweenStart:Play()
                            textTweenStart:Play()
                        else
                            imageTweenEnd:Play()
                            textTweenEnd:Play()
                        end
                        end
                        end)
 
                        local tab = {}
                        local groupCount = 0
                        local jigCount = 0
                        local topStuff = 2000
 
                        function tab:createGroup(pos,groupname)
                        local groupbox = Instance.new("Frame")
                        local grouper = Instance.new("Frame")
                        local UIListLayout = Instance.new("UIListLayout")
                        local UIPadding = Instance.new("UIPadding")
                        local element = Instance.new("Frame")
                        local element2 = Instance.new("UIGradient")
                        local title = Instance.new("TextLabel")
 
                        groupCount -= 1
                        groupbox.Parent = newTab[pos]
                        groupbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        groupbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        groupbox.BorderSizePixel = 0
                        groupbox.Size = UDim2.new(0, 211, 0, 8)
                        groupbox.ZIndex = groupCount
 
                        grouper.Parent = groupbox
                        grouper.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                        grouper.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        grouper.Size = UDim2.new(1, 0, 1, 0)
 
                        UIListLayout.Parent = grouper
                        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
 
                        UIPadding.Parent = grouper
                        UIPadding.PaddingBottom = UDim.new(0, 4)
                        UIPadding.PaddingTop = UDim.new(0, 7)
 
                        element.Name = "element_frame"
                        element.Parent = groupbox
                        element.BackgroundColor3 = Color3.fromRGB(210, 210, 210)
                        element.BorderSizePixel = 0
                        element.Size = UDim2.new(1, 0, 0, 1)
  
                        element2.Name = "element1"
                        element2.Parent = element
                        element2.Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)),
                            ColorSequenceKeypoint.new(0.05, library.Colors.libColor),
                            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))
                        })                  
 
                        title.Parent = groupbox
                        title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        title.BackgroundTransparency = 1.000
                        title.BorderSizePixel = 0
                        title.Position = UDim2.new(0, 17, 0, 0)
                        title.ZIndex = 2
                        title.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                        title.Text = groupname or ""
                        title.TextColor3 = Color3.fromRGB(255, 255, 255)
                        title.TextSize = 10
                        title.TextStrokeTransparency = 0.000
                        title.TextXAlignment = Enum.TextXAlignment.Left
 
                        local group = {}
                        function group:addToggle(args)
                            if not args.flag and args.text then args.flag = args.text end
                            if not args.flag then return warn("⚠️ incorrect arguments ⚠️ - missing args on recent toggle") end
                            function riskyCfg(state)
                                args.risky = state
                            end
                            groupbox.Size += UDim2.new(0, 0, 0, 20)
 
                            local toggleframe = Instance.new("Frame")
                            local tobble = Instance.new("Frame")
                            local mid = Instance.new("Frame")
                            local front = Instance.new("Frame")
                            local text = Instance.new("TextLabel")
                            local button = Instance.new("TextButton")
 
                            jigCount -= 1
                            library.multiZindex -= 1
 
                            toggleframe.Name = "toggleframe"
                            toggleframe.Parent = grouper
                            toggleframe.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                            toggleframe.BackgroundTransparency = 1.000
                            toggleframe.BorderSizePixel = 0
                            toggleframe.Size = UDim2.new(1, 0, 0, 20)
                            toggleframe.ZIndex = library.multiZindex
 
                            tobble.Name = "tobble"
                            tobble.Parent = toggleframe
                            tobble.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                            tobble.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            tobble.BorderSizePixel = 3
                            tobble.Position = UDim2.new(0.0209999000, 0, 0.242000015, 0)
                            tobble.Size = UDim2.new(0, 11, 0, 11)
 
                            mid.Name = "mid"
                            mid.Parent = tobble
                            mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
                            mid.BorderColor3 = Color3.fromRGB(25,25,25)
                            mid.BorderSizePixel = 2
                            mid.Size = UDim2.new(0, 12, 0, 12)
 
                            front.Name = "front"
                            front.Parent = mid
                            front.BackgroundColor3 = Color3.fromRGB(21,21,21)
                            front.BorderColor3 = Color3.fromRGB(25, 25, 25)
                            front.Size = UDim2.new(0, 12, 0, 12)
 
                            local front2 = Instance.new("UIGradient", front)
                            front2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 75, 75)), ColorSequenceKeypoint.new(0.320, Color3.fromRGB(100, 100, 100)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}
                            front2.Rotation = 45
 
                            text.Name = "text"
                            text.Parent = toggleframe
                            text.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
                            text.BackgroundTransparency = 1.000
                            text.Position = UDim2.new(0, 22, 0, 0)
                            text.Size = UDim2.new(0, 0, 1, 2)
                            text.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            text.Text = args.text or args.flag
                            text.TextColor3 = Color3.fromRGB(155, 155, 155)
                            text.TextSize = 10
                            text.TextStrokeTransparency = 0.000
                            text.TextXAlignment = Enum.TextXAlignment.Left
 
                            button.Name = "button"
                            button.Parent = toggleframe
                            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            button.BackgroundTransparency = 1.000
                            button.BorderSizePixel = 0
                            button.Size = UDim2.new(0, 101, 1, 0)
                            button.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            button.Text = ""
                            button.TextColor3 = Color3.fromRGB(0, 0, 0)
                            button.TextSize = 10
 
                            local state = args.default
                            if args.risky then text.TextColor3 = state and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(139, 0, 0) end
                            if state == true then
                                front.Name = state and "accent" or "back"
                                library.flags[args.flag] = state
                                mid.BorderColor3 = Color3.fromRGB(25,25,25)
                                front.BackgroundColor3 = state and library.Colors.libColor or Color3.fromRGB(25, 25, 25)
                                if args.risky then text.TextColor3 = state and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(139, 0, 0) else text.TextColor3 = state and Color3.fromRGB(244, 244, 244) or Color3.fromRGB(144, 144, 144) end
                                if args.callback then args.callback(state) end
                            else
                                if args.risky then text.TextColor3 = Color3.fromRGB(139, 0, 0) else text.TextColor3 = Color3.fromRGB(144, 144, 144) end
                            end
 
                            function toggle(newState)
                                state = newState
                                library.flags[args.flag] = state
                                front.BackgroundColor3 = state and library.Colors.libColor or Color3.fromRGB(25, 25, 25)
                                --library:Tween(front, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = state and library.libColor or Color3.fromRGB(25, 25, 25)})
                                if args.risky then text.TextColor3 = state and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(139, 0, 0) else text.TextColor3 = state and Color3.fromRGB(244, 244, 244) or Color3.fromRGB(144, 144, 144) end
                                if args.callback then args.callback(state) end
                            end
 
                            button.MouseButton1Click:Connect(function()
                            state = not state
                            front.Name = state and "accent" or "back"
                            library.flags[args.flag] = state
                            mid.BorderColor3 = Color3.fromRGB(25,25,25)
                            front.BackgroundColor3 = state and library.Colors.libColor or Color3.fromRGB(25, 25, 25)
                            --library:Tween(front, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = state and library.libColor or Color3.fromRGB(25, 25, 25)})
                            if args.risky then text.TextColor3 = state and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(139, 0, 0) else text.TextColor3 = state and Color3.fromRGB(244, 244, 244) or Color3.fromRGB(144, 144, 144) end
                            if args.callback then args.callback(state) end
                            end)
 
                            button.MouseEnter:Connect(function()
                                library:Tween(mid, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BorderColor3 = library.Colors.libColor})
                            end)
                            
                            button.MouseLeave:Connect(function()
                                library:Tween(mid, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(25,25,25)})
                            end)                            
 
                            library.flags[args.flag] = false
                            library.options[args.flag] = {text = "",type = "toggle",gui = args.gui,changeState = toggle,skipflag = args.skipflag,oldargs = args,toggle = state,risky = args.risky or false,riskcfg = riskyCfg}
                            local toggle = {}
                            function toggle:addKeybind(args)
                                if not args.flag then return warn("⚠️ incorrect arguments ⚠️ - missing args on toggle:keybind") end
                                local next = false
                                local keybind = Instance.new("Frame")
                                local button = Instance.new("TextButton")
                                local Name = Instance.new("TextLabel")
 
                                Name.Name = "Name"
                                Name.Parent = Tab
                                Name.AnchorPoint = Vector2.new(0.5, 0.5)
                                Name.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                                Name.BorderColor3 = Color3.fromRGB(25, 25, 25)
                                Name.BorderSizePixel = 1
                                Name.Position = UDim2.new(0.5, 0, -1.85000002, 0)
                                Name.Size = UDim2.new(1, 0, 1, 0)
                                Name.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                                Name.TextColor3 = Color3.fromRGB(125, 125, 125)
                                Name.TextSize = 10
                                Name.RichText = true
                                Name.Visible = false
 
                                keybind.Parent = toggleframe
                                keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                keybind.BackgroundTransparency = 0
                                keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                keybind.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                                keybind.BorderColor3 = Color3.fromRGB(20, 20, 20)
                                keybind.BorderSizePixel = 1
                                keybind.Visible = true
                                keybind.Position = UDim2.new(0.82, 4, 0.15, 0)
                                keybind.Size = UDim2.new(0, 30, 0, 13)
 
                                button.Parent = keybind
                                button.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                                button.BackgroundTransparency = 1
                                button.BorderSizePixel = 1
                                button.Position = UDim2.new(0.1, 0, 0, 2)
                                button.Size = UDim2.new(0.9, 0, 1, 0)
                                button.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                                button.Text = ""
                                button.TextColor3 = Color3.fromRGB(155, 155, 155)
                                button.TextSize = 10
                                button.TextStrokeTransparency = 0.000
                                button.TextXAlignment = Enum.TextXAlignment.Center
 
                                local status = false
                                local Toggle = false
                                function updateValue(val)
                                    if library.colorpicking then return end
                                        library.flags[args.flag] = val
                                        if val.Name == "Unknown" or val.Name == "Unknown" then
                                        button.Text = "None"
                                        else
                                        button.Text = keynames[val] or ""..val.Name..""
                                    end
                                end
                                InputService.InputBegan:Connect(function(input)
                                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                    return  
                                end
                                    
                                local key = input.KeyCode == Enum.KeyCode.Unknown and input.UserInputType or input.KeyCode
                                if next then
                                    if not table.find(library.blacklisted,key) then
                                    next = false
                                    library.flags[args.flag] = key
                                    if key.Name == "Unknown" or key.Name == "Unknown" then
                                        button.Text = "None"
                                    else
                                        button.Text = keynames[key] or ""..key.Name..""
                                        local keyName = tostring(library.flags[args.flag]):split(".")[3] -- Extracts the key name from the enum value
                                        if args.gui then
                                            Name.Visible = true
                                            if args.type == "hold" then
                                                Name.Text = "<font color=\"rgb(255,255,255)\">" ..args.text.. ":</font>".." <font color=\"rgb(200, 40, 40)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                            else
                                                if not Toggle then
                                                    Toggle = true
                                                    Name.Text = "<font color=\"rgb(255,255,255)\">" ..args.text.. ":</font>".." <font color=\"rgb(200, 40, 40)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                                else
                                                    Toggle = false
                                                    Name.Text = "<font color=\"rgb(125, 125, 125)\">" ..args.text.. ": /font>".." <font color=\"rgb(200, 40, 40)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                                end
                                            end
                                        end
                                    end
                                    button.TextColor3 = Color3.fromRGB(155, 155, 155)
                                    end
                                end
                                if not next and key == library.flags[args.flag] and args.callback then
                                    status = not status
                                    args.callback(key, status)
                                    local keyName = tostring(library.flags[args.flag]):split(".")[3] -- Extracts the key name from the enum value
                                    if args.gui then
                                        Name.Visible = true
                                        if args.type == "hold" then
                                            Name.Text = "<font color=\"rgb(255,255,255)\">" ..args.text.. ":</font>".." <font color=\"rgb(200, 40, 40)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                        else
                                            if not Toggle then
                                                Toggle = true
                                                Name.Text = "<font color=\"rgb(255,255,255)\">" ..args.text.. ":</font>".." <font color=\"rgb(200, 40, 40)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                            else
                                                Toggle = false
                                                Name.Text = "<font color=\"rgb(125, 125, 125)\">" ..args.text.. ":</font>".." <font color=\"rgb(200, 40, 40)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                            end
                                        end
                                    end
                                end
                                end)
 
                                if args.type == "hold" then
                                    InputService.InputEnded:Connect(function(input)
                                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                            return  
                                        end
                                        local key = input.KeyCode == Enum.KeyCode.Unknown and input.UserInputType or input.KeyCode
                                        if next then
                                        if not table.find(library.blacklisted,key) then
                                            next = false
                                            library.flags[args.flag] = key
                                            if key.Name == "Unknown" or key.Name == "Unknown" then
                                                button.Text = "None"
                                            else
                                                button.Text = keynames[key] or ""..key.Name..""
                                                local keyName = tostring(library.flags[args.flag]):split(".")[3] -- Extracts the key name from the enum value
                                                if args.gui then
                                                    Name.Visible = true
                                                    if args.type == "hold" then
                                                        Name.Text = "<font color=\"rgb(125, 125, 125)\">" ..args.text.. ":</font>".." <font color=\"rgb(200, 40, 40)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                                    else
                                                        Name.Text = "<font color=\"rgb(125, 125, 125)\">" ..args.text.. ":</font>".." <font color=\"rgb(200, 40, 40)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                                    end
                                                end
                                            end
                                        end
                                        end
                                        if not next and key == library.flags[args.flag] and args.callback then
                                        status = not status
                                        args.callback(key, status)
                                        local keyName = tostring(library.flags[args.flag]):split(".")[3] -- Extracts the key name from the enum value
                                        if args.gui then
                                            Name.Visible = true
                                            Name.Text = args.text..": <font color=\"rgb(125, 125, 125)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                        end
                                        end
                                    end)
                                end
 
                                button.MouseButton1Click:Connect(function()
                                if library.colorpicking then return end
                                library.flags[args.flag] = Enum.KeyCode.Unknown
                                button.Text = "--"
                                button.TextColor3 = library.Colors.libColor
                                next = true
                                end)
 
                                library.flags[args.flag] = Enum.KeyCode.Unknown
                                library.options[args.flag] = {type = "keybind",changeState = updateValue,skipflag = args.skipflag,oldargs = args}
 
                                local keyName = tostring(args.key):split(".")[3] -- Extracts the key name from the enum value
                                if args.gui then
                                    Name.Visible = true
                                    Name.Text = args.text..": <font color=\"rgb(200, 40, 40)\">" .."["..keyName.."]".. "</font> ("..args.type..")"
                                end
 
                                updateValue(args.key or Enum.KeyCode.Unknown)
                            end
                            function toggle:addColorpicker(args)
                                if not args.flag and args.text then args.flag = args.text end
                                if not args.flag then return warn("⚠️ incorrect arguments ⚠️") end
                                local colorpicker = Instance.new("Frame")
                                local mid = Instance.new("Frame")
                                local front = Instance.new("Frame")
                                local button2 = Instance.new("TextButton")
                                local colorFrame = Instance.new("Frame")
                                local colorFrame_2 = Instance.new("Frame")
                                local hueframe = Instance.new("Frame")
                                local main = Instance.new("Frame")
                                local hue = Instance.new("ImageLabel")
                                local pickerframe = Instance.new("Frame")
                                local main_2 = Instance.new("Frame")
                                local picker = Instance.new("ImageLabel")
                                local clr = Instance.new("Frame")
                                local copy = Instance.new("TextButton")
                                local CurrentColorFrame = Instance.new("Frame")
                                local CurrentColorFrame_Text = Instance.new("TextLabel")
 
                                library.multiZindex -= 1
                                jigCount -= 1
                                topStuff -= 1
 
                                colorpicker.Parent = toggleframe
                                colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                colorpicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                colorpicker.BorderSizePixel = 3
                                colorpicker.Position = args.second and UDim2.new(0.720000029, 4, 0.272000015, 0) or UDim2.new(0.880000014, 4, 0.272000015, 0)
                                colorpicker.Size = UDim2.new(0, 16, 0, 10)
 
                                mid.Name = "mid"
                                mid.Parent = colorpicker
                                mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
                                mid.BorderColor3 = Color3.fromRGB(25,25,25)
                                mid.BorderSizePixel = 2
                                mid.Size = UDim2.new(1, 0, 1, 0)
 
                                front.Name = "front"
                                front.Name = "dontchange"
                                front.Parent = mid
                                front.BackgroundColor3 = library.Colors.libColor
                                front.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                front.Size = UDim2.new(1, 0, 1, 0)
 
                                local ColorPickerGradient = Instance.new("UIGradient", front)
                                ColorPickerGradient.Name = "dontchange"
                                ColorPickerGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 75, 75)), ColorSequenceKeypoint.new(0.320, Color3.fromRGB(100, 100, 100)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}
                                ColorPickerGradient.Rotation = 270
 
                                button2.Name = "button2"
                                button2.Parent = front
                                button2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                button2.BackgroundTransparency = 1.000
                                button2.Size = UDim2.new(1, 0, 1, 0)
                                button2.Text = ""
                                button2.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                                button2.TextColor3 = Color3.fromRGB(0, 0, 0)
                                button2.TextSize = 10
 
                                colorFrame.Name = "colorFrame"
                                colorFrame.Parent = toggleframe
                                colorFrame.BackgroundColor3 = Color3.fromRGB(11,11,11)
                                colorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                colorFrame.BorderSizePixel = 2
                                colorFrame.Position = UDim2.new(0.101092957, 0, 0.75, 0)
                                colorFrame.Size = UDim2.new(0, 187, 0, 178)
 
                                colorFrame_2.Name = "colorFrame"
                                colorFrame_2.Parent = colorFrame
                                colorFrame_2.BackgroundColor3 = Color3.fromRGB(11,11,11)
                                colorFrame_2.BorderColor3 = Color3.fromRGB(30, 30, 30)
                                colorFrame_2.Size = UDim2.new(1, 0, 1, 0)
 
                                hueframe.Name = "hueframe"
                                hueframe.Parent = colorFrame_2
                                hueframe.BackgroundColor3 = Color3.fromRGB(11,11,11)
                                hueframe.BorderColor3 = Color3.fromRGB(30, 30, 30)
                                hueframe.BorderSizePixel = 2
                                hueframe.Position = UDim2.new(-0.0830000022, 18, -0.0559999987, 13)
                                hueframe.Size = UDim2.new(0.25, 110, 0.25, 110)
 
                                main.Name = "main"
                                main.Parent = hueframe
                                main.BackgroundColor3 = Color3.fromRGB(11,11,11)
                                main.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                main.Size = UDim2.new(1, 0, 1, 0)
                                main.ZIndex = 6
 
                                picker.Name = "picker"
                                picker.Parent = main
                                picker.BackgroundColor3 = library.Colors.libColor
                                picker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                picker.BorderSizePixel = 0
                                picker.Size = UDim2.new(1, 0, 1, 0)
                                picker.ZIndex = 104
                                picker.Image = "rbxassetid://2615689005"
 
                                pickerframe.Name = "pickerframe"
                                pickerframe.Parent = colorFrame
                                pickerframe.BackgroundColor3 = Color3.fromRGB(11,11,11)
                                pickerframe.BorderColor3 = Color3.fromRGB(30, 30, 30)
                                pickerframe.BorderSizePixel = 1
                                pickerframe.Position = UDim2.new(0.801000025, 14, -0.0559999987, 13)
                                pickerframe.Size = UDim2.new(0, 20, 0.25, 110)

                                main_2.Name = "main"
                                main_2.Parent = pickerframe
                                main_2.BackgroundColor3 = Color3.fromRGB(11,11,11)
                                main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                main_2.Size = UDim2.new(0, 20, 1, 0)
                                main_2.ZIndex = 6
 
                                hue.Name = "hue"
                                hue.Parent = main_2
                                hue.BackgroundColor3 = Color3.fromRGB(255, 0, 178)
                                hue.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                hue.BorderSizePixel = 0
                                hue.Size = UDim2.new(0, 20, 1, 0)
                                hue.ZIndex = 104
                                hue.Image = "rbxassetid://2615692420"
 
                                clr.Name = "clr"
                                clr.Parent = colorFrame
                                clr.BackgroundColor3 = Color3.fromRGB(11,11,11)
                                clr.BackgroundTransparency = 1.000
                                clr.BorderColor3 = Color3.fromRGB(60, 60, 60)
                                clr.BorderSizePixel = 2
                                clr.Position = UDim2.new(0.0280000009, 0, 0, 2)
                                clr.Size = UDim2.new(0, 0, 0, 14)
                                clr.ZIndex = 5
 
                                copy.MouseButton1Click:Connect(function()
                                colorFrame.Visible = false
                                end)
 
                                button2.MouseButton1Click:Connect(function()
                                colorFrame.Visible = not colorFrame.Visible
                                mid.BorderColor3 = Color3.fromRGB(25,25,25)
                                end)
 
                                button2.MouseEnter:Connect(function()
                                    library:Tween(mid, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BorderColor3 = library.Colors.libColor})
                                end)
                                
                                button2.MouseLeave:Connect(function()
                                    library:Tween(mid, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(25,25,25)})
                                end)  
 
                                local function updateValue(value,fakevalue)
                                    if typeof(value) == "table" then value = fakevalue end
                                    library.flags[args.flag] = value
                                    front.BackgroundColor3 = value
 
                                    if args.callback then
                                    args.callback(value)
                                    end
                                end
 
                                local white, black = Color3.new(1,1,1), Color3.new(0,0,0)
                                local colors = {Color3.new(1,0,0),Color3.new(1,1,0),Color3.new(0,1,0),Color3.new(0,1,1),Color3.new(0,0,1),Color3.new(1,0,1),Color3.new(1,0,0)}
                                local heartbeat = RunService.Heartbeat
                                local pickerX,pickerY,hueY = 0,0,0
                                local oldpercentX,oldpercentY = 0,0
 
                                hue.MouseEnter:Connect(function()
                                local input = hue.InputBegan:connect(function(key)
                                if key.UserInputType == Enum.UserInputType.MouseButton1 then
                                    while heartbeat:wait() and InputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                    library.colorpicking = true
                                    local percent = (hueY-hue.AbsolutePosition.Y-36)/hue.AbsoluteSize.Y
                                    local num = math.max(1, math.min(7,math.floor(((percent*7+0.5)*100))/100))
                                    local startC = colors[math.floor(num)]
                                    local endC = colors[math.ceil(num)]
                                    local color = white:lerp(picker.BackgroundColor3, oldpercentX):lerp(black, oldpercentY)
                                    picker.BackgroundColor3 = startC:lerp(endC, num-math.floor(num)) or Color3.new(0, 0, 0)
                                    updateValue(color)
                                    end
                                    library.colorpicking = false
                                end
                                end)
                                local leave
                                leave = hue.MouseLeave:connect(function()
                                input:disconnect()
                                leave:disconnect()
                                end)
                                end)
 
                                picker.MouseEnter:Connect(function()
                                local input = picker.InputBegan:connect(function(key)
                                if key.UserInputType == Enum.UserInputType.MouseButton1 then
                                    while heartbeat:wait() and InputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                    library.colorpicking = true
                                    local xPercent = (pickerX-picker.AbsolutePosition.X)/picker.AbsoluteSize.X
                                    local yPercent = (pickerY-picker.AbsolutePosition.Y-36)/picker.AbsoluteSize.Y
                                    local color = white:lerp(picker.BackgroundColor3, xPercent):lerp(black, yPercent)
                                    updateValue(color)
                                    oldpercentX,oldpercentY = xPercent,yPercent
                                    end
                                    library.colorpicking = false
                                end
                                end)
                                local leave
                                leave = picker.MouseLeave:connect(function()
                                input:disconnect()
                                leave:disconnect()
                                end)
                                end)
 
                                hue.MouseMoved:connect(function(_, y)
                                hueY = y
                                end)
 
                                picker.MouseMoved:connect(function(x, y)
                                pickerX,pickerY = x,y
                                end)
 
                                table.insert(library.toInvis,colorFrame)
                                library.flags[args.flag] = Color3.new(1,1,1)
                                library.options[args.flag] = {type = "colorpicker",changeState = updateValue,skipflag = args.skipflag,oldargs = args}
                                updateValue(args.color or Color3.new(1,1,1))
                            end
                            return toggle
                        end
                        function group:addButton(args)
                            if not args.callback or not args.text then return warn("⚠️ incorrect arguments ⚠️") end
                            groupbox.Size += UDim2.new(0, 0, 0, 20)
 
                            local buttonframe = Instance.new("Frame")
                            local bg = Instance.new("Frame")
                            local main = Instance.new("Frame")
                            local button = Instance.new("TextButton")
                            local gradient = Instance.new("UIGradient")
 
                            buttonframe.Name = "buttonframe"
                            buttonframe.Parent = grouper
                            buttonframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            buttonframe.BackgroundTransparency = 1.000
                            buttonframe.BorderSizePixel = 0
                            buttonframe.Size = UDim2.new(1, 0, 0, 20)
 
                            bg.Name = "bg"
                            bg.Parent = buttonframe
                            bg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                            bg.BorderColor3 = Color3.fromRGB(25, 25, 25)
                            bg.BorderSizePixel = 2
                            bg.Position = UDim2.new(0.02, -1, 0.12, 0)
                            bg.Size = UDim2.new(0, 205, 0, 15)
 
                            main.Name = "main"
                            main.Parent = bg
                            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                            main.BorderColor3 = Color3.fromRGB(25, 25, 25)
                            main.Size = UDim2.new(1, 0, 1, 0)
 
                            button.Name = "button"
                            button.Parent = main
                            button.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                            button.BackgroundTransparency = 1.000
                            button.BorderSizePixel = 0
                            button.Size = UDim2.new(1, 0, 1, 0)
                            button.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            button.Text = args.text or args.flag
                            button.TextColor3 = Color3.fromRGB(255, 255, 255)
                            button.TextSize = 10
                            button.TextStrokeTransparency = 0.000
 
                            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(59, 59, 59)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(83, 83, 83))}
                            gradient.Rotation = 90
                            gradient.Name = "gradient"
                            gradient.Parent = main
 
                            button.MouseButton1Click:Connect(function()
                            if not library.colorpicking then
                                args.callback()
                            end
                            end)
                            button.MouseEnter:Connect(function()
                                library:Tween(main, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BorderColor3 = library.Colors.libColor})
                            end)
                            
                            button.MouseLeave:Connect(function()
                                library:Tween(main, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(25,25,25)})
                            end) 
                        end
                        function group:addSlider(args,sub)
                            if not args.flag or not args.max then return warn("⚠️ incorrect arguments ⚠️") end
                            groupbox.Size += UDim2.new(0, 0, 0, 31)
                            function riskyCfg(state)
                                args.risky = state
                            end
 
                            local slider = Instance.new("Frame")
                            local bg = Instance.new("Frame")
                            local main = Instance.new("Frame")
                            local fill = Instance.new("Frame")
                            local button = Instance.new("TextButton")
                            local valuetext = Instance.new("TextLabel")
                            local UIGradient = Instance.new("UIGradient")
                            local text = Instance.new("TextLabel")
                            local textAdd = Instance.new("TextLabel")
                            local textRemove = Instance.new("TextLabel")
 
                            slider.Name = "slider"
                            slider.Parent = grouper
                            slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            slider.BackgroundTransparency = 1.000
                            slider.BorderSizePixel = 0
                            slider.Size = UDim2.new(1, 0, 0, 30)
 
                            bg.Name = "bg"
                            bg.Parent = slider
                            bg.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                            bg.BorderColor3 = Color3.fromRGB(25,25,25)
                            bg.BorderSizePixel = 2
                            bg.Position = UDim2.new(0.02, -1, 0, 15)
                            bg.Size = UDim2.new(0, 205, 0, 13)
 
                            main.Name = "main"
                            main.Parent = bg
                            main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                            main.BorderColor3 = Color3.fromRGB(20, 20, 20)
                            main.Size = UDim2.new(1, 0, 1, 0)
 
                            fill.Name = "fill"
                            fill.Parent = main
                            fill.BackgroundColor3 = library.Colors.libColor
                            fill.BackgroundTransparency = 0.200
                            fill.BorderColor3 = Color3.fromRGB(60, 60, 60)
                            fill.BorderSizePixel = 0
                            fill.Size = UDim2.new(0.617238641, 13, 1, 0)
                            if args.min < 0 then
                                fill.Position = UDim2.new(0.5,0,0,0)
                            end
 
                            local Fill_UIGradient = Instance.new("UIGradient", fill)
                            Fill_UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)), ColorSequenceKeypoint.new(0.8, Color3.fromRGB(100, 100, 100)), ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 75, 75))}
                            Fill_UIGradient.Rotation = 90
 
                            button.Name = "button"
                            button.Parent = main
                            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            button.BackgroundTransparency = 1.000
                            button.Size = UDim2.new(0, 191, 1, 0)
                            button.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            button.Text = ""
                            button.TextColor3 = Color3.fromRGB(0, 0, 0)
                            button.TextSize = 10
 
                            valuetext.Parent = main
                            valuetext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            valuetext.BackgroundTransparency = 1.000
                            valuetext.Position = UDim2.new(0.5, 0, 0.5, 0)
                            valuetext.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            valuetext.Text = "1/10"
                            valuetext.TextColor3 = Color3.fromRGB(255, 255, 255)
                            valuetext.TextSize = 10
                            valuetext.TextStrokeTransparency = 0.000
 
                            UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(105, 105, 105)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(121, 121, 121))}
                            UIGradient.Rotation = 90
                            UIGradient.Parent = main
 
                            text.Name = "text"
                            text.Parent = slider
                            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            text.BackgroundTransparency = 1.000
                            text.Position = UDim2.new(0.0299999993, -1, 0, 7)
                            text.ZIndex = 2
                            text.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            text.Text = args.text or args.flag
                            text.TextColor3 = Color3.fromRGB(244, 244, 244)
                            text.TextSize = 10
                            text.TextStrokeTransparency = 0.000
                            text.TextXAlignment = Enum.TextXAlignment.Left
 
                            if args.risky then
                                text.TextColor3 = library.Colors.riskyColor
                            end
 
                            textAdd.Name = "Add"
                            textAdd.Parent = slider
                            textAdd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            textAdd.BackgroundTransparency = 1.000
                            textAdd.Position = UDim2.new(0.9111111111, -1, 0, 7)
                            textAdd.ZIndex = 2
                            textAdd.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            textAdd.Text = "+"
                            textAdd.TextColor3 = Color3.fromRGB(125, 125, 125)
                            textAdd.TextSize = 10
                            textAdd.TextStrokeTransparency = 0.000
                            textAdd.TextXAlignment = Enum.TextXAlignment.Left
 
                            textRemove.Name = "Remove"
                            textRemove.Parent = slider
                            textRemove.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            textRemove.BackgroundTransparency = 1.000
                            textRemove.Position = UDim2.new(0.9599999999, -1, 0, 7)
                            textRemove.ZIndex = 2
                            textRemove.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            textRemove.Text = "-"
                            textRemove.TextColor3 = Color3.fromRGB(125, 125, 125)
                            textRemove.TextSize = 10
                            textRemove.TextStrokeTransparency = 0.000
                            textRemove.TextXAlignment = Enum.TextXAlignment.Left
 
                            button.MouseEnter:Connect(function()
                                library:Tween(bg, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BorderColor3 = library.Colors.libColor})
                            end)
                            
                            button.MouseLeave:Connect(function()
                                library:Tween(bg, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(25,25,25)})
                            end)            
 
                            local entered = false
                            local scrolling = false
                            local function round(value, decimalPlaces)
                                local shift = 10 ^ decimalPlaces return math.floor(value * shift + 0.5) / shift
                            end
 
                            local function updateValue(value)
                                if library.colorpicking then return end
                                if args.min < 0 then
                                    fill:TweenSize(UDim2.new(value / 2 / args.max, 0, 1, 0), Enum.EasingDirection.In,Enum.EasingStyle.Linear,0.1)
                                end
                                if value ~= 0 then
                                    if args.min < 0 then
                                    fill:TweenSize(UDim2.new(value  / 2 / args.max, 0, 1, 0), Enum.EasingDirection.In,Enum.EasingStyle.Linear,0.1)
                                    else
                                    fill:TweenSize(UDim2.new(value / args.max, 0, 1, 0), Enum.EasingDirection.In,Enum.EasingStyle.Linear,0.1)
                                    end
                                else
                                    fill:TweenSize(UDim2.new(0, 1, 1, 0), Enum.EasingDirection.In,Enum.EasingStyle.Linear,0.1)
                                end
                                valuetext.Text = value .. args.suffix .. "/" .. args.max .. args.suffix
                                library.flags[args.flag] = value
                                if args.callback then
                                    args.callback(value)
                                end
                            end
                            local function updateScroll()
                                while InputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and menu.Enabled do
                                    RunService.RenderStepped:Wait()
                                    library.scrolling = true
                                    valuetext.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    scrolling = true
                                    local floatStep = args.float or 0.1
                                    local range = args.max - args.min
                                    local normalizedMouseX = (Mouse.X - button.AbsolutePosition.X) / button.AbsoluteSize.X
                                    local value = args.min + normalizedMouseX * range
                                    local snappedValue = args.min + floatStep * math.floor((value - args.min) / floatStep + 0.5)
                                    value = math.min(args.max, snappedValue)
                                    value = math.max(args.min, value)
                                    value = round(value, 2)
                                    updateValue(value)
                                    fill.BackgroundColor3 = library.Colors.libColor
                                end
                                if scrolling and not entered then
                                    valuetext.TextColor3 = Color3.fromRGB(255, 255, 255)
                                end
                                if not menu.Enabled then
                                    entered = false
                                end
                                scrolling = false
                                library.scrolling = false
                            end
                            button.MouseEnter:Connect(function()
                            if library.colorpicking then return end
                            if scrolling or entered then return end
                            entered = true
                            main.BorderColor3 = library.Colors.libColor
                            while entered do
                                wait() updateScroll()
                            end
                            end)
                            button.MouseLeave:Connect(function()
                            entered = false
                            main.BorderColor3 = Color3.fromRGB(20, 20, 20)
                            end)
                            library.flags[args.flag] = args.value or args.default
                            library.options[args.flag] = { type = "slider", changeState = updateValue, skipflag = args.skipflag, oldargs = args }
                            updateValue(args.value or args.default)
                        end
                        function group:addTextbox(args)
                            if not args.flag then return warn("⚠️ incorrect arguments ⚠️") end
                            groupbox.Size += UDim2.new(0, 0, 0, 35)
 
                            local textbox = Instance.new("Frame")
                            local bg = Instance.new("Frame")
                            local main = Instance.new("ScrollingFrame")
                            local box = Instance.new("TextBox")
                            local gradient = Instance.new("UIGradient")
                            local text = Instance.new("TextLabel")
 
                            box:GetPropertyChangedSignal('Text'):Connect(function(val)
                            if library.colorpicking then return end
                            library.flags[args.flag] = box.Text
                            args.value = box.Text
                            if args.callback then
                                args.callback()
                            end
                            end)
                            textbox.Name = "textbox"
                            textbox.Parent = grouper
                            textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            textbox.BackgroundTransparency = 1.000
                            textbox.BorderSizePixel = 0
                            textbox.Size = UDim2.new(1, 0, 0, 35)
                            textbox.ZIndex = 10
 
                            bg.Name = "bg"
                            bg.Parent = textbox
                            bg.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
                            bg.BorderColor3 = Color3.fromRGB(2, 2, 2)
                            bg.BorderSizePixel = 2
                            bg.Position = UDim2.new(0.02, -1, 0, 16)
                            bg.Size = UDim2.new(0, 205, 0, 15)
 
                            main.Name = "main"
                            main.Parent = bg
                            main.Active = true
                            main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
                            main.BorderColor3 = Color3.fromRGB(12, 12, 12)
                            main.Size = UDim2.new(1, 0, 1, 0)
                            main.CanvasSize = UDim2.new(0, 0, 0, 0)
                            main.ScrollBarThickness = 0
 
                            box.Name = "box"
                            box.Parent = main
                            box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            box.BackgroundTransparency = 1.000
                            box.Selectable = false
                            box.Size = UDim2.new(1, 0, 1, 0)
                            box.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            box.Text = args.value or ""
                            box.TextColor3 = Color3.fromRGB(255, 255, 255)
                            box.TextSize = 10
                            box.TextStrokeTransparency = 0.000
                            box.TextXAlignment = Enum.TextXAlignment.Left
 
                            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(59, 59, 59)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(83, 83, 83))}
                            gradient.Rotation = 90
                            gradient.Name = "gradient"
                            gradient.Parent = main
 
                            text.Name = "text"
                            text.Parent = textbox
                            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            text.BackgroundTransparency = 1.000
                            text.Position = UDim2.new(0.0299999993, -1, 0, 7)
                            text.ZIndex = 2
                            text.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            text.Text = args.text or args.flag
                            text.TextColor3 = Color3.fromRGB(244, 244, 244)
                            text.TextSize = 10
                            text.TextStrokeTransparency = 0.000
                            text.TextXAlignment = Enum.TextXAlignment.Left
 
                            library.flags[args.flag] = args.value or ""
                            library.options[args.flag] = {type = "textbox",changeState = function(text) box.Text = text end,skipflag = args.skipflag,oldargs = args}
                        end
                        function group:addDivider(args)
                            groupbox.Size += UDim2.new(0, 0, 0, 10)
 
                            local div = Instance.new("Frame")
                            local bg = Instance.new("Frame")
                            local main = Instance.new("Frame")
 
                            div.Name = "div"
                            div.Parent = grouper
                            div.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            div.BackgroundTransparency = 1.000
                            div.BorderSizePixel = 0
                            div.Position = UDim2.new(0, 0, 0.743662, 0)
                            div.Size = UDim2.new(0, 202, 0, 10)
 
                            bg.Name = "bg"
                            bg.Parent = div
                            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            bg.BorderSizePixel = 2
                            bg.Position = UDim2.new(0.02, 0, 0, 4)
                            bg.Size = UDim2.new(0, 191, 0, 1)
 
                            main.Name = "main"
                            main.Parent = bg
                            main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                            main.BorderColor3 = Color3.fromRGB(40, 40, 40)
                            main.Size = UDim2.new(0, 191, 0, 1)
                        end
                        function group:addLabel(args)
                            groupbox.Size += UDim2.new(0, 0, 0, 20)
                            library.multiZindex -= 1
 
                            local div = Instance.new("Frame")
                            local Text = Instance.new("TextLabel")
 
                            div.Name = "div"
                            div.Parent = grouper
                            div.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            div.BackgroundTransparency = 1.000
                            div.BorderSizePixel = 0
                            div.Size = UDim2.new(1, 0, 0, 20)
                            div.ZIndex = topStuff
 
                            Text.Name = "Text"
                            Text.Parent = div
                            Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            Text.BackgroundTransparency = 1.000
                            Text.Position = UDim2.new(0.02, -1, 0, 10)
                            Text.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            Text.Text = args.text
                            Text.TextColor3 = Color3.fromRGB(244, 244, 244)
                            Text.TextSize = 10
                            Text.TextStrokeTransparency = 0.000
                            Text.TextXAlignment = Enum.TextXAlignment.Left
                        end
                        function group:addList(args)
                            if not args.flag or not args.values then return warn("⚠️ incorrect arguments ⚠️") end
                            groupbox.Size += UDim2.new(0, 0, 0, 34)
                            library.multiZindex -= 1
 
                            local list = Instance.new("Frame")
                            local bg = Instance.new("Frame")
                            local main = Instance.new("ScrollingFrame")
                            local button = Instance.new("TextButton")
                            local dumbtriangle = Instance.new("ImageLabel")
                            local valuetext = Instance.new("TextLabel")
                            local gradient = Instance.new("UIGradient")
                            local text = Instance.new("TextLabel")
                            local frame = Instance.new("Frame")
                            local holder = Instance.new("ScrollingFrame")
                            local UIListLayout = Instance.new("UIListLayout")
 
                            list.Name = "list"
                            list.Parent = grouper
                            list.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            list.BackgroundTransparency = 1.000
                            list.BorderSizePixel = 0
                            list.Size = UDim2.new(1, 0, 0, 35)
                            list.ZIndex = library.multiZindex
 
                            bg.Name = "bg"
                            bg.Parent = list
                            bg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            bg.BorderSizePixel = 0
                            bg.Position = UDim2.new(0.02, -1, 0, 16)
                            bg.Size = UDim2.new(0, 205, 0, 15)
 
                            main.Name = "main"
                            main.Parent = bg
                            main.Active = true
                            main.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                            main.BorderColor3 = Color3.fromRGB(25, 25, 25)
                            main.Size = UDim2.new(1, 0, 1, 0)
                            main.CanvasSize = UDim2.new(0, 0, 0, 0)
                            main.ScrollBarThickness = 0
 
                            button.Name = "button"
                            button.Parent = main
                            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            button.BackgroundTransparency = 1.000
                            button.Size = UDim2.new(0, 191, 1, 0)
                            button.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            button.Text = ""
                            button.TextColor3 = Color3.fromRGB(0, 0, 0)
                            button.TextSize = 10
 
                            dumbtriangle.Name = "dumbtriangle"
                            dumbtriangle.Parent = main
                            dumbtriangle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                            dumbtriangle.BackgroundTransparency = 1.000
                            dumbtriangle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            dumbtriangle.BorderSizePixel = 0
                            dumbtriangle.Position = UDim2.new(1, -11, 0.5, -3)
                            dumbtriangle.Size = UDim2.new(0, 7, 0, 6)
                            dumbtriangle.ZIndex = 3
                            dumbtriangle.Image = "rbxassetid://8532000591"
                            dumbtriangle.ImageColor3 = Color3.fromRGB(255, 255, 255)
 
                            valuetext.Name = "valuetext"
                            valuetext.Parent = main
                            valuetext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            valuetext.BackgroundTransparency = 1.000
                            valuetext.Position = UDim2.new(0.00200000009, 2, 0, 7)
                            valuetext.ZIndex = 2
                            valuetext.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            valuetext.Text = ""
                            valuetext.TextColor3 = Color3.fromRGB(244, 244, 244)
                            valuetext.TextSize = 10
                            valuetext.TextStrokeTransparency = 0.000
                            valuetext.TextXAlignment = Enum.TextXAlignment.Left
 
                            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(105, 105, 105)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(121, 121, 121))}
                            gradient.Rotation = 90
                            gradient.Name = "gradient"
                            gradient.Parent = main
 
                            text.Name = "text"
                            text.Parent = list
                            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            text.BackgroundTransparency = 1.000
                            text.Position = UDim2.new(0.0299999993, -1, 0, 7)
                            text.ZIndex = 2
                            text.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            text.Text = args.text or args.flag
                            text.TextColor3 = Color3.fromRGB(244, 244, 244)
                            text.TextSize = 10
                            text.TextStrokeTransparency = 0.000
                            text.TextXAlignment = Enum.TextXAlignment.Left
 
                            frame.Name = "frame"
                            frame.Parent = list
                            frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
                            frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            frame.BorderSizePixel = 0
                            frame.Position = UDim2.new(0.0299999993, -1, 0.605000019, 15)
                            frame.Size = UDim2.new(0, 203, 0, 0)
                            frame.Visible = false
                            frame.ZIndex = library.multiZindex
 
                            holder.Name = "holder"
                            holder.Parent = frame
                            holder.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                            holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            holder.Size = UDim2.new(1, 0, 1, 0)
                            holder.ScrollBarThickness = 1.5
 
                            UIListLayout.Parent = holder
                            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
 
                            local function updateValue(value)
                                if value == nil then valuetext.Text = "nil" return end
                                if args.multiselect then
                                    if type(value) == "string" then
                                    if not table.find(library.options[args.flag].values,value) then return end
                                    if table.find(library.flags[args.flag],value) then
                                        for i,v in pairs(library.flags[args.flag]) do
                                            if v == value then
                                                table.remove(library.flags[args.flag],i)
                                            end
                                        end
                                    else
                                        table.insert(library.flags[args.flag],value)
                                    end
                                    else
                                    library.flags[args.flag] = value
                                    end
                                    local buttonText = ""
                                    for i,v in pairs(library.flags[args.flag]) do
                                    local jig = i ~= #library.flags[args.flag] and "," or ""
                                    buttonText = buttonText..v..jig
                                    end
                                    if buttonText == "" then buttonText = "..." end
                                    for i,v in next, holder:GetChildren() do
                                    if v.ClassName ~= "Frame" then continue end
                                    v.off.TextColor3 = Color3.fromRGB(155, 155, 155)
                                        for _i,_v in next, library.flags[args.flag] do
                                            if v.Name == _v then
                                                v.off.TextColor3 = Color3.new(1,1,1)
                                            end
                                        end
                                    end
                                    valuetext.Text = buttonText
                                    if args.callback then
                                    args.callback(library.flags[args.flag])
                                    end
                                else
                                    if not table.find(library.options[args.flag].values,value) then value = library.options[args.flag].values[1] end
                                    library.flags[args.flag] = value
                                    for i,v in next, holder:GetChildren() do
                                    if v.ClassName ~= "Frame" then continue end
                                    v.off.TextColor3 = Color3.new(0.65,0.65,0.65)
                                    if v.Name == library.flags[args.flag] then
                                            v.off.TextColor3 = library.Colors.libColor
                                        end
                                    end
                                    frame.Visible = false
                                    if library.flags[args.flag] then
                                    valuetext.Text = library.flags[args.flag]
                                    if args.callback then
                                            args.callback(library.flags[args.flag])
                                        end
                                    end
                                end
                            end
                            function refresh(tbl)
                                for i,v in next, holder:GetChildren() do
                                    if v.ClassName == "Frame" then
                                    v:Destroy()
                                    end
                                    frame.Size = UDim2.new(0, 203, 0, 0)
                                end
                                for i,v in pairs(tbl) do
                                    frame.Size += UDim2.new(0, 0, 0, 20)
                                    local option = Instance.new("Frame")
                                    local button_2 = Instance.new("TextButton")
                                    local text_2 = Instance.new("TextLabel")
 
                                    option.Name = v
                                    option.Parent = holder
                                    option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    option.BackgroundTransparency = 1.000
                                    option.Size = UDim2.new(1, 0, 0, 20)
 
                                    button_2.Name = "button"
                                    button_2.Parent = option
                                    button_2.BackgroundColor3 = Color3.fromRGB(10,10,10)
                                    button_2.BackgroundTransparency = 0.850
                                    button_2.BorderSizePixel = 0
                                    button_2.Size = UDim2.new(1, 0, 1, 0)
                                    button_2.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                                    button_2.BorderColor3 = Color3.fromRGB(25,25,25)
                                    button_2.Text = ""
                                    button_2.TextColor3 = Color3.fromRGB(0, 0, 0)
                                    button_2.TextSize = 10
 
                                    text_2.Name = "off"
                                    text_2.Parent = option
                                    text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    text_2.BackgroundTransparency = 1.000
                                    text_2.Position = UDim2.new(0, 4, 0, 0)
                                    text_2.Size = UDim2.new(0, 0, 1, 0)
                                    text_2.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                                    text_2.Text = v
                                    text_2.TextColor3 = args.multiselect and Color3.fromRGB(125, 125, 125) or library.Colors.libColor
                                    text_2.TextSize = 10
                                    text_2.TextStrokeTransparency = 0.000
                                    text_2.TextXAlignment = Enum.TextXAlignment.Left
 
                                    button_2.MouseButton1Click:Connect(function()
                                            updateValue(v)
                                        end)
                                            button_2.MouseEnter:connect(function()
                                            button_2.BorderColor3 = library.Colors.libColor
                                            button_2.BorderSizePixel = 1
        
                                            button_2.MouseLeave:connect(function()
                                            button_2.BorderColor3 = Color3.fromRGB(1,1,1)
                                            button_2.BorderSizePixel = 0
                                        end)
                                    end)
                                end
                                library.options[args.flag].values = tbl
                                updateValue(table.find(library.options[args.flag].values,library.flags[args.flag]) and library.flags[args.flag] or library.options[args.flag].values[1])
                            end
 
                            button.MouseButton1Click:Connect(function()
                            if not library.colorpicking then
                                frame.Visible = not frame.Visible
                            end
                            end)
                            button.MouseEnter:Connect(function()
                                library:Tween(main, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BorderColor3 = library.Colors.libColor})
                            end)
                            
                            button.MouseLeave:Connect(function()
                              library:Tween(main, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(25,25,25)})
                            end) 
 
                            table.insert(library.toInvis,frame)
                            library.flags[args.flag] = args.multiselect and {} or ""
                            library.options[args.flag] = {type = "list",changeState = updateValue,values = args.values,refresh = refresh,skipflag = args.skipflag,oldargs = args}
                            refresh(args.values)
                            updateValue(args.value or not args.multiselect and args.values[1] or "abcdefghijklmnopqrstuwvxyz")
                        end
                        function group:addConfigbox(args)
                            if not args.flag or not args.values then return warn("⚠️ incorrect arguments ⚠️") end
                            groupbox.Size += UDim2.new(0, 0, 0, 138)
                            library.multiZindex -= 1
 
                            local list2 = Instance.new("Frame")
                            local frame = Instance.new("Frame")
                            local main = Instance.new("ScrollingFrame")
                            local holder = Instance.new("ScrollingFrame")
                            local UIListLayout = Instance.new("UIListLayout")
                            local dwn = Instance.new("ImageLabel")
                            local up = Instance.new("ImageLabel")
 
                            list2.Name = "list2"
                            list2.Parent = grouper
                            list2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            list2.BackgroundTransparency = 1.000
                            list2.BorderSizePixel = 0
                            list2.Position = UDim2.new(0, 0, 0.108108111, 0)
                            list2.Size = UDim2.new(1, 0, 0, 138)
 
                            frame.Name = "frame"
                            frame.Parent = list2
                            frame.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                            frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            frame.BorderSizePixel = 2
                            frame.Position = UDim2.new(0.02, -1, 0.0439999998, 0)
                            frame.Size = UDim2.new(0, 205, 0, 128)
 
                            main.Name = "main"
                            main.Parent = frame
                            main.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                            main.BorderColor3 = Color3.fromRGB(14, 14, 14)
                            main.Size = UDim2.new(1, 0, 1, 0)
                            main.ScrollBarThickness = 1
 
                            holder.Name = "holder"
                            holder.Parent = main
                            holder.Active = true
                            holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            holder.BackgroundTransparency = 1.000
                            holder.BorderSizePixel = 0
                            holder.Position = UDim2.new(0, 0, 0.00571428565, 0)
                            holder.Size = UDim2.new(1, 0, 1, 0)
                            holder.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                            holder.CanvasSize = UDim2.new(0, 0, 0, 0)
                            holder.ScrollBarThickness = 1
                            holder.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                            holder.AutomaticCanvasSize = Enum.AutomaticSize.Y
                            holder.ScrollingEnabled = true
                            holder.ScrollBarImageTransparency = 0
 
                            UIListLayout.Parent = holder
 
                            dwn.Name = "dwn"
                            dwn.Parent = frame
                            dwn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                            dwn.BackgroundTransparency = 1.000
                            dwn.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            dwn.BorderSizePixel = 0
                            dwn.Position = UDim2.new(0.930000007, 4, 1, -9)
                            dwn.Size = UDim2.new(0, 7, 0, 6)
                            dwn.ZIndex = 3
                            dwn.Image = "rbxassetid://8548723563"
                            dwn.Visible = false
 
                            up.Name = "up"
                            up.Parent = frame
                            up.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                            up.BackgroundTransparency = 1.000
                            up.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            up.BorderSizePixel = 0
                            up.Position = UDim2.new(0, 3, 0, 3)
                            up.Size = UDim2.new(0, 7, 0, 6)
                            up.ZIndex = 3
                            up.Image = "rbxassetid://8548757311"
                            up.Visible = false
 
                            local function updateValue(value)
                                if value == nil then return end
                                if not table.find(library.options[args.flag].values,value) then value = library.options[args.flag].values[1] end
                                library.flags[args.flag] = value
                                for i,v in next, holder:GetChildren() do
                                    if v.ClassName ~= "Frame" then continue end
                                    if v.text.Text == library.flags[args.flag] then
                                    v.text.TextColor3 = library.Colors.libColor
                                    else
                                    v.text.TextColor3 = Color3.fromRGB(255,255,255)
                                    end
                                end
                                if library.flags[args.flag] then
                                    if args.callback then
                                    args.callback(library.flags[args.flag])
                                    end
                                end
                                holder.Visible = true
                            end
                            holder:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
                            up.Visible = (holder.CanvasPosition.Y > 1)
                            dwn.Visible = (holder.CanvasPosition.Y + 1 < (holder.AbsoluteCanvasSize.Y - holder.AbsoluteSize.Y))
                            end)
                            function refresh(tbl)
                                for i,v in next, holder:GetChildren() do
                                    if v.ClassName == "Frame" then
                                    v:Destroy()
                                    end
                                end
                                for i,v in pairs(tbl) do
                                    local item = Instance.new("Frame")
                                    local button = Instance.new("TextButton")
                                    local text = Instance.new("TextLabel")
 
                                    item.Name = v
                                    item.Parent = holder
                                    item.Active = true
                                    item.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                    item.BackgroundTransparency = 1.000
                                    item.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                    item.BorderSizePixel = 0
                                    item.Size = UDim2.new(1, 0, 0, 18)
 
                                    button.Parent = item
                                    button.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                                    button.BackgroundTransparency = 1
                                    button.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                    button.BorderSizePixel = 0
                                    button.Size = UDim2.new(1, 0, 1, 0)
                                    button.Text = ""
                                    button.TextTransparency = 1.000
 
                                    text.Name = 'text'
                                    text.Parent = item
                                    text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    text.BackgroundTransparency = 1.000
                                    text.Size = UDim2.new(1, 0, 0, 18)
                                    text.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                                    text.Text = v
                                    text.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    text.TextSize = 10
                                    text.TextStrokeTransparency = 0.000
 
                                    button.MouseButton1Click:Connect(function()
                                    updateValue(v)
                                    end)
                                end
 
                                holder.Visible = true
                                library.options[args.flag].values = tbl
                                updateValue(table.find(library.options[args.flag].values,library.flags[args.flag]) and library.flags[args.flag] or library.options[args.flag].values[1])
                            end
 
                            library.flags[args.flag] = ""
                            library.options[args.flag] = {type = "cfg",changeState = updateValue,values = args.values,refresh = refresh,skipflag = args.skipflag,oldargs = args}
                            refresh(args.values)
                            updateValue(args.value or not args.multiselect and args.values[1] or "abcdefghijklmnopqrstuwvxyz")
                        end
                        function group:addColorpicker(args)
                            if not args.flag then return warn("⚠️ incorrect arguments ⚠️") end
                            groupbox.Size += UDim2.new(0, 0, 0, 20)
                            library.multiZindex -= 1
                            jigCount -= 1
                            topStuff -= 1
 
                            local colorpicker = Instance.new("Frame")
                            local back = Instance.new("Frame")
                            local mid = Instance.new("Frame")
                            local front = Instance.new("Frame")
                            local text = Instance.new("TextLabel")
                            local colorpicker_2 = Instance.new("Frame")
                            local button = Instance.new("TextButton")
                            local colorFrame = Instance.new("Frame")
                            local colorFrame_2 = Instance.new("Frame")
                            local hueframe = Instance.new("Frame")
                            local main = Instance.new("Frame")
                            local hue = Instance.new("ImageLabel")
                            local pickerframe = Instance.new("Frame")
                            local main_2 = Instance.new("Frame")
                            local picker = Instance.new("ImageLabel")
                            local clr = Instance.new("Frame")
                            local copy = Instance.new("TextButton")
                            local CurrentColorFrame = Instance.new("Frame")
                            local CurrentColorFrame_Text = Instance.new("TextLabel")
 
                            colorpicker.Name = "colorpicker"
                            colorpicker.Parent = grouper
                            colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            colorpicker.BackgroundTransparency = 1.000
                            colorpicker.BorderSizePixel = 0
                            colorpicker.Size = UDim2.new(1, 0, 0, 20)
                            colorpicker.ZIndex = topStuff
 
                            text.Name = "text"
                            text.Parent = colorpicker
                            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            text.BackgroundTransparency = 1.000
                            text.Position = UDim2.new(0.02, -1, 0, 10)
                            text.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            text.Text = args.text or args.flag
                            text.TextColor3 = Color3.fromRGB(244, 244, 244)
                            text.TextSize = 10
                            text.TextStrokeTransparency = 0.000
                            text.TextXAlignment = Enum.TextXAlignment.Left
 
                            button.Name = "button"
                            button.Parent = colorpicker
                            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            button.BackgroundTransparency = 1.000
                            button.BorderSizePixel = 0
                            button.Size = UDim2.new(1, 0, 1, 0)
                            button.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            button.Text = ""
                            button.TextColor3 = Color3.fromRGB(0, 0, 0)
                            button.TextSize = 10
 
                            colorpicker_2.Name = "colorpicker"
                            colorpicker_2.Parent = colorpicker
                            colorpicker_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            colorpicker_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            colorpicker_2.BorderSizePixel = 3
                            colorpicker_2.Position = UDim2.new(0.860000014, 4, 0.272000015, 0)
                            colorpicker_2.Size = UDim2.new(0, 20, 0, 10)
 
                            mid.Name = "mid"
                            mid.Parent = colorpicker_2
                            mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
                            mid.BorderColor3 = Color3.fromRGB(25,25,25)
                            mid.BorderSizePixel = 2
                            mid.Size = UDim2.new(1, 0, 1, 0)
 
                            front.Name = "front"
                            front.Parent = mid
                            front.BackgroundColor3 = library.Colors.libColor
                            front.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            front.Size = UDim2.new(1, 0, 1, 0)
                            front.Name = "dontchange"
 
                            local ColorPickerGradient2 = Instance.new("UIGradient", front)
                            ColorPickerGradient2.Name = "dontchange"
                            ColorPickerGradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 75, 75)), ColorSequenceKeypoint.new(0.320, Color3.fromRGB(100, 100, 100)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}
                            ColorPickerGradient2.Rotation = 270
 
                            button.Name = "button"
                            button.Parent = colorpicker
                            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            button.BackgroundTransparency = 1.000
                            button.Size = UDim2.new(0, 202, 0, 22)
                            button.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            button.Text = ""
                            button.ZIndex = args.ontop and topStuff or jigCount
                            button.TextColor3 = Color3.fromRGB(0, 0, 0)
                            button.TextSize = 10
 
                            colorFrame.Name = "colorFrame"
                            colorFrame.Parent = colorpicker
                            colorFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            colorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            colorFrame.BorderSizePixel = 2
                            colorFrame.Position = UDim2.new(0.101092957, 0, 0.75, 0)
                            colorFrame.Size = UDim2.new(0, 187, 0, 178)
 
                            colorFrame_2.Name = "colorFrame"
                            colorFrame_2.Parent = colorFrame
                            colorFrame_2.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            colorFrame_2.BorderColor3 = Color3.fromRGB(60, 60, 60)
                            colorFrame_2.Size = UDim2.new(1, 0, 1, 0)
 
                            hueframe.Name = "hueframe"
                            hueframe.Parent = colorFrame_2
                            hueframe.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            hueframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
                            hueframe.BorderSizePixel = 2
                            hueframe.Position = UDim2.new(-0.0830000022, 18, -0.0559999987, 13)
                            hueframe.Size = UDim2.new(0.25, 110, 0.25, 110)
 
                            main.Name = "main"
                            main.Parent = hueframe
                            main.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            main.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            main.Size = UDim2.new(1, 0, 1, 0)
                            main.ZIndex = 6
 
                            picker.Name = "picker"
                            picker.Parent = main
                            picker.BackgroundColor3 = Color3.fromRGB(232, 0, 255)
                            picker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            picker.BorderSizePixel = 0
                            picker.Size = UDim2.new(1, 0, 1, 0)
                            picker.ZIndex = 104
                            picker.Image = "rbxassetid://2615689005"
 
                            pickerframe.Name = "pickerframe"
                            pickerframe.Parent = colorFrame
                            pickerframe.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            pickerframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
                            pickerframe.BorderSizePixel = 2
                            pickerframe.Position = UDim2.new(0.801000025, 14, -0.0559999987, 13)
                            pickerframe.Size = UDim2.new(0, 20, 0.25, 110)
 
                            CurrentColorFrame.Name = "CurrentColorFrame"
                            CurrentColorFrame.Parent = colorFrame
                            CurrentColorFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            CurrentColorFrame.BorderColor3 = Color3.fromRGB(15,15,15)
                            CurrentColorFrame.BorderSizePixel = 2
                            CurrentColorFrame.Position = UDim2.new(0.98, 0, 0.915, 0)
                            CurrentColorFrame.Size = UDim2.new(-0.965, 0, 0, 12)
 
                            CurrentColorFrame_Text.Name = "CurrentColorFrame_Text"
                            CurrentColorFrame_Text.Parent = CurrentColorFrame
                            CurrentColorFrame_Text.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            CurrentColorFrame_Text.BackgroundTransparency = 1.000
                            CurrentColorFrame_Text.BorderSizePixel = 0
                            CurrentColorFrame_Text.Size = UDim2.new(1, 0, 1, 0)
                            CurrentColorFrame_Text.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            CurrentColorFrame_Text.Text = args.text or args.flag
                            CurrentColorFrame_Text.TextColor3 = library.Colors.libColor
                            CurrentColorFrame_Text.TextSize = 10
                            CurrentColorFrame_Text.TextStrokeTransparency = 0.000
 
                            main_2.Name = "main"
                            main_2.Parent = pickerframe
                            main_2.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            main_2.Size = UDim2.new(0, 20, 1, 0)
                            main_2.ZIndex = 6
 
                            hue.Name = "hue"
                            hue.Parent = main_2
                            hue.BackgroundColor3 = Color3.fromRGB(255, 0, 178)
                            hue.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            hue.BorderSizePixel = 0
                            hue.Size = UDim2.new(0, 20, 1, 0)
                            hue.ZIndex = 104
                            hue.Image = "rbxassetid://2615692420"
 
                            clr.Name = "clr"
                            clr.Parent = colorFrame
                            clr.BackgroundColor3 = Color3.fromRGB(15,15,15)
                            clr.BackgroundTransparency = 1.000
                            clr.BorderColor3 = Color3.fromRGB(30, 30, 30)
                            clr.BorderSizePixel = 2
                            clr.Position = UDim2.new(0.0280000009, 0, 0, 2)
                            clr.Size = UDim2.new(0, 0, 0, 14)
                            clr.ZIndex = 5
 
                            copy.MouseButton1Click:Connect(function()
                            colorFrame.Visible = false
                            end)
 
                            button.MouseButton1Click:Connect(function()
                            colorFrame.Visible = not colorFrame.Visible
                            mid.BorderColor3 = Color3.fromRGB(25,25,25)
                            end)
 
                            button.MouseEnter:Connect(function()
                                library:Tween(mid, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BorderColor3 = library.Colors.libColor})
                            end)
                            
                            button.MouseLeave:Connect(function()
                                library:Tween(mid, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BorderColor3 = Color3.fromRGB(25,25,25)})
                            end) 
 
                            local function updateValue(value,fakevalue)
                                if typeof(value) == "table" then value = fakevalue end
                                library.flags[args.flag] = value
                                front.BackgroundColor3 = value
 
                                local r, g, b = value.r * 255, value.g * 255, value.b * 255
                                CurrentColorFrame_Text.TextColor3 = value
                                CurrentColorFrame_Text.Text = "RGB(" .. math.floor(r) .. ", " .. math.floor(g) .. ", " .. math.floor(b) .. ")"
 
                                if args.callback then
                                    args.callback(value)
                                end
                            end
 
                            local white, black = Color3.new(1,1,1), Color3.new(0,0,0)
                            local colors = {Color3.new(1,0,0),Color3.new(1,1,0),Color3.new(0,1,0),Color3.new(0,1,1),Color3.new(0,0,1),Color3.new(1,0,1),Color3.new(1,0,0)}
                            local heartbeat = RunService.Heartbeat
                            local pickerX,pickerY,hueY = 0,0,0
                            local oldpercentX,oldpercentY = 0,0
 
                            hue.MouseEnter:Connect(function()
                            local input = hue.InputBegan:connect(function(key)
                            if key.UserInputType == Enum.UserInputType.MouseButton1 then
                                while heartbeat:wait() and InputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                    library.colorpicking = true
                                    local percent = (hueY-hue.AbsolutePosition.Y-36)/hue.AbsoluteSize.Y
                                    local num = math.max(1, math.min(7,math.floor(((percent*7+0.5)*100))/100))
                                    local startC = colors[math.floor(num)]
                                    local endC = colors[math.ceil(num)]
                                    local color = white:lerp(picker.BackgroundColor3, oldpercentX):lerp(black, oldpercentY)
                                    picker.BackgroundColor3 = startC:lerp(endC, num-math.floor(num)) or Color3.new(0, 0, 0)
                                    updateValue(color)
                                end
                                library.colorpicking = false
                            end
                            end)
                            local leave
                            leave = hue.MouseLeave:connect(function()
                            input:disconnect()
                            leave:disconnect()
                            end)
                            end)
 
                            picker.MouseEnter:Connect(function()
                            local input = picker.InputBegan:connect(function(key)
                            if key.UserInputType == Enum.UserInputType.MouseButton1 then
                                while heartbeat:wait() and InputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                    library.colorpicking = true
                                    local xPercent = (pickerX-picker.AbsolutePosition.X)/picker.AbsoluteSize.X
                                    local yPercent = (pickerY-picker.AbsolutePosition.Y-36)/picker.AbsoluteSize.Y
                                    local color = white:lerp(picker.BackgroundColor3, xPercent):lerp(black, yPercent)
                                    updateValue(color)
                                    oldpercentX,oldpercentY = xPercent,yPercent
                                end
                                library.colorpicking = false
                            end
                            end)
                            local leave
                            leave = picker.MouseLeave:connect(function()
                            input:disconnect()
                            leave:disconnect()
                            end)
                            end)
 
                            hue.MouseMoved:connect(function(_, y)
                            hueY = y
                            end)
 
                            picker.MouseMoved:connect(function(x, y)
                            pickerX,pickerY = x,y
                            end)
 
                            table.insert(library.toInvis,colorFrame)
                            library.flags[args.flag] = Color3.new(1,1,1)
                            library.options[args.flag] = {type = "colorpicker",changeState = updateValue,skipflag = args.skipflag,oldargs = args}
                            updateValue(args.color or Color3.new(1,1,1))
                        end
                        function group:addKeybind(args)
                            if not args.flag then return warn("⚠️ incorrect arguments ⚠️ - missing args on toggle:keybind") end
                            groupbox.Size += UDim2.new(0, 0, 0, 20)
                            local next = false
                            local keybind = Instance.new("Frame")
                            local text = Instance.new("TextLabel")
                            local button = Instance.new("TextButton")
 
                            keybind.Parent = grouper
                            keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            keybind.BackgroundTransparency = 1.000
                            keybind.BorderSizePixel = 0
                            keybind.Size = UDim2.new(1, 0, 0, 20)
 
                            text.Parent = keybind
                            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            text.BackgroundTransparency = 1.000
                            text.Position = UDim2.new(0.02, -1, 0, 10)
                            text.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            text.Text = args.text or args.flag
                            text.TextColor3 = Color3.fromRGB(244, 244, 244)
                            text.TextSize = 10
                            text.TextStrokeTransparency = 0.000
                            text.TextXAlignment = Enum.TextXAlignment.Left
 
                            button.Parent = keybind
                            button.BackgroundColor3 = Color3.fromRGB(187, 131, 255)
                            button.BackgroundTransparency = 1.000
                            button.BorderSizePixel = 0
                            button.Position = UDim2.new(7.09711117e-08, 0, 0, 0)
                            button.Size = UDim2.new(0.02, 0, 1, 0)
                            button.FontFace = Font.fromId(12187362578, Enum.FontWeight.Regular)
                            button.Text = "--"
                            button.TextColor3 = Color3.fromRGB(155, 155, 155)
                            button.TextSize = 10
                            button.TextStrokeTransparency = 0.000
                            button.TextXAlignment = Enum.TextXAlignment.Right
 
                            function updateValue(val)
                                if library.colorpicking then return end
                                library.flags[args.flag] = val
                                button.Text = keynames[val] or "["..val.Name.."]"
                            end
                            InputService.InputBegan:Connect(function(key)
                            local key = key.KeyCode == Enum.KeyCode.Unknown and key.UserInputType or key.KeyCode
                            if next then
                                if not table.find(library.blacklisted,key) then
                                    next = false
                                    library.flags[args.flag] = key
                                    button.Text = keynames[key] or "["..key.Name.."]"
                                    button.TextColor3 = Color3.fromRGB(155, 155, 155)
                                end
                            end
                            if not next and key == library.flags[args.flag] and args.callback then
                                    args.callback(key)
                                end
                            end)
 
                            button.MouseButton1Click:Connect(function()
                            if library.colorpicking then return end
                                library.flags[args.flag] = Enum.KeyCode.Unknown
                                button.Text = "..."
                                button.TextColor3 = Color3.new(0.2,0.2,0.2)
                                next = true
                            end)
 
                            library.flags[args.flag] = Enum.KeyCode.Unknown
                            library.options[args.flag] = {type = "keybind",changeState = updateValue,skipflag = args.skipflag,oldargs = args}
                            updateValue(args.key or Enum.KeyCode.Unknown)
                        end
                            return group, groupbox
                        end
                            return tab
                        end
 
                        --// Configs
                        function contains(list, x)
                        for _, v in pairs(list) do
                            if v == x then return true end
                            end return false end
                            function library:createConfig()
                                makefolder("untitled.wtf")
                                local name = library.flags["config_name"]
                                if contains(library.options["config_box"].values, name) then return library:Notify(name..".cfg already exists!", 5) end
                                if name == "" then return library:Notify("You need to put a name in!", 5) end
                                local jig = {}
                                for i,v in next, library.flags do
                                    if library.options[i].skipflag then continue end
                                    if typeof(v) == "Color3" then jig[i] = {v.R,v.G,v.B}
                                elseif typeof(v) == "EnumItem" then jig[i] = {string.split(tostring(v),".")[2],string.split(tostring(v),".")[3]}
                                else jig[i] = v
                                end
                            end
                            writefile("untitled.wtf/"..name..".cfg",game:GetService("HttpService"):JSONEncode(jig))
                            library:Notify("Succesfully created config "..name..".cfg!", 5)
                            library:refreshConfigs()
                        end
 
                        function library:saveConfig()
                            pcall(function()
                                makefolder("untitled.wtf")
                                local name = library.flags["config_box"]
                                if not name then
                                    return
                                end
                                
                                local jig = {}
                                for i, v in pairs(library.flags) do
                                    if library.options[i].skipflag then
                                        continue
                                    end
                                    if typeof(v) == "Color3" then
                                        jig[i] = {v.R, v.G, v.B}
                                    elseif typeof(v) == "EnumItem" then
                                        jig[i] = {string.split(tostring(v), ".")[2], string.split(tostring(v), ".")[3]}
                                    else
                                        jig[i] = v
                                    end
                                end
                                writefile(name, game:GetService("HttpService"):JSONEncode(jig))
                                library:Notify("Successfully updated config " .. name .. ".cfg!", 5)
                                library:refreshConfigs()
                            end)
                        end                                               
 
                        function library:loadConfig()
                            local name = library.flags["config_box"]
                                if not isfile(name) then
                                    library:Notify("Config file not found!")
                                    return 
                                 end
                                 local config = game:GetService("HttpService"):JSONDecode(readfile(name))
                                    for i,v in next, library.options do
                                     spawn(function()
                                         pcall(function()
                                         if config[i] then
                                             if v.type == "colorpicker" then v.changeState(Color3.new(config[i][1],config[i][2],config[i][3]))
                                         elseif v.type == "keybind" then v.changeState(Enum[config[i][1]][config[i][2]])
                                         else
                                             if config[i] ~= library.flags[i] then v.changeState(config[i]) end
                                         end
                                         else
                                         if v.type == "toggle" then v.changeState(false) v.riskcfg(v.risky)
                                         elseif v.type == "slider" then v.changeState(v.args.value or 0) v.riskcfg(v.risky)
                                         elseif v.type == "textbox" or v.type == "list" or v.type == "cfg" then v.changeState(v.args.value or v.args.text or "")
                                         elseif v.type == "colorpicker" then v.changeState(v.args.color or Color3.new(1,1,1))
                                         elseif v.type == "list" then v.changeState("")
                                         elseif v.type == "keybind" then v.changeState(v.args.key or Enum.KeyCode.Unknown)
                                    end
                                end
                            end)
                        end)
                    end
                    library:Notify("Succesfully loaded config "..name..".cfg!", 5)
                end
 
                function library:deleteConfig()
                if isfile(library.flags["config_box"]) then delfile(library.flags["config_box"])
                    library:refreshConfigs()
                    end
                end
 
                function library:refreshConfigs()
                    local tbl = {}
                    for i,v in next, listfiles("untitled.wtf") do table.insert(tbl,v) end
                    library.options["config_box"].refresh(tbl)
                end      
            end)()                         
            return library
