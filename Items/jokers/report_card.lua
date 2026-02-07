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
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local should_apply = false
            if G.GAME.dollars >= card.ability.extra.dollars then
                ease_dollars(-card.ability.extra.dollars)
                should_apply = true
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function()
                    SMODS.calculate_context({ playing_card_added = true, cards = SMODS.add_card { area = G.deck, set = "Base", rank = 'Ace', edition = (should_apply and "e_foil" or nil) } })
                    return true
                end
            }))
            SMODS.calculate_effect({ message = should_apply and "Foil Ace!" or "Ace!", colour = G.C.FILTER }, card)
        end
    end,
}
