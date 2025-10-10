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
    if tech["automation-tech-card"] then
        replace_dependency("fuel-processing","automation-tech-card", "flammables")
        add_dependency("fuel-processing", "military-tech-card")
        tech["fuel-processing"].unit =
            {
                count = 150,
                ingredients =
                    {
                        {"logistic-tech-card", 1},
                        {"military-tech-card", 1}
                    },
                time = 30
            }
    else
        replace_dependency("fuel-processing","automation-science-pack", "flammables")
        add_dependency("fuel-processing", "military-science-pack")
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
    end
    replace_dependency("electricity", "fuel-processing", "burner-mechanics")

    if mods ["boblogistics"] then
        replace_dependency("logistics-0", "basic-logistics", "burner-mechanics")
        transfer_effects("basic-logistics", "logistics")
        completely_delete("basic-logistics")
        if tech["automation-tech-card"] then
            add_dependency("electricity", "automation-tech-card")
            add_dependency("steam-power", "logistic-tech-card")
        else
            add_dependency("electricity", "automation-science-pack")
            add_dependency("steam-power", "logistic-science-pack")
        end
        replace_dependency("steam-power", "fluid-handling", "basic-fluid-handling")
    end

    if mods ["bobplates"] then
        if tech["automation-tech-card"] then
            remove_dependency("sand-processing", "automation-tech-card")
            add_dependency("automation-tech-card", "glass-processing")
            replace_dependency("bob-electrolysis-1", "automation-tech-card", "electricity")
        else
            remove_dependency("sand-processing", "automation-science-pack")
            add_dependency("automation-science-pack", "glass-processing")
            replace_dependency("bob-electrolysis-1", "automation-science-pack", "electricity")
        end
        tech["sand-processing"].research_trigger = {type = "mine-entity", entity = "stone", count = 50}
        tech["sand-processing"].unit = nil
        tech["glass-processing"].research_trigger = {type = "craft-item", item = "sand", count = 40}
        tech["glass-processing"].unit = nil
    end

    if mods ["bobelectronics"] then
        replace_dependency("electronics", "electricity", "bob-electronics")
        transfer_effects("electronics", "bob-electronics")
        disable("electronics")
        if tech["automation-tech-card"] then
            tech["bob-electronics"].unit = {count = 130, ingredients = {{"automation-tech-card", 1}}, time = 30}
        else
            tech["bob-electronics"].unit = {count = 130, ingredients = {{"automation-science-pack", 1}}, time = 30}
        end
    end

    if mods ["bobmining"] then
        if tech["automation-tech-card"] then
            replace_dependency("bob-water-miner-1", "automation-tech-card", "electricity")
        else
            replace_dependency("bob-water-miner-1", "automation-science-pack", "electricity")
        end
    end
end
-- ##############################################################################################

-- ##############################################################################################
if mods ["boblogistics"] then
    if tech["automation-tech-card"] then
        add_dependency("inserter-stack-size-bonus-2", "chemical-tech-card")
    else
        add_dependency("inserter-stack-size-bonus-2", "chemical-science-pack")
    end
end
-- ##############################################################################################

-- ##############################################################################################

if mods ["bobwarfare"] then
    replace_dependency("bob-sniper-turrets-1", "gun-turret", "military-3")
    if tech["automation-tech-card"] then
        replace_dependency("bob-sniper-turrets-1", "military-tech-card", "chemical-tech-card")
        tech["bob-sniper-turrets-1"].unit = {
            count = 150,
            ingredients =
                {
                    {"logistic-tech-card", 1},
                    {"military-tech-card", 1},
                    {"chemical-tech-card", 1}
                },
            time = 30
        }
    else
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