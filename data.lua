-- ##############################################################################################
local wallpapper = data.raw["utility-constants"]
local music = settings.startup["CTD-main-menu-music"].value
-- ##############################################################################################
require("prototypes.library.library-data")
require("prototypes.items.items-data")
-- ##############################################################################################
wallpapper["default"].main_menu_background_image_location = "__CTDaddon_for_Bob__/graphics/backgrounds/1.jpg"
-- ##############################################################################################
-------------------------------ИЗМЕНЕНИЕ ГЛАВНОЙ МУЗЫКАЛЬНОЙ ТЕМЫ--------------------------------
if music == "Niovel - The Factory Must Grow" then
    wallpapper["default"].main_menu_background_image_location = "__CTDaddon_for_Bob__/graphics/backgrounds/2.jpg"
    data.raw["ambient-sound"]["main-menu"].sound = "__CTDaddon_for_Bob__/music/The_Factory_Must_Grow.ogg"
elseif music == "Falconshield -The Factory Must Grow" then
    data.raw["ambient-sound"]["main-menu"].sound = "__CTDaddon_for_Bob__/music/THE-FACTORY-MUST-GROW-Falconshield.ogg"
elseif music == "Kuroi Riquid, Factorio Fan Song - I live here now" then
    data.raw["ambient-sound"]["main-menu"].sound = "__CTDaddon_for_Bob__/music/Factorio-Fan-Song-I-live-here-now.ogg"
elseif music == "Kuroi Riquid, Factorio Fan Song - Beautiful Disaster" then
    data.raw["ambient-sound"]["main-menu"].sound = "__CTDaddon_for_Bob__/music/Factorio-Fan-Song-Beautiful-Disaster.ogg"
elseif music == "Kuroi Riquid, Factorio Fan Song - Inserter Dance" then
    data.raw["ambient-sound"]["main-menu"].sound = "__CTDaddon_for_Bob__/music/Factorio-Fan-Song-Inserter-Dance.ogg"
elseif music == "QWC - The Factory must grow!" then
    data.raw["ambient-sound"]["main-menu"].sound = "__CTDaddon_for_Bob__/music/QWC-_Factorio_-The-Factory-must-grow_-A-Factorio-Fan-Song.ogg"
elseif music == "All in one" then
    data.raw["ambient-sound"]["main-menu"].sound = "__CTDaddon_for_Bob__/music/All-in-one.ogg"
elseif music == "Default" then
end
-- ##############################################################################################
-----------------------------------------НАСТРОЙКИ ПЕРСОНАЖА-------------------------------------
local player_corpse_time = settings.startup["CTD-player-corpse-life"].value * 60 * 60
local healing_per_second = settings.startup["CTD-healing-per-second"].value / 60
local stay_in_combat_time = settings.startup["CTD-seconds-to-stay-in-combat"].value * 60

data.raw["character-corpse"]["character-corpse"].time_to_live = player_corpse_time

local character = data.raw.character["character"]
if character["healing_per_tick"] then
	character["healing_per_tick"] = healing_per_second
end

if character["ticks_to_stay_in_combat"] then
    character["ticks_to_stay_in_combat"] = stay_in_combat_time
end
-- ##############################################################################################