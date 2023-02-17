---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Ismoh-PC.
--- DateTime: 30.06.2022 16:34
---


--Ismoh: when a mod is already "installed" and mod settings are set. how do I update those, when having a new version of my mod?
--    [16:21] Ismoh: ie removing an old or changing the default value, which was already set by the player/user
--    [16:23] Horscht: are you using the default settings framework?
--    [16:23] Horscht: anyway, you need to save a version number along with your settings and then check that and update all values accordingly, if no version number is present then I would say you can assume that as being version 1
--    [16:25] Ismoh: default settings.lua
--    [16:25] Ismoh: where is this version stored?
--    [16:26] Ismoh:
--
--    [16:26] Horscht: at the top of your settings.lua file
--    [16:27] Horscht:
--
--    [16:27] Horscht: that's what gets saved as a mod setting with the key yourmod_id._version
--[16:27] Ismoh:
--
--[16:27] Ismoh: ah yea
--[16:28] Horscht: then you basically check your current version against the saved one and update all values accordingly
--[16:28] Ismoh: ah okay
--NEU
--[16:31] Horscht: theoretically if you want to migrate older versions too, you can make a loop something like this:
--local migration_functions = {
--  v1_to_v2 = function()
--    -- Convert v1 to v2
--  end,
--  v2_to_v3 = function()
--    -- Convert v2 to v3
--  end,
--}
--
--while saved_version ~= current_version do
--  local next_version = saved_version + 1
--  migration_functions[("v%d_to_v%d"):format(saved_version, next_version)]()
--  saved_version = next_version
--end
--[16:31] Horscht: then it will call the conversion functions in sequence until it reaches the current version
--[16:32] Horscht: so you don't need a bunch of functions for converting from v1 to v2, v1 to v3, v1 to v4, v2 to v3, v2 to v4 etc