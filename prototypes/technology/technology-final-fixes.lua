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
if mods ["StorageTank2_2_0"] then
	add_dependency("adv-fluid-storage", "chemical-science-pack")
end
-- ##############################################################################################
if mods ["Repair_Turret"] then
	add_dependency("repair-turret", "CTD-science-pack-green")
end
-- ##############################################################################################
if raw_tech["CTD-electronics"] then
	if mods ["bobelectronics"] and mods ["aai-industry"] then
		replace_dependency("CTD-electronics", "electronics", "electricity")
	end
    replace_or_remove_dependencies("electronics", "CTD-electronics")
end
-- ##############################################################################################
if mods ["Smart_Inserters"] and mods ["aai-industry"] then
	mass_add_dependencies("si-unlock-cross", {"automation", "CTD-burner-mechanics"})
	mass_add_dependencies("si-unlock-offsets", {"automation", "CTD-burner-mechanics"})
	completely_delete("bob-long-inserters-1")
end
-- ##############################################################################################
if mods ["aai-industry"] then
	replace_dependency("CTD-fuel-processing","CTD-science-pack-grey", "flammables")
	add_dependency("CTD-fuel-processing", "CTD-science-pack-red")
	replace_dependency("electricity", "CTD-fuel-processing", "CTD-burner-mechanics")
	raw_tech["CTD-fuel-processing"].unit =
	{
		count = 150,
		ingredients =
		{
			{"CTD-science-pack-green", 1},
			{"CTD-science-pack-red", 1}
		},
		time = 30
	}
	if mods ["boblogistics"] then
		replace_dependency("CTD-logistics-0", "basic-logistics", "CTD-burner-mechanics")
		transfer_effects("basic-logistics", "logistics")
		completely_delete("basic-logistics")
		add_dependency("electricity", "CTD-science-pack-grey")
		replace_dependency("steam-power", "fluid-handling", "basic-fluid-handling")
		add_dependency("steam-power", "CTD-science-pack-green")
	end
	if mods ["bobplates"] then
		remove_dependency("sand-processing", "CTD-science-pack-grey")
		raw_tech["sand-processing"].research_trigger = {type = "craft-item", item = "stone", count = 10}
		raw_tech["sand-processing"].unit = nil
		raw_tech["glass-processing"].research_trigger = {type = "craft-item", item = "sand", count = 40}
		raw_tech["glass-processing"].unit = nil
		add_dependency("CTD-science-pack-grey", "glass-processing")
		replace_dependency("bob-electrolysis-1", "CTD-science-pack-grey", "electricity")
	end
	if mods ["bobelectronics"] then
		replace_dependency("electronics", "electricity", "CTD-electronics")
		transfer_effects("electronics", "CTD-electronics")
		disable("electronics")
		raw_tech["CTD-electronics"].unit = {count = 130, ingredients = {{"CTD-science-pack-grey", 1}}, time = 30}
	end
	if mods ["bobmining"] then
		replace_dependency("bob-water-miner-1", "CTD-science-pack-grey", "electricity")
	end
end
-- ##############################################################################################
if mods ["boblogistics"] then
	add_dependency("inserter-stack-size-bonus-2", "chemical-science-pack")
end
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
if mods ["bobelectronics"] and mods ["aai-industry"] then
	add_dependency("CTD-science-pack-red", "CTD-electronics")
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

-- ##############################################################################################
if mods ["bobwarfare"] then
	replace_dependency("bob-sniper-turrets-1", "gun-turret", "military-3")
	replace_dependency("bob-sniper-turrets-1", "CTD-science-pack-red", "CTD-science-pack-blue")
	raw_tech["bob-sniper-turrets-1"].unit = 
	{
		count = 150,
		ingredients =
		{
			{"CTD-science-pack-green", 1},
			{"CTD-science-pack-red", 1},
			{"CTD-science-pack-blue", 1}
		},
		time = 30
	}
end
-- ##############################################################################################
