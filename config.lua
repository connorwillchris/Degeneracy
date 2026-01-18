function DEGENERACY.content.config_tab()
    return {n = G.UIT.ROOT, config = {r = 0.1, minw = 4, align = "tm", padding = 0.2, colour = G.C.BLACK}, nodes = {
        {n = G.UIT.C, config = {r = 0.1, minw = 4, align = "tl", padding = 0.2, colour = G.C.BLACK}, nodes =
            {
                {
                    n = G.UIT.R,
                    config = {
                        align = "cm",
                        r = 0.1,
                        emboss = 0.1,
                        outline = 1,
                        padding = 0.14
                    },
                    nodes = {
                        create_toggle({
                            label = G.localization.misc.dictionary.deg_content_edits,
                            info = {
                                G.localization.misc.dictionary.deg_content_edits_desc,
                            },
                            ref_table = DEGENERACY.content.config,
                            ref_value = 'content_edits',
                            callback = function() DEGENERACY.content:save_config()
                        end})
                    }
                },
            }
        },
    }}
end

if DEGENERACY.content.config.content_edits == true then
    DEGENERACY.content.config.content_edits = true

    assert(SMODS.load_file("Items/changes.lua"))()
end

return {
    content_edits = true,
}

