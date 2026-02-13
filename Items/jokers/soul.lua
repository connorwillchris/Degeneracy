SMODS.Joker {
    key = "soul",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    rarity = 2,
    cost = 6,
    --atlas = 'deg_jokers',
    pos = { x = 0, y = 0 },

    config = {
        extra = {
        }
    },
    calculate = function(self, card, context)
        if context.setting_blind then
            SMODS.add_card { set = "Joker", stickers = { "perishable" }, force_stickers = true }
            SMODS.calculate_effect({ message = localize("k_plus_joker"), colour = G.C.FILTER }, card)
        end
    end
}
