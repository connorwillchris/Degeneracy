SMODS.Joker {
    key = "fake_id",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    rarity = 3,
    cost = 7,
    atlas = 'deg_jokers',
    pos = { x = 4, y = 0 },

    config = {
        extra = {
        }
    },
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand_text_area.blind_chips:juice_up()
                    G.hand_text_area.game_chips:juice_up()
                    play_sound('tarot1')
                    card:start_dissolve()
                    return true
                end
            }))
            ease_dollars(-G.GAME.dollars, true)
            return {
                message = localize('k_saved_ex'),
                saved = "Saved by Fake ID",
                colour = G.C.RED
            }
        end
    end,
}
