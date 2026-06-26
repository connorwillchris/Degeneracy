SMODS.Achievement {
    key = "you_win",
    unlock_condition = function(self, args)
    if args.type == 'you_win' then
      return true
    end
    end,
    hidden_name = false,
    hidden_text = false,
    bypass_all_unlocked = true
}
