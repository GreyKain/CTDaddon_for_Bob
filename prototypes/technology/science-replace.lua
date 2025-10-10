-- ##############################################################################################
local tech = data.raw.technology
local replace_science_pack_globally = CTDmod.lib.tech.replace_science_pack_globally
-- ##############################################################################################
-- ЗАМЕНА ВАНИЛЬНЫХ БАНОК НАУКИ НА ТЕХНОКАРТЫ KRsASTORIO
-- ##############################################################################################
replace_science_pack_globally("automation-science-pack", "automation-tech-card")
tech["automation-tech-card"].icons = {{icon = "__Krastorio2Assets__/technologies/automation-tech-card.png", icon_size = 256, mipmap = 1}}
replace_science_pack_globally("logistic-science-pack", "logistic-tech-card")
tech["logistic-tech-card"].icons = {{icon = "__Krastorio2Assets__/technologies/logistic-tech-card.png", icon_size = 256, mipmap = 1}}
replace_science_pack_globally("military-science-pack", "military-tech-card")
tech["military-tech-card"].icons = {{icon = "__Krastorio2Assets__/technologies/military-tech-card.png", icon_size = 256, mipmap = 1}}
replace_science_pack_globally("chemical-science-pack", "chemical-tech-card")
tech["chemical-tech-card"].icons = {{icon = "__Krastorio2Assets__/technologies/chemical-tech-card.png", icon_size = 256, mipmap = 1}}
replace_science_pack_globally("production-science-pack", "production-tech-card")
tech["production-tech-card"].icons = {{icon = "__Krastorio2Assets__/technologies/production-tech-card.png", icon_size = 256, mipmap = 1}}
replace_science_pack_globally("utility-science-pack", "utility-tech-card")
tech["utility-tech-card"].icons = {{icon = "__Krastorio2Assets__/technologies/utility-tech-card.png", icon_size = 256, mipmap = 1}}
replace_science_pack_globally("space-science-pack", "kr-matter-tech-card")
tech["kr-matter-tech-card"].icons = {{icon = "__Krastorio2Assets__/technologies/matter-tech-card.png", icon_size = 256, mipmap = 1}}
-- ##############################################################################################