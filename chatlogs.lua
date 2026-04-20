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
local cloneref = cloneref or function(aa)
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
fr.Size = UDim2.new(0, 540, 0, 580)
fr.Position = UDim2.new(0.5, -250, 0.5, -260)
fr.Parent = cloneref(game:GetService("CoreGui")):WaitForChild("RobloxGui")
fr.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
aui(fr, 12)
fr.ClipsDescendants = true
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Parent = fr
title.Text = "Logging With Cyanile"
title.Position = UDim2.new(0, 90, 0, 0)
title.AnchorPoint = Vector2.new(0.5, 0)
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
closebtn.Position = UDim2.new(1, -82, 0, 3)
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
minbtn.Position = UDim2.new(1, -109, 0, 3)
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
		if fr.Size == UDim2.new(0, 540, 0, 580) then
			ts:Create(fr, tii, { Size = UDim2.new(0, 540, 0, 30) }):Play()
			task.wait(0.25)
			ts:Create(fr, tii, { Size = UDim2.new(0, 270, 0, 30) }):Play()
			ts:Create(minbtn, tii, { Position = UDim2.new(0, 210, 0, 0) }):Play()
			ts:Create(closebtn, tii, { Position = UDim2.new(0, 235, 0, 0) }):Play()
			ts:Create(minbtn, ti, { Rotation = 180 }):Play()
		elseif fr.Size == UDim2.new(0, 270, 0, 30) then
			ts:Create(fr, tii, { Size = UDim2.new(0, 270, 0, 580) }):Play()
			task.wait(0.25)
			ts:Create(fr, tii, { Size = UDim2.new(0, 540, 0, 580) }):Play()
			ts:Create(closebtn, tii, { Position = UDim2.new(1, -82, 0, 3) }):Play()
			ts:Create(minbtn, tii, { Position = UDim2.new(1, -109, 0, 3) }):Play()
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
scrollfr.Size = UDim2.new(0, 520, 0, 540)
scrollfr.Position = UDim2.new(0, 10, 0, 30)
scrollfr.Parent = canvasgr
scrollfr.BackgroundTransparency = 0.15
aui(scrollfr, 12)
scrollfr.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
scrollfr.ScrollBarThickness = 4
scrollfr.ScrollBarImageColor3 = Color3.fromRGB(15, 40, 200)
scrollfr.CanvasSize = UDim2.new(0, 0, 0, 0)
local stroke7 = Instance.new("UIStroke")
stroke7.Parent = scrollfr
stroke7.Color = Color3.fromRGB(165, 165, 165)
stroke7.Thickness = 2
local grad7 = Instance.new("UIGradient")
grad7.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 40, 200)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(5, 100, 230)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 5, 75)),
})
local ull = Instance.new("UIListLayout")
ull.Parent = scrollfr
ull.SortOrder = Enum.SortOrder.LayoutOrder
ull.Padding = UDim.new(0, 5)
local padding = Instance.new("UIPadding")
padding.Parent = scrollfr
padding.PaddingTop = UDim.new(0, 5)
padding.PaddingLeft = UDim.new(0, 5)
padding.PaddingRight = UDim.new(0, 5)
padding.PaddingBottom = UDim.new(0, 5)
ull:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scrollfr.CanvasSize = UDim2.new(0, 0, 0, ull.AbsoluteContentSize.Y + 20)
end)
function addlog(player, text, issys)
	local isme = player == game.Players.LocalPlayer
	local function name(aaaa)
		if aaaa.DisplayName and aaaa.DisplayName ~= aaaa.Name then
			namee = " " .. aaaa.DisplayName .. " (@" .. aaaa.Name .. ") "
		else
			namee = " " .. aaaa.Name .. " "
		end
		if aaaa == game.Players.LocalPlayer then
			namee = " " .. game.Players.LocalPlayer.Name .. " (YOU) "
		end
		return namee
	end
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0.82, 0, 0, 0)
	label.AutomaticSize = Enum.AutomaticSize.Y
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Font = Enum.Font.GothamBold
	label.TextSize = 14
	label.TextWrapped = true
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.Text = issys and os.date("%I:%M:%S %p") .. " [SYSTEM]: " .. text
		or os.date("%I:%M:%S %p") .. " [" .. name(player) .. "]: " .. text
	label.Parent = scrollfr
	label.BackgroundTransparency = 1
	if issys then
		local textgrad = Instance.new("UIGradient")
		textgrad.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 180, 255)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 80, 200)),
		})
		textgrad.Parent = label
	elseif isme then
		local textgrad = Instance.new("UIGradient")
		textgrad.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 40, 200)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(5, 100, 230)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 5, 75)),
		})
		textgrad.Parent = label
	end
	if not issys then
		local button = Instance.new("TextButton")
		button.Size = UDim2.new(0, 25, 0, label.AbsoluteSize.Y)
		button.TextXAlignment = Enum.TextXAlignment.Center
		button.Text = "GOTO"
		button.Font = Enum.Font.GothamBold
		button.AutoButtonColor = false
		button.TextScaled = true
		button.TextColor3 = Color3.fromRGB(255, 255, 255)
		button.BackgroundTransparency = 0.15
		button.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		aui(button, 12)
		button.Parent = label
		button.Position = UDim2.new(0, label.AbsoluteSize.X + 5, 0, 0)
		button.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character:WaitForChild(
					"HumanoidRootPart"
				).CFrame + Vector3.new(3, 0, 0)
			end
		end)
		local button2 = Instance.new("TextButton")
		button2.Size = UDim2.new(0, 25, 0, label.AbsoluteSize.Y)
		button2.TextXAlignment = Enum.TextXAlignment.Center
		button2.Text = "COPY"
		button2.Font = Enum.Font.GothamBold
		button2.TextScaled = true
		button2.AutoButtonColor = false
		button2.TextColor3 = Color3.fromRGB(255, 255, 255)
		button2.BackgroundTransparency = 0.15
		button2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		aui(button2, 12)
		button2.Parent = label
		button2.Position = UDim2.new(0, label.AbsoluteSize.X + 35, 0, 0)
		button2.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				setclipboard(text)
			end
		end)
		local button3 = Instance.new("TextButton")
		button3.Size = UDim2.new(0, 25, 0, label.AbsoluteSize.Y)
		button3.TextXAlignment = Enum.TextXAlignment.Center
		button3.Text = "HLGT"
		button3.Font = Enum.Font.GothamBold
		button3.AutoButtonColor = false
		button3.TextScaled = true
		button3.TextColor3 = Color3.fromRGB(255, 255, 255)
		button3.BackgroundTransparency = 0.15
		button3.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		aui(button3, 12)
		button3.Parent = label
		button3.Position = UDim2.new(0, label.AbsoluteSize.X + 65, 0, 0)
		button3.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				local exst = player.Character:FindFirstChildOfClass("Highlight")
				if exst then
					exst:Destroy()
				else
					local hlg = Instance.new("Highlight")
					hlg.OutlineColor = Color3.fromRGB(255, 255, 255)
					hlg.FillColor = Color3.fromRGB(255, 255, 255)
					hlg.FillTransparency = 0.8
					hlg.OutlineTransparency = 0
					hlg.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					hlg.Parent = player.Character
				end
			end
		end)
		local stroke8 = Instance.new("UIStroke")
		stroke8.Parent = button
		stroke8.Color = Color3.fromRGB(165, 165, 165)
		stroke8.Thickness = 2
		local grad8 = Instance.new("UIGradient")
		grad8.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 40, 200)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(5, 100, 230)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 5, 75)),
		})
		grad8.Parent = stroke8
		local stroke9 = Instance.new("UIStroke")
		stroke9.Parent = button2
		stroke9.Color = Color3.fromRGB(165, 165, 165)
		stroke9.Thickness = 2
		local grad9 = Instance.new("UIGradient")
		grad9.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 40, 200)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(5, 100, 230)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 5, 75)),
		})
		grad9.Parent = stroke9
		local stroke0 = Instance.new("UIStroke")
		stroke0.Parent = button3
		stroke0.Color = Color3.fromRGB(165, 165, 165)
		stroke0.Thickness = 2
		local grad0 = Instance.new("UIGradient")
		grad0.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 40, 200)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(5, 100, 230)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 5, 75)),
		})
		grad0.Parent = stroke0
		button.MouseEnter:Connect(function()
			ts:Create(button, tii, { BackgroundColor3 = Color3.fromRGB(150, 150, 150) }):Play()
		end)
		button.MouseLeave:Connect(function()
			ts:Create(button, tii, { BackgroundColor3 = Color3.fromRGB(15, 15, 15) }):Play()
		end)
		button2.MouseEnter:Connect(function()
			ts:Create(button2, tii, { BackgroundColor3 = Color3.fromRGB(150, 150, 150) }):Play()
		end)
		button2.MouseLeave:Connect(function()
			ts:Create(button2, tii, { BackgroundColor3 = Color3.fromRGB(15, 15, 15) }):Play()
		end)
		button3.MouseEnter:Connect(function()
			ts:Create(button3, tii, { BackgroundColor3 = Color3.fromRGB(150, 150, 150) }):Play()
		end)
		button3.MouseLeave:Connect(function()
			ts:Create(button3, tii, { BackgroundColor3 = Color3.fromRGB(15, 15, 15) }):Play()
		end)
	end
	task.spawn(function()
		task.wait(0.1)
		local layout = scrollfr:FindFirstChildOfClass("UIListLayout")
		local cansize = scrollfr.AbsoluteCanvasSize.Y
		local winsize = scrollfr.AbsoluteWindowSize.Y
		local currpos = scrollfr.CanvasPosition.Y
		if currpos + winsize >= cansize - 40 then
			game:GetService("TweenService")
				:Create(scrollfr, TweenInfo.new(0.02, Enum.EasingStyle.Quad), {
					CanvasPosition = Vector2.new(0, math.max(0, cansize - winsize)),
				})
				:Play()
		end
	end)
