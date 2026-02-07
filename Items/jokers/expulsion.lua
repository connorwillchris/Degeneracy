SMODS.Joker {
    key = "expulsion",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {

            }
        }
    end,

    blueprint_compat = false,
    rarity = 2,
    cost = 5,
    atlas = 'deg_jokers',
    pos = { x = 6, y = 1 },

    config = {
        extra = {
            h_size = 2
        }
    },

    add_to_deck = function(self, card, context)
        G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 2
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, context)
        G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling / 2
        G.hand:change_size(-card.ability.extra.h_size)
    end,
}
