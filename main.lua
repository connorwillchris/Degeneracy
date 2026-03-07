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

SMODS.current_mod.calculate = function(self, context)
    -- Achievment
    if context.after and not context.blueprint and context.main_eval then
        local hand_score = hand_chips * mult
        local required_score = G.GAME.blind.chips


        if hand_score <= -required_score then
            unlock_achievement("ach_deg_you_win")

            G.ARGS.score_intensity.earned_score = 10000
            G.ARGS.score_intensity.required_score = 10000
        end
    end
    -- Tangelo Token
    if context.end_of_round and context.main_eval and not context.blueprint then
        for k, v in pairs(G.playing_cards) do
            if v.ability and v.ability.temp_deg_locked then
                v.ability.temp_deg_locked = nil
                SMODS.Stickers["deg_locked"]:apply(v, false)
            end
        end
    end
end
