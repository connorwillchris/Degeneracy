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
