Angleur_HelpTipCloseButtonMixin = CreateFromMixins(ButtonStateBehaviorMixin);

function Angleur_HelpTipCloseButtonMixin:GetAtlas()
	if self:IsDown() then
		return "common-icon-yellowx-down";
	end
	return "common-icon-yellowx";
end

function Angleur_HelpTipCloseButtonMixin:OnButtonStateChanged()
	self.Texture:SetAtlas(self:GetAtlas(), TextureKitConstants.UseAtlasSize);
end


Angleur_HelpTipTemplateMixin = {};

Angleur_HelpTipTemplateMixin.warningFrame = nil

Angleur_HelpTipTemplateMixin.acknowledgeThisHide = false

Angleur_HelpTipTemplateMixin.savedTable = nil

Angleur_HelpTipTemplateMixin.partActive = nil

Angleur_HelpTipTemplateMixin.onSkipCallback = nil

Angleur_HelpTipTemplateMixin.parts = {}
--[[
	Angleur_HelpTipTemplateMixin.parts[i] = {
		text,									-- also acts as a key for various API, MUST BE SET
		textColor = HIGHLIGHT_FONT_COLOR,
		textJustifyH = "LEFT",
		buttonStyle = HelpTip.ButtonStyle.None	--> [None|Close|Okay|GotIt|Next]

		targetPoint = HelpTip.Point.BottomEdgeCenter, --> [TopEdgeLeft|TopEdgeCenter|TopEdgeRight|BottomEdgeLeft|BottomEdgeCenter|BottomEdgeRight]
								   						  [RightEdgeTop|RightEdgeCenter|RightEdgeBottom|LeftEdgeTop|LeftEdgeCenter|LeftEdgeBottom]

		alignment = HelpTip.Alignment.Center,	--> [Left|Center|Right|Top|Bottom] (Left = Top and Right = Bottom, ie actually 3 values in total)
		
		hideArrow = false,						
		offsetX = 0,
		offsetY	= 0,

		hideHighlightTexture = false
        highlightTextureSizeMultiplierX = 1,
        highlightTextureSizeMultiplierY = 1,

		onHideCallback, callbackArg,			-- callback whenever the helptip is closed:  onHideCallback(acknowledged, callbackArg)
		autoEdgeFlipping = false,				-- on: will flip helptip to opposite edge based on relative region's center vs helptip's center during OnUpdate
		autoHorizontalSlide = false,			-- on: will change the alignment to fit helptip on screen during OnUpdate
		useParentStrata	= false,				-- whether to use parent framestrata
		systemPriority = 0,						-- if a system and a priority is specified, higher priority helptips will close another helptip in that system
		extraRightMarginPadding = 0,			--  extra padding on the right side of the helptip
		appendFrame = nil,						-- if a helptip needs a custom display you can append your own frame to the text
		appendFrameYOffset = nil,				-- the offset for the vertical anchor for appendFrame
		autoHideWhenTargetHides = false,		-- if the target frame hides, the helptip will hide if this is set and call the onHideCallback with an apprpropriate reason
	}
]]--

function Angleur_HelpTipTemplateMixin:OnLoad()
	self.Arrow.Arrow:ClearAllPoints();
	self.Arrow.Arrow:SetPoint("CENTER");
	self.Arrow.Glow:ClearAllPoints();
	self.OkayButton:SetScript("OnClick", function()
		self.acknowledgeThisHide = true
		self:Hide()
	end)
	self.CloseButton:SetScript("OnClick", function()
		if self.warningFrame then
			self.warningFrame:Show()
		else
			self:SkipTutorial()
		end
	end)
end

function Angleur_HelpTipTemplateMixin:OnHide()
	if self.warningFrame then
		self.warningFrame:Hide()
	end
	if not self.acknowledgeThisHide then return end
	if not self.partActive then 
        assert("Angleur: Unexpected Error, no active part found when hiding")
        return
    end
    local thisPart = self.parts[self.partActive]
    if not thisPart then
        assert("Angleur: Unexpected Error, data table of this part could not be found")
        return
    end
    if thisPart.onHideCallback then
		thisPart.onHideCallback(thisPart.callbackArg);
	end
	thisPart.appliedAlignment = nil
	thisPart.appliedTargetPoint = nil
	self.OkayButton:Hide()
	self.featureHighlight:ClearAllPoints()
	self.featureHighlight:Hide()
	self.acknowledgeThisHide = false
    self:GoToNextPart()
end

function Angleur_HelpTipTemplateMixin:AttachWarning(warningFrame)
	self.warningFrame = warningFrame

	warningFrame.noButton:SetScript("OnClick", function()
		warningFrame:Hide()
	end)
	warningFrame.yesButton:SetScript("OnClick", function()
		self:SkipTutorial()
	end)
