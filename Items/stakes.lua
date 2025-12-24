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
    above_stake = 'gold',
    applied_stakes = { "gold" },
    prefix_config = { above_stake = { false }, applied_stakes = { mod = false } },
    colour = HEX("d2ad64"),
    shiny = true,

    calculate = function (self, context)
    end,

    modifiers = function()
        G.GAME.modifiers.enable_deg_locked = true
    end,
})
