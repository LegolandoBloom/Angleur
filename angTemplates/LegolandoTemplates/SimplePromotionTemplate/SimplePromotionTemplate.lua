
-- NOTE: See exampleUsage.lua to see how to use the library

-- ____________________________________[1]______________________________________________
--  Templates Mixins Ported directly from Blizzard's FrameXML, just in case it changes later on
-- ____________________________________[1]______________________________________________
Angleur_PortedCollectionsPagingMixin = { };
function Angleur_PortedCollectionsPagingMixin:OnLoad()
	self.currentPage = 1;
	self.maxPages = 1;
	self:Update();
end
function Angleur_PortedCollectionsPagingMixin:SetMaxPages(maxPages)
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
function Angleur_PortedCollectionsPagingMixin:GetMaxPages()
	return self.maxPages;
end
function Angleur_PortedCollectionsPagingMixin:SetCurrentPage(page, userAction)
	page = Clamp(page, 1, self.maxPages);
	if ( self.currentPage ~= page ) then
		self.currentPage = page;
		self:Update();
		if ( self:GetParent().OnPageChanged ) then
			self:GetParent():OnPageChanged(userAction);
		end
	end
end
function Angleur_PortedCollectionsPagingMixin:GetCurrentPage()
	return self.currentPage;
end
function Angleur_PortedCollectionsPagingMixin:NextPage()
	self:SetCurrentPage(self.currentPage + self:GetPageDelta(), true);
end
function Angleur_PortedCollectionsPagingMixin:PreviousPage()
	self:SetCurrentPage(self.currentPage - self:GetPageDelta(), true);
end
function Angleur_PortedCollectionsPagingMixin:GetPageDelta()
	local delta = 1;
	if self.canUseShiftKey and IsShiftKeyDown() then
		delta = 10;
	end
	if self.canUseControlKey and IsControlKeyDown() then
		delta = 100;
	end
	return delta;
end
function Angleur_PortedCollectionsPagingMixin:OnMouseWheel(delta)
	if ( delta > 0 ) then
		self:PreviousPage();
	else
		self:NextPage();
	end
end
function Angleur_PortedCollectionsPagingMixin:Update()
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
Angleur_LegolandoPictureTooltipMixin = {}

function Angleur_LegolandoPictureTooltipMixin:OnShow()

end

function Angleur_LegolandoPictureTooltipMixin:PlaceTexture(texturePath, pictureWidth, pictureHeight, anchor)
    if not texturePath then return end
    self.texture:ClearAllPoints()
    self.texture:SetTexture(texturePath)
    self.texture:SetSize(pictureWidth, pictureHeight)
    self.texture:SetPoint(anchor, self, anchor)
    local width, height = self:GetSize()
    local extraWidth = 0
    local extraHeight = 0
    -- + 16 is needed due to the offset of 8 in SetPoint
    if pictureWidth + 16 > width then extraWidth = pictureWidth - width + 16 end
    if pictureHeight + 16 > height then extraHeight = pictureHeight - height + 16 end
    if anchor == "TOPLEFT" then
        self.texture:SetPoint(anchor, self, anchor, 8, -8)
        self:SetPadding(extraWidth, 0, 0, pictureHeight)
    elseif anchor == "TOPRIGHT" then
        self.texture:SetPoint(anchor, self, anchor, -8, -8)
        self:SetPadding(pictureWidth, extraHeight, 0, 0)
    elseif anchor == "BOTTOMLEFT" then
        self.texture:SetPoint(anchor, self, anchor, 8, 8)
        self:SetPadding(extraWidth, pictureHeight, 0, 0)
    elseif anchor == "BOTTOMRIGHT" then
        self.texture:SetPoint(anchor, self, anchor, -8, 8)
        self:SetPadding(pictureWidth, extraHeight, 0, 0)
    end
end

function Angleur_LegolandoPictureTooltipMixin:OnHide()
    self.texture:SetTexture(nil)
    self.texture:ClearAllPoints()
end
-- ____________________________________[2]______________________________________________
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




-- ____________________________________[3]______________________________________________
--  Templates made by Legolando, specifically for this lib
-- ____________________________________[3]______________________________________________
Angleur_LegolandoAddonButtonMixin = {}

function Angleur_LegolandoAddonButtonMixin:OnClick()
    self.linkBox:Show()
end

function Angleur_LegolandoAddonButtonMixin:OnEnter()
    local size = self:GetSize()
    Angleur_SimplePromotionTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT", size/10, (size/12)*14)
    Angleur_SimplePromotionTooltip:AddLine(self.tooltipTitle)
    Angleur_SimplePromotionTooltip:AddLine(self.tooltipText, 1, 1, 1, true)
    Angleur_SimplePromotionTooltip:Show()
    Angleur_SimplePromotionTooltip:PlaceTexture(self.tooltipPicture, self.tooltipPictureWidth, self.tooltipPictureHeight, self.tooltipPictureAnchor)
end


function Angleur_LegolandoAddonButtonMixin:OnLeave()
    Angleur_SimplePromotionTooltip:Hide()
end

function Angleur_LegolandoAddonButtonMixin:Clear()
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

function Angleur_LegolandoAddonButtonMixin:Update()
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


Angleur_SimplePromotionMixin = {}


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
function Angleur_SimplePromotionMixin:ResizeAndReplace()
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

function Angleur_SimplePromotionMixin:SetupButtons()
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
            addonsFrame[parentKey] = CreateFrame("Button", nil, addonsFrame, "Angleur_LegolandoAddonButtonTemplate", id)
            addonsFrame[parentKey]:SetPoint("TOPLEFT", addonsFrame, "TOPLEFT", (j-1)*(buttonSize + spaceBetweenColumns), -1*(i-1)*(buttonSize + spaceBetweenLines))
            addonsFrame[parentKey]:SetSize(buttonSize, buttonSize)
            addonsFrame[parentKey].Icon:SetSize(buttonSize, buttonSize)
            addonsFrame[parentKey].frameTexture:SetSize((buttonSize/2)*3, (buttonSize/2)*3)
        end
	end
end

function Angleur_SimplePromotionMixin:UpdateButtons()
    local addonsFrame = self.addonsFrame
    for i = 1, self.addonsPerPage do
	    local button = addonsFrame["addonButton"..i];
		button:Update()
	end
end
function Angleur_SimplePromotionMixin:UpdatePages()
    local addonCount = #self.addonsTable
    local pageCount = math.ceil(addonCount/self.addonsPerPage)
    self.PagingFrame:SetMaxPages(pageCount)
    if self.PagingFrame:GetMaxPages() < 2 then self.PagingFrame:Hide() end
end

function Angleur_SimplePromotionMixin:Init()
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
        print("Angleur_SimplePromotionMixin:OnLoad(): No valid addon table.")
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

