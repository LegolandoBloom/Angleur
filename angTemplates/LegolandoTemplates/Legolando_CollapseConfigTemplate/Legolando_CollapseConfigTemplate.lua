local function getFolderPath()
    local stack = debugstack()
    local _, _, luafilepath = string.find(stack, "[%[](.-)[%]]")
    -- print("lue file's path: ", luafilepath)
    local i = 1
    local lastPart
    while string.find(luafilepath, "([/].+)", i) do
        local startPoint, endPoint
        startPoint, endPoint, lastPart = string.find(luafilepath, "([/].+)", i)
        i = startPoint + 1
        -- print(s, startPoint, endPoint, "\n")
    end
    -- print("part to remove: ", lastPart)
    local afterRemoval = string.gsub(luafilepath, lastPart, "")
    -- print("After removal: ", afterRemoval)
    return afterRemoval
end

-- ____________________________________[1]______________________________________________
--       Templates Ported directly from Blizzard's FrameXML, for classic parity
-- ____________________________________[1]______________________________________________
local TabSideExtraSpacing = 20;
Legolando_PortedTabSystemButtonArtMixin_Angleur = {};

function Legolando_PortedTabSystemButtonArtMixin_Angleur:OnLoad()
	local folderPath = getFolderPath()
    local imagePath =  folderPath .. "/Ported_UIFrameTabs.blp"
	self.LeftActive:SetTexture(imagePath)
	self.LeftActive:SetSize(35, 42)
	self.LeftActive:SetTexCoord(0.015625, 0.5625, 0.496094, 0.660156)
	
	self.RightActive:SetTexture(imagePath)
	self.RightActive:SetSize(37, 42)
	self.RightActive:SetTexCoord(0.015625, 0.59375, 0.324219, 0.488281)

	self.MiddleActive:SetTexture(imagePath)
	self.MiddleActive:SetSize(1, 42)
	self.MiddleActive:SetTexCoord(0, 0.015625, 0.00390625, 0.167969)

	self.Left:SetTexture(imagePath)
	self.Left:SetSize(35, 36)
	self.Left:SetTexCoord(0.015625, 0.5625, 0.816406, 0.957031)

	self.Right:SetTexture(imagePath)
	self.Right:SetSize(37, 36)
	self.Right:SetTexCoord(0.015625, 0.59375, 0.667969, 0.808594)

	self.Middle:SetTexture(imagePath)
	self.Middle:SetSize(1, 36)
	self.Middle:SetTexCoord(0, 0.015625, 0.175781, 0.316406)

	self.LeftHighlight:SetTexture(imagePath)
	self.LeftHighlight:SetSize(35, 36)
	self.LeftHighlight:SetTexCoord(0.015625, 0.5625, 0.816406, 0.957031)

	self.RightHighlight:SetTexture(imagePath)
	self.RightHighlight:SetSize(37, 36)
	self.RightHighlight:SetTexCoord(0.015625, 0.59375, 0.667969, 0.808594)

	self.MiddleHighlight:SetTexture(imagePath)
	self.MiddleHighlight:SetSize(1, 36)
	self.MiddleHighlight:SetTexCoord(0, 0.015625, 0.175781, 0.316406)
end

function Legolando_PortedTabSystemButtonArtMixin_Angleur:HandleRotation()
	if self.isTabOnTop then
		for _, texture in ipairs(self.RotatedTextures) do
			texture:ClearAllPoints();
			texture:SetRotation(math.pi);
		end
		self.RightActive:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", -7, 0);
		self.LeftActive:SetPoint("BOTTOMRIGHT");
		self.MiddleActive:SetPoint("LEFT", self.RightActive, "RIGHT");
		self.MiddleActive:SetPoint("RIGHT", self.LeftActive, "LEFT");
		self.Right:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", -6, 0);
		self.Left:SetPoint("BOTTOMRIGHT");
		self.Middle:SetPoint("LEFT", self.Right, "RIGHT");
		self.Middle:SetPoint("RIGHT", self.Left, "LEFT");
		self.LeftHighlight:SetPoint("TOPRIGHT", self.Left);
		self.RightHighlight:SetPoint("TOPLEFT", self.Right);
		self.MiddleHighlight:SetPoint("LEFT", self.Middle, "LEFT");
		self.MiddleHighlight:SetPoint("RIGHT", self.Middle, "RIGHT");
	end
