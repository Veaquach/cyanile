-- yes, if youre reading this this is the main theme of Cyanile :)
local cmds = getgenv().cyaniletbl
	or {
		{
			"error",
			"This only shows up if it couldn't find commands, please make sure you launched this through Cyanile's cmds command.",
			function() end,
		},
	}
function aui(el, crd)
	local uic = Instance.new("UICorner")
	uic.Parent = el
	uic.CornerRadius = UDim.new(0, crd)
end
function aust(el, color, thick)
	local s = Instance.new("UIStroke")
	s.Parent = el
	s.Color = color
	s.Thickness = thick
end
cloneref = cloneref or function(aa)
	return aa
end
local theme = {
	Main = Color3.fromRGB(15, 40, 200),
	Title = Color3.fromRGB(125, 125, 125),
	Text = Color3.fromRGB(255, 255, 255),
	Secondary = Color3.fromRGB(5, 100, 230),
	Command = Color3.fromRGB(0, 5, 75),
}
local fr = Instance.new("Frame")
fr.Size = UDim2.new(0, 250, 0, 470)
fr.Position = UDim2.new(0.5, -250, 0.5, -250)
fr.Parent = cloneref(game:GetService("CoreGui")):WaitForChild("RobloxGui")
fr.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
aui(fr, 12)
fr.ClipsDescendants = true
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Parent = fr
title.Text = "Cyanile Commands Center"
title.Position = UDim2.new(0, -30, 0, 0)
title.Parent = fr
title.ZIndex = 12
title.BackgroundTransparency = 1
title.TextSize = 14
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(15, 40, 200)
local stroke6 = Instance.new("UIStroke")
stroke6.Parent = title
stroke6.Color = Color3.fromRGB(0, 0, 0)
stroke6.Thickness = 1.5
local gradtable = {}
local canvasgr = Instance.new("CanvasGroup")
canvasgr.Parent = fr
canvasgr.GroupTransparency = 0
canvasgr.BackgroundTransparency = 1
canvasgr.Size = UDim2.new(1.1, 0, 1.1, 0)
local closebtn = Instance.new("TextButton")
closebtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
aui(closebtn, 4)
closebtn.Size = UDim2.new(0, 25, 0, 25)
closebtn.Position = UDim2.new(1, -55, 0, 3)
closebtn.Text = "X"
closebtn.TextColor3 = Color3.fromRGB(75, 75, 75)
closebtn.AutoButtonColor = false
closebtn.Font = Enum.Font.GothamBold
closebtn.TextSize = 22
closebtn.Parent = canvasgr
closebtn.BackgroundTransparency = 1
closebtn.ZIndex = 14
local minbtn = Instance.new("TextButton")
minbtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
aui(minbtn, 4)
minbtn.Size = UDim2.new(0, 25, 0, 25)
minbtn.Position = UDim2.new(1, -82, 0, 3)
minbtn.Text = "^"
minbtn.Rotation = 0
minbtn.TextColor3 = Color3.fromRGB(75, 75, 75)
minbtn.AutoButtonColor = false
minbtn.Font = Enum.Font.GothamBold
minbtn.TextSize = 22
minbtn.Parent = canvasgr
minbtn.BackgroundTransparency = 1
minbtn.ZIndex = 14
local ti = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local tii = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local ts = cloneref(game:GetService("TweenService"))
minbtn.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		if fr.Size == UDim2.new(0, 250, 0, 470) then
			ts:Create(fr, tii, { Size = UDim2.new(0, 250, 0, 30) }):Play()
			ts:Create(minbtn, ti, { Rotation = 180 }):Play()
		elseif fr.Size == UDim2.new(0, 250, 0, 30) then
			ts:Create(fr, tii, { Size = UDim2.new(0, 250, 0, 470) }):Play()
			ts:Create(minbtn, ti, { Rotation = 0 }):Play()
		end
	end
end)
local stroke4 = Instance.new("UIStroke")
stroke4.Parent = closebtn
stroke4.Color = Color3.fromRGB(165, 165, 165)
stroke4.Thickness = 2
local grad4 = Instance.new("UIGradient")
grad4.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 40, 200)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(5, 100, 230)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 5, 75)),
})
local stroke5 = Instance.new("UIStroke")
stroke5.Parent = minbtn
stroke5.Color = Color3.fromRGB(165, 165, 165)
stroke5.Thickness = 2
local grad5 = Instance.new("UIGradient")
grad5.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 40, 200)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(5, 100, 230)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 5, 75)),
})
table.insert(gradtable, grad5)
grad5.Parent = stroke5
local stroke = Instance.new("UIStroke")
stroke.Parent = fr
stroke.Color = Color3.fromRGB(165, 165, 165)
stroke.Thickness = 2
table.insert(gradtable, grad4)
grad4.Parent = stroke4
closebtn.MouseButton1Click:Connect(function()
	ts:Create(canvasgr, ti, { GroupTransparency = 1 }):Play()
	ts:Create(fr, ti, { BackgroundTransparency = 1 }):Play()
	ts:Create(stroke, ti, { Transparency = 1 }):Play()
	ts:Create(title, ti, { TextTransparency = 1 }):Play()
	ts:Create(stroke6, ti, { Transparency = 1 }):Play()
	task.wait(0.26)
	fr:Destroy()
end)
closebtn.MouseEnter:Connect(function()
	grad4.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(5, 100, 230)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(15, 40, 200)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 100, 230)),
	})
end)
closebtn.MouseLeave:Connect(function()
	grad4.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 40, 200)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(5, 100, 230)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 5, 75)),
	})
