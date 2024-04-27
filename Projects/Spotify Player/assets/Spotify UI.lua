local ui = {}

function ui:load(config)
	local function newfolder(name)
		name = tostring(name)
		if not isfolder(name) then
			makefolder(name)
		end
	end

	newfolder(config.file)

	local settings = {
		["scale"] = config.Scale;
		["version"] = config.Version;
		["tracks"] = config.Tracks;
	}

	if game:GetService("CoreGui"):FindFirstChild("SP") ~= nil then
		game:GetService("CoreGui")["SP"]:Destroy()
	elseif game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("SP") ~= nil then
		game:GetService("Players").LocalPlayer.PlayerGui["SP"]:Destroy()
	end

	local G2L = {};

	-- StarterGui.SP
	G2L["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"));
	G2L["1"]["IgnoreGuiInset"] = true;
	G2L["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
	G2L["1"]["Name"] = [[_SP]];
	G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
	G2L["1"]["ResetOnSpawn"] = false;

	-- StarterGui.SP.Holder
	G2L["2"] = Instance.new("Frame", G2L["1"]);
	G2L["2"]["BorderSizePixel"] = 0;
	G2L["2"]["BackgroundColor3"] = Color3.fromRGB(9, 9, 9);
	G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["2"]["Size"] = UDim2.new(0, 490, 0, 130);
	G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	G2L["2"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	G2L["2"]["Name"] = [[Holder]];

	-- StarterGui.SP.Holder.UICorner
	G2L["3"] = Instance.new("UICorner", G2L["2"]);
	G2L["3"]["CornerRadius"] = UDim.new(0, 12);

	-- StarterGui.SP.Holder.Dragify
	G2L["4"] = Instance.new("LocalScript", G2L["2"]);
	G2L["4"]["Name"] = [[Dragify]];

	-- StarterGui.SP.Holder.TrackList
	G2L["5"] = Instance.new("Frame", G2L["2"]);
	G2L["5"]["BorderSizePixel"] = 0;
	G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["5"]["BackgroundTransparency"] = 1;
	G2L["5"]["Size"] = UDim2.new(1, 0, 0.6230769157409668, 0);
	G2L["5"]["ClipsDescendants"] = true;
	G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["5"]["Position"] = UDim2.new(0, 0, 0, 49);
	G2L["5"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	G2L["5"]["Name"] = [[TrackList]];

	-- StarterGui.SP.Holder.TrackList.UIListLayout
	G2L["6"] = Instance.new("UIListLayout", G2L["5"]);
	G2L["6"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
	G2L["6"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

	-- StarterGui.SP.Holder.TrackList.TrackList
	G2L["7"] = Instance.new("ScrollingFrame", G2L["5"]);
	G2L["7"]["Active"] = true;
	G2L["7"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
	G2L["7"]["BorderSizePixel"] = 0;
	G2L["7"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
	G2L["7"]["TopImage"] = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];
	G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["7"]["BackgroundTransparency"] = 1;
	G2L["7"]["Size"] = UDim2.new(1, 0, 0, 81);
	G2L["7"]["ScrollBarImageColor3"] = Color3.fromRGB(208, 208, 208);
	G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["7"]["ScrollBarThickness"] = 8;
	G2L["7"]["Position"] = UDim2.new(0, 0, 0, 49);
	G2L["7"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	G2L["7"]["Name"] = [[TrackList]];
	G2L["7"]["BottomImage"] = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];

	-- StarterGui.SP.Holder.TrackList.TrackList.Function
	G2L["8"] = Instance.new("LocalScript", G2L["7"]);
	G2L["8"]["Name"] = [[Function]];

	-- StarterGui.SP.Holder.TrackList.TrackList.UIPadding
	G2L["17"] = Instance.new("UIPadding", G2L["7"]);
	G2L["17"]["PaddingLeft"] = UDim.new(0, 6);

	-- StarterGui.SP.Holder.TrackList.TrackList.UIGridLayout
	G2L["18"] = Instance.new("UIGridLayout", G2L["7"]);
	G2L["18"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
	G2L["18"]["CellSize"] = UDim2.new(0, 238, 0, 81);
	G2L["18"]["CellPadding"] = UDim2.new(0, 0, 0, 0);

	-- StarterGui.SP.Holder.TrackList.PLAYING
	G2L["19"] = Instance.new("Frame", G2L["5"]);
	G2L["19"]["BorderSizePixel"] = 0;
	G2L["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["19"]["BackgroundTransparency"] = 1;
	G2L["19"]["Size"] = UDim2.new(0, 490, 0, 81);
	G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["19"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	G2L["19"]["Name"] = [[PLAYING]];

	-- StarterGui.SP.Holder.TrackList.PLAYING.INFO
	G2L["1a"] = Instance.new("Frame", G2L["19"]);
	G2L["1a"]["BorderSizePixel"] = 0;
	G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["1a"]["AnchorPoint"] = Vector2.new(0, 0.5);
	G2L["1a"]["BackgroundTransparency"] = 1;
	G2L["1a"]["Size"] = UDim2.new(0, 134, 0, 55);
	G2L["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["1a"]["Position"] = UDim2.new(0, 66, 0, 40);
	G2L["1a"]["Name"] = [[INFO]];

	-- StarterGui.SP.Holder.TrackList.PLAYING.INFO.UIListLayout
	G2L["1b"] = Instance.new("UIListLayout", G2L["1a"]);
	G2L["1b"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
	G2L["1b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

	-- StarterGui.SP.Holder.TrackList.PLAYING.INFO.TRACKNAME
	G2L["1c"] = Instance.new("TextLabel", G2L["1a"]);
	G2L["1c"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
	G2L["1c"]["BorderSizePixel"] = 0;
	G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["1c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	G2L["1c"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	G2L["1c"]["TextSize"] = 14;
	G2L["1c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["1c"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	G2L["1c"]["Size"] = UDim2.new(1, 0, 0.5, 0);
	G2L["1c"]["ClipsDescendants"] = true;
	G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["1c"]["Text"] = [[TRACK NAME]];
	G2L["1c"]["Name"] = [[TRACKNAME]];
	G2L["1c"]["BackgroundTransparency"] = 1;
	G2L["1c"]["Position"] = UDim2.new(0.13469387590885162, 0, 0.16049382090568542, 0);

	-- StarterGui.SP.Holder.TrackList.PLAYING.INFO.TRACKNAME.UIPadding
	G2L["1d"] = Instance.new("UIPadding", G2L["1c"]);
	G2L["1d"]["PaddingLeft"] = UDim.new(0, 8);

	-- StarterGui.SP.Holder.TrackList.PLAYING.INFO.TRACKARTIST
	G2L["1e"] = Instance.new("TextLabel", G2L["1a"]);
	G2L["1e"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
	G2L["1e"]["BorderSizePixel"] = 0;
	G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["1e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	G2L["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	G2L["1e"]["TextSize"] = 12;
	G2L["1e"]["TextColor3"] = Color3.fromRGB(81, 81, 81);
	G2L["1e"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	G2L["1e"]["Size"] = UDim2.new(1, 0, 0.5, 0);
	G2L["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["1e"]["Text"] = [[TRACK ARTIST]];
	G2L["1e"]["Name"] = [[TRACKARTIST]];
	G2L["1e"]["BackgroundTransparency"] = 1;
	G2L["1e"]["Position"] = UDim2.new(0.13469387590885162, 0, 0.4938271641731262, 0);

	-- StarterGui.SP.Holder.TrackList.PLAYING.INFO.TRACKARTIST.UIPadding
	G2L["1f"] = Instance.new("UIPadding", G2L["1e"]);
	G2L["1f"]["PaddingLeft"] = UDim.new(0, 8);

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS
	G2L["20"] = Instance.new("Frame", G2L["19"]);
	G2L["20"]["BorderSizePixel"] = 0;
	G2L["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["20"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["20"]["BackgroundTransparency"] = 1;
	G2L["20"]["Size"] = UDim2.new(0.5918367505073547, 0, 1, 0);
	G2L["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["20"]["Position"] = UDim2.new(0.704081654548645, 0, 0.5, 0);
	G2L["20"]["Name"] = [[TRACKOPTIONS]];

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.PROGRESS
	G2L["21"] = Instance.new("Frame", G2L["20"]);
	G2L["21"]["BorderSizePixel"] = 0;
	G2L["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["21"]["BackgroundTransparency"] = 1;
	G2L["21"]["Size"] = UDim2.new(1, 0, 0.4000000059604645, 0);
	G2L["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["21"]["Position"] = UDim2.new(0, 0, 0.6000000238418579, 0);
	G2L["21"]["Name"] = [[PROGRESS]];

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.PROGRESS.UIListLayout
	G2L["22"] = Instance.new("UIListLayout", G2L["21"]);
	G2L["22"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
	G2L["22"]["FillDirection"] = Enum.FillDirection.Horizontal;
	G2L["22"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
	G2L["22"]["Padding"] = UDim.new(0, 9);
	G2L["22"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.PROGRESS.ProgressBar
	G2L["23"] = Instance.new("Frame", G2L["21"]);
	G2L["23"]["BorderSizePixel"] = 0;
	G2L["23"]["BackgroundColor3"] = Color3.fromRGB(9, 9, 9);
	G2L["23"]["Size"] = UDim2.new(0.8999999761581421, 0, 0.30000001192092896, 0);
	G2L["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["23"]["Position"] = UDim2.new(0.021472392603754997, 0, 0.350000262260437, 0);
	G2L["23"]["Name"] = [[ProgressBar]];

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.PROGRESS.ProgressBar.UIStroke
	G2L["24"] = Instance.new("UIStroke", G2L["23"]);
	G2L["24"]["Color"] = Color3.fromRGB(31, 31, 31);

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.PROGRESS.ProgressBar.UICorner
	G2L["25"] = Instance.new("UICorner", G2L["23"]);
	G2L["25"]["CornerRadius"] = UDim.new(1, 0);

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.PROGRESS.ProgressBar.Bar
	G2L["26"] = Instance.new("Frame", G2L["23"]);
	G2L["26"]["BorderSizePixel"] = 0;
	G2L["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["26"]["Size"] = UDim2.new(0.19923371076583862, 0, 1, 0);
	G2L["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["26"]["Position"] = UDim2.new(-0.0038314175326377153, 0, 0, 0);
	G2L["26"]["Name"] = [[Bar]];

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.PROGRESS.ProgressBar.Bar.UICorner
	G2L["27"] = Instance.new("UICorner", G2L["26"]);
	G2L["27"]["CornerRadius"] = UDim.new(1, 0);

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.PROGRESS.ProgressBar.Function
	G2L["28"] = Instance.new("LocalScript", G2L["23"]);
	G2L["28"]["Name"] = [[Function]];

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.PROGRESS.ProgressBar.Button
	G2L["29"] = Instance.new("ImageButton", G2L["23"]);
	G2L["29"]["BorderSizePixel"] = 0;
	G2L["29"]["AutoButtonColor"] = false;
	G2L["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["29"]["Size"] = UDim2.new(1, 0, 1, 0);
	G2L["29"]["Name"] = [[Button]];
	G2L["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["29"]["BackgroundTransparency"] = 1;

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS
	G2L["2a"] = Instance.new("Frame", G2L["20"]);
	G2L["2a"]["BorderSizePixel"] = 0;
	G2L["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["2a"]["BackgroundTransparency"] = 1;
	G2L["2a"]["Size"] = UDim2.new(1, 0, 0.6000000238418579, 0);
	G2L["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["2a"]["Name"] = [[OPTIONS]];

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.UIListLayout
	G2L["2b"] = Instance.new("UIListLayout", G2L["2a"]);
	G2L["2b"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
	G2L["2b"]["FillDirection"] = Enum.FillDirection.Horizontal;
	G2L["2b"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
	G2L["2b"]["Padding"] = UDim.new(0, 9);
	G2L["2b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.Prev
	G2L["2c"] = Instance.new("Frame", G2L["2a"]);
	G2L["2c"]["ZIndex"] = 2;
	G2L["2c"]["BorderSizePixel"] = 0;
	G2L["2c"]["BackgroundColor3"] = Color3.fromRGB(9, 9, 9);
	G2L["2c"]["Size"] = UDim2.new(0, 28, 0, 28);
	G2L["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["2c"]["Position"] = UDim2.new(0.9020408391952515, 0, 0, 0);
	G2L["2c"]["Name"] = [[Prev]];

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.Prev.Function
	G2L["2d"] = Instance.new("LocalScript", G2L["2c"]);
	G2L["2d"]["Name"] = [[Function]];

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.Prev.UICorner
	G2L["2e"] = Instance.new("UICorner", G2L["2c"]);
	G2L["2e"]["CornerRadius"] = UDim.new(1, 0);

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.Prev.Button
	G2L["2f"] = Instance.new("ImageButton", G2L["2c"]);
	G2L["2f"]["BorderSizePixel"] = 0;
	G2L["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["2f"]["Size"] = UDim2.new(1, 0, 1, 0);
	G2L["2f"]["Name"] = [[Button]];
	G2L["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["2f"]["BackgroundTransparency"] = 1;

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.Prev.Icon
	G2L["30"] = Instance.new("ImageLabel", G2L["2c"]);
	G2L["30"]["ZIndex"] = 2;
	G2L["30"]["BorderSizePixel"] = 0;
	G2L["30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["30"]["ImageColor3"] = Color3.fromRGB(201, 201, 201);
	G2L["30"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["30"]["Image"] = [[rbxassetid://7072722377]];
	G2L["30"]["Size"] = UDim2.new(0.699999988079071, 0, 0.699999988079071, 0);
	G2L["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["30"]["Name"] = [[Icon]];
	G2L["30"]["BackgroundTransparency"] = 1;
	G2L["30"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.PlayButton
	G2L["31"] = Instance.new("Frame", G2L["2a"]);
	G2L["31"]["ZIndex"] = 2;
	G2L["31"]["BorderSizePixel"] = 0;
	G2L["31"]["BackgroundColor3"] = Color3.fromRGB(9, 9, 9);
	G2L["31"]["Size"] = UDim2.new(0, 38, 0, 38);
	G2L["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["31"]["Position"] = UDim2.new(0.9020408391952515, 0, 0, 0);
	G2L["31"]["Name"] = [[PlayButton]];

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.PlayButton.Function
	G2L["32"] = Instance.new("LocalScript", G2L["31"]);
	G2L["32"]["Name"] = [[Function]];

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.PlayButton.UICorner
	G2L["33"] = Instance.new("UICorner", G2L["31"]);
	G2L["33"]["CornerRadius"] = UDim.new(1, 0);

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.PlayButton.Button
	G2L["34"] = Instance.new("ImageButton", G2L["31"]);
	G2L["34"]["BorderSizePixel"] = 0;
	G2L["34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["34"]["Size"] = UDim2.new(1, 0, 1, 0);
	G2L["34"]["Name"] = [[Button]];
	G2L["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["34"]["BackgroundTransparency"] = 1;

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.PlayButton.Icon
	G2L["35"] = Instance.new("ImageLabel", G2L["31"]);
	G2L["35"]["ZIndex"] = 2;
	G2L["35"]["BorderSizePixel"] = 0;
	G2L["35"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["35"]["ImageColor3"] = Color3.fromRGB(201, 201, 201);
	G2L["35"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["35"]["Image"] = [[rbxassetid://7072720676]];
	G2L["35"]["Size"] = UDim2.new(0.699999988079071, 0, 0.699999988079071, 0);
	G2L["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["35"]["Name"] = [[Icon]];
	G2L["35"]["BackgroundTransparency"] = 1;
	G2L["35"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.Next
	G2L["36"] = Instance.new("Frame", G2L["2a"]);
	G2L["36"]["ZIndex"] = 2;
	G2L["36"]["BorderSizePixel"] = 0;
	G2L["36"]["BackgroundColor3"] = Color3.fromRGB(9, 9, 9);
	G2L["36"]["Size"] = UDim2.new(0, 28, 0, 28);
	G2L["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["36"]["Position"] = UDim2.new(0.9020408391952515, 0, 0, 0);
	G2L["36"]["Name"] = [[Next]];

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.Next.Function
	G2L["37"] = Instance.new("LocalScript", G2L["36"]);
	G2L["37"]["Name"] = [[Function]];

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.Next.UICorner
	G2L["38"] = Instance.new("UICorner", G2L["36"]);
	G2L["38"]["CornerRadius"] = UDim.new(1, 0);

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.Next.Button
	G2L["39"] = Instance.new("ImageButton", G2L["36"]);
	G2L["39"]["BorderSizePixel"] = 0;
	G2L["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["39"]["Size"] = UDim2.new(1, 0, 1, 0);
	G2L["39"]["Name"] = [[Button]];
	G2L["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["39"]["BackgroundTransparency"] = 1;

	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.Next.Icon
	G2L["3a"] = Instance.new("ImageLabel", G2L["36"]);
	G2L["3a"]["ZIndex"] = 2;
	G2L["3a"]["BorderSizePixel"] = 0;
	G2L["3a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["3a"]["ImageColor3"] = Color3.fromRGB(201, 201, 201);
	G2L["3a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["3a"]["Image"] = [[rbxassetid://7072722426]];
	G2L["3a"]["Size"] = UDim2.new(0.699999988079071, 0, 0.699999988079071, 0);
	G2L["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["3a"]["Name"] = [[Icon]];
	G2L["3a"]["BackgroundTransparency"] = 1;
	G2L["3a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

	-- StarterGui.SP.Holder.TrackList.PLAYING.TrackCover
	G2L["3b"] = Instance.new("ImageLabel", G2L["19"]);
	G2L["3b"]["BorderSizePixel"] = 0;
	G2L["3b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["3b"]["AnchorPoint"] = Vector2.new(0, 0.5);
	G2L["3b"]["Image"] = [[rbxasset://textures/ui/GuiImagePlaceholder.png]];
	G2L["3b"]["Size"] = UDim2.new(0, 55, 0, 55);
	G2L["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["3b"]["Name"] = [[TrackCover]];
	G2L["3b"]["Position"] = UDim2.new(0.024000000208616257, 0, 0.5, 0);

	-- StarterGui.SP.Holder.TrackList.PLAYING.TrackCover.UICorner
	G2L["3c"] = Instance.new("UICorner", G2L["3b"]);


	-- StarterGui.SP.Holder.Topbar
	G2L["3d"] = Instance.new("Frame", G2L["2"]);
	G2L["3d"]["ZIndex"] = 999999999;
	G2L["3d"]["BorderSizePixel"] = 0;
	G2L["3d"]["BackgroundColor3"] = Color3.fromRGB(9, 9, 9);
	G2L["3d"]["Size"] = UDim2.new(0, 490, 0, 48);
	G2L["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["3d"]["Name"] = [[Topbar]];

	-- StarterGui.SP.Holder.Topbar.UICorner
	G2L["3e"] = Instance.new("UICorner", G2L["3d"]);
	G2L["3e"]["CornerRadius"] = UDim.new(0, 12);

	-- StarterGui.SP.Holder.Topbar.cover
	G2L["3f"] = Instance.new("Frame", G2L["3d"]);
	G2L["3f"]["BorderSizePixel"] = 0;
	G2L["3f"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
	G2L["3f"]["Size"] = UDim2.new(0, 490, 0, 1);
	G2L["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["3f"]["Position"] = UDim2.new(0, 0, 1, 0);
	G2L["3f"]["Name"] = [[cover]];

	-- StarterGui.SP.Holder.Topbar.Close
	G2L["40"] = Instance.new("Frame", G2L["3d"]);
	G2L["40"]["ZIndex"] = 2;
	G2L["40"]["BorderSizePixel"] = 0;
	G2L["40"]["BackgroundColor3"] = Color3.fromRGB(9, 9, 9);
	G2L["40"]["Size"] = UDim2.new(0, 48, 0, 48);
	G2L["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["40"]["Position"] = UDim2.new(0.9020408391952515, 0, 0, 0);
	G2L["40"]["Name"] = [[Close]];

	-- StarterGui.SP.Holder.Topbar.Close.UICorner
	G2L["41"] = Instance.new("UICorner", G2L["40"]);
	G2L["41"]["CornerRadius"] = UDim.new(0, 12);

	-- StarterGui.SP.Holder.Topbar.Close.cover-bottom
	G2L["42"] = Instance.new("Frame", G2L["40"]);
	G2L["42"]["ZIndex"] = 2;
	G2L["42"]["BorderSizePixel"] = 0;
	G2L["42"]["BackgroundColor3"] = Color3.fromRGB(9, 9, 9);
	G2L["42"]["Size"] = UDim2.new(0, 48, 0, 12);
	G2L["42"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["42"]["Position"] = UDim2.new(0, 0, 0.75, 0);
	G2L["42"]["Name"] = [[cover-bottom]];

	-- StarterGui.SP.Holder.Topbar.Close.cover-left
	G2L["43"] = Instance.new("Frame", G2L["40"]);
	G2L["43"]["ZIndex"] = 2;
	G2L["43"]["BorderSizePixel"] = 0;
	G2L["43"]["BackgroundColor3"] = Color3.fromRGB(9, 9, 9);
	G2L["43"]["Size"] = UDim2.new(0, 9, 0, 48);
	G2L["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["43"]["Name"] = [[cover-left]];

	-- StarterGui.SP.Holder.Topbar.Close.CloseX
	G2L["44"] = Instance.new("ImageLabel", G2L["40"]);
	G2L["44"]["ZIndex"] = 2;
	G2L["44"]["BorderSizePixel"] = 0;
	G2L["44"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["44"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["44"]["Image"] = [[rbxassetid://7072725342]];
	G2L["44"]["Size"] = UDim2.new(0.5, 0, 0.5, 0);
	G2L["44"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["44"]["Name"] = [[CloseX]];
	G2L["44"]["BackgroundTransparency"] = 1;
	G2L["44"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

	-- StarterGui.SP.Holder.Topbar.Close.CloseButton
	G2L["45"] = Instance.new("ImageButton", G2L["40"]);
	G2L["45"]["BorderSizePixel"] = 0;
	G2L["45"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["45"]["Size"] = UDim2.new(1, 0, 1, 0);
	G2L["45"]["Name"] = [[CloseButton]];
	G2L["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["45"]["BackgroundTransparency"] = 1;

	-- StarterGui.SP.Holder.Topbar.Close.Function
	G2L["46"] = Instance.new("LocalScript", G2L["40"]);
	G2L["46"]["Name"] = [[Function]];

	-- StarterGui.SP.Holder.Topbar.TitleLabel
	G2L["47"] = Instance.new("TextLabel", G2L["3d"]);
	G2L["47"]["ZIndex"] = 999999999;
	G2L["47"]["BorderSizePixel"] = 0;
	G2L["47"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["47"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	G2L["47"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Heavy, Enum.FontStyle.Normal);
	G2L["47"]["TextSize"] = 16;
	G2L["47"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["47"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	G2L["47"]["Size"] = UDim2.new(0.6163265109062195, 0, 0.9999999403953552, 0);
	G2L["47"]["ClipsDescendants"] = true;
	G2L["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["47"]["Text"] = [[Spotify Player v]]..config.Version;
	G2L["47"]["Name"] = [[TitleLabel]];
	G2L["47"]["BackgroundTransparency"] = 1;

	-- StarterGui.SP.Holder.Topbar.TitleLabel.UIPadding
	G2L["48"] = Instance.new("UIPadding", G2L["47"]);
	G2L["48"]["PaddingRight"] = UDim.new(0, 5);
	G2L["48"]["PaddingLeft"] = UDim.new(0, 50);

	-- StarterGui.SP.Holder.Topbar.SpotifyLogo
	G2L["49"] = Instance.new("Frame", G2L["3d"]);
	G2L["49"]["ZIndex"] = 2;
	G2L["49"]["BorderSizePixel"] = 0;
	G2L["49"]["BackgroundColor3"] = Color3.fromRGB(9, 9, 9);
	G2L["49"]["Size"] = UDim2.new(0, 48, 0, 48);
	G2L["49"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["49"]["Name"] = [[SpotifyLogo]];

	-- StarterGui.SP.Holder.Topbar.SpotifyLogo.UICorner
	G2L["4a"] = Instance.new("UICorner", G2L["49"]);
	G2L["4a"]["CornerRadius"] = UDim.new(0, 12);

	-- StarterGui.SP.Holder.Topbar.SpotifyLogo.Icon
	G2L["4b"] = Instance.new("ImageLabel", G2L["49"]);
	G2L["4b"]["ZIndex"] = 2;
	G2L["4b"]["BorderSizePixel"] = 0;
	G2L["4b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["4b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	G2L["4b"]["Size"] = UDim2.new(0.6000000238418579, 0, 0.6000000238418579, 0);
	G2L["4b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["4b"]["Name"] = [[Icon]];
	G2L["4b"]["BackgroundTransparency"] = 1;
	G2L["4b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

	-- StarterGui.SP.UIScale
	G2L["4c"] = Instance.new("UIScale", G2L["1"]);


	-- StarterGui.SP.TRACKSOUND
	G2L["4d"] = Instance.new("Sound", G2L["1"]);
	G2L["4d"]["Volume"] = 0.699999988079071;
	G2L["4d"]["Looped"] = true;
	G2L["4d"]["SoundId"] = "0";
	G2L["4d"]["Name"] = [[TRACKSOUND]];
	G2L["4d"]["RollOffMode"] = Enum.RollOffMode.InverseTapered;

	local function C_4()
		local script = G2L["4"];
		local UserInputService = game:GetService("UserInputService")

		local gui = script.Parent
		local ui = gui.Topbar

		local dragging
		local dragInput
		local dragStart
		local startPos

		local function update(input)
			local delta = input.Position - dragStart
			gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end

		ui.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = gui.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		ui.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				update(input)
			end
		end)
	end;
	task.spawn(C_4);
	-- StarterGui.SP.Holder.TrackList.TrackList.Function
	local function C_8()
		local script = G2L["8"];
		script.Parent.MouseEnter:Connect(function()
			script.Parent.ScrollBarImageColor3 = Color3.fromRGB(79, 240, 114)
		end)
		script.Parent.MouseLeave:Connect(function()
			script.Parent.ScrollBarImageColor3 = Color3.fromRGB(207, 207, 207)
		end)
		while true do
			local c = script.Parent:GetChildren()
			if #c >= 6 then
				script.Parent.AutomaticSize = Enum.AutomaticSize.None
				script.Parent.AutomaticCanvasSize = Enum.AutomaticSize.Y
				script.Parent.ScrollingDirection = Enum.ScrollingDirection.Y
				script.Parent.Size = UDim2.new(1, 0,0, 162)
			else
				script.Parent.AutomaticSize = Enum.AutomaticSize.Y
				script.Parent.AutomaticCanvasSize = Enum.AutomaticSize.None
				script.Parent.ScrollingDirection = Enum.ScrollingDirection.Y
				script.Parent.Size = UDim2.new(1, 0,0, 81)
			end
			wait()
		end
	end;
	task.spawn(C_8);
	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.PROGRESS.ProgressBar.Function
	local function C_28()
		local script = G2L["28"];
		script.Parent.Button.MouseButton1Down:Connect(function()
			script.Parent.Bar.Size = UDim2.new(math.clamp((game.Players.LocalPlayer:GetMouse().X - script.Parent.AbsolutePosition.X)/script.Parent.AbsoluteSize.X,0,1),0,1,0)
			G2L["1"].TRACKSOUND.TimePosition = math.floor(script.Parent.Bar.Size.X.Scale * G2L["1"].TRACKSOUND.TimeLength)
		end)
		script.Parent.MouseEnter:Connect(function()
			script.Parent.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			script.Parent.Bar.BackgroundColor3 = Color3.fromRGB(64, 193, 94)
		end)
		script.Parent.MouseLeave:Connect(function()
			script.Parent.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
			script.Parent.Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		end)
		while true do
			local progress = G2L["1"].TRACKSOUND.TimePosition / G2L["1"].TRACKSOUND.TimeLength
			script.Parent.Bar.Size = UDim2.new(progress, 0, 1, 0)
			wait()
		end
	end;
	task.spawn(C_28);
	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.Prev.Function
	local function C_2d()
		local script = G2L["2d"];
		local function enter()
			script.Parent.Size = UDim2.new(0, 32, 0, 32)
			script.Parent.Icon.ImageColor3 = Color3.fromRGB(255,255,255)
		end
		local function leave()
			script.Parent.Size = UDim2.new(0, 28, 0, 28)
			script.Parent.Icon.ImageColor3 = Color3.fromRGB(200,200,200)
		end
		script.Parent.MouseEnter:Connect(enter)
		script.Parent.MouseLeave:Connect(leave)
		script.Parent.Button.MouseButton1Down:Connect(enter)
		script.Parent.Button.MouseButton1Up:Connect(leave)
		script.Parent.Button.MouseButton1Click:Connect(function()
			enter()
			task.wait(0.2)
			leave()
		end)
	end;
	task.spawn(C_2d);
	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.PlayButton.Function
	local function C_32()
		local script = G2L["32"];
		local function enter()
			script.Parent.Size = UDim2.new(0, 44, 0, 44)
			script.Parent.Icon.ImageColor3 = Color3.fromRGB(255,255,255)
		end
		local function leave()
			script.Parent.Size = UDim2.new(0, 38, 0, 38)
			script.Parent.Icon.ImageColor3 = Color3.fromRGB(200,200,200)
		end
		script.Parent.MouseEnter:Connect(enter)
		script.Parent.MouseLeave:Connect(leave)
		script.Parent.Button.MouseButton1Down:Connect(enter)
		script.Parent.Button.MouseButton1Up:Connect(leave)
		script.Parent.Button.MouseButton1Click:Connect(function()
			enter()
			G2L["1"].TRACKSOUND.Playing = not G2L["1"].TRACKSOUND.Playing
			if G2L["1"].TRACKSOUND.Playing then
				script.Parent.Icon.Image = "rbxassetid://7072719997"
			else
				script.Parent.Icon.Image = "rbxassetid://7072720676"
			end
			task.wait(0.2)
			leave()
		end)
		G2L["1"].TRACKSOUND.DidLoop:Connect(function()
			G2L["1"].TRACKSOUND:Pause()
			G2L["1"].TRACKSOUND.TimePosition = 0
			script.Parent.Icon.Image = "rbxassetid://7072720676"
		end)
		G2L["1"].TRACKSOUND.Played:Connect(function()
			G2L["1"].TRACKSOUND.TimePosition = 0
			script.Parent.Icon.Image = "rbxassetid://7072719997"
		end)
	end;
	task.spawn(C_32);
	-- StarterGui.SP.Holder.TrackList.PLAYING.TRACKOPTIONS.OPTIONS.Next.Function
	local function C_37()
		local script = G2L["37"];
		local function enter()
			script.Parent.Size = UDim2.new(0, 32, 0, 32)
			script.Parent.Icon.ImageColor3 = Color3.fromRGB(255,255,255)
		end
		local function leave()
			script.Parent.Size = UDim2.new(0, 28, 0, 28)
			script.Parent.Icon.ImageColor3 = Color3.fromRGB(200,200,200)
		end
		script.Parent.MouseEnter:Connect(enter)
		script.Parent.MouseLeave:Connect(leave)
		script.Parent.Button.MouseButton1Down:Connect(enter)
		script.Parent.Button.MouseButton1Up:Connect(leave)
		script.Parent.Button.MouseButton1Click:Connect(function()
			enter()
			task.wait(0.2)
			leave()
		end)
	end;
	task.spawn(C_37);
	-- StarterGui.SP.Holder.Topbar.Close.Function
	local function C_46()
		local script = G2L["46"];
		local color1 = Color3.fromRGB(30, 30, 30)
		local color2 = Color3.fromRGB(8, 8, 8)
		local function light()
			script.Parent.BackgroundColor3 = color1
			script.Parent["cover-left"].BackgroundColor3 = color1
			script.Parent["cover-bottom"].BackgroundColor3 = color1
		end
		local function dark()
			script.Parent.BackgroundColor3 = color2
			script.Parent["cover-left"].BackgroundColor3 = color2
			script.Parent["cover-bottom"].BackgroundColor3 = color2
		end
		script.Parent.MouseEnter:Connect(light)
		script.Parent.MouseLeave:Connect(dark)
		script.Parent.CloseButton.MouseButton1Down:Connect(light)
		script.Parent.CloseButton.MouseButton1Up:Connect(dark)
		script.Parent.CloseButton.MouseButton1Click:Connect(function()
			light()
			local ui = G2L["1"]
			local t = game:GetService("TweenService")
			t:Create(ui.UIScale, TweenInfo.new(0.3, Enum.EasingStyle.Quint), { Scale = 0 }):Play()
			task.wait(0.3)
			delfolder(config.Tick.."_Spotify")
			ui:Destroy()
		end)
	end;
	task.spawn(C_46);

	local loading = true
	
	local currentTrackIndex = 1
	
	local function set_track(title, cover, art, track, keep)
		if loading then
			local old_id
			if keep == false then
				G2L["3b"]["Image"] = "rbxassetid://"..cover
				G2L["1c"]["Text"] = title;
				G2L["1e"]["Text"] = art;
				G2L["1"].TRACKSOUND.TimePosition = 0
				G2L["1"].TRACKSOUND.SoundId = "rbxassetid://"..track
			end
		else
			G2L["3b"]["Image"] =  "rbxassetid://"..cover
			G2L["1c"]["Text"] = title;
			G2L["1e"]["Text"] = art;
			G2L["1"].TRACKSOUND.TimePosition = 0
			G2L["1"].TRACKSOUND.SoundId = "rbxassetid://"..track
		end
	end
	local function next_track()
		local order = {}
		for _, track in pairs(config.Tracks) do
			table.insert(order, track)
		end
		currentTrackIndex = currentTrackIndex + 1
		if currentTrackIndex > #order then
			currentTrackIndex = 1
		end
		local nextTrack = order[currentTrackIndex]
		local configFolder = config.file.."/"..nextTrack.title.."_".."Config"
		local coverFile = configFolder.."/"..nextTrack.title.."_".."Cover.png"
		local trackFile = configFolder.."/"..nextTrack.title.."_".."Track.mp4"
		set_track(nextTrack.title, coverFile, nextTrack.artists, trackFile, false)
		G2L["1"].TRACKSOUND:Play()
		return nextTrack
	end
	local function previous_track()
		local order = {}
		for _, track in pairs(config.Tracks) do
			table.insert(order, track)
		end
		currentTrackIndex = currentTrackIndex - 1
		if currentTrackIndex < 1 then
			currentTrackIndex = #order
		end
		local prevTrack = order[currentTrackIndex]
		local configFolder = config.file.."/"..prevTrack.title.."_".."Config"
		local coverFile = configFolder.."/"..prevTrack.title.."_".."Cover.png"
		local trackFile = configFolder.."/"..prevTrack.title.."_".."Track.mp4"
		set_track(prevTrack.title, coverFile, prevTrack.artists, trackFile, false)
		G2L["1"].TRACKSOUND:Play()
		return prevTrack
	end
	local function add_playist(title, cover, artist, track)
		
		-- StarterGui.SP.Holder.TrackList.TrackList.SONG1
		G2L["9"] = Instance.new("Frame", G2L["7"]);
		G2L["9"]["BorderSizePixel"] = 0;
		G2L["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["9"]["BackgroundTransparency"] = 1;
		G2L["9"]["Size"] = UDim2.new(0, 249, 0, 81);
		G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["9"]["AutomaticSize"] = Enum.AutomaticSize.Y;
		G2L["9"]["Name"] = title;

		-- StarterGui.SP.Holder.TrackList.TrackList.SONG1.INFO
		G2L["a"] = Instance.new("Frame", G2L["9"]);
		G2L["a"]["BorderSizePixel"] = 0;
		G2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["a"]["AnchorPoint"] = Vector2.new(0, 0.5);
		G2L["a"]["BackgroundTransparency"] = 1;
		G2L["a"]["Size"] = UDim2.new(0, 134, 0, 55);
		G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["a"]["Position"] = UDim2.new(0, 66, 0, 40);
		G2L["a"]["Name"] = [[INFO]];

		-- StarterGui.SP.Holder.TrackList.TrackList.SONG1.INFO.UIListLayout
		G2L["b"] = Instance.new("UIListLayout", G2L["a"]);
		G2L["b"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
		G2L["b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

		-- StarterGui.SP.Holder.TrackList.TrackList.SONG1.INFO.TRACKNAME
		G2L["c"] = Instance.new("TextLabel", G2L["a"]);
		G2L["c"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
		G2L["c"]["BorderSizePixel"] = 0;
		G2L["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		G2L["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		G2L["c"]["TextSize"] = 14;
		G2L["c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["c"]["AutomaticSize"] = Enum.AutomaticSize.Y;
		G2L["c"]["Size"] = UDim2.new(1, 0, 0.5, 0);
		G2L["c"]["ClipsDescendants"] = true;
		G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["c"]["Text"] = title;
		G2L["c"]["Name"] = [[TRACKNAME]];
		G2L["c"]["BackgroundTransparency"] = 1;
		G2L["c"]["Position"] = UDim2.new(0.13469387590885162, 0, 0.16049382090568542, 0);

		-- StarterGui.SP.Holder.TrackList.TrackList.SONG1.INFO.TRACKNAME.UIPadding
		G2L["d"] = Instance.new("UIPadding", G2L["c"]);
		G2L["d"]["PaddingLeft"] = UDim.new(0, 8);

		-- StarterGui.SP.Holder.TrackList.TrackList.SONG1.INFO.TRACKARTIST
		G2L["e"] = Instance.new("TextLabel", G2L["a"]);
		G2L["e"]["TextWrapped"] = true;
		G2L["e"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
		G2L["e"]["BorderSizePixel"] = 0;
		G2L["e"]["TextYAlignment"] = Enum.TextYAlignment.Top;
		G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		G2L["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		G2L["e"]["TextSize"] = 12;
		G2L["e"]["TextColor3"] = Color3.fromRGB(81, 81, 81);
		G2L["e"]["AutomaticSize"] = Enum.AutomaticSize.Y;
		G2L["e"]["Size"] = UDim2.new(1, 0, 0.5, 0);
		G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["e"]["Text"] = artist;
		G2L["e"]["Name"] = [[TRACKARTIST]];
		G2L["e"]["BackgroundTransparency"] = 1;
		G2L["e"]["Position"] = UDim2.new(0.13469387590885162, 0, 0.4938271641731262, 0);

		-- StarterGui.SP.Holder.TrackList.TrackList.SONG1.INFO.TRACKARTIST.UIPadding
		G2L["f"] = Instance.new("UIPadding", G2L["e"]);
		G2L["f"]["PaddingLeft"] = UDim.new(0, 8);

		-- StarterGui.SP.Holder.TrackList.TrackList.SONG1.TrackCover
		G2L["10"] = Instance.new("ImageLabel", G2L["9"]);
		G2L["10"]["BorderSizePixel"] = 0;
		G2L["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["10"]["AnchorPoint"] = Vector2.new(0, 0.5);
		G2L["10"]["Image"] = [[rbxasset://textures/ui/GuiImagePlaceholder.png]];
		G2L["10"]["Size"] = UDim2.new(0, 55, 0, 55);
		G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["10"]["Name"] = [[TrackCover]];
		G2L["10"]["Position"] = UDim2.new(0.024000000208616257, 0, 0.5, 0);

		-- StarterGui.SP.Holder.TrackList.TrackList.SONG1.TrackCover.UICorner
		G2L["11"] = Instance.new("UICorner", G2L["10"]);


		-- StarterGui.SP.Holder.TrackList.TrackList.SONG1.PlayButton
		G2L["12"] = Instance.new("Frame", G2L["9"]);
		G2L["12"]["ZIndex"] = 2;
		G2L["12"]["BorderSizePixel"] = 0;
		G2L["12"]["BackgroundColor3"] = Color3.fromRGB(9, 9, 9);
		G2L["12"]["AnchorPoint"] = Vector2.new(0, 0.5);
		G2L["12"]["BackgroundTransparency"] = 1;
		G2L["12"]["Size"] = UDim2.new(0, 38, 0, 38);
		G2L["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["12"]["Position"] = UDim2.new(0.800000011920929, 0, 0, 40);
		G2L["12"]["Name"] = [[PlayButton]];

		-- StarterGui.SP.Holder.TrackList.TrackList.SONG1.PlayButton.Function
		G2L["13"] = Instance.new("LocalScript", G2L["12"]);
		G2L["13"]["Name"] = [[Function]];

		-- StarterGui.SP.Holder.TrackList.TrackList.SONG1.PlayButton.UICorner
		G2L["14"] = Instance.new("UICorner", G2L["12"]);
		G2L["14"]["CornerRadius"] = UDim.new(1, 0);

		-- StarterGui.SP.Holder.TrackList.TrackList.SONG1.PlayButton.Button
		G2L["15"] = Instance.new("ImageButton", G2L["12"]);
		G2L["15"]["BorderSizePixel"] = 0;
		G2L["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["15"]["Size"] = UDim2.new(1, 0, 1, 0);
		G2L["15"]["Name"] = [[Button]];
		G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["15"]["BackgroundTransparency"] = 1;

		-- StarterGui.SP.Holder.TrackList.TrackList.SONG1.PlayButton.Icon
		G2L["16"] = Instance.new("ImageLabel", G2L["12"]);
		G2L["16"]["ZIndex"] = 2;
		G2L["16"]["BorderSizePixel"] = 0;
		G2L["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["16"]["ImageColor3"] = Color3.fromRGB(201, 201, 201);
		G2L["16"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		G2L["16"]["Image"] = [[rbxassetid://7072720676]];
		G2L["16"]["Size"] = UDim2.new(0.699999988079071, 0, 0.699999988079071, 0);
		G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["16"]["Name"] = [[Icon]];
		G2L["16"]["BackgroundTransparency"] = 1;
		G2L["16"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

		local script = G2L["13"];
		local function enter()
			script.Parent.Icon.ImageColor3 = Color3.fromRGB(255,255,255)
		end
		local function leave()
			script.Parent.Icon.ImageColor3 = Color3.fromRGB(200,200,200)
		end
		script.Parent.MouseEnter:Connect(enter)
		script.Parent.MouseLeave:Connect(leave)
		script.Parent.Button.MouseButton1Down:Connect(enter)
		script.Parent.Button.MouseButton1Up:Connect(leave)
		script.Parent.Button.MouseButton1Click:Connect(function()
			enter()
			repeat
				next_track()
				wait()
			until next_track().title == title
			task.wait(0.2)
			leave()
		end)

		-- set getsynasset
		G2L["10"]["Image"] = "rbxassetid://"..cover

	end
	G2L["39"].MouseButton1Click:Connect(next_track)
	G2L["2f"].MouseButton1Click:Connect(previous_track)
	G2L["1"].TRACKSOUND.DidLoop:Connect(function()
		wait(0.2)
		next_track()
	end)

	writefile(config.file.."/Logo.png", game:HttpGet("https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Spotify_logo_without_text.svg/2048px-Spotify_logo_without_text.svg.png"))
	G2L["4b"]["Image"] = "rbxassetid://"..config.file.."/Logo.png"
	local order = {}
	for i,v in pairs(config.Tracks) do
		local configFolder = config.file.."/"..i.."_".."Config"
		newfolder(configFolder)
		local coverFile = configFolder.."/"..i.."_".."Cover.png"
		local trackFile = configFolder.."/"..i.."_".."Track.mp4"
		writefile(coverFile, game:HttpGet(v.cover))
		writefile(trackFile, game:HttpGet(v.track))
		add_playist(i, coverFile, v.artists, trackFile)
		for _, track in pairs(config.Tracks) do
			table.insert(order, track)
		end
		local configFolder = config.file.."/"..order[1].title.."_".."Config"
		local coverFile = configFolder.."/"..order[1].title.."_".."Cover.png"
		local trackFile = configFolder.."/"..order[1].title.."_".."Track.mp4"
		if G2L["4d"]["SoundId"] == "0" then
			G2L["4d"]["SoundId"] = "rbxassetid://"..trackFile
			G2L["3b"]["Image"] = "rbxassetid://"..coverFile
			G2L["1c"]["Text"] = order[1].title;
			G2L["1e"]["Text"] = order[1].artists;
			G2L["1"].TRACKSOUND.TimePosition = 0
			G2L["1"].TRACKSOUND.SoundId = "rbxassetid://"..trackFile
		end
		set_track(order[1].title, coverFile, order[1].artists, trackFile, true)
	end
	loading = false
	print("Finished loading")

	return G2L["1"];

end

return ui