-- ##############################################################################################
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
-- ##############################################################################################

-- ##############################################################################################
-- Определяем цвета научных анализаторов
local science_pack_colors = {"grey", "red", "green", "blue", "orange", "white", "yellow"}

-- Таблица соответствий цветов и tint
local color_tints = {
    grey = item_tints.grey_science or item_tints.bluish_science,
    red = item_tints.red_science or item_tints.bluish_science,
    green = item_tints.green_science or item_tints.bluish_science,
    blue = item_tints.blue_science or item_tints.bluish_science,
    orange = item_tints.orange_science or item_tints.bluish_science,
    white = item_tints.white_science or item_tints.bluish_science,
    yellow = item_tints.yellow_science or item_tints.bluish_science
}

local color_order = {
    grey = "1",
    red = "2",
    green = "3",
    blue = "4",
    orange = "5",
    yellow = "8",
    white = "7"
}

-- Создаем все научные анализаторы в цикле
for _, color in ipairs(science_pack_colors) do
    data:extend({
        {
            type = "tool",
            name = "CTD-scientific-analyzer-" .. color,
            icon = "__CTDaddon_for_Bob__/graphics/icons/science/scientific-analyzer-" .. color .. "-256.png",
            icon_size = 256,
            icon_mipmaps = 3,
            subgroup = "CTD-scientific-analyzer",
            order = "c" .. color_order[color] .. "[CTD-scientific-analyzer-" .. color .. "]",
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