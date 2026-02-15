SMODS.Joker {
    key = "joker6",

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_tower
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.base, card.ability.extra.odds,
            'joker6')
        return {
            vars = {
                numerator,
                denominator
            }
        }
    end,

    rarity = 2,
    cost = 6,
    --atlas = 'deg_jokers',
    pos = { x = 0, y = 0 },

    config = {
        extra = {
            base = 1,
            odds = 3
        }
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint and not context.repetition then
            if SMODS.has_enhancement(context.other_card, 'm_stone') and SMODS.pseudorandom_probability(card, 'joker6', card.ability.extra.base, card.ability.extra.odds, 'deg_joker6') and #G.consumeables.cards < G.consumeables.config.card_limit then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card {
                            set = "Tarot",
                            key = "c_tower"
                        }
                        return true
                    end
                }))
                SMODS.calculate_effect({ message = localize('k_plus_tarot'), colour = G.C.PURPLE },
                    context.blueprint_card or card)
            end
        end
    end,

    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_stone') then
                return true
            end
        end
        return false
    end
}
