-- ##############################################################################################
local raw_tech = data.raw.technology
local add_dependency = CTDmod.lib.tech.add_dependency
local mass_add_dependencies = CTDmod.lib.tech.mass_add_dependencies
local replace_dependency = CTDmod.lib.tech.replace_dependency
local remove_dependency = CTDmod.lib.tech.remove_dependency
local replace_or_remove_dependencies = CTDmod.lib.tech.replace_or_remove_dependencies
local transfer_effects = CTDmod.lib.tech.transfer_effects
local disable = CTDmod.lib.tech.disable
local completely_delete = CTDmod.lib.tech.completely_delete
local replace_science_pack_globally = CTDmod.lib.tech.replace_science_pack_globally
local remove_recipe_effect = CTDmod.lib.tech.remove_recipe_effect
local remove_recipe_effects = CTDmod.lib.tech.remove_recipe_effects
local get_recipe_effects = CTDmod.lib.tech.get_recipe_effects
local has_recipe_effect = CTDmod.lib.tech.has_recipe_effect
local remove_science_pack = CTDmod.lib.tech.remove_science_pack_if_another_exists
-- ##############################################################################################

-- ##############################################################################################
replace_science_pack_globally("automation-science-pack", "CTD-science-pack-grey")
raw_tech["CTD-science-pack-grey"].icons = {{icon = "__CTDaddon_for_Bob__/graphics/icons/science/science-pack-grey-256.png", icon_size = 256, mipmap = 3}}
replace_science_pack_globally("military-science-pack", "CTD-science-pack-red")
raw_tech["CTD-science-pack-red"].icons = {{icon = "__CTDaddon_for_Bob__/graphics/icons/science/science-pack-red-256.png", icon_size = 256, mipmap = 3}}
replace_science_pack_globally("logistic-science-pack", "CTD-science-pack-green")
raw_tech["CTD-science-pack-green"].icons = {{icon = "__CTDaddon_for_Bob__/graphics/icons/science/science-pack-green-256.png", icon_size = 256, mipmap = 3}}
replace_science_pack_globally("chemical-science-pack", "CTD-science-pack-blue")
raw_tech["CTD-science-pack-blue"].icons = {{icon = "__CTDaddon_for_Bob__/graphics/icons/science/science-pack-blue-256.png", icon_size = 256, mipmap = 3}}
replace_science_pack_globally("production-science-pack", "CTD-science-pack-orange")
raw_tech["CTD-science-pack-orange"].icons = {{icon = "__CTDaddon_for_Bob__/graphics/icons/science/science-pack-orange-256.png", icon_size = 256, mipmap = 3}}
replace_science_pack_globally("space-science-pack", "CTD-science-pack-white")
raw_tech["CTD-science-pack-white"].icons = {{icon = "__CTDaddon_for_Bob__/graphics/icons/science/science-pack-white-256.png", icon_size = 256, mipmap = 3}}
replace_science_pack_globally("utility-science-pack", "CTD-science-pack-yellow")
raw_tech["CTD-science-pack-yellow"].icons = {{icon = "__CTDaddon_for_Bob__/graphics/icons/science/science-pack-yellow-256.png", icon_size = 256, mipmap = 3}}
-- ##############################################################################################

-- ##############################################################################################
require("tech-rename")					-- Переименование технологий для исключения неверных ссылок
require("technology-dependency-fix")	-- Изменение зависимостей технологий
-- require("technology-cost-fix")			-- Изменение стоимости исследования технологий
-- require("technology-delete")            -- Удаление технологий
-- ##############################################################################################

-- ##############################################################################################
if mods ["aai-industry"] then
	data:extend
	({
		{
			type = "technology",
			name = "CTD-copper-wire",
			icon = "__base__/graphics/icons/copper-wire.png",
			icon_size = 64,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "copper-cable"
				},
				{
					type = "unlock-recipe",
					recipe = "bob-basic-circuit-board"
				},
			},
			research_trigger =
			{
				type = "craft-item",
				item = "copper-plate",
				count = 50
			}
		}
	})
	add_dependency("electricity", "CTD-copper-wire")
end
-- ##############################################################################################

-- ##############################################################################################
if mods ["aai-industry"] then
	remove_recipe_effect("electricity", "copper-cable")
	remove_recipe_effect("CTD-electronics", "bob-basic-circuit-board")
end
-- ##############################################################################################

-- ##############################################################################################
remove_science_pack("CTD-science-pack-green", "CTD-science-pack-grey")
-- ##############################################################################################

-- ##############################################################################################
replace_or_remove_dependencies("processing-unit", "CTD-science-pack-blue")
replace_dependency("CTD-science-pack-green", "electricity", "CTD-electronics")
remove_dependency("CTD-science-pack-green", "logistics")
remove_dependency("CTD-science-pack-green", "CTD-logistics-0")
replace_dependency("CTD-science-pack-red", "CTD-electronics", "advanced-circuit")
remove_dependency("CTD-science-pack-red", "military-2")
remove_dependency("CTD-science-pack-red", "stone-wall")
replace_dependency("processing-unit", "CTD-science-pack-blue", "advanced-circuit")
replace_dependency("CTD-science-pack-blue", "advanced-circuit", "processing-unit")
raw_tech["processing-unit"].unit = {count = 600, ingredients = {{"CTD-science-pack-green", 1}}, time = 30}
-- ##############################################################################################
