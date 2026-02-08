SMODS.Joker {
    key = "joker8",

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.dollars
            }
        }
    end,

    rarity = 2,
    cost = 6,
    --atlas = 'deg_jokers',
    pos = { x = 0, y = 0 },

    config = {
        extra = {
            mult = 2,
            dollars = 2,
        }
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint and not context.repetition then
            if SMODS.has_enhancement(context.other_card, 'm_lucky') then
                return {
                    mult = card.ability.extra.mult,
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end,

    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_lucky') then
                return true
            end
        end
        return false
    end
}
