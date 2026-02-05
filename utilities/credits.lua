DEG.Credits_Joker = SMODS.Joker:extend({
    required_params = {
        "key",
    },

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    atlas = 'deg_jokers', -- set atlas here
    pos = { x = 0, y = 0 },
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    no_collection = true,
    no_mod_badges = true,

    config = {},
    in_pool = function(self)
        return false
    end,
    set_card_type_badge = function(self, card, badges)
        if self.programmer then
            badges[#badges + 1] = create_badge(localize('k_programmer_badge'), G.C.BLUE, G.C.WHITE, 1.2)
        elseif self.artist then
            badges[#badges + 1] = create_badge(localize('k_artist_badge'), G.C.PURPLE, G.C.WHITE, 1.2)
        elseif self.ideas then
            badges[#badges + 1] = create_badge("Ideas", G.C.GREEN, G.C.WHITE, 1.2)
        end
    end,
})

-- New Thing! can now just say programmer = true, artist = true, ideas = true etc. to add badge
DEG.Credits_Joker {
    key = "cloudzXIII",
    pos = { x = 0, y = 0 },
    programmer = true,
}
DEG.Credits_Joker {
    key = "Gud",
    pos = { x = 0, y = 0 },
    artist = true
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
        { ppl = { "j_joker", "j_deg_cloudzXIII", "j_deg_Gud", "j_joker", "j_joker" } },
        -- (If you want another row uncomment below)
        --{ ppl = { "j_joker", "j_deg_Gud", "j_joker" } },
        { ppl = { "j_joker", "j_joker", "j_joker", "j_joker", "j_joker", "j_joker" } }
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