end
function Legolando_PortedTabSystemButtonArtMixin_Angleur:GetTextYOffset(isSelected)
	if self.isTabOnTop then
		return isSelected and 0 or -3;
	else
		return isSelected and -3 or 2;
	end
end
function Legolando_PortedTabSystemButtonArtMixin_Angleur:SetTabSelected(isSelected)
	self.isSelected = isSelected;
	self.Left:SetShown(not isSelected);
	self.Middle:SetShown(not isSelected);
	self.Right:SetShown(not isSelected);
	self.LeftActive:SetShown(isSelected);
	self.MiddleActive:SetShown(isSelected);
	self.RightActive:SetShown(isSelected);
	local selectedFontObject = self.selectedFontObject or GameFontHighlightSmall;
	local unselectedFontObject = self.unselectedFontObject or GameFontNormalSmall;
	self:SetNormalFontObject(isSelected and selectedFontObject or unselectedFontObject);
	self:SetEnabled(not isSelected and not self.forceDisabled);
	self.Text:SetPoint("CENTER", self, "CENTER", 0, self:GetTextYOffset(isSelected));
	local tooltip = GetAppropriateTooltip();
	if tooltip:IsOwned(self) then
		tooltip:Hide();
	end
end
function Legolando_PortedTabSystemButtonArtMixin_Angleur:SetTabWidth(width)
	self:SetWidth(width);
end

Legolando_PortedTabSystemButtonMixin_Angleur = {};
function Legolando_PortedTabSystemButtonMixin_Angleur:OnEnter()
	if not self:IsEnabled() and self.errorReason ~= nil then
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT", -12, -6);
		GameTooltip_AddErrorLine(GameTooltip, self.errorReason);
		if self.tooltipText then
			GameTooltip_AddBlankLineToTooltip(GameTooltip);
			GameTooltip_AddNormalLine(GameTooltip, self.tooltipText);
		end
		GameTooltip:Show();
	elseif self.tooltipText then
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT", -12, -6);
		GameTooltip_AddNormalLine(GameTooltip, self.tooltipText);
		GameTooltip:Show();
	elseif self.Text:IsTruncated() then
		local text = self.Text:GetText();
		if text then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT", -12, -6);
			GameTooltip_AddNormalLine(GameTooltip, text);
			GameTooltip:Show();
		end
	end
end
function Legolando_PortedTabSystemButtonMixin_Angleur:OnLeave()
	GameTooltip_Hide();
end
function Legolando_PortedTabSystemButtonMixin_Angleur:OnClick()
	local tabSystem = self:GetTabSystem();
	tabSystem:PlayTabSelectSound();
	tabSystem:SetTab(self:GetTabID());
end
function Legolando_PortedTabSystemButtonMixin_Angleur:Init(tabID, tabText)
	self.tabID = tabID;
	self:HandleRotation();
	self.tabText = tabText;
	self:SetText(tabText);
	self:UpdateTabWidth();
	self:SetTabSelected(false);
end
function Legolando_PortedTabSystemButtonMixin_Angleur:SetTooltipText(tooltipText)
	self.tooltipText = tooltipText;
end
function Legolando_PortedTabSystemButtonMixin_Angleur:SetTabEnabled(enabled, errorReason)
	self.forceDisabled = not enabled;
	self:SetEnabled(enabled and not self.isSelected);
	local text = enabled and self.tabText or DISABLED_FONT_COLOR:WrapTextInColorCode(self.tabText);
	self.Text:SetText(text);
	self.errorReason = errorReason;
end
function Legolando_PortedTabSystemButtonMixin_Angleur:UpdateTabWidth()
	local sidesWidth = self.Left:GetWidth() + self.Right:GetWidth();
	local width = sidesWidth + TabSideExtraSpacing;
	local minTabWidth, maxTabWidth = self:GetTabSystem():GetTabWidthConstraints();
	local textWidth;
	if maxTabWidth and width > maxTabWidth then
		width = maxTabWidth;
		textWidth = width - 10;
	end
	if minTabWidth and width < minTabWidth then
		width = minTabWidth;
		textWidth = width - 10;
	end
	self.Text:SetWidth(textWidth or 0);
	self:SetTabWidth(width);
