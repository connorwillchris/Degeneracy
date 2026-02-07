DEGENERACY = { vars = {}, funcs = { deg_alias_type = type }, content = SMODS.current_mod }
DEG = {}

SMODS.Atlas({
    key = "deg_jokers",
    path = "jokers.png",
    px = 71,
    py = 95,
})

-- Load Utilities
for _, filename in pairs(NFS.getDirectoryItems(SMODS.current_mod.path .. "utilities")) do
    assert(SMODS.load_file("utilities/" .. filename))()
end

--assert(SMODS.load_file("Items/advantage.lua"))()
assert(SMODS.load_file("config.lua"))()
assert(SMODS.load_file("Items/challenges.lua"))()
--assert(SMODS.load_file("Items/chips.lua"))()
assert(SMODS.load_file("Items/ranks.lua"))()
assert(SMODS.load_file("Items/stakes.lua"))()
assert(SMODS.load_file("Items/stickers.lua"))()
assert(SMODS.load_file("Items/decks.lua"))()

for _, filename in pairs(NFS.getDirectoryItems(SMODS.current_mod.path .. "Items/jokers")) do
    assert(SMODS.load_file("Items/jokers/" .. filename))()
end

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

if next(SMODS.find_mod("MoreFluff")) then
    assert(SMODS.load_file("crossmod/morefluff.lua"))()
end
