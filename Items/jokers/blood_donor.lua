SMODS.Joker {
    key = 'blood_donor',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_mult,
            }
        }
    end,

    rarity = 3,
    cost = 8,
    atlas = 'deg_jokers',
    pos = { x = 5, y = 1 },

    config = {
        extra = {
            x_mult = 1.5,
        }
    },
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:is_suit("Hearts") then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            scored_card:flip()
                            play_sound('card1', 1)
                            scored_card:juice_up(0.3, 0.3)
                            return true
                        end
                    }))
                    delay(0.2)

                    -- can't put this in an event otherwise it won't be changed before scoring
                    assert(SMODS.modify_rank(scored_card, -1))

                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            scored_card:flip()
                            play_sound('tarot2', 1, 0.6)
                            scored_card:juice_up(0.3, 0.3)
                            return true
                        end
                    }))
                    delay(0.5)
                end
            end
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit("Hearts") then
                return {
                    x_mult = card.ability.extra.x_mult
                }
            end
        end
    end
}
