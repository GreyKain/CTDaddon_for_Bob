-- ##############################################################################################
local assembler = data.raw["assembling-machine"]
local burner_assembler = assembler["burner-assembling-machine"]
local hand_crafting = settings.startup["CTD-hand-crafting"].value
local lab = data.raw["lab"]
local shortcut = data.raw["shortcut"]
-- ##############################################################################################
require("prototypes.mining-resource")
require("prototypes.technology.tech-rename")
require("prototypes.recipes.recipes-data-final-fixes")
require("prototypes.technology.technology-final-fixes")
require("prototypes.energy")

if hand_crafting == "forbidden" or hand_crafting == "forbidden-and-hidden" then
	require("mods.prohibition_manual_crafting")	-- мод на запрет ручного крафта (для мазохистов)
end

if settings.startup["CTD-crafting-time"].value then
	require("prototypes.crafting-time")
end
-- ##############################################################################################
if mods ["aai-programmable-vehicles"] then
	shortcut["path-remote-control"].technology_to_unlock = "automobilism"
	shortcut["path-remote-control"].unavailable_until_unlocked = true
	shortcut["unit-remote-control"].technology_to_unlock = "automobilism"
	shortcut["unit-remote-control"].unavailable_until_unlocked = true
end
-- ##############################################################################################
if mods ["bobassembly"] then
	assembler["assembling-machine-1"].ingredient_count = 4
	assembler["assembling-machine-2"].ingredient_count = 5
end
if mods ["aai-industry"] then
	burner_assembler.ingredient_count = 3
	burner_assembler.crafting_speed = 0.25
	burner_assembler.energy_usage = "75kW"
	burner_assembler.energy_source.effectivity = 0.45

	lab["burner-lab"].energy_usage = "45kW"
	lab["burner-lab"].energy_source.effectivity = 0.45
	lab["burner-lab"].researching_speed = 0.5
end
-- ##############################################################################################
--- изменение размера твердотопливного ассемблера в зависимости от выбранной опции:
if mods ["aai-industry"] and mods ["bobassembly"] and mods ["reskins-compatibility"] then
	if settings.startup["CTD-size-burner-assembler"].value == "2x2" then
		if burner_assembler then
			-- Убираем апгрейд для твердотопливного сборщика
			burner_assembler.next_upgrade = nil

			-- Убираем связи с другими ассемблерами
			burner_assembler.fast_replaceable_group = nil
			burner_assembler.allowed_effects = nil

			-- Изменяем визуальные границы
			burner_assembler.collision_box = {{-1, -1}, {1, 1}}  		-- 2x2
			burner_assembler.selection_box = {{-1, -1}, {1, 1}} 		-- 2x2
			burner_assembler.drawing_box = {{-1.5, -1.5}, {1.5, 1.5}} 	-- Визуальные границы
		end
	else
		-- Увеличиваем визуальный размер до 3x3
		if burner_assembler then
			burner_assembler.graphics_set.animation.layers[1] =
			{
				filename = "__aai-industry__/graphics/entity/burner-assembling-machine/burner-assembling-machine.png",
				priority="high",
				width = 214,
				height = 226,
				frame_count = 32,
				line_length = 8,
				shift = util.by_pixel(0, 2),
				scale = 0.5
			}
			burner_assembler.graphics_set.working_visualisations =
			{
				{
					draw_as_glow = true,
					fadeout = true,
					animation =
					{
						filename = "__aai-industry__/graphics/entity/burner-assembling-machine/burner-assembling-machine-light.png",
						priority = "high",
						width = 214,
						height = 226,
						frame_count = 1,
						animation_speed = 1,
						shift = util.by_pixel(0, 2),
						scale = 0.5,
						draw_as_glow = true,
						blend_mode = "additive",
					}
				}
			}
		end
	end
end
-- ##############################################################################################
--- для скрытия ярлыков зелёных/красных проводов:
if not mods ["GetWiresBack"] then
	if mods ["aai-industry"] then
		shortcut["give-copper-wire"].technology_to_unlock = "electricity"
	end
	shortcut["give-copper-wire"].unavailable_until_unlocked = true
	shortcut["give-red-wire"].unavailable_until_unlocked = true
	shortcut["give-green-wire"].unavailable_until_unlocked = true
end
-- ##############################################################################################