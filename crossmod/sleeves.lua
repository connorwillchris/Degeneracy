SMODS.Atlas {
    key = "sleeves",
    path = "sleeves.png",
    px = 71,
    py = 95
}

-- cards marked with "deg_return_to_hand" are returned to hand
G.FUNCS.draw_from_play_to_discard = function(e)
    local play_count = #G.play.cards
    local i = 1
    for _, card in ipairs(G.play.cards) do
        if (not card.shattered) and not card.destroyed then
            if card.deg_return_to_hand then
                card.deg_return_to_hand = nil
                draw_card(G.play, G.hand, i * 100 / play_count, "up", true, card)
            else
                draw_card(G.play, G.discard, i * 100 / play_count, "down", false, card)
            end
            i = i + 1
        end
    end
end

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
        if self.get_current_deck_key() == "b_deg_giantrat" then
            -- this is for both deck and sleeve
            if context.after and context.main_eval and not context.blueprint then
                for _, played_card in ipairs(context.full_hand) do
                    played_card.deg_return_to_hand = true
                end
                return {
                    message = "Returned!",
                    colour = G.C.GREEN
                }
            end
        else
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
    end
}
