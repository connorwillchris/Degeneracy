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
            for i = 1, #G.playing_cards do
                if SMODS.pseudorandom_probability(self, "deg_seed", 1, 7, "brass") then
                    SMODS.Stickers["deg_locked"]:apply(G.playing_cards[i], true)
                end
            end
        end
    end,
    modifiers = function()
        G.GAME.modifiers.enable_deg_locked = true
    end,
})

