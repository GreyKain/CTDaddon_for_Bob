-- ##############################################################################################
local burner_generator = data.raw["burner-generator"]
local generator = data.raw["generator"]
local boiler = data.raw["boiler"]
local reactor = data.raw["reactor"]
local assembler = data.raw["assembling-machine"]
local radar = data.raw["radar"]
local pump = data.raw["offshore-pump"]
-- ##############################################################################################
if settings.startup["CTD-efficiency"].value == "standard" then
	-- КПД паровых движков
	generator["steam-engine"].effectivity = 0.7
	-- КПД бойлеров
	boiler["boiler"].energy_source.effectivity = 0.7
	if mods ["aai-industry"] then
		-- КПД Твердотопливной турбины-генератора
		burner_generator["burner-turbine"].burner.effectivity = 0.45
		burner_generator["burner-turbine"].max_power_output = "800kW"

		pump["offshore-pump"].energy_usage = "60kW"
		pump["offshore-pump"].pumping_speed = 2
	end

	if mods ["bobpower"] then
		-- КПД паровых движков
		generator["bob-steam-engine-2"].effectivity = 0.75
		generator["bob-steam-engine-3"].effectivity = 0.8
		generator["bob-steam-engine-4"].effectivity = 0.85
		generator["bob-steam-engine-5"].effectivity = 0.9
		-- КПД бойлеров
		boiler["bob-boiler-2"].energy_source.effectivity = 0.75
		boiler["bob-boiler-3"].energy_source.effectivity = 0.8
		boiler["bob-boiler-4"].energy_source.effectivity = 0.85
		boiler["bob-boiler-5"].energy_source.effectivity = 0.9
		-- КПД Нефтежидкостных генераторов
		generator["bob-fluid-generator"].effectivity = 0.55
		generator["bob-fluid-generator-2"].effectivity = 0.7
		generator["bob-fluid-generator-3"].effectivity = 0.75
		generator["bob-hydrazine-generator"].effectivity = 0.9
	end
end
if settings.startup["CTD-efficiency"].value == "hardcore" then
	-- КПД паровых движков
	generator["steam-engine"].effectivity = 0.25
	-- КПД бойлеров
	boiler["boiler"].energy_source.effectivity = 0.55
	if mods ["aai-industry"] then
		-- КПД Твердотопливной турбины-генератора
		burner_generator["burner-turbine"].burner.effectivity = 0.1
		burner_generator["burner-turbine"].max_power_output = "800kW"

		pump["offshore-pump"].energy_usage = "60kW"
		pump["offshore-pump"].pumping_speed = 2
	end
	if mods ["bobpower"] then
		-- КПД паровых движков
		generator["bob-steam-engine-2"].effectivity = 0.3
		generator["bob-steam-engine-3"].effectivity = 0.35
		generator["bob-steam-engine-4"].effectivity = 0.4
		generator["bob-steam-engine-5"].effectivity = 0.45
		-- КПД бойлеров
		boiler["bob-boiler-2"].energy_source.effectivity = 0.6
		boiler["bob-boiler-3"].energy_source.effectivity = 0.65
		boiler["bob-boiler-4"].energy_source.effectivity = 0.7
		boiler["bob-boiler-5"].energy_source.effectivity = 0.75
		-- КПД Нефтежидкостных генераторов
		generator["bob-fluid-generator"].effectivity = 0.55 -- поправить
		generator["bob-fluid-generator-2"].effectivity = 0.7 -- поправить
		generator["bob-fluid-generator-3"].effectivity = 0.75 -- поправить
		generator["bob-hydrazine-generator"].effectivity = 0.9 -- поправить
	end
end
-- ##############################################################################################
--- увеличение потребления эл.энергии радарами х3
radar["radar"].energy_usage = "900kW"

if mods ["bobwarfare"] then
	radar["bob-radar-2"].energy_usage = "1.35MW"
	radar["bob-radar-3"].energy_usage = "1.8MW"
	radar["bob-radar-4"].energy_usage = "2.25MW"
	radar["bob-radar-5"].energy_usage = "2.7MW"
end
-- ##############################################################################################
-- reactor["burner-reactor"].energy_source.effectivity = 0.75
-- reactor["burner-reactor-2"].energy_source.effectivity = 0.85

-- reactor["fluid-reactor"].energy_source.effectivity = 0.8
-- reactor["fluid-reactor-2"].energy_source.effectivity = 0.9
-- ##############################################################################################
-- 	reactor["burner-reactor"].energy_source.effectivity = 0.75
-- 	reactor["burner-reactor-2"].energy_source.effectivity = 0.87

-- 	reactor["fluid-reactor"].energy_source.effectivity = 0.76
-- 	reactor["fluid-reactor-2"].energy_source.effectivity = 0.88
-- ##############################################################################################