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
if mods ["StorageTank2_2_0"] then
	add_dependency("adv-fluid-storage", "chemical-science-pack")
end
-- ##############################################################################################

-- ##############################################################################################
if tech["logistic-science-pack"] then
    if mods ["Repair_Turret"] then
        add_dependency("repair-turret", "logistic-science-pack")
    end
end
-- ##############################################################################################

-- ##############################################################################################
if tech["bob-electronics"] then
	if mods ["bobelectronics"] and mods ["aai-industry"] then
		replace_dependency("bob-electronics", "electronics", "electricity")
	end
    replace_or_remove_dependencies("electronics", "bob-electronics")
end
-- ##############################################################################################

-- ##############################################################################################
if mods ["Smart_Inserters"] and mods ["aai-industry"] then
	mass_add_dependencies("si-unlock-cross", {"automation", "burner-mechanics"})
	mass_add_dependencies("si-unlock-offsets", {"automation", "burner-mechanics"})
	completely_delete("bob-long-inserters-1")
end
-- ##############################################################################################

-- ##############################################################################################
if mods ["aai-industry"] then
	replace_dependency("fuel-processing","automation-science-pack", "flammables")
	add_dependency("fuel-processing", "military-science-pack")
	replace_dependency("electricity", "fuel-processing", "burner-mechanics")
	tech["fuel-processing"].unit =
	{
		count = 150,
		ingredients =
		{
			{"logistic-science-pack", 1},
			{"military-science-pack", 1}
		},
		time = 30
	}
	if mods ["boblogistics"] then
		replace_dependency("logistics-0", "basic-logistics", "burner-mechanics")
		transfer_effects("basic-logistics", "logistics")
		completely_delete("basic-logistics")
		add_dependency("electricity", "automation-science-pack")
		replace_dependency("steam-power", "fluid-handling", "basic-fluid-handling")
		add_dependency("steam-power", "logistic-science-pack")
	end
	if mods ["bobplates"] then
		remove_dependency("sand-processing", "automation-science-pack")
		tech["sand-processing"].research_trigger = {type = "mine-entity", entity = "stone", count = 50}
		tech["sand-processing"].unit = nil
		tech["glass-processing"].research_trigger = {type = "craft-item", item = "sand", count = 40}
		tech["glass-processing"].unit = nil
		add_dependency("automation-science-pack", "glass-processing")
		replace_dependency("bob-electrolysis-1", "automation-science-pack", "electricity")
	end
	if mods ["bobelectronics"] then
		replace_dependency("electronics", "electricity", "bob-electronics")
		transfer_effects("electronics", "bob-electronics")
		disable("electronics")
		tech["bob-electronics"].unit = {count = 130, ingredients = {{"automation-science-pack", 1}}, time = 30}
	end
	if mods ["bobmining"] then
		replace_dependency("bob-water-miner-1", "automation-science-pack", "electricity")
	end
end
-- ##############################################################################################

-- ##############################################################################################
if mods ["boblogistics"] then
	add_dependency("inserter-stack-size-bonus-2", "chemical-science-pack")
end
-- ##############################################################################################

-- ##############################################################################################
-- if tech["military-science-pack"] and tech["bob-electronics"] then
-- 	if mods ["bobelectronics"] and mods ["aai-industry"] then
-- 		add_dependency("military-science-pack", "bob-electronics")
-- 	end
-- end
-- ##############################################################################################

-- ##############################################################################################
if tech["military-science-pack"] then
    if mods ["bobwarfare"] then
        replace_dependency("bob-sniper-turrets-1", "gun-turret", "military-3")
        replace_dependency("bob-sniper-turrets-1", "military-science-pack", "chemical-science-pack")
        tech["bob-sniper-turrets-1"].unit = {
            count = 150,
            ingredients =
                {
                    {"logistic-science-pack", 1},
                    {"military-science-pack", 1},
                    {"chemical-science-pack", 1}
                },
            time = 30
        }
    end
end
-- ##############################################################################################