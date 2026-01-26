--Birthday Card - Implemented! but awaiting art
SMODS.Joker {
    key = "birthday_card",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    rarity = 1,
    cost = 6,
    atlas = 'deg_jokers',
    pos = { x = 1, y = 0 },

    config = {
        extra = {
            options = {
                [1] = 'tag_standard',
                [2] = 'tag_charm',
                [3] = 'tag_meteor',
                [4] = 'tag_buffoon',
                [5] = 'tag_ethereal',
            }
        }
    },
    calculate = function(self, card, context)
        if context.after and context.main_eval and not context.blueprint and #context.full_hand == 5 then
            local count = 0
            for i = 1, #context.scoring_hand do
                local rank_val = context.scoring_hand[i]:get_id() == 14 and 1 or context.scoring_hand[i].base.nominal
                count = count + rank_val
            end
            if count == 21 then
                local tag_choice = pseudorandom_element(card.ability.extra.options, 'birthday')
                SMODS.calculate_effect({ message = "+1 Tag!" }, card)
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        add_tag(Tag(tag_choice, false, 'Small'))
                        return true
                    end)
                }))
            end
        end
    end,
}
