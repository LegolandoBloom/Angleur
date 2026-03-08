
-- NOTE: See exampleUsage.lua to see how to use the library

-- ____________________________________[1]______________________________________________
--  Templates Mixins Ported directly from Blizzard's FrameXML, just in case it changes later on
-- ____________________________________[1]______________________________________________
Legolando_PortedCollectionsPagingMixin_Angleur = { };
function Legolando_PortedCollectionsPagingMixin_Angleur:OnLoad()
	self.currentPage = 1;
	self.maxPages = 1;
	self:Update();
end
function Legolando_PortedCollectionsPagingMixin_Angleur:SetMaxPages(maxPages)
	maxPages = math.max(maxPages, 1);
	if ( self.maxPages == maxPages ) then
		return;
	end
	self.maxPages= maxPages;
	if ( self.maxPages < self.currentPage ) then
		self.currentPage = self.maxPages;
	end
	self:Update();
end
function Legolando_PortedCollectionsPagingMixin_Angleur:GetMaxPages()
	return self.maxPages;
end
function Legolando_PortedCollectionsPagingMixin_Angleur:SetCurrentPage(page, userAction)
	page = Clamp(page, 1, self.maxPages);
	if ( self.currentPage ~= page ) then
		self.currentPage = page;
		self:Update();
		if ( self:GetParent().OnPageChanged ) then
			self:GetParent():OnPageChanged(userAction);
		end
	end
end
function Legolando_PortedCollectionsPagingMixin_Angleur:GetCurrentPage()
	return self.currentPage;
end
function Legolando_PortedCollectionsPagingMixin_Angleur:NextPage()
	self:SetCurrentPage(self.currentPage + self:GetPageDelta(), true);
end
function Legolando_PortedCollectionsPagingMixin_Angleur:PreviousPage()
	self:SetCurrentPage(self.currentPage - self:GetPageDelta(), true);
end
function Legolando_PortedCollectionsPagingMixin_Angleur:GetPageDelta()
	local delta = 1;
	if self.canUseShiftKey and IsShiftKeyDown() then
		delta = 10;
	end
	if self.canUseControlKey and IsControlKeyDown() then
		delta = 100;
	end
	return delta;
end
function Legolando_PortedCollectionsPagingMixin_Angleur:OnMouseWheel(delta)
	if ( delta > 0 ) then
		self:PreviousPage();
	else
		self:NextPage();
	end
end
function Legolando_PortedCollectionsPagingMixin_Angleur:Update()
	self.PageText:SetFormattedText(COLLECTION_PAGE_NUMBER, self.currentPage, self.maxPages);
	if ( self.currentPage <= 1 ) then
		self.PrevPageButton:Disable();
	else
		self.PrevPageButton:Enable();
	end
	if ( self.currentPage >= self.maxPages ) then
		self.NextPageButton:Disable();
	else
		self.NextPageButton:Enable();
	end
end
-- ____________________________________[1]______________________________________________
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



-- ____________________________________[2]______________________________________________
--  Generalized Templates made by Legolando, to be used in this library
-- ____________________________________[2]______________________________________________

-- ____________________________________[2]______________________________________________
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




-- ____________________________________[3]______________________________________________
--  Templates made by Legolando, specifically for this lib
-- ____________________________________[3]______________________________________________
Legolando_AddonButtonMixin_Angleur = {}

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

function Legolando_AddonButtonMixin_Angleur:OnLoad()
    local folderPath = getFolderPath()
    local imagePath =  folderPath .. "/otheraddonsframe.png"
    self.frameTexture:SetTexture(imagePath)
end

function Legolando_AddonButtonMixin_Angleur:OnClick()
    self.linkBox:Show()
end

function Legolando_AddonButtonMixin_Angleur:OnEnter()
    local size = self:GetSize()
    Legolando_SimplePromotionTooltip_Angleur:SetOwner(self, "ANCHOR_BOTTOMRIGHT", size/10, (size/12)*14)
    Legolando_SimplePromotionTooltip_Angleur:AddLine(self.tooltipTitle)
    Legolando_SimplePromotionTooltip_Angleur:AddLine(self.tooltipText, 1, 1, 1, true)
    Legolando_SimplePromotionTooltip_Angleur:Show()
    Legolando_SimplePromotionTooltip_Angleur:PlaceTexture(self.tooltipPicture, self.tooltipPictureWidth, self.tooltipPictureHeight, self.tooltipPictureAnchor)
end


function Legolando_AddonButtonMixin_Angleur:OnLeave()
    Legolando_SimplePromotionTooltip_Angleur:Hide()
end

function Legolando_AddonButtonMixin_Angleur:Clear()
    self.text:SetText(nil)
    self.Icon:SetTexture(nil)
    self.link = nil
    self.tooltipPicture = nil
    self.tooltipPictureWidth = nil
    self.tooltipPictureHeight = nil
    self.tooltipPictureAnchor = nil
    self.tooltipTitle = nil
    self.tooltipText = nil
end

function Legolando_AddonButtonMixin_Angleur:Update()
    local grandParent = self:GetParent():GetParent()
    local index = (grandParent.PagingFrame:GetCurrentPage() - 1) * grandParent.addonsPerPage + self:GetID()
    local addonsTable = grandParent.addonsTable
    local addon = addonsTable[index]
    if addon then
        self.text:SetText(index)
        self.Icon:SetTexture(addon.icon)
        self.link = addon.link
        self.tooltipPicture = addon.tooltipPicture
        self.tooltipPictureWidth = addon.tooltipPictureWidth
        self.tooltipPictureHeight = addon.tooltipPictureHeight
        self.tooltipPictureAnchor = addon.tooltipPictureAnchor
        self.tooltipTitle = addon.tooltipTitle
        self.tooltipText = addon.tooltipText
        self:Show()
    else
        self:Clear()
        self:Hide()
    end
