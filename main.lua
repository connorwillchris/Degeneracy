DEGENERACY = { vars = {}, funcs = { deg_alias_type = type }, content = SMODS.current_mod }
DEG = {}


-- tailsman thingy
to_big = to_big or function(x) return x end
to_number = to_number or function(x) return x end

-- Load Utilities
for _, filename in pairs(NFS.getDirectoryItems(SMODS.current_mod.path .. "utilities")) do
    assert(SMODS.load_file("utilities/" .. filename))()
end

assert(SMODS.load_file("config.lua"))()
assert(SMODS.load_file("Items/challenges.lua"))()
assert(SMODS.load_file("Items/ranks.lua"))()
assert(SMODS.load_file("Items/stakes.lua"))()
assert(SMODS.load_file("Items/stickers.lua"))()
assert(SMODS.load_file("Items/decks.lua"))()
assert(SMODS.load_file("Items/blinds.lua"))()

for _, filename in pairs(NFS.getDirectoryItems(SMODS.current_mod.path .. "Items/jokers")) do
    assert(SMODS.load_file("Items/jokers/" .. filename))()
end



function DEGENERACY.content.save_config(self)
    SMODS.save_mod_config(self)
end

if next(SMODS.find_mod("MoreFluff")) then
    assert(SMODS.load_file("crossmod/morefluff.lua"))()
end

if next(SMODS.find_mod("CardSleeves")) then
    assert(SMODS.load_file("crossmod/sleeves.lua"))()
end
