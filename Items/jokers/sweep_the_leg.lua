-- Sweep The Leg - Implemented! but awaiting art
SMODS.Joker {
    key = "sweep_the_leg",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    rarity = 2,
    cost = 6,
    atlas = 'deg_jokers',
    pos = { x = 3, y = 0 },

    config = {
        extra = {
            percent = 0.05,
            mult = 5
        }
    },
    calculate = function(self, card, context)
        if context.before then
            G.GAME.blind.chips = math.floor(G.GAME.blind.chips - G.GAME.blind.chips * card.ability.extra.percent)
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            SMODS.calculate_effect({ message = "Reduced!" }, card)
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
}
