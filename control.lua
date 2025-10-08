-- ##############################################################################################
local function aggressively_remove_stone()
    log("Starting aggressive stone removal...")

    -- Метод 1: Прямое вмешательство в глобальные переменные RSO
    if not global.RSO then global.RSO = {} end
    if not global.RSO.resourceConfig then global.RSO.resourceConfig = {} end

    -- Полностью удаляем камень из конфигурации RSO
    global.RSO.resourceConfig["stone"] = nil

    -- Метод 2: Если RSO использует другую структуру
    if global.rso_config then
        global.rso_config.resourceConfig = global.rso_config.resourceConfig or {}
        global.rso_config.resourceConfig["stone"] = nil
    end

    -- Метод 3: Ищем и модифицируем любые упоминания камня в глобальных переменных
    for key, value in pairs(global) do
        if type(value) == "table" and value.resourceConfig then
            value.resourceConfig["stone"] = nil
        end
        if key:lower():find("rso") and type(value) == "table" then
            if value.resourceConfig then
                value.resourceConfig["stone"] = nil
            end
        end
    end

    -- Метод 4: Удаляем существующие камни на всех поверхностях
    for _, surface in pairs(game.surfaces) do
        local stones = surface.find_entities_filtered{name = "stone"}
        log("Removing " .. #stones .. " stones from surface " .. surface.name)
        for _, stone in pairs(stones) do
            stone.destroy()
        end
    end
end

local function handle_chunk_generated(event)
    -- Немедленно удаляем любые камни в новом чанке
    local stones = event.surface.find_entities_filtered{
        name = "stone",
        area = event.area
    }
    for _, stone in pairs(stones) do
        stone.destroy()
    end
end

script.on_init(function()
    script.on_nth_tick(3, function()
        aggressively_remove_stone()
        script.on_nth_tick(3, nil)
    end)
end)

script.on_configuration_changed(function()
    script.on_nth_tick(3, function()
        aggressively_remove_stone()
        script.on_nth_tick(3, nil)
    end)
end)

-- Обработчик для новых чанков ДОЛЖЕН быть объявлен после функции
script.on_event(defines.events.on_chunk_generated, handle_chunk_generated)

log("Aggressive stone removal completed")
-- ##############################################################################################

-- ##############################################################################################
-- Инициализация
script.on_init(function()
    global = global or {}
    global.players_seen = global.players_seen or {}
end)

script.on_configuration_changed(function()
    global = global or {}
    global.players_seen = global.players_seen or {}
end)

-- Функция отправки сообщения
local function send_welcome(player)
    -- Создаем цветной текст через Rich Text
    local message = {"", "[color=green]", {"CTD.CTD-welcome", player.name}, "[/color]"}
    player.print(message)
end

-- Обработчики событий
script.on_event(defines.events.on_player_created, function(event)
    local player = game.players[event.player_index]
    if not global.players_seen[player.index] then
        send_welcome(player)
        global.players_seen[player.index] = true
    end
end)

script.on_event(defines.events.on_player_joined_game, function(event)
    global = global or {}
    global.players_seen = global.players_seen or {}

    local player = game.players[event.player_index]
    if not global.players_seen[player.index] then
        send_welcome(player)
        global.players_seen[player.index] = true
    end
end)
-- ##############################################################################################

-- ##############################################################################################
local modifier = -0.9835  -- 1.0 → 0.0165
local function apply_crafting_speed()
    if settings.startup["CTD-hand-crafting"].value == "slowing-down" then
        for _, player in pairs(game.players) do
            if player.character then
                player.character_crafting_speed_modifier = modifier
            end
        end
        log("Скорость крафта замедленна для всех игроков")
    end
end

-- Обработчики событий
script.on_init(apply_crafting_speed)
script.on_configuration_changed(apply_crafting_speed)

-- Для новых игроков (если нужно)
script.on_event(defines.events.on_player_created, function(event)
    if settings.startup["CTD-hand-crafting"].value == "slowing-down" then
        local player = game.players[event.player_index]
        if player.character then
            player.character_crafting_speed_modifier = modifier
        end
    end
end)
-- ##############################################################################################