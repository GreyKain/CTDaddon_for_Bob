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