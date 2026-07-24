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
local function reAnchorAndResize(texture, newAnchor, sizeX, sizeY)
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
		reAnchorAndResize(self.highlight, self, x, y)
		reAnchorAndResize(self.normal, self, x, y)
	end
	self.highlight:SetRotation(enum_Rotation[facing])
	self.normal:SetRotation(enum_Rotation[facing])
end
