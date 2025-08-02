
-- ____________________________________[1]______________________________________________
--  Templates Mixins Ported directly from Blizzard's FrameXML, just in case it changes later on
-- ____________________________________[1]______________________________________________
Ported_CollectionsPagingMixin = { };
function Ported_CollectionsPagingMixin:OnLoad()
	self.currentPage = 1;
	self.maxPages = 1;
	self:Update();
end
function Ported_CollectionsPagingMixin:SetMaxPages(maxPages)
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
function Ported_CollectionsPagingMixin:GetMaxPages()
	return self.maxPages;
end
function Ported_CollectionsPagingMixin:SetCurrentPage(page, userAction)
	page = Clamp(page, 1, self.maxPages);
	if ( self.currentPage ~= page ) then
		self.currentPage = page;
		self:Update();
		if ( self:GetParent().OnPageChanged ) then
			self:GetParent():OnPageChanged(userAction);
		end
	end
end
function Ported_CollectionsPagingMixin:GetCurrentPage()
	return self.currentPage;
end
function Ported_CollectionsPagingMixin:NextPage()
	self:SetCurrentPage(self.currentPage + self:GetPageDelta(), true);
end
function Ported_CollectionsPagingMixin:PreviousPage()
	self:SetCurrentPage(self.currentPage - self:GetPageDelta(), true);
end
function Ported_CollectionsPagingMixin:GetPageDelta()
	local delta = 1;
	if self.canUseShiftKey and IsShiftKeyDown() then
		delta = 10;
	end
	if self.canUseControlKey and IsControlKeyDown() then
		delta = 100;
	end
	return delta;
end
function Ported_CollectionsPagingMixin:OnMouseWheel(delta)
	if ( delta > 0 ) then
		self:PreviousPage();
	else
		self:NextPage();
	end
end
function Ported_CollectionsPagingMixin:Update()
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
Legolando_PictureTooltipMixin = {}

function Legolando_PictureTooltipMixin:OnShow()
    self:SetPadding(self.paddingL, self.paddingB, self.paddingR, self.paddingT)
end

function Legolando_PictureTooltipMixin:PlaceTexture(texturePath, width, height, anchor, padOffsetX, padOffsetY)
    if not texturePath then return end
    self.texture:ClearAllPoints()
    self.texture:SetTexture(texturePath)
    self.texture:SetSize(width, height)
    self.texture:SetPoint(anchor, self, anchor)
    self:ResetPadding()
    if anchor == "TOPLEFT" then
        self.paddingL = width + padOffsetX
        self.paddingT = height + padOffsetY
    elseif anchor == "TOPRIGHT" then
        self.paddingR = width + padOffsetX
        self.paddingT = height + padOffsetY
    elseif anchor == "BOTTOMLEFT" then
        self.paddingL = width + padOffsetX
        self.paddingB = height + padOffsetY
    elseif anchor == "BOTTOMRIGHT" then
        self.paddingR = width + padOffsetX
        self.paddingB = height + padOffsetY
    end
end

function Legolando_PictureTooltipMixin:ResetPadding()
    self.paddingL = 0
    self.paddingB = 0
    self.paddingR = 0
    self.paddingT = 0
end

function Legolando_PictureTooltipMixin:OnHide()
    self.texture:SetTexture(nil)
    self.texture:ClearAllPoints()
    self:ResetPadding()    
end
-- ____________________________________[2]______________________________________________
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




-- ____________________________________[3]______________________________________________
--  Templates made by Legolando, specifically for this lib
-- ____________________________________[3]______________________________________________
Legolando_AddonButtonMixin = {}

function Legolando_AddonButtonMixin:Clear()
    self.text:SetText(nil)
    self.icon:SetTexture(nil)
    self.linkText = nil
end

function Legolando_AddonButtonMixin:Update()
    local grandParent = self:GetParent():GetParent()
    local index = (grandParent.PagingFrame:GetCurrentPage() - 1) * grandParent.addonsPerPage + self:GetID()
    local addonsTable = grandParent.addonsTable
    local addon = addonsTable[index]
    if addon then
        self.text:SetText(addon.number)
        self.icon:SetTexture(addon.icon)
        self.linkTest = addon.link
    else
        self:Clear()
    end
end


Legolando_OtherAddonsFrameMixin = {}

function Legolando_OtherAddonsFrameMixin:SetupButtons()
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
            addonsFrame[parentKey] = CreateFrame("Button", nil, addonsFrame, "Legolando_AddonButtonTemplate", id)
            addonsFrame[parentKey]:SetPoint("TOPLEFT", addonsFrame, "TOPLEFT", (j-1)*(buttonSize + spaceBetweenColumns), -1*(i-1)*(buttonSize + spaceBetweenLines))
            addonsFrame[parentKey].text:SetText(parentKey)
            print(parentKey)
        end
	end

end

function Legolando_OtherAddonsFrameMixin:UpdateButtons()
    local addonsFrame = self.addonsFrame
    for i = 1, self.addonsPerPage do
	    local button = addonsFrame["addonButton"..i];
		button:Update()
	end
end
function Legolando_OtherAddonsFrameMixin:UpdatePages()
	print(#self.addonsTable)
    self.PagingFrame:SetMaxPages(3)
end
function Legolando_OtherAddonsFrameMixin:Init()
    if not self.lines then self.lines = 2 end
    if not self.columns then self.columns = 3 end
    if not self.spaceBetweenLines then self.spaceBetweenLines = 10 end
    if not self.spaceBetweenColumns then self.spaceBetweenColumns = 10 end
    if not self.buttonSize then self.buttonSize = 45 end
    self:SetupButtons()
    print("hi")
    if not self.addonsTable or next(self.addonsTable) == nil then 
        print("Legolando_OtherAddonsFrameMixin:OnLoad(): No valid addon table.")
        return
    end
    self:UpdatePages()
    local pagingFrame = self.PagingFrame
    self.OnPageChanged = function() 
        print("Page: ", pagingFrame:GetCurrentPage())
        self:UpdateButtons()
    end
end
-- ____________________________________[3]______________________________________________
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

