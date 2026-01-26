SMODS.Joker {
    key = "break_limits",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.repetitions
            }
        }
    end,

    rarity = 2,
    cost = 6,
    atlas = 'deg_jokers',
    pos = { x = 0, y = 0 },

    config = {
        extra = {
            retrigger_card = nil,
            repetitions = 3,
        }
    },
    calculate = function(self, card, context)
        if context.before then
            card.ability.extra.retrigger_card = pseudorandom_element(context.scoring_hand, 'break_limits')
        end
        if context.repetition and context.cardarea == G.play then
            if context.other_card == card.ability.extra.retrigger_card then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
    end,
}
