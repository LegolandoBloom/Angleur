Legolando_PictureTooltipMixin_Angleur = {}

function Legolando_PictureTooltipMixin_Angleur:OnShow()

end

function Legolando_PictureTooltipMixin_Angleur:PlaceTexture(texturePath, pictureWidth, pictureHeight, anchor, extraPaddingX, extraPaddingY)
    if not texturePath then return end
    if not extraPaddingX then extraPaddingX = 0 end
    if not extraPaddingY then extraPaddingY = 0 end
    self.texture:ClearAllPoints()
    self.texture:SetTexture(texturePath)
    self.texture:SetSize(pictureWidth, pictureHeight)
    self.texture:SetPoint(anchor, self, anchor)
    local width, height = self:GetSize()
    local adjustedWidth = 0
    local adjustedHeight = 0
    -- + 16 is needed due to the offset of 8 in SetPoint
    if pictureWidth + 16 > width then adjustedWidth = pictureWidth - width + 16 end
    if pictureHeight + 16 > height then adjustedHeight = pictureHeight - height + 16 end
    -- "TOPLEFT" doesn't work in classic, as it tries to expand the "top" field which can't be done
    if anchor == "TOPLEFT" then
        if WOW_PROJECT_ID ~= WOW_PROJECT_MAINLINE then
            geterrorhandler()("PictureTooltipTemplate: Tried to Anchor to \"TOPLEFT\" on NON-RETAIL game client.\n\n" 
            .. "Tooltip cannot be expanded towards top-side on Classic clients\n\n")
            return
        end
        self.texture:SetPoint(anchor, self, anchor, 8, -8)
        self:SetPadding(adjustedWidth + extraPaddingX, 0, 0, pictureHeight + extraPaddingY)
    elseif anchor == "TOPRIGHT" then
        self.texture:SetPoint(anchor, self, anchor, -8, -8)
        self:SetPadding(pictureWidth + extraPaddingX, adjustedHeight + extraPaddingY, 0, 0)
    elseif anchor == "BOTTOMLEFT" then
        self.texture:SetPoint(anchor, self, anchor, 8, 8)
        self:SetPadding(adjustedWidth + extraPaddingX, pictureHeight + extraPaddingY, 0, 0)
    elseif anchor == "BOTTOMRIGHT" then
        self.texture:SetPoint(anchor, self, anchor, -8, 8)
        self:SetPadding(pictureWidth + extraPaddingX, adjustedHeight + extraPaddingY, 0, 0)
    end
end

function Legolando_PictureTooltipMixin_Angleur:OnHide()
    self.texture:SetTexture(nil)
    self:SetPadding(0, 0, 0, 0)
    self.texture:ClearAllPoints()
end