end
local chattedevent = {}
for i, v in game.Players:GetPlayers() do
	chattedevent[v] = v.Chatted:Connect(function(msg)
		addlog(v, tostring(msg))
	end)
end
game.Players.PlayerRemoving:Connect(function(plr)
	if chattedevent[plr] then
		chattedevent[plr]:Disconnect()
	end
	addlog(
		game.Players.LocalPlayer,
		"Player "
			.. if plr.DisplayName and plr.DisplayName ~= plr.Name
				then plr.DisplayName .. " (@" .. plr.DisplayName .. ")" .. " has left the game."
				else plr.Name .. " has left the game.",
		true
	)
end)
game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Wait()
	chattedevent[plr] = plr.Chatted:Connect(function(msg)
		addlog(plr, tostring(msg))
	end)
	addlog(
		game.Players.LocalPlayer,
		"Player "
			.. if plr.DisplayName and plr.DisplayName ~= plr.Name
				then plr.DisplayName .. " (@" .. plr.DisplayName .. ")" .. " has joined the game."
				else plr.Name .. " has joined the game.",
		true
	)
end)
grad7.Parent = stroke7
table.insert(gradtable, grad7)
closebtn.MouseButton1Click:Connect(function()
	for i, v in chattedevent do
		v:Disconnect()
	end
	ts:Create(canvasgr, ti, { GroupTransparency = 1 }):Play()
	ts:Create(fr, ti, { BackgroundTransparency = 1 }):Play()
	ts:Create(stroke, ti, { Transparency = 1 }):Play()
	ts:Create(title, ti, { TextTransparency = 1 }):Play()
	ts:Create(stroke6, ti, { Transparency = 1 }):Play()
	task.wait(0.26)
	fr:Destroy()
end)
local dragging = false
local dragStart
local startPos
local sliderDragging = false
fr.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 and not sliderDragging then
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
local spinconn
task.spawn(function()
	spinconn = cloneref(game:GetService("RunService")).RenderStepped:Connect(function()
		grad.Rotation = (grad.Rotation + 1) % 360
		for i, v in pairs(gradtable) do
			v.Rotation = (v.Rotation + 1) % 360
		end
	end)
end)
