SMODS.current_mod.calculate = function(self, context)
    if context.after and not context.blueprint and context.main_eval then
        local hand_score = hand_chips * mult
        local required_score = G.GAME.blind.chips


        if hand_score <= -required_score then
            unlock_achievement("ach_deg_you_win")

            G.ARGS.score_intensity.earned_score = 10000
            G.ARGS.score_intensity.required_score = 10000
        end
    end
end
SMODS.Achievement {
    key = "you_win",
    unlock_condition = function(self, args)

    end,
    hidden_name = false,
    hidden_text = false,
    bypass_all_unlocked = true
}
