--#region Plate of Escardgot - Implemented! but awaiting art
SMODS.Joker {
    key = "escardgot",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.rounds_remaining,
                card.ability.extra.x_mult,
            }
        }
    end,

    rarity = 2,
    cost = 8,
    atlas = 'deg_jokers',
    pos = { x = 2, y = 0 },

    config = {
        extra = {
            x_mult = 1.5,
            rounds_remaining = 5,
        }
    },
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.rounds_remaining <= 1 then
                SMODS.calculate_effect({ message = "Destroyed!", colour = G.C.FILTER }, card)
                SMODS.destroy_cards(card)
            else
                card.ability.extra.rounds_remaining = card.ability.extra.rounds_remaining - 1
                SMODS.calculate_effect({ message = card.ability.extra.rounds_remaining .. '', }, card)
            end
        end
        if context.joker_main then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end,
}

DEG.Button("j_deg_escardgot", {
    text = "USE",
    can_click = function(e)
        local card = e.config and e.config.ref_table
        return G.hand and #G.hand.highlighted == 1 and card.ability.extra.rounds_remaining > 1
    end,
    ui_config = {
        align = 'cl',
        offset = { x = 0.2, y = 0 },
    },
    click = function(e)
        local card = e.config and e.config.ref_table
        if G.hand.highlighted then
            card.ability.extra.rounds_remaining = card.ability.extra.rounds_remaining - 1
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[1]:flip()
                    play_sound('card1', 1)
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                func = function()
                    assert(SMODS.modify_rank(G.hand.highlighted[1], -1))
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[1]:flip()
                    play_sound('tarot2', 1, 0.6)
                    return true
                end
            }))
            delay(0.5)

            SMODS.calculate_effect({ message = card.ability.extra.rounds_remaining .. '', }, card)
        end
    end
})
--#endregion
