-- ##############################################################################################
local remove = CTDmod.lib.recipe.completely_remove
local delete = CTDmod.lib.recipe.completely_delete
local safely_delete = CTDmod.lib.recipe.safely_delete
-- ##############################################################################################
if mods ["aai-industry"] then
    if mods ["bobpower"] then
        delete("bob-burner-generator")
    end
    if mods ["bobelectronics"] then
        safely_delete("electronic-circuit-wood")
        delete("stone-tablet")
    end
end
-- ##############################################################################################
if mods ["bobplates"] then
    remove("bob-synthetic-wood")
end
-- ##############################################################################################