end
function Legolando_PortedTabSystemButtonMixin_Angleur:GetTabID()
	return self.tabID;
end
function Legolando_PortedTabSystemButtonMixin_Angleur:GetTabSystem()
	return self:GetParent();
end

Legolando_PortedTabSystemMixin_Angleur = {};
function Legolando_PortedTabSystemMixin_Angleur:OnLoad()
	self.tabs = {};
	self.tabPool = CreateFramePool("BUTTON", self, self.tabTemplate);
end
function Legolando_PortedTabSystemMixin_Angleur:AddTab(tabText)
	local tabID = #self.tabs + 1;
	local newTab = self.tabPool:Acquire();
	table.insert(self.tabs, newTab);
	newTab.layoutIndex = tabID;
	newTab:Init(tabID, tabText);
	newTab:Show();
	self:MarkDirty();
	return tabID;
end
function Legolando_PortedTabSystemMixin_Angleur:SetTabSelectedCallback(tabSelectedCallback)
	self.tabSelectedCallback = tabSelectedCallback;
end
function Legolando_PortedTabSystemMixin_Angleur:SetTab(tabID)
	if not self.tabSelectedCallback(tabID) then
		self:SetTabVisuallySelected(tabID);
	end
end
function Legolando_PortedTabSystemMixin_Angleur:SetTabVisuallySelected(tabID)
	self.selectedTabID = tabID;
	for i, tab in ipairs(self.tabs) do
		tab:SetTabSelected(tab:GetTabID() == tabID);
	end
end
function Legolando_PortedTabSystemMixin_Angleur:SetTabShown(tabID, isShown)
	self.tabs[tabID]:SetShown(isShown);
	self:MarkDirty();
end
function Legolando_PortedTabSystemMixin_Angleur:SetTabEnabled(tabID, enabled, errorReason)
	self.tabs[tabID]:SetTabEnabled(enabled, errorReason);
	self:MarkDirty();
end
function Legolando_PortedTabSystemMixin_Angleur:GetTabWidthConstraints()
	return self.minTabWidth, self.maxTabWidth;
end
function Legolando_PortedTabSystemMixin_Angleur:GetTabButton(tabID)
	return self.tabs[tabID];
end
function Legolando_PortedTabSystemMixin_Angleur:PlayTabSelectSound()
	if self.tabSelectSound then
		PlaySound(self.tabSelectSound);
	end
end
-- ____________________________________[1]______________________________________________
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


-- ____________________________________[2]______________________________________________
--                          Templates made by Legolando                                 
-- ____________________________________[2]______________________________________________
Legolando_CollapseConfigMixin_Angleur = {}

function Legolando_CollapseConfigMixin_Angleur:Init(tabNames)
    if tabNames and next(tabNames) ~= nil then
        local tabs = self.popup.tabs
        for i, name in ipairs(tabNames) do
            tabs:AddTab(name)
        end
        local function tabSelectedCallback(tabID)
            local children = {self.popup:GetChildren()}
            for i, v in pairs(children) do
                local id = v:GetID()
                if id and id ~= 0 then
                    if id == tabID then
                        v:Show()
                    else
                        v:Hide()
                    end
                end
            end
            -- if tabID == 1 then
            --     print("this is tab 1")
            -- elseif tabID == 2 then
            --     print("this is tab 2")
            -- elseif tabID == 3 then
            --     print("this is tab 3")
            -- end
        end
        tabs:SetTabSelectedCallback(tabSelectedCallback)
        tabs:SetTab(1)
    end
end

function Legolando_CollapseConfigMixin_Angleur:Update()
    local teeburu = self.savedVarTable
    if not teeburu then
        print("checkbox parent doesn't have a saved variable table attached")
        return
    end
    local children = {self.popup:GetChildren()}
    for i, child in pairs(children) do
        if child:GetObjectType() == "CheckButton" and child.reference then
            local savedVar = teeburu[child.reference]
            if savedVar then
                if savedVar == true then
                    child:SetChecked(true)
                elseif savedVar == false then
                    child:SetChecked(false)
                end
            end
        end
    end
end
-- ____________________________________[2]______________________________________________
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
