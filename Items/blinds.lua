SMODS.Blind {
    key = 'tangelo_token',
    dollars = 8,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX('f94d00'),
    atlas = 'deg_jokers',
    pos = { x = 0, y = 0 },
    calculate = function(self, blind, context)
        if context.first_hand_drawn then
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
                        if not G.hand.cards[i].ability.deg_locked then
                            SMODS.Stickers["deg_locked"]:apply(G.hand.cards[i], true)
                        end
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
}
