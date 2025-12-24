assert(SMODS.load_file("Items/challenges.lua"))()
--assert(SMODS.load_file("Items/chips.lua"))()
assert(SMODS.load_file("Items/credits.lua"))()
assert(SMODS.load_file("Items/ranks.lua"))()
assert(SMODS.load_file("Items/stakes.lua"))()
assert(SMODS.load_file("Items/stickers.lua"))()

SMODS.Atlas({
    key = "modicon",
    path = "Icon.png",
    px = 32,
    py = 32
})

SMODS.Atlas({
    key = "balatro",
    path = "balatro.png",
    px = 333,
    py = 216,
    prefix_config = { key = false },
})