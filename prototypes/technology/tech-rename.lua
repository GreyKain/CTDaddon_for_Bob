-- ##############################################################################################
local tech_rename = CTDmod.lib.tech.rename
-- ##############################################################################################
if mods ["bobelectronics"] and mods ["aai-industry"] then
    tech_rename("bob-electronics", "CTD-electronics")
end
-- ##############################################################################################
if mods ["bobenemies"] then
    tech_rename("bob-artifact-radar", "CTD-artifact-radar")
end
-- ##############################################################################################
if mods ["boblogistics"] then
    tech_rename("logistics-0", "CTD-logistics-0")
end
-- ##############################################################################################
if mods ["bobmining"] then
    tech_rename("steel-axe", "CTD-bronze-axe")
end
-- ##############################################################################################
if mods ["aai-industry"] then
    tech_rename("burner-mechanics", "CTD-burner-mechanics")
    tech_rename("fuel-processing", "CTD-fuel-processing", tostring(settings.startup["aai-fuel-processor-efficiency"].value))
end
-- ##############################################################################################