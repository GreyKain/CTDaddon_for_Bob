-- ##############################################################################################
local tech = data.raw.technology
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
-- replace_science_pack_globally("automation-science-pack", "CTD-scientific-analyzer-grey")
-- tech["CTD-scientific-analyzer-grey"].icons = {{icon = "__CTDaddon_for_Bob__/graphics/icons/science/scientific-analyzer-grey-256.png", icon_size = 256, mipmap = 3}}
-- replace_science_pack_globally("military-science-pack", "CTD-scientific-analyzer-red")
-- tech["CTD-scientific-analyzer-red"].icons = {{icon = "__CTDaddon_for_Bob__/graphics/icons/science/scientific-analyzer-red-256.png", icon_size = 256, mipmap = 3}}
-- replace_science_pack_globally("logistic-science-pack", "CTD-scientific-analyzer-green")
-- tech["CTD-scientific-analyzer-green"].icons = {{icon = "__CTDaddon_for_Bob__/graphics/icons/science/scientific-analyzer-green-256.png", icon_size = 256, mipmap = 3}}
-- replace_science_pack_globally("chemical-science-pack", "CTD-scientific-analyzer-blue")
-- tech["CTD-scientific-analyzer-blue"].icons = {{icon = "__CTDaddon_for_Bob__/graphics/icons/science/scientific-analyzer-blue-256.png", icon_size = 256, mipmap = 3}}
-- replace_science_pack_globally("production-science-pack", "CTD-scientific-analyzer-orange")
-- tech["CTD-scientific-analyzer-orange"].icons = {{icon = "__CTDaddon_for_Bob__/graphics/icons/science/scientific-analyzer-orange-256.png", icon_size = 256, mipmap = 3}}
-- replace_science_pack_globally("space-science-pack", "CTD-scientific-analyzer-white")
-- tech["CTD-scientific-analyzer-white"].icons = {{icon = "__CTDaddon_for_Bob__/graphics/icons/science/scientific-analyzer-white-256.png", icon_size = 256, mipmap = 3}}
-- replace_science_pack_globally("utility-science-pack", "CTD-scientific-analyzer-yellow")
-- tech["CTD-scientific-analyzer-yellow"].icons = {{icon = "__CTDaddon_for_Bob__/graphics/icons/science/scientific-analyzer-yellow-256.png", icon_size = 256, mipmap = 3}}
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
	remove_recipe_effect("bob-electronics", "bob-basic-circuit-board")
end
-- ##############################################################################################

-- ##############################################################################################
remove_science_pack("logistic-science-pack", "automation-science-pack")
-- ##############################################################################################

-- ##############################################################################################
replace_or_remove_dependencies("processing-unit", "chemical-science-pack")
replace_dependency("logistic-science-pack", "electricity", "bob-electronics")
remove_dependency("logistic-science-pack", "logistics")
remove_dependency("logistic-science-pack", "logistics-0")
add_dependency("military-science-pack", "advanced-circuit")
remove_dependency("military-science-pack", "military-2")
remove_dependency("military-science-pack", "stone-wall")
replace_dependency("processing-unit", "chemical-science-pack", "advanced-circuit")
replace_dependency("chemical-science-pack", "advanced-circuit", "processing-unit")
tech["processing-unit"].unit = {count = 600, ingredients = {{"logistic-science-pack", 1}}, time = 30}
-- ##############################################################################################