end

function Angleur_HelpTipTemplateMixin:SkipTutorial()
	Angleur_BetaPrint("Skipping Tutorial")
	self.partActive = #self.parts + 1
	if self.savedTable then
		self.savedTable.part = self.partActive
	end
	self:Hide()
	if self.onSkipCallback then
		self.onSkipCallback()
	end
end

function Angleur_HelpTipTemplateMixin:CompletePartWithAction(part)
	if part == self.partActive then
		self.acknowledgeThisHide = true
		self:Hide()
		Angleur_BetaPrint("Completing part with action.")
	end
end

function Angleur_HelpTipTemplateMixin:Activate(startingPart)
	if startingPart > #self.parts then 
		Angleur_BetaPrint("Tutorial has already been completed.")
		return 
	end
	self.partActive = startingPart
	if self.warningFrame then self.warningFrame:Hide() end
    self:ShowActivePart()
end

function Angleur_HelpTipTemplateMixin:GoToNextPart()
    Angleur_BetaPrint("Going to next part: ")
	self.partActive = self.partActive + 1
	if self.savedTable then
		self.savedTable.part = self.partActive
	end
    if self.parts[self.partActive] then
        self:ShowActivePart()
    else
        self.partActive = nil
        Angleur_BetaPrint("Iterating through tutorials over.")
    end
end

function Angleur_HelpTipTemplateMixin:ShowActivePart()
	thisPart = self.parts[self.partActive]
	Angleur_BetaPrint("ShowActivePart: ", thisPart.text)
    self:AnchorAndRotate(thisPart)
    self:Layout(thisPart)
    self:Show()
end

function Angleur_HelpTipTemplateMixin.GetTargetPoint(targetPoint)
	return targetPoint or HelpTip.Point.BottomEdgeCenter;
end

function Angleur_HelpTipTemplateMixin.GetAlignment(alignment)
	return alignment or HelpTip.Alignment.Center;
end

function Angleur_HelpTipTemplateMixin.GetButtonInfo(buttonStyle)
	local buttonStyle = buttonStyle or HelpTip.ButtonStyle.None;
	return HelpTip.Buttons[buttonStyle];
end

	local function transformOffsetsForRotation(offsets, rotationInfo)
		local offsetX = offsets[1];
		local offsetY = offsets[2];
		if rotationInfo.swapOffsets then
			offsetX, offsetY = offsetY, offsetX;
		end
		offsetX = offsetX * rotationInfo.modOffsetX;
		offsetY = offsetY * rotationInfo.modOffsetY;
		return offsetX, offsetY;
	end
function Angleur_HelpTipTemplateMixin:AnchorAndRotate(partTable, overrideTargetPoint, overrideAlignment)
	local baseTargetPoint = self.GetTargetPoint(partTable.targetPoint);
	local targetPoint = overrideTargetPoint or baseTargetPoint;
	local alignment = overrideAlignment or self.GetAlignment(partTable.alignment);
	if targetPoint == partTable.appliedTargetPoint and alignment == partTable.appliedAlignment then
		return;
	end
	local pointInfo = HelpTip.PointInfo[targetPoint];
	local rotationInfo = HelpTip.Rotations[pointInfo.arrowRotation];
	-- anchor
	local arrowAnchor = rotationInfo.anchors[alignment];
	
	local offsetX, offsetY = transformOffsetsForRotation(HelpTip.DistanceOffsets[alignment], rotationInfo);
	local baseOffsetX = partTable.offsetX or 0;
	local baseOffsetY = partTable.offsetY or 0;
	if overrideTargetPoint and overrideTargetPoint ~= baseTargetPoint then
		if HelpTip:IsPointVertical(targetPoint) then
			baseOffsetY = -baseOffsetY;
		else
			baseOffsetX = -baseOffsetX;
		end
	end
	offsetX = offsetX + baseOffsetX;
	offsetY = offsetY + baseOffsetY;
	self:ClearAllPoints();
	self:SetPoint(arrowAnchor, partTable.relativeRegion, pointInfo.relativeAnchor, offsetX, offsetY);
	-- arrow
	if partTable.hideArrow then
		self.Arrow:Hide();
	else
		self.Arrow:Show();
		self:RotateArrow(pointInfo.arrowRotation);
		self:AnchorArrow(rotationInfo, alignment);
	end
	partTable.appliedAlignment = alignment;
	partTable.appliedTargetPoint = targetPoint;
end

function Angleur_HelpTipTemplateMixin.GetHighlightTextureSize(partTable)
	if not partTable.highlightTextureSizeMultiplierX then partTable.highlightTextureSizeMultiplierX = 1 end
	if not partTable.highlightTextureSizeMultiplierY then partTable.highlightTextureSizeMultiplierY = 1 end
end

