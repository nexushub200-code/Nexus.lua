local Players=game:GetService("Players")
local TweenService=game:GetService("TweenService")
local LP=Players.LocalPlayer

local C={
	BG=Color3.fromRGB(8,3,9),
	BG2=Color3.fromRGB(20,4,13),
	P1=Color3.fromRGB(38,5,18),
	P2=Color3.fromRGB(55,7,24),
	Crimson=Color3.fromRGB(225,25,62),
	Red=Color3.fromRGB(255,48,82),
	Purple=Color3.fromRGB(145,45,255),
	Purple2=Color3.fromRGB(195,85,255),
	White=Color3.fromRGB(250,245,248),
	Gray=Color3.fromRGB(150,130,145),
	Good=Color3.fromRGB(65,220,130)
}

local Discord="https://discord.gg/UH57k6uwB"

local GUI=Instance.new("ScreenGui")
GUI.Name="NexusIntro"
GUI.ResetOnSpawn=false
GUI.IgnoreGuiInset=true
GUI.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
GUI.Parent=game:GetService("CoreGui")

local function Corner(o,r)
	local x=Instance.new("UICorner")
	x.CornerRadius=UDim.new(0,r)
	x.Parent=o
end

local function Stroke(o,c,t,w)
	local x=Instance.new("UIStroke")
	x.Color=c
	x.Transparency=t or 0
	x.Thickness=w or 1
	x.Parent=o
	return x
end

local function Tween(o,t,p,style,dir)
	local x=TweenService:Create(
		o,
		TweenInfo.new(
			t,
			style or Enum.EasingStyle.Quart,
			dir or Enum.EasingDirection.Out
		),
		p
	)
	x:Play()
	return x
end

--==================================================
-- LOADING
--==================================================

local Loading=Instance.new("Frame")
Loading.Size=UDim2.fromOffset(305,78)
Loading.Position=UDim2.new(.5,-152,0,15)
Loading.BackgroundColor3=C.BG
Loading.BorderSizePixel=0
Loading.ClipsDescendants=true
Loading.Parent=GUI
Corner(Loading,14)

local LStroke=Stroke(Loading,C.Crimson,.08,1.5)

local LG=Instance.new("UIGradient")
LG.Color=ColorSequence.new{
	ColorSequenceKeypoint.new(0,Color3.fromRGB(55,5,20)),
	ColorSequenceKeypoint.new(.45,Color3.fromRGB(22,4,15)),
	ColorSequenceKeypoint.new(.75,Color3.fromRGB(40,5,22)),
	ColorSequenceKeypoint.new(1,Color3.fromRGB(10,3,10))
}
LG.Rotation=25
LG.Parent=Loading

local LTitle=Instance.new("TextLabel")
LTitle.Size=UDim2.new(1,-20,0,30)
LTitle.Position=UDim2.fromOffset(10,8)
LTitle.BackgroundTransparency=1
LTitle.Text="Waiting game to load"
LTitle.TextColor3=C.White
LTitle.TextSize=13
LTitle.Font=Enum.Font.GothamBold
LTitle.TextXAlignment=Enum.TextXAlignment.Center
LTitle.Parent=Loading

local Track=Instance.new("Frame")
Track.Size=UDim2.new(1,-28,0,9)
Track.Position=UDim2.fromOffset(14,51)
Track.BackgroundColor3=Color3.fromRGB(32,5,19)
Track.BorderSizePixel=0
Track.ClipsDescendants=true
Track.Parent=Loading
Corner(Track,8)
Stroke(Track,C.Purple,.55,1)

local Fill=Instance.new("Frame")
Fill.Size=UDim2.new(0,0,1,0)
Fill.BackgroundColor3=C.Crimson
Fill.BorderSizePixel=0
Fill.Parent=Track
Corner(Fill,8)

local FillGradient=Instance.new("UIGradient")
FillGradient.Color=ColorSequence.new{
	ColorSequenceKeypoint.new(0,C.Crimson),
	ColorSequenceKeypoint.new(.45,C.Red),
	ColorSequenceKeypoint.new(.72,C.Purple),
	ColorSequenceKeypoint.new(1,C.Purple2)
}
FillGradient.Parent=Fill

local function Step(text,time)
	LTitle.Text=text
	Fill.Size=UDim2.new(0,0,1,0)

	Tween(
		Fill,
		time,
		{Size=UDim2.new(1,0,1,0)},
		Enum.EasingStyle.Linear,
		Enum.EasingDirection.Out
	)

	task.wait(time)
end

Step("Waiting game to load",3)
Step("Loading resources",4)
Step("Checking whitelist for "..LP.Name,3)

