-- Joker changes

--[[SMODS.Joker:take_ownership('fibonacci', {
    config = { extra = { mult = 8 } },
    loc_vars = function(self, info_queue, card)
        return {
            key = 'j_deg_fibonacci',
            vars = { card.ability.extra.mult }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 2 or
                context.other_card:get_id() == 3 or
                context.other_card:get_id() == 5 or
                context.other_card:get_id() == 8 or
                context.other_card:get_id() == 14 then
                --context.other_card.base.value == "deg_21" then
                return {
                    mult = self.ability.extra.mult
                }
            end
        end
    end
})--]]

--[[SMODS.Joker:take_ownership('odd_todd', {
    config = { extra = { chips = 31 } },
    loc_vars = function(self, info_queue, card)
        return {
            key = 'j_deg_odd_todd',
            vars = { card.ability.extra.chips }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 3 or
                context.other_card:get_id() == 5 or
                context.other_card:get_id() == 7 or
                context.other_card:get_id() == 9 or
                context.other_card:get_id() == 14 or
                context.other_card.base.value == "deg_21" then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
})}}

--[[SMODS.Joker:take_ownership('even_steven', {
    config = { extra = { mult = 4 } },
    loc_vars = function(self, info_queue, card)
        return {
            key = 'j_deg_even_steven',
            vars = { card.ability.extra.mult }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() <= 10 and
                context.other_card:get_id() >= 0 and
                context.other_card:get_id() % 2 == 0 then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
})]]--
