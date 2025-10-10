-- ##############################################################################################
local add_ingredient = CTDmod.lib.recipe.add_ingredient
local add_ingredient_at_position = CTDmod.lib.recipe.add_ingredient_at_position
local replace_ingredient = CTDmod.lib.recipe.replace_ingredient
local replace_ingredient_everywhere = CTDmod.lib.recipe.replace_ingredient_everywhere
local remove_ingredient = CTDmod.lib.recipe.remove_ingredient
local add_tech_unlock = CTDmod.lib.recipe.add_tech_unlock
local change_tech_unlock = CTDmod.lib.recipe.change_tech_unlock
local duplicate = CTDmod.lib.recipe.duplicate
local completely_remove = CTDmod.lib.recipe.completely_remove
local completely_delete = CTDmod.lib.recipe.completely_delete
local modify = CTDmod.lib.recipe.modify
local set_energy_required = CTDmod.lib.recipe.set_energy_required
local item = data.raw.item
local recipe = data.raw.recipe
local tech = data.raw.technology
-- ##############################################################################################
-- ДОБАВЛЕНИЕ УГЛЯ В РЕЦЕПТ ПАТРОНОВ ДЛЯ ДРОБОВИКА
-- ##############################################################################################
add_ingredient_at_position("shotgun-shell", "coal", 1)
-- ##############################################################################################
-- УДАЛЕНИЕ И ЗАМЕНА УГЛЕРОДА ОТ БОБА НА ВАНИЛЬНЫЙ УГЛЕРОД
-- ##############################################################################################
if mods ["bobplates"] and mods ["space-age"] then
    replace_ingredient_everywhere("bob-carbon", "carbon")
    change_tech_unlock("carbon", "tungsten-carbide", "sulfur-processing")
    duplicate(
        "bob-carbon-from-wood",
        "CTD-carbon-from-wood",
        {
            results = {
                {
                    type = "item",
                    name = "carbon",
                    amount = 1
                }
            },
            category = "bob-mixing-furnace",
            main_product = "carbon"
        }
    )
    completely_remove("bob-carbon-from-wood")
    duplicate(
        "bob-carbon",
        "CTD-carbon",
        {
            results = {
                {
                    type = "item",
                    name = "carbon",
                    amount = 2
                }
            }
        }
    )
    completely_remove("bob-carbon")
end
modify("carbon", {results = {{type = "item", name = "carbon", amount = 4}}})
-- ##############################################################################################

-- ##############################################################################################
if item["sand"] and recipe["sand"] then
    recipe["sand"].category = "CTD-ore-refining-t1"
    replace_ingredient("sand", "stone", "CTD-crushed-stone")
end
-- ##############################################################################################

-- ##############################################################################################
if mods ["boblogistics"] then
    if mods ["aai-loaders-electric"] and mods ["aai-industry"] then
          modify("aai-basic-loader", {category = "crafting"})
          add_ingredient("aai-basic-loader", {"electric-motor", 4})
    end
	data.raw.recipe["bob-basic-transport-belt"].enabled = false
	add_tech_unlock("bob-basic-transport-belt", "CTD-logistics-0")
    if mods ["aai-industry"] then
        replace_ingredient("bob-basic-transport-belt", "iron-plate", "iron-stick")
        add_ingredient("bob-basic-transport-belt", "motor")
        completely_delete("bob-steam-inserter")
        data.raw.recipe["bob-steam-inserter-recycling"] = nil
        replace_ingredient("transport-belt", "motor", "bob-basic-transport-belt")
        replace_ingredient("splitter", "transport-belt", {name = "bob-basic-splitter", amount = 1})
        change_tech_unlock("bob-copper-pipe", "electricity", "basic-fluid-handling")
        change_tech_unlock("bob-copper-pipe-to-ground", "electricity", "basic-fluid-handling")
    end
end
-- ##############################################################################################

-- ##############################################################################################
replace_ingredient("stone-furnace", "stone", {name = "stone-brick", amount = 3})
if mods ["bobplates"] then
    replace_ingredient("bob-stone-mixing-furnace", "stone", {name = "stone-brick", amount = 3})
    replace_ingredient("bob-stone-chemical-furnace", "stone", {name = "stone-brick", amount = 3})
    if mods ["aai-industry"] then
        remove_ingredient("solar-panel", "glass")
        remove_ingredient("chemical-plant", "glass")
        replace_ingredient_everywhere("bob-glass", "glass")
        completely_delete("bob-glass")
    end
end
-- ##############################################################################################

-- ##############################################################################################
replace_ingredient("gun-turret", "iron-plate", {name = "submachine-gun", amount = 1})
-- ##############################################################################################

