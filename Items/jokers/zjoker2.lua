SMODS.Joker {
    key = "joker2",

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
        return {
            vars = {
                card.ability.extra.chips,
            }
        }
    end,

    rarity = 2,
    cost = 6,
    --atlas = 'deg_jokers',
    pos = { x = 0, y = 0 },

    config = {
        extra = {
            chips = 40,
        }
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint and not context.repetition then
            if SMODS.has_enhancement(context.other_card, 'm_mult') then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end,

    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_mult') then
                return true
            end
        end
        return false
    end
}
