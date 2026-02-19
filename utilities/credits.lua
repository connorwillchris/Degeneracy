local lcp_ref = Card.click
function Card:click()
    local ret = lcp_ref(self)
    if self.config.center.credits_joker then
        if self.config.center.link then
            love.system.openURL(self.config.center.link)
        end
    end
    return ret
end

DEG.Credits_Joker = SMODS.Joker:extend({
    required_params = {
        "key",
    },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    atlas = 'credits',

    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    no_collection = true,
    no_mod_badges = true,
    credits_joker = true,
    config = {},
    in_pool = function(self)
        return false
    end,
})


DEG.Credits_Joker {
    key = "gud",
    atlas = 'credits',
    pos = { x = 0, y = 0 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_artist_badge'), G.C.PURPLE, G.C.WHITE, 1.2)
    end,
}
DEG.Credits_Joker {
    key = "astro",
    atlas = 'credits',
    pos = { x = 1, y = 0 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_ideas_badge'), G.C.BLUE, G.C.WHITE, 1.2)
    end,
}
DEG.Credits_Joker {
    key = "cloudzXIII",
    atlas = 'credits',
    pos = { x = 2, y = 0 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_leadprogrammer_badge'), G.C.EDITION, G.C.UI.TEXT_DARK, 1.2)
    end,
}
DEG.Credits_Joker {
    key = "nrio",
    atlas = 'credits',
    pos = { x = 3, y = 0 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_ideas_badge'), G.C.GREEEN, G.C.WHITE, 1.2)
    end,
}
DEG.Credits_Joker {
    key = "candy",
    atlas = 'credits',
    pos = { x = 4, y = 0 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_ideas_badge'), G.C.BLUE, G.C.WHITE, 1.2)
    end,
}
DEG.Credits_Joker {
    key = "cg",
    atlas = 'credits',
    pos = { x = 0, y = 1 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_programmer_badge'), G.C.BLUE, G.C.WHITE, 1.2)
    end,
}
DEG.Credits_Joker {
    key = "tech",
    atlas = 'credits',
    pos = { x = 1, y = 1 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_ideas_badge'), G.C.BLUE, G.C.WHITE, 1.2)
    end,
}
DEG.Credits_Joker {
    key = "treeman",
    atlas = 'credits',
    pos = { x = 2, y = 1 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_programmer_badge'), G.C.BLUE, G.C.WHITE, 1.2)
    end,
}
DEG.Credits_Joker {
    key = "jamirror",
    atlas = 'credits',
    pos = { x = 3, y = 1 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_programmer_badge'), G.C.BLUE, G.C.WHITE, 1.2)
    end,
}
DEG.Credits_Joker {
    key = "ali",
    atlas = 'credits',
    pos = { x = 4, y = 1 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_programmer_badge'), G.C.FILTER, G.C.WHITE, 1.2)
    end,
}
DEG.Credits_Joker {
    key = "silver",
    atlas = 'credits',
    pos = { x = 0, y = 2 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_programmer_badge'), SMODS.Gradients.deg_pride, G.C.WHITE, 1.2)
    end,
}
DEG.Credits_Joker {
    key = "tatsu",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_deg_joker6
    end,
    atlas = 'credits',
    pos = { x = 1, y = 2 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_ideas_badge'), HEX('b80b3c'), G.C.WHITE, 1.2)
    end,
}

SMODS.current_mod.credits_tab = function()
    local create_credits_row = function(cards)
        local area = CardArea(
            G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
            4.25 * G.CARD_W,
            0.95 * G.CARD_H,
            { card_limit = #cards, type = 'title', highlight_limit = 0, collection = true }
        )

        for _, key in ipairs(cards) do
            local card = Card(
                area.T.x + area.T.w / 2,
                area.T.y,
                G.CARD_W,
                G.CARD_H,
                G.P_CARDS.empty,
                G.P_CENTERS[key]
            )
            area:emplace(card)
            card:juice_up(0.3)
        end

        return area
    end

    local credits_ppl = {
        { ppl = { "j_deg_gud", "j_deg_astro", "j_deg_cloudzXIII", "j_deg_nrio", "j_deg_candy", } },
        { ppl = { "j_deg_cg", "j_deg_tech", "j_deg_treeman", "j_deg_jamirror", "j_deg_ali", } },
        { ppl = { "j_deg_silver", "j_deg_tatsu", } }
    }

    --#region Bit with the localised text, can remove/change if unneccessary
    local loc_nodes = {}
    localize {
        type = "descriptions",
        set = "Other",
        key = "deg_credits",
        nodes = loc_nodes,
        vars = {}
    }
    local row_nodes = {
        -- commented localised text for now
        --[[{
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
        }--]]
    }
    --#endregion

    -- Insert ppl into row_nodes
    for _, row in ipairs(credits_ppl) do
        local area = create_credits_row(row.ppl)

        row_nodes[#row_nodes + 1] = {
            n = G.UIT.R,
            config = { align = "cm", padding = 0.07, no_fill = true },
            nodes = {
                { n = G.UIT.O, config = { object = area } }
            }
        }
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
        nodes = row_nodes
    }
end
