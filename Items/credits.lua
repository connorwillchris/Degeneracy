DEG.Credits_Joker = SMODS.Joker:extend({
    required_params = {
        "key",
    },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    set_card_type_badge = function(self, card, badges)
    end,

    atlas = 'deg_jokers',
    pos = { x = 0, y = 0 },
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    no_collection = true,

    config = {},
    in_pool = function(self)
        return false
    end,
})

DEG.Credits_Joker {
    key = "cloudzXIII",
    atlas = 'deg_jokers',
    pos = { x = 0, y = 0 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_programmer_badge'), G.C.BLUE, G.C.WHITE, 1.2)
    end,
}
DEG.Credits_Joker {
    key = "Gud",
    atlas = 'deg_jokers',
    pos = { x = 0, y = 0 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_artist_badge'), G.C.RARITY.LEGENDARY, G.C.WHITE, 1.2)
    end,
}

SMODS.current_mod.credits_tab = function()
    local loc_nodes = {}

    localize {
        type = "descriptions",
        set = "Other",
        key = "deg_credits",
        nodes = loc_nodes,
        vars = {}
    }

    G.deg_credits_area = CardArea(
        G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
        4.25 * G.CARD_W,
        0.95 * G.CARD_H,
        { card_limit = 5, type = 'title', highlight_limit = 0, collection = true }
    )

    -- add joker keys to credits_ppl to add more people
    local credits_ppl = { "j_deg_Gud", "j_deg_cloudzXIII" }
    for i, key in ipairs(credits_ppl) do
        local card = Card(
            G.deg_credits_area.T.x + G.deg_credits_area.T.w / 2, G.deg_credits_area.T.y,
            G.CARD_W, G.CARD_H, G.P_CARDS.empty,
            G.P_CENTERS[key])

        G.deg_credits_area:emplace(card)
        card:juice_up()
    end

    return {
        n = G.UIT.ROOT,
        config = {
            emboss = 0.05,
            r = 0.1,
            align = "tm",
            padding = 0.2,
            colour = G.C.BLACK
        },
        nodes = {
            --#region Bit with the localized text, can remove/change if unneccessary
            {
                n = G.UIT.R,
                config = {
                    align = "tm",
                    padding = 0,
                    minw = 8,
                    minh = 3
                },
                nodes = {
                    desc_from_rows(loc_nodes, true, 7)
                }
            },
            --#endregion
            {
                n = G.UIT.R,
                config = { align = "cm", padding = 0.07, no_fill = true },
                nodes = {
                    { n = G.UIT.O, config = { object = G.deg_credits_area } }
                }
            }
        }
    }
end
