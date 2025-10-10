-- ##############################################################################################
data:extend({
    {
        type = "item",
        name = "kr-blank-tech-card",
        icon = "__Krastorio2Assets__/icons/items/blank-tech-card-1.png",
        subgroup = "Krastorio-science-pack",
        order = "a00[blank-tech-card]",
        stack_size = 200,
    },
    {
        type = "item",
        name = "kr-biter-research-data",
        icon = "__Krastorio2Assets__/icons/cards/biters-research-data.png",
        subgroup = "Krastorio-research-data",
        order = "a01[biters-research-data]",
        stack_size = 200,
    },
    {
        type = "item",
        name = "kr-matter-research-data",
        icon = "__Krastorio2Assets__/icons/cards/matter-research-data.png",
        subgroup = "Krastorio-research-data",
        order = "a02[matter-research-data]",
        stack_size = 200,
    },
    {
        type = "item",
        name = "kr-space-research-data",
        icon = "__Krastorio2Assets__/icons/cards/space-research-data.png",
        subgroup = "Krastorio-research-data",
        order = "a03[space-research-data]",
        stack_size = 1000,
    },
    {
        type = "tool",
        name = "kr-basic-tech-card",
        localised_description = { "item-description.science-pack" },
        icon = "__Krastorio2Assets__/icons/cards/basic-tech-card.png",
        subgroup = "Krastorio-science-pack",
        order = "b01[basic-tech-card]",
        stack_size = 200,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
    },
    {
        type = "tool",
        name = "automation-tech-card",
        localised_description = { "item-description.science-pack" },
        icon = "__Krastorio2Assets__/icons/cards/automation-tech-card.png",
        subgroup = "Krastorio-science-pack",
        order = "b02[automation-tech-card]",
        stack_size = 200,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        pictures = {
            layers = {
                {
                    filename = "__Krastorio2Assets__/icons/cards/automation-tech-card.png",
                    size = 64,
                    scale = 0.5,
                },
                {
                    filename = "__Krastorio2Assets__/icons/cards/automation-tech-card-light.png",
                    size = 64,
                    scale = 0.5,
                    draw_as_light = true,
                },
            },
        },
    },
    {
        type = "tool",
        name = "logistic-tech-card",
        localised_description = { "item-description.science-pack" },
        icon = "__Krastorio2Assets__/icons/cards/logistic-tech-card.png",
        subgroup = "Krastorio-science-pack",
        order = "b03[logistic-tech-card]",
        stack_size = 200,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        pictures = {
            layers = {
                {
                    filename = "__Krastorio2Assets__/icons/cards/logistic-tech-card.png",
                    size = 64,
                    scale = 0.5,
                },
                {
                    filename = "__Krastorio2Assets__/icons/cards/logistic-tech-card-light.png",
                    size = 64,
                    scale = 0.5,
                    draw_as_light = true,
                },
            },
        },
    },
    {
        type = "tool",
        name = "military-tech-card",
        localised_description = { "item-description.science-pack" },
        icon = "__Krastorio2Assets__/icons/cards/military-tech-card.png",
        subgroup = "Krastorio-science-pack",
        order = "b04[military-tech-card]",
        stack_size = 200,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        pictures = {
            layers = {
                {
                    filename = "__Krastorio2Assets__/icons/cards/military-tech-card.png",
                    size = 64,
                    scale = 0.5,
                },
                {
                    filename = "__Krastorio2Assets__/icons/cards/military-tech-card-light.png",
                    size = 64,
                    scale = 0.5,
                    draw_as_light = true,
                },
            },
        },
    },
    {
        type = "tool",
        name = "chemical-tech-card",
        localised_description = { "item-description.science-pack" },
        icon = "__Krastorio2Assets__/icons/cards/chemical-tech-card.png",
        subgroup = "Krastorio-science-pack",
        order = "b05[chemical-tech-card]",
        stack_size = 200,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        pictures = {
            layers = {
                {
                    filename = "__Krastorio2Assets__/icons/cards/chemical-tech-card.png",
                    size = 64,
                    scale = 0.5,
                },
                {
                    filename = "__Krastorio2Assets__/icons/cards/chemical-tech-card-light.png",
                    size = 64,
                    scale = 0.5,
                    draw_as_light = true,
                },
            },
        },
    },
    {
        type = "tool",
        name = "production-tech-card",
        localised_description = { "item-description.science-pack" },
        icon = "__Krastorio2Assets__/icons/cards/production-tech-card.png",
        subgroup = "Krastorio-science-pack",
        order = "b06[production-tech-card]",
        stack_size = 200,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        pictures = {
            layers = {
                {
                    filename = "__Krastorio2Assets__/icons/cards/production-tech-card.png",
                    size = 64,
                    scale = 0.5,
                },
                {
                    filename = "__Krastorio2Assets__/icons/cards/production-tech-card-light.png",
                    size = 64,
                    scale = 0.5,
                    draw_as_light = true,
                },
            },
        },
    },
    {
        type = "tool",
        name = "optimization-tech-card",
        localised_description = { "item-description.science-pack" },
        icon = "__Krastorio2Assets__/icons/cards/optimization-tech-card.png",
        subgroup = "Krastorio-science-pack",
        order = "b07[optimization-tech-card]",
        stack_size = 200,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        pictures = {
            layers = {
                {
                    filename = "__Krastorio2Assets__/icons/cards/optimization-tech-card.png",
                    size = 64,
                    scale = 0.5,
                },
                {
                    filename = "__Krastorio2Assets__/icons/cards/optimization-tech-card-light.png",
                    size = 64,
                    scale = 0.5,
                    draw_as_light = true,
                },
            },
        },
    },
    {
        type = "tool",
        name = "utility-tech-card",
        localised_description = { "item-description.science-pack" },
        icon = "__Krastorio2Assets__/icons/cards/utility-tech-card.png",
        subgroup = "Krastorio-science-pack",
        order = "b08[utility-tech-card]",
        stack_size = 200,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        pictures = {
            layers = {
                {
                    filename = "__Krastorio2Assets__/icons/cards/utility-tech-card.png",
                    size = 64,
                    scale = 0.5,
                },
                {
                    filename = "__Krastorio2Assets__/icons/cards/utility-tech-card-light.png",
                    size = 64,
                    scale = 0.5,
                    draw_as_light = true,
                },
            },
        },
    },
    {
        type = "tool",
        name = "kr-matter-tech-card",
        localised_description = { "item-description.science-pack" },
        icon = "__Krastorio2Assets__/icons/cards/matter-tech-card.png",
        subgroup = "Krastorio-science-pack",
        order = "b09[matter-tech-card]",
        stack_size = 200,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        pictures = {
            layers = {
                {
                    filename = "__Krastorio2Assets__/icons/cards/matter-tech-card.png",
                    size = 64,
                    scale = 0.5,
                },
                {
                    filename = "__Krastorio2Assets__/icons/cards/matter-tech-card-light.png",
                    size = 64,
                    scale = 0.5,
                    draw_as_light = true,
                },
            },
        },
    },
    {
        type = "tool",
        name = "kr-advanced-tech-card",
        localised_description = { "item-description.science-pack" },
        icon = "__Krastorio2Assets__/icons/cards/advanced-tech-card.png",
        subgroup = "Krastorio-science-pack",
        order = "b10[advanced-tech-card]",
        stack_size = 200,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        pictures = {
            layers = {
                {
                    filename = "__Krastorio2Assets__/icons/cards/advanced-tech-card.png",
                    size = 64,
                    scale = 0.5,
                },
                {
                    filename = "__Krastorio2Assets__/icons/cards/advanced-tech-card-light.png",
                    size = 64,
                    scale = 0.5,
                    draw_as_light = true,
                },
            },
        },
    },
    {
        type = "tool",
        name = "kr-singularity-tech-card",
        localised_description = { "item-description.science-pack" },
        icon = "__Krastorio2Assets__/icons/cards/singularity-tech-card.png",
        subgroup = "Krastorio-science-pack",
        order = "b11[singularity-tech-card]",
        stack_size = 200,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        pictures = {
            layers = {
                {
                    filename = "__Krastorio2Assets__/icons/cards/singularity-tech-card.png",
                    size = 64,
                    scale = 0.5,
                },
                {
                    filename = "__Krastorio2Assets__/icons/cards/singularity-tech-card-light.png",
                    size = 64,
                    scale = 0.5,
                    draw_as_light = true,
                }
            }
        }
    }
})
-- ##############################################################################################