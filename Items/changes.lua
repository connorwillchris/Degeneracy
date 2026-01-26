-- Joker changes
SMODS.Joker:take_ownership('fibonacci', {
    config = { extra = { mult = 8 } },
    loc_vars = function(self, info_queue, card)
        return {
            key = 'j_deg_fibonacci',
            vars = { card.ability.extra.mult }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if
                context.other_card.base.value == "deg_1" or
                context.other_card:get_id() == 2 or
                context.other_card:get_id() == 3 or
                context.other_card:get_id() == 5 or
                context.other_card:get_id() == 8 or
                context.other_card:get_id() == 14 or
                context.other_card.base.value == "deg_13" or
                context.other_card.base.value == "deg_21" then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
})

SMODS.Joker:take_ownership('odd_todd', {
    config = { extra = { chips = 31 } },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.chips }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if not context.other_card:is_face() and (context.other_card:get_id() % 2 == 1 or context.other_card.base.nominal % 2 == 1 or context.other_card:get_id() == 14) then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
})
SMODS.Joker:take_ownership('even_steven', {
    config = { extra = { mult = 4 } },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.mult }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if not context.other_card:is_face() and (context.other_card:get_id() % 2 == 0 or context.other_card.base.nominal % 2 == 0) then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
})

-- Name change, otherwise functionally the same
SMODS.Joker:take_ownership('business', {
    loc_vars = function(self, info_queue, card)
        return {
            key = 'j_deg_business',
        }
    end,
}, true)
