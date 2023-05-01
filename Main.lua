LP = game.Players.LocalPlayer
Char = LP.Character
Cc = workspace.CurrentCamera
mouse = LP:GetMouse()
UIS = game:GetService("UserInputService")

function Player(PartialName)
	for i,v in pairs(game.Players:GetPlayers()) do
		if string.lower(v.DisplayName):sub(1, #PartialName) == string.lower(PartialName) then
			return v
		end
	end
end

function Character(PartialName)
	return Player(PartialName).Character
end

function GetClosestPlayer(Vec3)
	Closest = {math.huge,nil}
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v.Character ~= nil and v ~= LP then
			if v.Character:FindFirstChild("Head") ~= nil then
				mag = (v.Character.Head.Position - Vec3).Magnitude
				if mag < Closest[1] then
					Closest = {mag,v.Character}
				end
			end
		end
	end
	return Closest[2]
end

function GetUA()
	UA = {}
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") or v.ClassName == "MeshPart" then
			if isnetworkowner(v) and v.Parent ~= Char and v.Parent.Parent ~= Char then
				table.insert(UA, v)
			end
		end
	end
	return UA
end

function LaunchUA(Vec3, Force, Loops)
	for count = 0, Loops do
		for i,v in pairs(GetUA()) do
			v.Velocity = ((Vec3 - v.Position).Unit) * Force
		end
		wait()
	end
end

function VelocityUA(Vec3, Loops)
	for count = 0, Loops do
		for i,v in pairs(GetUA()) do
			v.Velocity = Vec3
		end
		wait()
	end
end

--------------------------------------------

function SummonSM()
	local a=Instance.new"ScreenGui"
	a.Name="ScriptManager"
	a.ZIndexBehavior=1
	a.ResetOnSpawn=false
	a.ScreenInsets=1
	a.IgnoreGuiInset=true
	local b=Instance.new"Frame"
	b.Name="Keys"
	b.Visible=false
	b.Size=UDim2.new(0.1468793,0,0.4969745,0)
	b.ClipsDescendants=true
	b.BorderColor3=Color3.fromRGB(53,53,53)
	b.BackgroundTransparency=0.45
	b.Position=UDim2.new(0.5899225,0,0.2152941,0)
	b.BackgroundColor3=Color3.fromRGB(29,29,29)
	b.Parent=a
	local c=Instance.new"ScrollingFrame"
	c.Size=UDim2.new(1,-10,1,-40)
	c.BorderColor3=Color3.fromRGB(0,0,0)
	c.BackgroundTransparency=1
	c.Position=UDim2.new(0,5,0,30)
	c.Active=true
	c.BorderSizePixel=0
	c.BackgroundColor3=Color3.fromRGB(255,255,255)
	c.ScrollBarImageColor3=Color3.fromRGB(0,0,0)
	c.ScrollBarThickness=10
	c.Parent=b
	local d=Instance.new"UIListLayout"
	d.SortOrder=2
	d.Padding=UDim.new(0,5)
	d.Parent=c
	local e=Instance.new"UIPadding"
	e.PaddingTop=UDim.new(0,2)
	e.PaddingLeft=UDim.new(0,2)
	e.PaddingRight=UDim.new(0,2)
	e.Parent=c
	local f=Instance.new"Frame"
	f.Name="Key"
	f.Size=UDim2.new(0.99,-10,0,25)
	f.BorderColor3=Color3.fromRGB(49,50,53)
	f.BackgroundTransparency=0.5
	f.Position=UDim2.new(0.005,0,0,0)
	f.BackgroundColor3=Color3.fromRGB(56,56,56)
	f.Parent=c
	local g=Instance.new"UIStroke"
	g.Transparency=0.2
	g.Parent=f
	local h=Instance.new"UICorner"
	h.Parent=f
	local i=Instance.new"TextLabel"
	i.Name="Title"
	i.Size=UDim2.new(1,-75,1,0)
	i.BackgroundTransparency=1
	i.Position=UDim2.new(0,5,0,0)
	i.BackgroundColor3=Color3.fromRGB(255,255,255)
	i.FontSize=5
	i.TextStrokeTransparency=0
	i.TextSize=14
	i.TextColor3=Color3.fromRGB(255,255,255)
	i.Text=""
	i.TextWrapped=true
	i.Font=41
	i.TextWrap=true
	i.TextXAlignment=0
	i.TextScaled=true
	i.Parent=f
	local j=Instance.new"TextButton"
	j.Name="Stop"
	j.AnchorPoint=Vector2.new(1,0.5)
	j.Size=UDim2.new(0,15,0,15)
	j.BackgroundTransparency=0.25
	j.Position=UDim2.new(1,-5,0.5,0)
	j.BackgroundColor3=Color3.fromRGB(255,0,0)
	j.FontSize=5
	j.TextSize=14
	j.TextColor3=Color3.fromRGB(255,255,255)
	j.Text="C"
	j.TextWrapped=true
	j.Font=4
	j.TextWrap=true
	j.TextScaled=true
	j.Parent=f
	local k=Instance.new"UICorner"
	k.CornerRadius=UDim.new(0,10)
	k.Parent=j
	local l=Instance.new"TextButton"
	l.Name="UI"
	l.AnchorPoint=Vector2.new(1,0.5)
	l.Size=UDim2.new(0,20,0,15)
	l.BackgroundTransparency=0.25
	l.Position=UDim2.new(0.9999999,-25,0.5,0)
	l.BackgroundColor3=Color3.fromRGB(0,0,0)
	l.FontSize=5
	l.TextSize=14
	l.TextColor3=Color3.fromRGB(255,255,255)
	l.Text=""
	l.TextWrapped=true
	l.Font=4
	l.TextWrap=true
	l.TextScaled=true
	l.Parent=f
	local m=Instance.new"UIStroke"
	m.Transparency=0.4
	m.Thickness=3
	m.Color=Color3.fromRGB(255,0,153)
	m.Parent=b
	local n=Instance.new"UICorner"
	n.CornerRadius=UDim.new(0,3)
	n.Parent=b
	local o=Instance.new"Frame"
	o.Name="TopBar"
	o.Size=UDim2.new(1,0,0,22)
	o.BackgroundTransparency=0.5
	o.Position=UDim2.new(0,0,0,0)
	o.BackgroundColor3=Color3.fromRGB(29,29,29)
	o.Parent=b
	local p=Instance.new"UICorner"
	p.CornerRadius=UDim.new(0,3)
	p.Parent=o
	local q=Instance.new"TextButton"
	q.Name="SM_Minimize"
	q.AnchorPoint=Vector2.new(0.5,0.5)
	q.Size=UDim2.new(0,15,0,15)
	q.BackgroundTransparency=0.2
	q.Position=UDim2.new(1,-12,0,12)
	q.BackgroundColor3=Color3.fromRGB(0,0,0)
	q.FontSize=6
	q.TextSize=15
	q.TextColor3=Color3.fromRGB(255,255,255)
	q.Text="-"
	q.TextYAlignment=0
	q.TextWrapped=true
	q.Font=100
	q.TextWrap=true
	q.TextScaled=true
	q.Parent=o
	local r=Instance.new"UICorner"
	r.CornerRadius=UDim.new(0,10)
	r.Parent=q
	local s=Instance.new"Frame"
	s.Name="Manager"
	s.ZIndex=10
	s.Size=UDim2.new(0.1759691,0,0.5764706,0)
	s.BorderColor3=Color3.fromRGB(53,53,53)
	s.BackgroundTransparency=0.45
	s.Position=UDim2.new(0.4034961,0,0.2164118,0)
	s.BackgroundColor3=Color3.fromRGB(29,29,29)
	s.Parent=a
	local t=Instance.new"ScrollingFrame"
	t.Size=UDim2.new(1,-10,1,-40)
	t.BorderColor3=Color3.fromRGB(0,0,0)
	t.BackgroundTransparency=1
	t.Position=UDim2.new(0,5,0,30)
	t.Active=true
	t.BorderSizePixel=0
	t.BackgroundColor3=Color3.fromRGB(255,255,255)
	t.ScrollBarImageColor3=Color3.fromRGB(0,0,0)
	t.ScrollBarThickness=10
	t.Parent=s
	local u=Instance.new"UIListLayout"
	u.SortOrder=2
	u.Padding=UDim.new(0,5)
	u.Parent=t
	local v=Instance.new"Frame"
	v.Name="Self"
	v.Size=UDim2.new(0.99,-10,0,25)
	v.BorderColor3=Color3.fromRGB(49,50,53)
	v.BackgroundTransparency=0.5
	v.Position=UDim2.new(0.005,0,0,0)
	v.BackgroundColor3=Color3.fromRGB(56,22,55)
	v.Parent=t
	local w=Instance.new"UIStroke"
	w.Transparency=0.2
	w.Color=Color3.fromRGB(123,41,130)
	w.Parent=v
	local x=Instance.new"UICorner"
	x.Parent=v
	local y=Instance.new"TextButton"
	y.Name="Stop"
	y.AnchorPoint=Vector2.new(1,0.5)
	y.Size=UDim2.new(0,15,0,15)
	y.BackgroundTransparency=0.25
	y.Position=UDim2.new(1,-5,0.5,0)
	y.BackgroundColor3=Color3.fromRGB(255,0,0)
	y.FontSize=5
	y.TextSize=14
	y.TextColor3=Color3.fromRGB(255,255,255)
	y.Text="X"
	y.TextWrapped=true
	y.Font=4
	y.TextWrap=true
	y.TextScaled=true
	y.Parent=v
	local z=Instance.new"UICorner"
	z.CornerRadius=UDim.new(0,10)
	z.Parent=y
	local A=Instance.new"TextButton"
	A.Name="UI"
	A.AnchorPoint=Vector2.new(1,0.5)
	A.Size=UDim2.new(0,15,0,15)
	A.BackgroundTransparency=0.25
	A.Position=UDim2.new(1,-25,0.5,0)
	A.BackgroundColor3=Color3.fromRGB(0,0,0)
	A.FontSize=5
	A.TextSize=14
	A.TextColor3=Color3.fromRGB(255,255,255)
	A.Text=" UI "
	A.TextWrapped=true
	A.Font=4
	A.TextWrap=true
	A.TextScaled=true
	A.Parent=v
	local B=Instance.new"UICorner"
	B.CornerRadius=UDim.new(0,0)
	B.Parent=A
	local C=Instance.new"TextButton"
	C.Name="Keys"
	C.AnchorPoint=Vector2.new(1,0.5)
	C.Size=UDim2.new(0,15,0,15)
	C.BackgroundTransparency=0.25
	C.Position=UDim2.new(1,-45,0.5,0)
	C.BackgroundColor3=Color3.fromRGB(0,0,0)
	C.FontSize=5
	C.TextSize=14
	C.TextColor3=Color3.fromRGB(255,255,255)
	C.Text="Aa"
	C.TextWrapped=true
	C.Font=4
	C.TextWrap=true
	C.TextScaled=true
	C.Parent=v
	local D=Instance.new"UICorner"
	D.CornerRadius=UDim.new(0,0)
	D.Parent=C
	local E=Instance.new"TextButton"
	E.Name="Title"
	E.Size=UDim2.new(1,-75,1,0)
	E.BackgroundTransparency=1
	E.BackgroundColor3=Color3.fromRGB(255,255,255)
	E.FontSize=5
	E.TextStrokeTransparency=0
	E.TextSize=14
	E.TextColor3=Color3.fromRGB(255,0,255)
	E.Text="ScriptManager"
	E.TextWrapped=true
	E.Font=41
	E.TextWrap=true
	E.TextScaled=true
	E.Parent=v
	local F=Instance.new"Frame"
	F.Name="Template"
	F.Visible=false
	F.Size=UDim2.new(0.99,-10,0,25)
	F.BorderColor3=Color3.fromRGB(49,50,53)
	F.BackgroundTransparency=0.5
	F.Position=UDim2.new(0.005,0,0,0)
	F.BackgroundColor3=Color3.fromRGB(56,56,56)
	F.Parent=t
	local G=Instance.new"UIStroke"
	G.Transparency=0.2
	G.Parent=F
	local H=Instance.new"UICorner"
	H.Parent=F
	local I=Instance.new"TextButton"
	I.Name="Stop"
	I.AnchorPoint=Vector2.new(1,0.5)
	I.Size=UDim2.new(0,15,0,15)
	I.BackgroundTransparency=0.25
	I.Position=UDim2.new(1,-5,0.5,0)
	I.BackgroundColor3=Color3.fromRGB(255,0,0)
	I.FontSize=5
	I.TextSize=14
	I.TextColor3=Color3.fromRGB(255,255,255)
	I.Text="X"
	I.TextWrapped=true
	I.Font=4
	I.TextWrap=true
	I.TextScaled=true
	I.Parent=F
	local J=Instance.new"UICorner"
	J.CornerRadius=UDim.new(0,10)
	J.Parent=I
	local K=Instance.new"TextButton"
	K.Name="UI"
	K.AnchorPoint=Vector2.new(1,0.5)
	K.Size=UDim2.new(0,15,0,15)
	K.BackgroundTransparency=0.25
	K.Position=UDim2.new(1,-25,0.5,0)
	K.BackgroundColor3=Color3.fromRGB(0,0,0)
	K.FontSize=5
	K.TextSize=14
	K.TextColor3=Color3.fromRGB(255,255,255)
	K.Text=" UI "
	K.TextWrapped=true
	K.Font=4
	K.TextWrap=true
	K.TextScaled=true
	K.Parent=F
	local L=Instance.new"UICorner"
	L.CornerRadius=UDim.new(0,0)
	L.Parent=K
	local M=Instance.new"TextButton"
	M.Name="Keys"
	M.AnchorPoint=Vector2.new(1,0.5)
	M.Size=UDim2.new(0,15,0,15)
	M.BackgroundTransparency=0.25
	M.Position=UDim2.new(1,-45,0.5,0)
	M.BackgroundColor3=Color3.fromRGB(0,0,0)
	M.FontSize=5
	M.TextSize=14
	M.TextColor3=Color3.fromRGB(255,255,255)
	M.Text="Aa"
	M.TextWrapped=true
	M.Font=4
	M.TextWrap=true
	M.TextScaled=true
	M.Parent=F
	local N=Instance.new"UICorner"
	N.CornerRadius=UDim.new(0,0)
	N.Parent=M
	local O=Instance.new"TextButton"
	O.Name="Title"
	O.Size=UDim2.new(1,-75,1,0)
	O.BackgroundTransparency=1
	O.BackgroundColor3=Color3.fromRGB(255,255,255)
	O.FontSize=5
	O.TextStrokeTransparency=0
	O.TextSize=14
	O.TextColor3=Color3.fromRGB(255,255,255)
	O.Text="ScriptManager"
	O.TextWrapped=true
	O.Font=41
	O.TextWrap=true
	O.TextScaled=true
	O.Parent=F
	local P=Instance.new"ObjectValue"
	P.Name="Folder"
	P.Parent=F
	local Q=Instance.new"UIPadding"
	Q.PaddingTop=UDim.new(0,2)
	Q.PaddingLeft=UDim.new(0,2)
	Q.PaddingRight=UDim.new(0,2)
	Q.Parent=t
	local R=Instance.new"UIStroke"
	R.Transparency=0.4
	R.Thickness=3
	R.Color=Color3.fromRGB(157,0,255)
	R.Parent=s
	local S=Instance.new"UICorner"
	S.CornerRadius=UDim.new(0,3)
	S.Parent=s
	local T=Instance.new"Frame"
	T.Name="TopBar"
	T.Size=UDim2.new(1,0,0,22)
	T.BackgroundTransparency=0.5
	T.Position=UDim2.new(0,0,0,0)
	T.BackgroundColor3=Color3.fromRGB(29,29,29)
	T.Parent=s
	local U=Instance.new"UICorner"
	U.CornerRadius=UDim.new(0,3)
	U.Parent=T
	local V=Instance.new"TextButton"
	V.Name="Minimize"
	V.AnchorPoint=Vector2.new(0.5,0.5)
	V.Size=UDim2.new(0,15,0,15)
	V.BackgroundTransparency=0.2
	V.Position=UDim2.new(1,-12,0,12)
	V.BackgroundColor3=Color3.fromRGB(0,0,0)
	V.FontSize=6
	V.TextSize=15
	V.TextColor3=Color3.fromRGB(255,0,255)
	V.Text="-"
	V.TextYAlignment=0
	V.TextWrapped=true
	V.Font=100
	V.TextWrap=true
	V.TextScaled=true
	V.Parent=T
	local W=Instance.new"UICorner"
	W.CornerRadius=UDim.new(0,10)
	W.Parent=V
	local X=Instance.new"TextButton"
	X.Name="Title"
	X.ZIndex=3
	X.Size=UDim2.new(0.9,0,1,0)
	X.BackgroundTransparency=1
	X.BackgroundColor3=Color3.fromRGB(255,255,255)
	X.FontSize=5
	X.TextStrokeTransparency=0
	X.TextSize=14
	X.TextColor3=Color3.fromRGB(255,0,255)
	X.Text="Script Manager"
	X.TextWrapped=true
	X.Font=3
	X.TextWrap=true
	X.TextScaled=true
	X.Parent=T
	local Y=Instance.new"TextButton"
	Y.Name="Resizer"
	Y.AnchorPoint=Vector2.new(1,1)
	Y.Size=UDim2.new(0,10,0,10)
	Y.BackgroundTransparency=0.3
	Y.Position=UDim2.new(1,0,1,0)
	Y.BorderSizePixel=0
	Y.BackgroundColor3=Color3.fromRGB(157,0,255)
	Y.FontSize=11
	Y.TextSize=30
	Y.TextColor3=Color3.fromRGB(0,0,0)
	Y.Text=""
	Y.TextWrapped=true
	Y.Font=4
	Y.TextWrap=true
	Y.TextScaled=true
	Y.Parent=s
	local Za=Instance.new"LocalScript"
	Za.Parent=a
	local aa=Instance.new"TextButton"
	aa.Name="UI"
	aa.AnchorPoint=Vector2.new(0.5,0.5)
	aa.Visible=false
	aa.Size=UDim2.new(0,15,0,15)
	aa.BackgroundTransparency=0.45
	aa.Position=UDim2.new(0.5,0,0,15)
	aa.BackgroundColor3=Color3.fromRGB(29,29,29)
	aa.FontSize=5
	aa.TextSize=14
	aa.TextColor3=Color3.fromRGB(255,255,255)
	aa.Text="UI"
	aa.Font=4
	aa.Parent=a
	local ba=Instance.new"UICorner"
	ba.CornerRadius=UDim.new(0,3)
	ba.Parent=aa
	local ca=Instance.new"UIStroke"
	ca.ApplyStrokeMode=1
	ca.Transparency=0.4
	ca.Thickness=3
	ca.Color=Color3.fromRGB(157,0,255)
	ca.Parent=aa
	a.Parent=game:GetService"CoreGui"
	a.ResetOnSpawn = false
	return a
end

function _SMNewScript()
	local sca=Instance.new"Folder"
	sca.Name="Template"
	local scb=Instance.new"Folder"
	scb.Name="Display"
	scb.Parent=sca
	local scc=Instance.new"Color3Value"
	scc.Name="TextColor"
	scc.Value=Color3.fromRGB(255,255,255)
	scc.Parent=scb
	local scd=Instance.new"Color3Value"
	scd.Name="TextStroke"
	scd.Parent=scb
	local sce=Instance.new"Color3Value"
	sce.Name="BGColor"
	sce.Value=Color3.fromRGB(56,56,56)
	sce.Parent=scb
	local scf=Instance.new"Color3Value"
	scf.Name="BGStroke"
	scf.Parent=scb
	local scg=Instance.new"BoolValue"
	scg.Name="Keys"
	scg.Parent=sca
	local sch=Instance.new"StringValue"
	sch.Name="Name"
	sch.Value="F"
	sch.Parent=scg
	local sci=Instance.new"BindableFunction"
	sci.Parent=sch
	local scj=Instance.new"ObjectValue"
	scj.Name="UI"
	scj.Parent=sca
	local sck=Instance.new"BindableFunction"
	sck.Name="Kill"
	sck.Parent=sca
	return sca
end

if game:GetService("CoreGui"):FindFirstChild("ScriptManager") == nil then
	wait(0.1)
	_SM = SummonSM()
	_SMScripts = Instance.new("Folder")
	_SMScripts.Parent = game:GetService"CoreGui"
	_SMScripts.Name = "Scripts"
	
	_SMVars = {
		Connections = {},
		Resizing = {false},
		Dragging = {false},
		Open = {true,false}
	}
	
	function _SMConnect(v)
		table.insert(_SMVars.Connections,v)
	end

	function _SMResize()
		_SMVars.Resizing = {false}
		_SMVars.Resizing = {true,_SM.Manager.Size}
		local mp = {mouse.X,mouse.Y}
		mouse.Icon = 'rbxasset://textures/StudioUIEditor/icon_resize3.png'
		while _SMVars.Resizing[1] == true do
			local xo = _SMVars.Resizing[2].X.Offset + mouse.X - mp[1]
			local yo = _SMVars.Resizing[2].Y.Offset + mouse.Y - mp[2]
			local xo = math.max(xo,_SM.Manager.Size.X.Scale/-2*mouse.ViewSizeX)
			local yo = math.max(yo,_SM.Manager.Size.Y.Scale/-2*mouse.ViewSizeY)
			_SM.Manager.Size = UDim2.new(_SM.Manager.Size.X.Scale,xo,_SM.Manager.Size.Y.Scale,yo)
			wait()
		end
	end
	_SMConnect(_SM.Manager.Resizer.MouseButton1Down:Connect(_SMResize))


	function _SMDrag()
		_SMVars.Dragging = {false}
		_SMVars.Dragging = {true,_SM.Manager.Position}
		local mp = {mouse.X,mouse.Y}
		mouse.Icon = 'rbxasset://textures/StudioUIEditor/icon_resize3.png'

		while _SMVars.Dragging[1] == true do
			local xo = _SMVars.Dragging[2].X.Offset + mouse.X - mp[1]
			local yo = _SMVars.Dragging[2].Y.Offset + mouse.Y - mp[2]
			_SM.Manager.Position = UDim2.new(_SM.Manager.Position.X.Scale,xo,_SM.Manager.Position.Y.Scale,yo)
			wait()
		end
	end
	_SMConnect(_SM.Manager.TopBar.Title.MouseButton1Down:Connect(_SMDrag))

	function _SMToggle()
		_SM.UI.Visible = not _SM.UI.Visible
		_SM.Keys.Visible = false
		_SM.Manager.Visible = not _SM.Manager.Visible
		_SMVars.Open[1] = not _SMVars.Open[1]
		if _SMVars.Open[1] == true then
			_SM.Keys.Visible = _SMVars.Open[2]
		end
	end
	_SMConnect(_SM.Manager.TopBar.Minimize.MouseButton1Click:Connect(_SMToggle))
	_SMConnect(_SM.UI.MouseButton1Click:Connect(_SMToggle))

	function _SMInput(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			_SMVars.Resizing[1] = false
			_SMVars.Dragging[1] = false
			mouse.Icon = ''
		end
	end
	_SMConnect(UIS.InputEnded:Connect(_SMInput))

	function _SMKill()
		for i,v in pairs(_SMVars.Connections) do
			v:Disconnect()
		end
		_SM:Destroy()
	end

	

	function _SMRegister(obj)
		local gui = _SM.Manager.ScrollingFrame.Template:Clone()
		gui.Parent = _SM.Manager.ScrollingFrame
		gui.Folder.Value = obj
		gui.Title.Text = obj.Name
		gui.UI.Visible = obj.UI.Value ~= nil
		gui.Keys.Visible = obj.Keys.Value
		gui.BackgroundColor3 = obj.Display.BGColor.Value
		gui.UIStroke.Color = obj.Display.BGStroke.Value
		gui.Title.TextColor3 = obj.Display.TextColor.Value
		gui.Title.TextStrokeColor3 = obj.Display.TextStroke.Value
		local function _SMUIToggle()
			obj.UI.Value.Enabled = not obj.UI.Value.Enabled
		end
		_SMConnect(gui.UI.MouseButton1Click:Connect(_SMUIToggle))
		local function _SMUpdate()
			gui.UI.Visible = obj.UI.Value ~= nil
			gui.Keys.Visible = obj.Keys.Value
		end
		_SMConnect(obj.UI.Changed:Connect(_SMUpdate))
		_SMConnect(obj.Keys.Changed:Connect(_SMUpdate))
		local function _SMKillScript()
			obj.Kill:Invoke()
			gui:Destroy()
		end
		_SMConnect(gui.Stop.MouseButton1Click:Connect(_SMKillScript))
		gui.Visible = true
	end
	_SMConnect(_SMScripts.ChildAdded:Connect(_SMRegister))
	for i,v in pairs(_SMScripts:GetChildren()) do 
		if v.Name ~= "Template" then
			_SMRegister(v)
		end
	end
else
    _SMScripts = game:GetService("CoreGui").Scripts
end

-- :)
