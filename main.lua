DEGENERACY = { vars = {}, funcs = { deg_alias_type = type }, content = SMODS.current_mod }
DEG = {}

-- tailsman thingy
to_big = to_big or function(x) return x end
to_number = to_number or function(x) return x end

-- Load Utilities
for _, filename in pairs(NFS.getDirectoryItems(SMODS.current_mod.path .. "utilities")) do
    assert(SMODS.load_file("utilities/" .. filename))()
end

-- Load Jokers
for _, filename in pairs(NFS.getDirectoryItems(SMODS.current_mod.path .. "content/cards")) do
    assert(SMODS.load_file("content/cards/" .. filename))()
end

-- Load Misc
for _, filename in pairs(NFS.getDirectoryItems(SMODS.current_mod.path .. "content/misc")) do
    assert(SMODS.load_file("content/misc/" .. filename))()
end

function DEGENERACY.content.save_config(self)
    SMODS.save_mod_config(self)
end

if next(SMODS.find_mod("MoreFluff")) then
    assert(SMODS.load_file("content/crossmod/morefluff.lua"))()
end

if next(SMODS.find_mod("CardSleeves")) then
    assert(SMODS.load_file("content/crossmod/sleeves.lua"))()
end

SMODS.current_mod.calculate = function(self, context)
    -- Achievment
    if context.after and not context.blueprint and context.main_eval then
        local hand_score = hand_chips * mult
        local required_score = G.GAME.blind.chips


        if hand_score <= -required_score then
        check_for_unlock({ type = 'you_win' })

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

-- IDEAS (prolly outdated but putting them here rather than in seperate files)
--[[
-- Hand where played cards have the rank add up to 0?

SMODS.ConsumableType({
    key = "uniquechips",
    primary_colour = HEX("60b2be"),
    secondary_colour = HEX("60b2be"),
    collection_rows = { 5, 5 },
    shop_rate = 0,
    default = "c_fool"
})

-- This is for version 0.2
-- They will act as vouchers as long as you have them in your consumable slots

--]]