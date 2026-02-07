SMODS.Joker {
    key = "report_card",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,

    rarity = 2,
    cost = 6,
    atlas = 'deg_jokers',
    pos = { x = 7, y = 1 },

    config = {
        extra = {
            dollars = 11
        }
    },
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval then
            local should_apply = false
            if G.GAME.dollars >= card.ability.extra.dollars then
                should_apply = true
            end
            ease_dollars(-card.ability.extra.dollars)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function()
                    SMODS.calculate_context({ playing_card_added = true, cards = SMODS.add_card { set = "Base", rank = 'Ace', edition = (should_apply and "e_foil" or nil) } })
                    return true
                end
            }))
        end
    end,
}