Tween(LTitle,.15,{TextTransparency=1})
Tween(Track,.15,{BackgroundTransparency=1})
Tween(Fill,.15,{BackgroundTransparency=1})
Tween(LStroke,.2,{Transparency=1})

Tween(
	Loading,
	.3,
	{
		Size=UDim2.fromOffset(8,2),
		Position=UDim2.new(.5,-4,0,15),
		BackgroundTransparency=1
	},
	Enum.EasingStyle.Back,
	Enum.EasingDirection.In
)

task.wait(.35)
Loading:Destroy()

--==================================================
-- MAIN UI
--==================================================

local W,H=300,145

local Main=Instance.new("Frame")
Main.Name="NexusAnnouncement"
Main.Size=UDim2.fromOffset(8,2)
Main.Position=UDim2.new(.5,-4,.5,-1)
Main.BackgroundColor3=C.BG
Main.BorderSizePixel=0
Main.ClipsDescendants=true
Main.Parent=GUI
Corner(Main,15)

local MainStroke=Stroke(Main,C.Crimson,1,1.5)

local MG=Instance.new("UIGradient")
MG.Color=ColorSequence.new{
	ColorSequenceKeypoint.new(0,Color3.fromRGB(55,5,20)),
	ColorSequenceKeypoint.new(.35,Color3.fromRGB(25,4,14)),
	ColorSequenceKeypoint.new(.7,Color3.fromRGB(35,5,20)),
	ColorSequenceKeypoint.new(1,Color3.fromRGB(10,3,10))
}
MG.Rotation=35
MG.Parent=Main

-- TOP ACCENT
local Accent=Instance.new("Frame")
Accent.Size=UDim2.new(1,-30,0,2)
Accent.Position=UDim2.fromOffset(15,0)
Accent.BackgroundColor3=C.Crimson
Accent.BorderSizePixel=0
Accent.Parent=Main
Corner(Accent,2)

local AccentGradient=Instance.new("UIGradient")
AccentGradient.Color=ColorSequence.new{
	ColorSequenceKeypoint.new(0,C.Crimson),
	ColorSequenceKeypoint.new(.5,C.Purple),
	ColorSequenceKeypoint.new(1,C.Red)
}
AccentGradient.Parent=Accent

-- HEADER
local Header=Instance.new("TextLabel")
Header.Size=UDim2.new(1,-60,0,22)
Header.Position=UDim2.fromOffset(14,10)
Header.BackgroundTransparency=1
Header.Text="Nexus Hub"
Header.TextColor3=C.White
Header.TextSize=12
Header.Font=Enum.Font.GothamBold
Header.TextXAlignment=Enum.TextXAlignment.Left
Header.TextTransparency=1
Header.Parent=Main

local Close=Instance.new("TextButton")
Close.Size=UDim2.fromOffset(27,27)
Close.Position=UDim2.new(1,-38,0,8)
Close.BackgroundColor3=C.P1
Close.BorderSizePixel=0
Close.Text="×"
Close.TextColor3=C.White
Close.TextSize=16
Close.Font=Enum.Font.GothamBold
Close.AutoButtonColor=false
Close.TextTransparency=1
Close.Parent=Main
Corner(Close,9)
Stroke(Close,C.Crimson,.3,1)

-- RELEASE
local Release=Instance.new("TextLabel")
Release.Size=UDim2.new(1,-28,0,25)
Release.Position=UDim2.fromOffset(14,35)
Release.BackgroundTransparency=1
Release.Text="Script is on work to be released\nOctober 7 / October 20"
Release.TextColor3=C.Purple2
Release.TextSize=9
Release.Font=Enum.Font.GothamBold
Release.TextXAlignment=Enum.TextXAlignment.Center
Release.TextYAlignment=Enum.TextYAlignment.Center
Release.TextTransparency=1
Release.Parent=Main

-- MESSAGE
local Message=Instance.new("TextLabel")
Message.Size=UDim2.new(1,-28,0,18)
Message.Position=UDim2.fromOffset(14,63)
Message.BackgroundTransparency=1
Message.Text="Join our Discord for more updates"
Message.TextColor3=C.White
Message.TextSize=9
Message.Font=Enum.Font.Gotham
Message.TextXAlignment=Enum.TextXAlignment.Center
Message.TextTransparency=1
Message.Parent=Main

-- DISCORD BOX
local LinkBox=Instance.new("Frame")
LinkBox.Size=UDim2.fromOffset(205,32)
LinkBox.Position=UDim2.new(.5,-102.5,0,87)
LinkBox.BackgroundColor3=C.P1
LinkBox.BorderSizePixel=0
LinkBox.Parent=Main
Corner(LinkBox,9)
Stroke(LinkBox,C.Purple,.25,1)

