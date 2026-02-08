SMODS.Joker {
    key = 'cardiovascular_exercise',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.dollars,
                card.ability.extra.count * card.ability.extra.dollars,
            }
        }
    end,

    rarity = 1,
    cost = 4,
    atlas = 'deg_jokers',
    pos = { x = 9, y = 1 },

    config = {
        extra = {
            mult = -5,
            dollars = 3,
            count = 0
        }
    },
    calculate = function(self, card, context)
        if context.starting_shop then
            card.ability.extra.count = 0
        end
        if context.joker_main then
            card.ability.extra.count = card.ability.extra.count + 1
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.count * card.ability.extra.dollars or nil
    end
}
