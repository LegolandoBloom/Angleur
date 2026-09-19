A majority of Addons cannot save user preferences right now, due to a bug. 

To remedy this temporarily, I have created the file: "forever_savedVariables.lua". Please locate it in Angleur's AddOn Folder.

Upon opening it, you need to the section marked as: _______________________________ You can change these _______________________________

 ┌─────────────────────────────┐                                                               
 │ forever_savedVariables.lua  │                                                               
 ├─────────────────────────────┴─────────────────────────────────────────────────────────────┐ 
 │                                                                                           │ 
 │                                            .                                              │ 
 │                                            .                                              │ 
 │                                            .                                              │ 
 │                                                                                           │ 
 │  -- _______________________________ You can change these _______________________________  │ 
 │  -- ___ UI Placement ___                                                                  │ 
 │  local Visual_Shown = DISABLED                                                            │ 
 │  local Visual_XAxis = 100                                                                 │ 
 │  local Visual_YAxis = 100                                                                 │ 
 │  local Minimap_Shown = ENABLED                                                            │ 
 │  -- ____________________                                                                  │ 
 │                                                                                           │ 
 │  local Fishing_Method = "doubleClick" -- "oneKey" for keybind fishing                     │ 
 │  local Keybind_Base = "SPACE" -- Can be set to any key                                    │ 
 │  local Keybind_Modifier = "SHIFT" -- The modifier key to use                              │ 
 │                                                                                           │ 
 │  -- ______ Recast ______                                                                  │ 
 │  local Recast = DISABLED                                                                  │ 
 │  local Recast_Keybind = "SPACE"                                                           │ 
 │  local Recast_Modifier = "CTRL"                                                           │ 
 │  -- ____________________                                                                  │ 
 │                                                                                           │ 
 │  -- ____ Ultra Focus ____                                                                 │ 
 │  local UltraFocus_Audio = ENABLED                                                         │ 
 │  local UltraFocus_TemporaryAutoLoot = DISABLED                                            │ 
 │  -- _____________________                                                                 │ 
 │                                                                                           │ 
 │  -- ____ Bobber Scanner ____                                                              │ 
 │  local BobberScanner = ENABLED                                                            │ 
 │  local WarningSound = ENABLED                                                             │ 
 │  -- ____________________________________________________________________________________  │ 
 │                                                                                           │ 
 │                                            .                                              │ 
 │                                            .                                              │ 
 │                                            .                                              │ 
 │                                                                                           │ 
 └───────────────────────────────────────────────────────────────────────────────────────────┘ 

local Recast_Keybind = 
local Recast_Modifier = "CTRL" -- SHIFT, CTRL, ALT

Here, you can change some of the default settings to your liking.
                                                                                                                                  
    ┌───────────────────────────────┐             ┌───────────────────────────────┐                                            
If  │ SomethingSomething == ENABLED │   making it │SomethingSomething == DISABLED │ will disable that feature. And vice versa. 
    └───────────────────────────────┘             └───────────────────────────────┘                                            
                                                                                                                                  
For settings that aren't as simple as a disable/enable, there will be further instructions to the right of it describing how to change them.


I recommend not changing anything beyond the part marked as ___You can change these___ unless you are somewhat knowledgeable in lua.