end)
minbtn.MouseEnter:Connect(function()
	grad5.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(5, 100, 230)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(15, 40, 200)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 100, 230)),
	})
end)
minbtn.MouseLeave:Connect(function()
	grad5.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 40, 200)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(5, 100, 230)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 5, 75)),
	})
end)
fr.BackgroundTransparency = 0.15
local grad = Instance.new("UIGradient")
grad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 40, 200)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(5, 100, 230)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 5, 75)),
})

grad.Parent = stroke
local scrollfr = Instance.new("ScrollingFrame")
scrollfr.Size = UDim2.new(0, 230, 0, 430)
scrollfr.Position = UDim2.new(0, 10, 0, 30)
scrollfr.Parent = canvasgr
scrollfr.BackgroundTransparency = 0.15
aui(scrollfr, 12)
scrollfr.ScrollBarThickness = 0
scrollfr.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
local stroke2 = Instance.new("UIStroke")
stroke2.Parent = scrollfr
stroke2.Color = Color3.fromRGB(165, 165, 165)
stroke2.Thickness = 2
local grad2 = Instance.new("UIGradient")
grad2.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 40, 200)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(5, 100, 230)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 5, 75)),
})
grad2.Parent = stroke2
grad2.Name = "grad2"
local ull = Instance.new("UIListLayout")
ull.Parent = scrollfr
ull.SortOrder = Enum.SortOrder.LayoutOrder
ull.Padding = UDim.new(0, 10)
local padding = Instance.new("UIPadding")
padding.Parent = scrollfr
padding.PaddingTop = UDim.new(0, 10)
padding.PaddingLeft = UDim.new(0, 10)
padding.PaddingRight = UDim.new(0, 10)
padding.PaddingBottom = UDim.new(0, 10)
ull:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scrollfr.CanvasSize = UDim2.new(0, 0, 0, ull.AbsoluteContentSize.Y + 20)
end)
local dragging = false
local dragStart
local startPos
fr.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = fr.Position
	end
end)

fr.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)
local UIS = game:GetService("UserInputService")
UIS.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		cloneref(game:GetService("TweenService"))
			:Create(fr, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Position = UDim2.new(
					startPos.X.Scale,
					startPos.X.Offset + delta.X,
					startPos.Y.Scale,
					startPos.Y.Offset + delta.Y
				),
			})
			:Play()
	end
end)
function addcmd(name, desc, func)
	local frr = Instance.new("Frame")
	frr.Size = UDim2.new(0, 210, 0, 0)
	frr.Position = UDim2.new(0, 10, 0, 10)
	frr.Parent = scrollfr
	frr.BackgroundTransparency = 0.15
	aui(frr, 7)
	frr.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	frr.AutomaticSize = Enum.AutomaticSize.Y
	local ilist = Instance.new("UIListLayout")
	ilist.Parent = frr
	ilist.SortOrder = Enum.SortOrder.LayoutOrder
	ilist.Padding = UDim.new(0, 2)
	local padding = Instance.new("UIPadding")
	padding.Parent = frr
	padding.PaddingTop = UDim.new(0, 10)
	padding.PaddingLeft = UDim.new(0, 10)
	padding.PaddingRight = UDim.new(0, 8)
	padding.PaddingBottom = UDim.new(0, 8)
	local stroke3 = Instance.new("UIStroke")
	stroke3.Parent = frr
	stroke3.Color = Color3.fromRGB(165, 165, 165)
	stroke3.Thickness = 2
	local grad3 = Instance.new("UIGradient")
	grad3.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 40, 200)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(5, 100, 230)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 5, 75)),
	})
	grad3.Parent = stroke3
	table.insert(gradtable, grad3)
	local namee = Instance.new("TextLabel")
	namee.Size = UDim2.new(0, 220, 0, 30)
	namee.Position = UDim2.new(0, 5, 0, 5)
	namee.Parent = frr
	namee.BackgroundTransparency = 1
	namee.Text = " " .. tostring(name)
	namee.TextSize = 12
	namee.Font = Enum.Font.GothamBold
	namee.TextColor3 = Color3.fromRGB(255, 255, 255)
	namee.TextXAlignment = Enum.TextXAlignment.Left
	local descc = Instance.new("TextLabel")
	descc.Size = UDim2.new(1, 0, 0, 0)
	descc.Position = UDim2.new(0, 5, 0, 30)
	descc.Parent = frr
	descc.BackgroundTransparency = 1
	descc.AutomaticSize = Enum.AutomaticSize.Y
	descc.Text = tostring(desc)
	descc.TextSize = 14
	descc.Font = Enum.Font.Gotham
	descc.TextColor3 = Color3.fromRGB(255, 255, 255)
	descc.TextXAlignment = Enum.TextXAlignment.Left
	descc.TextWrapped = true
	descc.TextYAlignment = Enum.TextYAlignment.Top
end
for name, data in pairs(cmds) do
	if type(data) == "table" and data.desc then
		addcmd(data.displaynms or name, data.desc, data.func)
	elseif type(data) == "table" then
		addcmd(data[1], data[2], data[3])
	end
end
local spinconn
task.spawn(function()
	spinconn = cloneref(game:GetService("RunService")).RenderStepped:Connect(function()
		grad.Rotation = (grad.Rotation + 1) % 360
		grad2.Rotation = (grad2.Rotation + 1) % 360
		for i, v in pairs(gradtable) do
			v.Rotation = (v.Rotation + 1) % 360
		end
	end)
end)
