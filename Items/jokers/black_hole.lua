SMODS.Joker {
    key = "notblackhole",
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.base, card.ability.extra.odds,
            'black_hole')
        return {
            vars = {
                numerator,
                denominator,
            }
        }
    end,
    rarity = 2,
    cost = 6,
    atlas = 'deg_jokers',
    pos = { x = 9, y = 2 },
    config = {
        extra = {
            base = 1,
            odds = 3,
        }
    },
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end,
    calculate = function(self, card, context)
        if context.before and SMODS.pseudorandom_probability(card, 'black_hole', card.ability.extra.base, card.ability.extra.odds, 'deg_black_hole') then
            SMODS.calculate_effect({ message = localize("k_level_up_ex"), colour = G.C.FILTER }, card)
            SMODS.smart_level_up_hand(card, context.scoring_name, nil, 2)
            local rnd_hand = pseudorandom_element(G.handlist, "seed")
            SMODS.smart_level_up_hand(card, rnd_hand, nil, -1)
        end
    end
}
