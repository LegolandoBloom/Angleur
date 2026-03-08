Legolando_MouseScanAnimMixin_Angleur = {}


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
local folderPath = getFolderPath()
local imagePath =  folderPath .. "/scanAnim.png"

function Legolando_MouseScanAnimMixin_Angleur:OnLoad()
    self.ProcLoopFlipbook:SetTexture(imagePath)
end

function Legolando_MouseScanAnimMixin_Angleur:OnShow()
    local uiScale, x, y = UIParent:GetEffectiveScale(), GetCursorPosition()
    self:ClearAllPoints()
    self:SetPoint("CENTER", UIParent, "BOTTOMLEFT", x / uiScale, y / uiScale)
	self.ProcLoop:Play()
end

function Legolando_MouseScanAnimMixin_Angleur:OnHide()
	if ( self.ProcLoop:IsPlaying() ) then
		self.ProcLoop:Stop()
	end
    self:ClearAllPoints()
end