function Angleur_HelpTipTemplateMixin:Layout(partTable)
	local targetPoint = self.GetTargetPoint(partTable.targetPoint);
	local pointInfo = HelpTip.PointInfo[targetPoint];
	local buttonInfo = self.GetButtonInfo(partTable.buttonStyle);
	-- starting defaults
	local textOffsetX = 15;
	local textOffsetY = 1;
	local textWidth = HelpTip.defaultTextWidth;
	local height = HelpTip.verticalPadding;
	-- button
	textWidth = textWidth + buttonInfo.textWidthAdj;
	textOffsetY = textOffsetY + buttonInfo.heightAdj / 2;
	height = height + buttonInfo.heightAdj;
	if buttonInfo.parentKey then
		self[buttonInfo.parentKey]:Show();
		if buttonInfo.text then
			self[buttonInfo.parentKey]:SetText(buttonInfo.text);
		end
	end
	self.GetHighlightTextureSize(partTable)
	self:SetHighlightTexture(partTable)
	-- set height based on the text
	self:ApplyText(partTable);
	self.Text:SetWidth(textWidth);
	local appendFrame = partTable.appendFrame;
	self.Text:ClearAllPoints();
	if appendFrame then
		self.Text:SetPoint("TOPLEFT", textOffsetX, textOffsetY - 16);
	else
		self.Text:SetPoint("LEFT", textOffsetX, textOffsetY);
	end
	height = height + self.Text:GetHeight();
	if appendFrame then
		appendFrame:ClearAllPoints();
		appendFrame:SetParent(self);
		local anchorOffset = info.appendFrameYOffset or 0;
		appendFrame:SetPoint("TOP", self.Text, "BOTTOM", 0, anchorOffset);
		appendFrame:SetPoint("LEFT", self.Text, "LEFT");
		appendFrame:SetPoint("RIGHT", self.Text, "RIGHT");
		appendFrame:Show();
		height = (height + appendFrame:GetHeight()) - anchorOffset;
	end
	if pointInfo.arrowRotation == HelpTip.ArrowRotation.Left or pointInfo.arrowRotation == HelpTip.ArrowRotation.Right then
		height = max(height, HelpTip.minimumHeight);
	end
	self:SetHeight(height);
end

function Angleur_HelpTipTemplateMixin:SetHighlightTexture(partTable)
	if partTable.hideHighlightTexture == true then return end
	local multiX = partTable.highlightTextureSizeMultiplierX
	local multiY = partTable.highlightTextureSizeMultiplierY
	local targetX, targetY = partTable.relativeRegion:GetSize()
	
	local highlightX = targetX * 1.22 * multiX
	local highlightY = targetY * 1.45 * multiY
	self.featureHighlight:SetSize(highlightX , highlightY)
	
	local offsetterX = (1 - multiX) * targetX/2
	local offsetterY = (multiY - 1) * targetY/2
	self.featureHighlight:ClearAllPoints()
	self.featureHighlight:SetPoint("TOPLEFT", partTable.relativeRegion, "TOPLEFT", offsetterX, offsetterY)
	
	self.featureHighlight:Show()
end

function Angleur_HelpTipTemplateMixin:ApplyText(partTable)
	local info = partTable;
	self.Text:SetText(partTable.text);
	local color = info.textColor or HIGHLIGHT_FONT_COLOR;
	self.Text:SetTextColor(color:GetRGB());
	local justifyH = info.textJustifyH;
	if not justifyH then
		if self.Text:GetNumLines() == 1 then
			justifyH = "CENTER";
		else
			justifyH = "LEFT";
		end
	end
	self.Text:SetJustifyH(justifyH);
end

function Angleur_HelpTipTemplateMixin:AnchorArrow(rotationInfo, alignment)
	local arrowAnchor = rotationInfo.anchors[alignment];
	local offsetX, offsetY = transformOffsetsForRotation(HelpTip.ArrowOffsets[alignment], rotationInfo);
	self.Arrow:ClearAllPoints();
	self.Arrow:SetPoint("CENTER", self, arrowAnchor, offsetX, offsetY);
end

function Angleur_HelpTipTemplateMixin:RotateArrow(rotation)
	if self.Arrow.rotation == rotation then
		return;
	end
	local rotationInfo = HelpTip.Rotations[rotation];
	SetClampedTextureRotation(self.Arrow.Arrow, rotationInfo.degrees);
	SetClampedTextureRotation(self.Arrow.Glow, rotationInfo.degrees);
	local offsetX, offsetY = transformOffsetsForRotation(HelpTip.ArrowGlowOffsets, rotationInfo);
	self.Arrow.Glow:SetPoint("CENTER", self.Arrow.Arrow, "CENTER", offsetX, offsetY);
	self.Arrow.rotation = rotation;
end
