SMODS.Joker {
    key = "communist_party_card",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    rarity = 2,
    cost = 6,
    atlas = 'deg_jokers',
    pos = { x = 8, y = 1 },

    config = {
        extra = {
        }
    },
    calculate = function(self, card, context)
        if context.after and context.main_eval and not context.blueprint and G.GAME.current_round.hands_played == 0 then
            if #G.hand.cards > 0 then
                local rnd_card = pseudorandom_element(context.scoring_hand)
                for i = 1, #G.hand.cards do
                    local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            G.hand.cards[i]:flip()
                            play_sound('card1', percent)
                            G.hand.cards[i]:juice_up(0.3, 0.3)
                            return true
                        end
                    }))
                end
                for i = 1, #G.hand.cards do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            copy_card(rnd_card, G.hand.cards[i])
                            return true
                        end
                    }))
                end
                for i = 1, #G.hand.cards do
                    local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            G.hand.cards[i]:flip()
                            play_sound('tarot2', percent, 0.6)
                            G.hand.cards[i]:juice_up(0.3, 0.3)
                            return true
                        end
                    }))
                end
                delay(0.5)
            end
        end
    end,
}
