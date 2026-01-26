-- Radiation Detector - Implemented! but awaiting art
SMODS.Joker {
    key = "radiation_detector",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    rarity = 3,
    cost = 8,
    atlas = 'deg_jokers',
    pos = { x = 5, y = 0 },

    config = {
        extra = {
        }
    },
    calculate = function(self, card, context)
        if context.after and context.main_eval and not context.blueprint and #context.full_hand == 1 and G.GAME.current_round.hands_played == 0 then
            if #G.hand.cards > 0 then
                local chosen = pseudorandom_element(G.hand.cards, "radiation")

                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('tarot1')
                        chosen:juice_up(0.3, 0.5)
                        return true
                    end
                }))

                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        chosen:flip()
                        play_sound('card1', 1)
                        chosen:juice_up(0.3, 0.3)
                        return true
                    end
                }))

                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        copy_card(context.scoring_hand[1], chosen)
                        return true
                    end
                }))

                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        chosen:flip()
                        play_sound('tarot2', 1, 0.6)
                        chosen:juice_up(0.3, 0.3)
                        return true
                    end
                }))

                delay(0.5)
            end
        end
    end,
}
