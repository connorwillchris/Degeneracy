SMODS.current_mod.description_loc_vars = function()
    return { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.2, shadow = true }
end

SMODS.current_mod.custom_ui = function(modNodes)
    G.deg_desc_area = CardArea(
        G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
        4.25 * G.CARD_W,
        0.95 * G.CARD_H,
        { card_limit = 5, type = 'title', highlight_limit = 0, collection = true }
    )
    local function card_to_desc(cards, center)
        center = center or G.P_CENTERS.c_base

        for _, key in ipairs(cards) do
            local card = Card(
                G.deg_desc_area.T.x + G.deg_desc_area.T.w / 2,
                G.deg_desc_area.T.y,
                G.CARD_W,
                G.CARD_H,
                center and G.P_CARDS.empty or G.P_CARDS[key],
                center
            )
            G.deg_desc_area:emplace(card)
            card:juice_up()
        end
    end

    card_to_desc({ "j_deg_break_limits" }, G.P_CENTERS.j_deg_break_limits)
    card_to_desc({ "D_deg_0.5", "C_deg_pi", "H_deg_21" })
    card_to_desc({ "j_deg_memory_card" }, G.P_CENTERS.j_deg_memory_card)

    -- Cards
    modNodes[#modNodes + 1] = {
        n = G.UIT.R,
        config = { align = "cm", padding = 0.07, no_fill = true },
        nodes = {
            { n = G.UIT.O, config = { object = G.deg_desc_area } }
        }
    }
    -- Wiki Link
    modNodes[#modNodes + 1] = {
        n = G.UIT.R,
        config = { align = "bm", padding = 0.05 },
        nodes = {
            {
                n = G.UIT.C,
                config = { align = "cm", padding = 0.05 },
                nodes = {
                    UIBox_button({
                        colour = G.C.RED,
                        button = "deg_wiki_page",
                        label = { localize("b_deg_wiki_page") },
                        minw = 4.75,
                    }),
                },
            },
        },
    }
end

function G.FUNCS.deg_wiki_page(e)
    love.system.openURL("https://balatromods.miraheze.org/wiki/Degeneracy")
end