-- ##############################################################################################
if mods ["aai-industry"] then
    add_ingredient("logistic-science-pack", {"automation-science-pack", 2})
    if mods ["bobelectronics"] then
        add_ingredient("electronic-circuit", "bob-insulated-cable")
        replace_ingredient("lab", "bob-basic-circuit-board", "electronic-circuit")
    end
end
-- ##############################################################################################

-- ##############################################################################################
if mods ["bobelectronics"] then
    replace_ingredient("automation-science-pack", "copper-plate", "bob-basic-circuit-board")
    replace_ingredient("automation-science-pack", "iron-gear-wheel", "iron-plate")
    replace_ingredient("logistic-science-pack", "transport-belt", "electronic-circuit")
    replace_ingredient("logistic-science-pack", "inserter", "bob-solder")
    replace_ingredient("chemical-science-pack", "engine-unit", "automation-science-pack")
    replace_ingredient("chemical-science-pack", "advanced-circuit", "processing-unit")
    if mods ["bobgreenhouse"] then
        replace_ingredient("bob-wooden-board", "wood", "bob-wood-pellets")
        modify("bob-wooden-board",
        {
            results = {{type = "item", name = "bob-wooden-board", amount = 10}},
            energy_required = 2.5
        })
    end
    modify("military-science-pack",
    {
        ingredients =
        {
            {type = "item", name = "advanced-circuit", amount = 2},
            {type = "item", name = "automation-science-pack", amount = 2},
            {type = "item", name = "bob-solder", amount = 1},
        }
    })
end
-- ##############################################################################################

-- ##############################################################################################
if mods ["bobplates"] and mods ["boblogistics"] and mods ["aai-industry"] then
    replace_ingredient("long-handed-inserter", "iron-plate", "bob-bronze-alloy")
end
-- ##############################################################################################

-- ##############################################################################################
if mods ["large-storage-tank"] then
    add_ingredient("large-storage-tank", {"pipe", 8})
end
-- ##############################################################################################

-- ##############################################################################################
add_ingredient_at_position("rail-signal", "small-lamp", 1)
add_ingredient_at_position("rail-chain-signal", "small-lamp", 1)
-- ##############################################################################################

-- ##############################################################################################
if mods ["bobwarfare"] and mods ["bobplates"] then
	replace_ingredient("bob-sniper-turret-1", "iron-gear-wheel", "bob-steel-gear-wheel")
	replace_ingredient("bob-sniper-turret-1", "iron-plate", "steel-plate")
    add_ingredient("bob-sniper-turret-1", "bob-sniper-rifle")
end
-- ##############################################################################################
-- ЗАМЕНА ВАНИЛЬНОЙ ДРЕВЕСИНЫ НА ДЕРЕВО ПРИ МАЙНИНГЕ
-- ##############################################################################################
if settings.startup["CTD-new-tree-recipes"].value then
    local excluded_trees_list = { -- исключенные из обработки деревья
        "dead-dry-hairy-tree",
        "dead-grey-trunk",
        "dead-tree-desert",
        "dry-hairy-tree",
        "dry-tree",
        "funneltrunk",
        "hairyclubhub",
        "stingfrond",
        "boompuff",
        "cuttlepop",
        "water-cane",
        "tree-dryland-n"
    }

    -- Создаём lookup-таблицу из массива
    local excluded_trees = {}
    for _, tree_name in ipairs(excluded_trees_list) do
        excluded_trees[tree_name] = true
    end

    local new_tree = {
        {
            type = "item",
            name = "CTD-tree",
            amount = 1
        }
    }

    for _, tree in pairs(data.raw.tree) do
        if not excluded_trees[tree.name] then
            for _, tree in pairs(data.raw.tree) do
                -- Пропускаем исключённые деревья
                if not excluded_trees[tree.name] then
                    local tree_m = tree.minable
                    if tree_m then
                        if tree_m.result then
                            if tree_m.result == "wood" then
                                tree_m.mining_time = 3
                                tree_m.results = new_tree
                                tree_m.result = nil
                            else
                                tree_m.results = {
                                    {
                                        type = "item",
                                        name = tree_m.result,
                                        amount = tree_m.count or 1
                                    }
                                }
                                tree_m.result = nil
                                tree_m.count = nil
                            end
                        elseif tree_m.results then
                            for r, result in pairs(tree_m.results) do
                                if result.name == "wood" then
                                    result.name = "CTD-tree"
                                    result.amount = 1
                                end
                            end
                        else
                            tree_m.results = new_tree
                        end
                    end
                end
            end
        end
    end
end
-- ##############################################################################################