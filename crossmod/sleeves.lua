SMODS.Atlas {
    key = "sleeves",
    path = "sleeves.png",
    px = 71,
    py = 95
}

CardSleeves.Sleeve {
    key = "giantrat",
    name = "Giant rat Sleeve",
    atlas = "sleeves",
    pos = { x = 0, y = 0 },
    unlocked = false,
    unlock_condition = { deck = "b_deg_giantrat", stake = "stake_deg_brass" },
    loc_vars = function(self)
        local key, vars
        if self.get_current_deck_key() == "b_deg_giantrat" then
            key = self.key .. "_alt"
        else
            key = self.key
        end
        return { key = key, vars = vars }
    end,
    calculate = function(self, back, context)
        if context.final_scoring_step then
            if self.get_current_deck_key() == "b_deg_giantrat" then
                -- this is for both deck and sleeve
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
            else
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
    end
}
