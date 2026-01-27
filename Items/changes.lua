-- Joker changes
SMODS.Joker:take_ownership('fibonacci', {
    config = { extra = { mult = 8 } },
    loc_vars = function(self, info_queue, card)
        return {
            key = 'j_deg_fibonacci',
            vars = { card.ability.extra.mult }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if
                context.other_card.base.value == "deg_1" or
                context.other_card:get_id() == 2 or
                context.other_card:get_id() == 3 or
                context.other_card:get_id() == 5 or
                context.other_card:get_id() == 8 or
                context.other_card:get_id() == 14 or
                context.other_card.base.value == "deg_13" or
                context.other_card.base.value == "deg_21" then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
})

DEGENERACY.faces = {
    Jack = true,
    Queen = true,
    King = true,
    ["deg_-Jack"] = true,
    ["deg_-Queen"] = true,
    ["deg_-King"] = true
}

function DEGENERACY.rank_check(card, mod, remainder)
    -- Returns false if card doesn't show rank (e.g. Stone Card)
    if SMODS.has_no_rank(card) then
        return false
    end

    -- Returns false if rank is a face card in DEGENERACY.faces
    if DEGENERACY.faces[card.base.value] then
        return false
    end

    return (card.base.nominal % mod == remainder)
end

SMODS.Joker:take_ownership('odd_todd', {
    config = { extra = { chips = 31 } },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.chips }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if DEGENERACY.rank_check(context.other_card, 2, 1) or context.other_card.base.value == "deg_0.5" or context.other_card.base.value == "deg_pi" then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}, true)

SMODS.Joker:take_ownership('even_steven', {
    config = { extra = { mult = 4 } },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.mult }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if DEGENERACY.rank_check(context.other_card, 2, 0) or context.other_card.base.value == "deg_0.5" or context.other_card.base.value == "deg_pi" then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}, true)
