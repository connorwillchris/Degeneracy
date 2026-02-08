SMODS.Joker {
    key = "d_of_6",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,

    rarity = 1,
    cost = 4,
    atlas = 'deg_jokers',
    pos = { x = 2, y = 1 },

    config = {
        extra = {
            dollars = 1
        }
    },
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local count = 0
            for i = 1, #context.scoring_hand do
                local rank_val = context.scoring_hand[i]:get_id() == 14 and 1 or context.scoring_hand[i].base.nominal
                count = count + rank_val
            end
            if count == 15 then
                return {
                    dollars = card.ability.extra.dollars,
                }
            end
        end
    end,
}
