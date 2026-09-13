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
local sleepflipbookPath =  folderPath .. "/sleepflipbook.png"





Legolando_SleepAnimFrameMixin_Angleur = {}

function Legolando_SleepAnimFrameMixin_Angleur:OnLoad()
    self.texture:SetTexture(sleepflipbookPath)
end