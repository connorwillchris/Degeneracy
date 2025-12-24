SMODS.Atlas({
    key = "deg_stickers",
    path = "Stickers.png",
    px = 71,
    py = 95,
})

local function haslocksticker()
    if G and G.hand and G.hand.highlighted and next(G.hand.highlighted) then
        for k, v in pairs(G.hand.highlighted) do
            if v.ability['deg_locked'] then return true end
        end
    end
    return false
end

local cdref = G.FUNCS.can_discard

function G.FUNCS.can_discard(e)
    cdref(e)
    if haslocksticker() then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

SMODS.Sticker {
    key = "locked",
    badge_colour = HEX 'f6c46a',
    atlas = "deg_stickers",
    pos = { x = 0, y = 0 },
    sets =  { ["Default"] = true, ["Enhanced"] = true, ["Base"] = true },
    needs_enable_flag = true,

    --[[apply = function (self, card, val)
        if val then
            card.ability['deg_locked'] = true
            card.ability['deg_unlocked'] = false
        else
            card.ability['deg_locked'] = false
            card.ability['deg_unlocked'] = true
        end
    end]]
    
}
