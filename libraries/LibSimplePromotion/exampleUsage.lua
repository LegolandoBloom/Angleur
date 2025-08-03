promotionFrame = CreateFrame("Frame", "MyAddonPromotionFrame", UIParent, "SimpleAddonPromotionTemplate")
promotionFrame:SetPoint("CENTER", UIParent, "CENTER")

--______________________________________________________________________
--NOTE: You NEED to index the table elements(addons) 1 2 3 4 5 6 etc!
-- _____________________________________________________________________
    --      [X] = { 
    --             icon = "Interface/AddOns/MyAddon/images/AddonIconX",
    --             link = "https://www.curseforge.com/wow/addons/addonX",
    --             tooltipPicture = "Interface/AddOns/MyAddon/images/AddonTooltipPicX.png",
    --             tooltipPictureWidth = 128,
    --             tooltipPictureHeight = 64,
    --             tooltipPictureAnchor = "TOPLEFT"
    --             tooltipPicturePaddingX = 15,
    --             tooltipPicturePaddingY = 8,
    --             tooltipTitle = "X Addon",
    --             tooltipText = "Description",
    --            }     
local addonsToPromote = {
    [1] = { 
            icon = "Interface/AddOns/MyAddon/images/AddonIcon1",
            link = "https://www.curseforge.com/wow/addons/addon1",
            tooltipPicture = "Interface/AddOns/MyAddon/images/AddonTooltipPic1.png",
            tooltipPictureWidth = 128,
            tooltipPictureHeight = 64,
            tooltipPictureAnchor = "TOPLEFT",
            tooltipPicturePaddingX = 15,
            tooltipPicturePaddingY = 8,
            tooltipTitle = "Awesome Addon",
            tooltipText = "very awesome, very cool! does all the cool stuffz and is like the bestest addonz like ever so you should download it ",
    },
    [2] = { 
            icon = "Interface/AddOns/MyAddon/images/AddonIcon2",
            link = "https://www.curseforge.com/wow/addons/addon2",
            tooltipPicture = "Interface/AddOns/MyAddon/images/AddonTooltipPic2.png",
            tooltipPictureWidth = 128,
            tooltipPictureHeight = 64,
            tooltipPictureAnchor = "TOPRIGHT",
            tooltipPicturePaddingX = 15,
            tooltipPicturePaddingY = 8,
            tooltipTitle = "Great Addon",
            tooltipText = "UUUUUUWWWUUWUUWUWUWUWUWuWUuUwUU",
    },
    [3] = { 
            icon = "Interface/AddOns/MyAddon/images/AddonIcon3",
            link = "https://www.curseforge.com/wow/addons/addon3",
            tooltipPicture = "Interface/AddOns/MyAddon/images/AddonTooltipPic3.png",
            tooltipPictureWidth = 128,
            tooltipPictureHeight = 64,
            tooltipPictureAnchor = "BOTTOMLEFT",
            tooltipPicturePaddingX = 15,
            tooltipPicturePaddingY = 8,
            tooltipTitle = "Amazing Addon",
            tooltipText = "EYEYEYEYEYYEYEYEYEYEYEYYEYEYEYEYEYEYYEYEYEYEYEYEYYEYEYEYEYEYEYYEYEYEYEYEYEYYEYEYEYEYEYEYYEYEYEYEYEYEYYEY",
    },
    [4] = { 
            icon = "Interface/AddOns/MyAddon/images/AddonIcon4",
            link = "https://www.curseforge.com/wow/addons/addon4",
            
            tooltipPicture = "Interface/AddOns/MyAddon/images/AddonTooltipPic4.png",
            tooltipPictureWidth = 128,
            tooltipPictureHeight = 64,
            tooltipPictureAnchor = "BOTTOMRIGHT",
            tooltipPicturePaddingX = 15,
            tooltipPicturePaddingY = 8,
            tooltipTitle = "The Best Addon",
            tooltipText = "bladabludiblablubla",
    },
}
-- Set frame.addonsTable to the table above
promotionFrame.addonsTable = addonsToPromote

-- These are the settings you can change
promotionFrame.lines = 1
promotionFrame.columns = 3
promotionFrame.spaceBetweenLines = 10
promotionFrame.spaceBetweenColumns = 10
promotionFrame.buttonSize = 32
promotionFrame.pageButtonsAnchor = "Bottom" -- options: "Left"  "Right"  "Top"  "Bottom"
promotionFrame.pageButtonsOffsetX = 0
promotionFrame.pageButtonsOffsetY = 0
promotionFrame.pageButtonsTextAnchor = "Bottom" -- options: "Left"  "Right"  "Top"  "Bottom"

-- Call Init() and you are good to go!
promotionFrame:Init()