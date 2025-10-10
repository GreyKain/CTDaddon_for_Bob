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
local remove_recipe_effect = CTDmod.lib.tech.remove_recipe_effect
local remove_recipe_effects = CTDmod.lib.tech.remove_recipe_effects
local get_recipe_effects = CTDmod.lib.tech.get_recipe_effects
local has_recipe_effect = CTDmod.lib.tech.has_recipe_effect
local remove_science_pack = CTDmod.lib.tech.remove_science_pack_if_another_exists
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
-- remove_science_pack("logistic-science-pack", "automation-science-pack")
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