-- ##############################################################################################
-- НОВЫЕ РЕСУРСЫ ИЗ ДЕРЕВЬЕВ
-- ##############################################################################################
data:extend(
    {
        {
            type = "item",
            name = "CTD-tree",
            icon = "__CTDaddon_for_Bob__/graphics/icons/tree.png",
            icon_size = 64,
            icon_mipmaps = 4,
            subgroup = "CTD-raw",
            order = "w[CTD-tree]",
            stack_size = 50,
            weight = 20 * kg,
        },
        {
            type = "item",
            name = "CTD-log",
            icon = "__CTDaddon_for_Bob__/graphics/icons/ctd-log-256.png",
            icon_size = 256,
            icon_mipmaps = 3,
            subgroup = "CTD-raw",
            order = "w[CTD-log]",
            stack_size = 50,
            weight = 10 * kg,

        }
    }
)
-- ##############################################################################################