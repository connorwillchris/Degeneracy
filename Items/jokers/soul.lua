SMODS.Joker {
    key = "notsoul",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = { HEX('4F5DA1') },
            }
        }
    end,
    rarity = 3,
    cost = 6,
    atlas = 'deg_jokers',
    pos = { x = 0, y = 3 },
    soul_pos = {x = 1, y = 3, draw = function(card, scale_mod, rotate_mod)
        if card.config.center.key == "j_deg_notsoul" and (card.config.center.discovered or card.bypass_discovery_center) then
            local scale_mod = 0.05 + 0.05 * math.sin(1.8 * G.TIMERS.REAL) +
                0.07 * math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) * math.pi * 14) *
                (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
            local rotate_mod = 0.1 * math.sin(1.219 * G.TIMERS.REAL) +
                0.07 * math.sin((G.TIMERS.REAL) * math.pi * 5) * (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 2

            card.children.floating_sprite:draw_shader('dissolve', 0, nil, nil, card.children.center, scale_mod, rotate_mod, nil,
                0.1 + 0.03 * math.sin(1.8 * G.TIMERS.REAL), nil, 0.6)
            card.children.floating_sprite:draw_shader('dissolve', nil, nil, nil, card.children.center, scale_mod, rotate_mod)
        end
    end
    },
    config = {
        extra = {
        }
    },
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            SMODS.add_card { set = "Joker", stickers = { "perishable" }, force_stickers = true }
            SMODS.calculate_effect({ message = localize("k_plus_joker"), colour = G.C.FILTER }, card)
        end
    end
    
}