end


Legolando_SimplePromotionMixin_Angleur = {}


local buttonAnchorTable = {
    ["Left"] = {point = "RIGHT", relativePoint = "LEFT", offsetX = -36, offsetY = 0},
    ["Right"] = {point = "LEFT", relativePoint = "RIGHT", offsetX = 72, offsetY = 0},
    ["Top"] = {point = "BOTTOM", relativePoint = "TOP", offsetX = -16, offsetY = 8},
    ["Bottom"] = {point = "TOP", relativePoint = "BOTTOM", offsetX = -17, offsetY = -8},
}
local textAnchorTable = {
    ["Left"] = {point = "RIGHT", relativePoint = "LEFT", offsetX = -3, offsetY = 0},
    ["Right"] = {point = "LEFT", relativePoint = "RIGHT", offsetX = 37, offsetY = 0},
    ["Top"] = {point = "BOTTOM", relativePoint = "TOP", offsetX = 16, offsetY = 0},
    ["Bottom"] = {point = "TOP", relativePoint = "BOTTOM", offsetX = 17, offsetY = 0},
}
function Legolando_SimplePromotionMixin_Angleur:ResizeAndReplace()
    local resizeX = ((self.columns - 1) * self.spaceBetweenColumns) + (self.columns * self.buttonSize)
    local resizeY = ((self.lines - 1) * self.spaceBetweenLines) + (self.lines * self.buttonSize)
    self:SetSize(resizeX, resizeY)
    local buttonAnchor = buttonAnchorTable[self.pageButtonsAnchor]
    if buttonAnchor then
        self.PagingFrame:ClearAllPoints()
        self.PagingFrame:SetPoint(buttonAnchor.point, self, buttonAnchor.relativePoint, buttonAnchor.offsetX + self.pageButtonsOffsetX, buttonAnchor.offsetY + self.pageButtonsOffsetY)
    end
    local textAnchor = textAnchorTable[self.pageButtonsTextAnchor]
    if textAnchor then
        self.PagingFrame.PageText:ClearAllPoints()
        self.PagingFrame.PageText:SetPoint(textAnchor.point, self.PagingFrame, textAnchor.relativePoint, textAnchor.offsetX, textAnchor.offsetY)
    end
end

function Legolando_SimplePromotionMixin_Angleur:SetupButtons()
    local lines = self.lines
    local columns = self.columns
    local spaceBetweenLines = self.spaceBetweenLines
    local spaceBetweenColumns = self.spaceBetweenColumns
    local buttonSize = self.buttonSize
    self.addonsPerPage = self.lines * self.columns
    local addonsFrame = self.addonsFrame
    for i = 1, lines do
        for j = 1, columns do
            local id = (i-1)*columns + j
            local parentKey = "addonButton" .. id
            addonsFrame[parentKey] = CreateFrame("Button", nil, addonsFrame, "Legolando_AddonButtonTemplate_Angleur", id)
            addonsFrame[parentKey]:SetPoint("TOPLEFT", addonsFrame, "TOPLEFT", (j-1)*(buttonSize + spaceBetweenColumns), -1*(i-1)*(buttonSize + spaceBetweenLines))
            addonsFrame[parentKey]:SetSize(buttonSize, buttonSize)
            addonsFrame[parentKey].Icon:SetSize(buttonSize, buttonSize)
            addonsFrame[parentKey].frameTexture:SetSize((buttonSize/2)*3, (buttonSize/2)*3)
        end
	end
end

function Legolando_SimplePromotionMixin_Angleur:UpdateButtons()
    local addonsFrame = self.addonsFrame
    for i = 1, self.addonsPerPage do
	    local button = addonsFrame["addonButton"..i];
		button:Update()
	end
end
function Legolando_SimplePromotionMixin_Angleur:UpdatePages()
    local addonCount = #self.addonsTable
    local pageCount = math.ceil(addonCount/self.addonsPerPage)
    self.PagingFrame:SetMaxPages(pageCount)
    if self.PagingFrame:GetMaxPages() < 2 then self.PagingFrame:Hide() end
end

function Legolando_SimplePromotionMixin_Angleur:Init()
    if not self.lines then self.lines = 2 end
    if not self.columns then self.columns = 3 end
    if not self.spaceBetweenLines then self.spaceBetweenLines = 10 end
    if not self.spaceBetweenColumns then self.spaceBetweenColumns = 10 end
    if not self.buttonSize then self.buttonSize = 36 end
    if not self.pageButtonsAnchor then self.pageButtonsAnchor = "Bottom" end
    if not self.pageButtonsOffsetX then self.pageButtonsOffsetX = 0 end
    if not self.pageButtonsOffsetY then self.pageButtonsOffsetY = 0 end
    if not self.pageButtonsTextAnchor then self.pageButtonsTextAnchor = "Bottom" end
    self:SetupButtons()
    self:UpdateButtons()
    self:ResizeAndReplace()
    if not self.addonsTable or next(self.addonsTable) == nil then 
        print("Legolando_SimplePromotionMixin_Angleur:OnLoad(): No valid addon table.")
        return
    end
    self:UpdatePages()
    local pagingFrame = self.PagingFrame
    self.OnPageChanged = function() 
        self:UpdateButtons()
    end
end
-- ____________________________________[3]______________________________________________
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

