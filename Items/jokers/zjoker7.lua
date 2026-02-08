SMODS.Joker {
    key = "joker7",

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        return {
            vars = {
                card.ability.extra.x_mult,
            }
        }
    end,

    rarity = 2,
    cost = 6,
    --atlas = 'deg_jokers',
    pos = { x = 0, y = 0 },

    config = {
        extra = {
            x_mult = 1.25,
        }
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and SMODS.has_enhancement(context.other_card, "m_gold") then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    x_mult = card.ability.extra.x_mult
                }
            end
        end
    end,

    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_gold') then
                return true
            end
        end
        return false
    end
}