local Link=Instance.new("TextLabel")
Link.Size=UDim2.new(1,-40,1,0)
Link.Position=UDim2.fromOffset(5,0)
Link.BackgroundTransparency=1
Link.Text=Discord
Link.TextColor3=C.Purple2
Link.TextSize=8
Link.Font=Enum.Font.Code
Link.TextXAlignment=Enum.TextXAlignment.Center
Link.TextTransparency=1
Link.Parent=LinkBox

-- COPY
local Copy=Instance.new("TextButton")
Copy.Name="CopyButton"
Copy.Size=UDim2.fromOffset(28,28)
Copy.Position=UDim2.new(1,-30,0,2)
Copy.BackgroundColor3=C.Crimson
Copy.BorderSizePixel=0
Copy.Text="📋"
Copy.TextColor3=C.White
Copy.TextSize=14
Copy.Font=Enum.Font.SourceSansBold
Copy.AutoButtonColor=false
Copy.TextTransparency=1
Copy.Parent=LinkBox
Corner(Copy,8)

local CopyStroke=Stroke(Copy,C.Purple2,.12,1)

--==================================================
-- OPEN FROM CENTER
--==================================================

Tween(MainStroke,.2,{Transparency=.08})

Tween(
	Main,
	.55,
	{
		Size=UDim2.fromOffset(W,H),
		Position=UDim2.new(.5,-W/2,.5,-H/2)
	},
	Enum.EasingStyle.Back,
	Enum.EasingDirection.Out
)

task.delay(.16,function()
	Tween(Header,.25,{TextTransparency=0})
	Tween(Close,.25,{TextTransparency=0})
	Tween(Release,.3,{TextTransparency=0})
	Tween(Message,.35,{TextTransparency=0})
	Tween(Link,.4,{TextTransparency=0})
	Tween(Copy,.4,{TextTransparency=0})
end)

--==================================================
-- COPY
--==================================================

Copy.MouseButton1Click:Connect(function()

	local copied=false

	if typeof(setclipboard)=="function" then
		copied=pcall(function()
			setclipboard(Discord)
		end)
	elseif typeof(toclipboard)=="function" then
		copied=pcall(function()
			toclipboard(Discord)
		end)
	end

	if copied then
		Copy.Text="✓"
		Copy.BackgroundColor3=C.Good

		Tween(Copy,.12,{
			Size=UDim2.fromOffset(31,31)
		})

		task.delay(.14,function()
			if Copy.Parent then
				Tween(Copy,.12,{
					Size=UDim2.fromOffset(28,28)
				})
			end
		end)

		task.delay(1.2,function()
			if Copy.Parent then
				Copy.Text="📋"
				Copy.BackgroundColor3=C.Crimson
			end
		end)
	end
end)

--==================================================
-- HOVER
--==================================================

Close.MouseEnter:Connect(function()
	Tween(Close,.12,{
		BackgroundColor3=C.Crimson
	})
end)

Close.MouseLeave:Connect(function()
	Tween(Close,.12,{
		BackgroundColor3=C.P1
	})
end)

Copy.MouseEnter:Connect(function()
	Tween(Copy,.12,{
		BackgroundColor3=C.Purple
	})
end)

Copy.MouseLeave:Connect(function()
	Tween(Copy,.12,{
		BackgroundColor3=C.Crimson
	})
end)

--==================================================
-- CLOSE
--==================================================

Close.MouseButton1Click:Connect(function()

	Tween(Header,.12,{TextTransparency=1})
	Tween(Close,.12,{TextTransparency=1})
	Tween(Release,.12,{TextTransparency=1})
	Tween(Message,.12,{TextTransparency=1})
	Tween(Link,.12,{TextTransparency=1})
	Tween(Copy,.12,{TextTransparency=1})
	Tween(MainStroke,.18,{Transparency=1})

	Tween(
		Main,
		.42,
		{
			Size=UDim2.fromOffset(8,2),
			Position=UDim2.new(.5,-4,.5,-1),
			BackgroundTransparency=1
		},
		Enum.EasingStyle.Back,
		Enum.EasingDirection.In
	)

	task.wait(.45)
	GUI:Destroy()
end)

--==================================================
-- CRIMSON / NEXUS ANIMATION
--==================================================

task.spawn(function()
	local t=0

	while GUI.Parent do
		t+=task.wait()

		local v=(math.sin(t*2)+1)/2

		MainStroke.Color=C.Crimson:Lerp(C.Purple,v)
		CopyStroke.Color=C.Purple2:Lerp(C.Red,v)
		AccentGradient.Offset=Vector2.new((t%3)/3,0)
	end
end)
