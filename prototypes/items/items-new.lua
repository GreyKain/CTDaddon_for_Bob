-- ##############################################################################################
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
-- ##############################################################################################

-- ##############################################################################################
if settings.startup["CTD-new-tree-recipes"].value then
    data:extend(
        {
            {
                type = "item",
                name = "CTD-tree",
                icon = "__CTDaddon_for_Bob__/graphics/icons/tree.png",
                icon_size = 64,
                icon_mipmaps = 4,
                subgroup = "CTD-raw",
                order = "w[CTD-tree]",
                stack_size = 50,
                weight = 20 * kg,
            },
            {
                type = "item",
                name = "CTD-log",
                icon = "__CTDaddon_for_Bob__/graphics/icons/ctd-log-256.png",
                icon_size = 256,
                icon_mipmaps = 3,
                subgroup = "CTD-raw",
                order = "w[CTD-log]",
                stack_size = 50,
                weight = 10 * kg,

            }
        }
    )
end
-- ##############################################################################################

-- ##############################################################################################
-- Определяем цвета научных пакетов
local science_pack_colors = {"grey", "red", "green", "blue", "orange", "white", "yellow"}

-- Таблица соответствий цветов и tint
local color_tints = {
    grey = item_tints.grey_science or item_tints.bluish_science,
    green = item_tints.green_science or item_tints.bluish_science,
    red = item_tints.red_science or item_tints.bluish_science,
    blue = item_tints.blue_science or item_tints.bluish_science,
    orange = item_tints.orange_science or item_tints.bluish_science,
    white = item_tints.white_science or item_tints.bluish_science,
    yellow = item_tints.yellow_science or item_tints.bluish_science
}

local color_order = {
    grey = "a",
    green = "b", 
    red = "c",
    blue = "d",
    orange = "e",
    white = "f",
    yellow = "g"
}

-- Создаем все научные пакеты в цикле
for _, color in ipairs(science_pack_colors) do
    data:extend({
        {
            type = "tool",
            name = "CTD-science-pack-" .. color,
            icon = "__CTDaddon_for_Bob__/graphics/icons/science/science-pack-" .. color .. "-256.png",
            icon_size = 256,
            icon_mipmaps = 3,
            subgroup = "science-pack",
            order = color_order[color] .. "[CTD-science-pack-" .. color .. "]",
            inventory_move_sound = item_sounds.science_inventory_move,
            pick_sound = item_sounds.science_inventory_pickup,
            drop_sound = item_sounds.science_inventory_move,
            stack_size = 200,
            weight = 1 * kg,
            durability = 1,
            durability_description_key = "description.science-pack-remaining-amount-key",
            factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
            durability_description_value = "description.science-pack-remaining-amount-value",
            random_tint_color = color_tints[color]
        }
    })
end
-- ##############################################################################################

-- ##############################################################################################
require("new.ore-crusher")                      -- дробилки руды
require("new.crushed-stone")                    -- Щебень
-- ##############################################################################################