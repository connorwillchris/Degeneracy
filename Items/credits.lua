SMODS.current_mod.credits_tab = function()
    local loc_nodes = {}

    localize {
        type = 'descriptions',
        set = "Other",
        key = "deg_credits",
        nodes = loc_nodes,
        vars = {}
    }

    return {
        n = G.UIT.ROOT,
        config = {
            emboss = 0.05,
            r = 0.1,
            align = "tm",
            padding = 0.2,
            colour = G.C.BLACK
        },
        nodes =  {
            {
                n = G.UIT.R,
                config = {
                    align = "tm", padding = 0,
                    minw = 8,
                    minh = 5
                },
                nodes = {
                    desc_from_rows(loc_nodes, true, 7)
                }
            }
        }
    }
end
