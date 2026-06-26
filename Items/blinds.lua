SMODS.Blind {
    key = 'tangelo_token',
    dollars = 8,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX('ff9b56'),
    atlas = 'deg_blinds',
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
                            G.hand.cards[i].ability.temp_deg_locked = true
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

SMODS.Blind {
    key = "incarnadine_club",
    dollars = 8,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX('ee3a68'),
    atlas = 'deg_blinds',
    pos = { x = 0, y = 1 },
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.modify_hand then
                blind.triggered = true
                mult = 0
                hand_chips = 0
                update_hand_text({ sound = 'chips2', modded = true }, { chips = hand_chips, mult = mult })
            end
        end
    end
}
