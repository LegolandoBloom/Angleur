

--**********************************************************************
--*THE PART THAT IS PORTED FROM RETAIL TO CLASSIC, NOT NEEDED IN RETAIL*
--**********************************************************************

local HelpTip = { };
-- external use enums
HelpTip.Point = {
	TopEdgeLeft = 1,
	TopEdgeCenter = 2,
	TopEdgeRight = 3,
	BottomEdgeLeft = 4,	
	BottomEdgeCenter = 5,
	BottomEdgeRight = 6,
	RightEdgeTop = 7,
	RightEdgeCenter = 8,
	RightEdgeBottom = 9,
	LeftEdgeTop = 10,
	LeftEdgeCenter = 11,
	LeftEdgeBottom = 12,
};
HelpTip.Alignment = {
	Left = 1,
	Center = 2,
	Right = 3,
	-- Intentional re-use of indices, really just need 3 settings but 5 makes it easier to visualize
	Top = 1,
	Bottom = 3,
};
HelpTip.ButtonStyle = {
	None = 1,
	Close = 2,
	Okay = 3,
	GotIt = 4,
	Next = 5,
};

HelpTip.ArrowRotation = {
	Down = 1,
	Left = 2,
	Up = 3,
	Right = 4,
};
-- data
HelpTip.PointInfo = {
	[HelpTip.Point.TopEdgeLeft]		= { arrowRotation = HelpTip.ArrowRotation.Down,	 relativeAnchor = "TOPLEFT",	oppositePoint = HelpTip.Point.BottomEdgeLeft },
	[HelpTip.Point.TopEdgeCenter]	= { arrowRotation = HelpTip.ArrowRotation.Down,  relativeAnchor = "TOP",		oppositePoint = HelpTip.Point.BottomEdgeCenter },
	[HelpTip.Point.TopEdgeRight]	= { arrowRotation = HelpTip.ArrowRotation.Down,  relativeAnchor = "TOPRIGHT",	oppositePoint = HelpTip.Point.BottomEdgeRight },
	[HelpTip.Point.RightEdgeTop]	= { arrowRotation = HelpTip.ArrowRotation.Left,  relativeAnchor = "TOPRIGHT",	oppositePoint = HelpTip.Point.LeftEdgeTop },
	[HelpTip.Point.RightEdgeCenter] = { arrowRotation = HelpTip.ArrowRotation.Left,  relativeAnchor = "RIGHT",		oppositePoint = HelpTip.Point.LeftEdgeCenter },
	[HelpTip.Point.RightEdgeBottom] = { arrowRotation = HelpTip.ArrowRotation.Left,  relativeAnchor = "BOTTOMRIGHT",oppositePoint = HelpTip.Point.LeftEdgeBottom },
	[HelpTip.Point.BottomEdgeRight] = { arrowRotation = HelpTip.ArrowRotation.Up,	 relativeAnchor = "BOTTOMRIGHT",oppositePoint = HelpTip.Point.TopEdgeRight },
	[HelpTip.Point.BottomEdgeCenter]= { arrowRotation = HelpTip.ArrowRotation.Up,	 relativeAnchor = "BOTTOM",		oppositePoint = HelpTip.Point.TopEdgeCenter },
	[HelpTip.Point.BottomEdgeLeft]	= { arrowRotation = HelpTip.ArrowRotation.Up,	 relativeAnchor = "BOTTOMLEFT",	oppositePoint = HelpTip.Point.TopEdgeLeft },
	[HelpTip.Point.LeftEdgeBottom]	= { arrowRotation = HelpTip.ArrowRotation.Right, relativeAnchor = "BOTTOMLEFT",	oppositePoint = HelpTip.Point.RightEdgeBottom },
	[HelpTip.Point.LeftEdgeCenter]	= { arrowRotation = HelpTip.ArrowRotation.Right, relativeAnchor = "LEFT",		oppositePoint = HelpTip.Point.RightEdgeCenter },
	[HelpTip.Point.LeftEdgeTop]		= { arrowRotation = HelpTip.ArrowRotation.Right, relativeAnchor = "TOPLEFT",	oppositePoint = HelpTip.Point.RightEdgeTop },
};
HelpTip.ArrowOffsets = {
	[HelpTip.Alignment.Center]	= { 0,	 5 };
	[HelpTip.Alignment.Left]	= { 35,  5 };
	[HelpTip.Alignment.Right]	= { -35, 5 };
};
HelpTip.ArrowGlowOffsets = { 0, 4 };
HelpTip.DistanceOffsets = {
	[HelpTip.Alignment.Center]	= { 0,	 -20 };
	[HelpTip.Alignment.Left]	= { -35, -20 };
	[HelpTip.Alignment.Right]	= { 35,  -20 };
};
HelpTip.Rotations = {
	[HelpTip.ArrowRotation.Down]	= { modOffsetX = 1,  modOffsetY = -1, swapOffsets = false,	degrees = 0,	anchors = { "BOTTOMLEFT", "BOTTOM", "BOTTOMRIGHT" } },
	[HelpTip.ArrowRotation.Left]	= { modOffsetX = -1, modOffsetY = -1, swapOffsets = true,	degrees = 90,	anchors = { "TOPLEFT", "LEFT", "BOTTOMLEFT" } },
	[HelpTip.ArrowRotation.Up]		= { modOffsetX = 1,	 modOffsetY = 1,  swapOffsets = false,	degrees = 180,	anchors = { "TOPLEFT", "TOP", "TOPRIGHT"}  },
	[HelpTip.ArrowRotation.Right]	= { modOffsetX = 1,	 modOffsetY = -1, swapOffsets = true,	degrees = 270,	anchors = { "TOPRIGHT", "RIGHT", "BOTTOMRIGHT" } },
};
HelpTip.Buttons = {
	[HelpTip.ButtonStyle.None]	= { textWidthAdj = 0,	heightAdj = 0,	parentKey = nil },
	[HelpTip.ButtonStyle.Close]	= { textWidthAdj = -6,	heightAdj = 0,	parentKey = "CloseButton" },
	[HelpTip.ButtonStyle.Okay]	= { textWidthAdj = 0,	heightAdj = 30,	parentKey = "OkayButton", text = OKAY },
	[HelpTip.ButtonStyle.GotIt]	= { textWidthAdj = 0,	heightAdj = 30,	parentKey = "OkayButton", text = HELP_TIP_BUTTON_GOT_IT },
	[HelpTip.ButtonStyle.Next]	= { textWidthAdj = 0,	heightAdj = 30,	parentKey = "OkayButton", text = NEXT },
};
HelpTip.verticalPadding	 = 31;
HelpTip.minimumHeight	 = 72;
HelpTip.defaultTextWidth = 196;
HelpTip.width = 226;
HelpTip.halfWidth = HelpTip.width / 2;

--**********************************************************************
--**********************************************************************
--**********************************************************************

