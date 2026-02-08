SMODS.Atlas({
    key = "deg_stakes",
    path = "stakes.png",
    px = 29,
    py = 29,
})

SMODS.Stake({
    key = "brass",
    atlas = "deg_stakes",
    pos = { x = 0, y = 0 },
    sticker_atlas = "deg_stickers",
    sticker_pos = { x = 1, y = 0 },
    above_stake = "gold",
    applied_stakes = { "gold" },
    prefix_config = { above_stake = { false }, applied_stakes = { mod = false } },
    colour = HEX("d2ad64"),
    shiny = true,
    calculate = function(self, context)
        if G.GAME.modifiers.enable_deg_locked and not G.GAME.brass_applied then
            G.GAME.brass_applied = true -- so it only does it once
            local count = 0
            while count < 7 do
                for i = 1, #G.playing_cards do
                    if SMODS.pseudorandom_probability(self, "deg_seed", 1, 7, "brass") and count < 7 then
                        count = count + 1
                        SMODS.Stickers["deg_locked"]:apply(G.playing_cards[i], true)
                    end
                end
            end
        end
        --[[ At the end of the round, applies locked to a random card (Commented out for now)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and context.beat_boss then
            local unlocked = {}
            for i = 1, #G.playing_cards do
                if not G.playing_cards[i].ability.deg_locked then
                    table.insert(unlocked, G.playing_cards[i])
                end
            end
            local _card = pseudorandom_element(unlocked, "locked")
            SMODS.Stickers["deg_locked"]:apply(_card, true)
            SMODS.calculate_effect({ message = "Locked!" }, G.deck)
        end--]]
    end,
    modifiers = function()
        G.GAME.modifiers.enable_deg_locked = true
    end,
})
