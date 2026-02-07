SMODS.Joker {
    key = 'cardiovascular_exercise',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.dollars,
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
        }
    },
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
    calc_dollar_bonus = function(self, card)
        return G.GAME.current_round.hands_played * card.ability.extra.dollars or nil
    end
}
