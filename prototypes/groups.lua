-- ##############################################################################################
local tool = data.raw.tool
-- ##############################################################################################
        -- ГРУППЫ
-- ##############################################################################################
data:extend(
    {
        {
            type = "item-group",
            name = "CTD-science",
            order = "c-a[CTD-science]",
            icon = "__CTDaddon_for_Bob__/graphics/icons/science/datacore-energy-1-256.png",
            icon_size = 256
        }
    }
)
data.raw["item-group"]["intermediate-products"].icon = "__CTDaddon_for_Bob__/graphics/item-group/intermediate-products.png"
data.raw["item-group"]["intermediate-products"].icon_size = 256
-- ##############################################################################################
        -- ПОДГРУППЫ
-- ##############################################################################################
data:extend(
    {
        {
			type = "item-subgroup",
			name = "CTD-raw",
			group = "intermediate-products",
			order = "a[CTD-raw]"
		},
        {
			type = "item-subgroup",
			name = "CTD-ore-crusher",
			group = "production",
			order = "a[CTD-ore-crusher]"
		},
        {
			type = "item-subgroup",
			name = "CTD-scientific-analyzer",
			group = "CTD-science",
			order = "a-a[CTD-scientific-analyzer]"
		},
        {
			type = "item-subgroup",
			name = "Krastorio-research-data",
			group = "CTD-science",
			order = "a-b[Krastorio-research-data]"
		},
        {
			type = "item-subgroup",
			name = "Krastorio-science-pack",
			group = "CTD-science",
			order = "a-c[Krastorio-science-pack]"
		},
        {
			type = "item-subgroup",
			name = "other-science-pack",
			group = "CTD-science",
			order = "a-d[other-science-pack]"
		}
    }
)
-- ##############################################################################################
	-- Создаем подгруппу для виртуальных сигналов если ее нет
if not data.raw["item-subgroup"]["virtual-signal"] then
    data:extend({
        {
            type = "item-subgroup",
            name = "virtual-signal",
            group = "production",
            order = "zz"
        }
    })
end
-- ##############################################################################################

-- ##############################################################################################
	-- перемещаем все предметы в группу науки
for name in  pairs(tool) do
    if tool and tool[name].subgroup == "science-pack" then
        tool[name].subgroup = "other-science-pack"
    end
end
-- ##############################################################################################