DEGENERACY = {vars = {}, funcs = {deg_alias_type = type}, content = SMODS.current_mod}

assert(SMODS.load_file("config.lua"))()

assert(SMODS.load_file("Items/challenges.lua"))()
--assert(SMODS.load_file("Items/chips.lua"))()
assert(SMODS.load_file("Items/credits.lua"))()
assert(SMODS.load_file("Items/ranks.lua"))()
assert(SMODS.load_file("Items/stakes.lua"))()
assert(SMODS.load_file("Items/stickers.lua"))()
assert(SMODS.load_file("Items/jokers.lua"))()

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

function DEGENERACY.content.save_config(self)
    SMODS.save_mod_config(self)
end
