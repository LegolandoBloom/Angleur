if not LegolandoUtil then return end
if LegolandoUtil.Chat then return end

LegolandoUtil.Chat = {}
local LC = LegolandoUtil.Chat


-- COMMUNITIES_DEFAULT_CHANNEL_NAME --> Global String for "General"
-- Couldn't find the rest ._.
function LC:GetChatChannelIndexFromName(name)
    local id, name, instanceID, isCommunitiesChannel = GetChannelName(name)
    return id
end

