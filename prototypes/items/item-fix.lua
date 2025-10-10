-- ##############################################################################################
local ammo = data.raw.ammo
local turret = data.raw["ammo-turret"]
local tool = data.raw.tool
-- ##############################################################################################
if mods ["RampantFixed"] then
    -- ЕМКОСТЬ ОБОИМЫ 10 --> 30
    ammo["firearm-magazine"].magazine_size = 30
    ammo["piercing-rounds-magazine"].magazine_size = 30
end
-- ##############################################################################################

-- ##############################################################################################
for name in  pairs(tool) do
    if tool and tool[name].subgroup == "science-pack" then
        tool[name].subgroup = "other-science-pack"
    end
end
-- ##############################################################################################