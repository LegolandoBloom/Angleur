Legolando_SimpleArrowPopoutButtonTemplateMixin_Angleur = {}

local enum_Rotation = {
	["Up"] = 0,
	["Left"] = math.pi/2,
	["Down"] = math.pi,
	["Right"] = (math.pi*3)/2,
}
-- For Right and Left:
-- - Need to UnAnchor TopLeft&BottomRight(setAllPoints) + Anchor to CENTER to rotate
-- - Also need to resize since it will lose its setAllPoints 
local function _reAnchorAndResize(texture, newAnchor, sizeX, sizeY)
	texture:ClearAllPoints()
	texture:SetPoint("CENTER", newAnchor, "CENTER")
	texture:SetSize(sizeX, sizeY)
end
function Legolando_SimpleArrowPopoutButtonTemplateMixin_Angleur:SetRotate(facing)
	if not facing or facing == "Up" then return end
	if facing == "Left" or facing == "Right" then
		local x, y = self:GetSize()
		-- Swap x and y when facing left or right
		self:SetSize(y, x)
		-- Plug the unswapped x and y to the texture(it's already rotated)
		_reAnchorAndResize(self.highlight, self, x, y)
		_reAnchorAndResize(self.normal, self, x, y)
	end
	self.highlight:SetRotation(enum_Rotation[facing])
	self.normal:SetRotation(enum_Rotation[facing])
end

function Legolando_SimpleArrowPopoutButtonTemplateMixin_Angleur:OnLoad()
	self:GetNormalTexture():SetTexCoord(0.188, 0.828, 0.062, 0.437)
	self:GetHighlightTexture():SetTexCoord(0.188, 0.828, 0.562, 0.937)
	self.updating = false
	self.onUpdateFrame = CreateFrame("Frame")
	self.onUpdateFrame:Show()
end

function Legolando_SimpleArrowPopoutButtonTemplateMixin_Angleur:SetState(forceSet)
	-- Only set state once per update
	if self.updating == true then return end
	local setTo = not self.expanded
	if forceSet ~= nil then
		setTo = forceSet
	end
	if setTo == false then
		self:GetNormalTexture():SetTexCoord(0.188, 0.828, 0.062, 0.437)
		self:GetHighlightTexture():SetTexCoord(0.188, 0.828, 0.562, 0.937)
		self.expanded = false
	elseif setTo == true then
		self:GetNormalTexture():SetTexCoord(0.188, 0.828, 0.437, 0.062)
		self:GetHighlightTexture():SetTexCoord(0.188, 0.828, 0.937, 0.562)
		self.expanded = true
	end
	self.updating = true
    self.onUpdateFrame:SetScript("OnUpdate", function(updaterFrame)
        self.updating = false
        updaterFrame:SetScript("OnUpdate", nil)
    end)
end

