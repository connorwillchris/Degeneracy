SMODS.Back {
    key = "giantrat",
    atlas = "decks",
    pos = { x = 0, y = 0 },

    calculate = function(self, back, context)
        if context.final_scoring_step then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local hand_count = #G.play.cards

                    for i = 1, hand_count do
                        draw_card(G.discard, G.deck, i * 100 / hand_count, "down", nil, nil, 0.08)
                    end

                    G.deck:shuffle("deg" .. G.GAME.round_resets.ante)

                    return true
                end
            }))
        end
    end
}

SMODS.Back {
    key = "e",
    atlas = "decks",
    pos = { x = 1, y = 0 },
    config = {
        hand_size  = 2
    },
    initial_deck = {
        Ranks = {
            "deg_1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace",
            "deg_0", "deg_0.5", "deg_pi", "deg_11", "deg_12", "deg_13", "deg_21", "deg_-11",
            "deg_-1", "deg_-2", "deg_-3", "deg_-4", "deg_-5", "deg_-6", "deg_-7", "deg_-8",
            "deg_-9", "deg_-10", "deg_-Jack", "deg_-Queen", "deg_-King", "deg_-Ace",
        }
    }
}
