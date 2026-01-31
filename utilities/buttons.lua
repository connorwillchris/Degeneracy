SMODS.draw_ignore_keys.deg_buttons = true

SMODS.DrawStep {
    key = 'deg_buttons',
    order = -30,
    func = function(self)
        if self.children.deg_button and self.highlighted then
            self.children.deg_button:draw()
        end
    end,
}

DEG.button_info = {}

function DEG.Button(joker_key, config)
    local name = joker_key .. "_button"

    DEG.button_info[joker_key] = {
        name = name,
        cost = config.cost or 0,
        text = config.text or "USE",
        can_click = config.can_click,
        click = config.click,
        ui_config = config.ui_config or {
            align = 'cl',
            offset = { x = 0.2, y = 0 },
        },
    }

    G.FUNCS[name .. "_can_click"] = function(e)
        local card = e.config and e.config.ref_table
        local btn = DEG.button_info[card.config.center.key]
        if btn and btn.can_click(e) then
            e.config.colour = G.C.RED
            e.config.button = name
        else
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
        end
    end

    G.FUNCS[name] = function(e)
        local card = e.config and e.config.ref_table
        local btn = DEG.button_info[card.config.center.key]
        if btn then btn.click(e) end
    end
end

local card_highlight_ref = Card.highlight
function Card:highlight(highlighted)
    card_highlight_ref(self, highlighted)

    if self.children.deg_button then
        self.children.deg_button:remove()
        self.children.deg_button = nil
    end

    if DEG.button_info[self.config.center.key] then
        -- Don't show buttons if in shop
        if G.shop_jokers and G.shop_jokers.cards then
            for i = 1, #G.shop_jokers.cards do
                if G.shop_jokers.cards[i] == self then
                    return
                end
            end
        end
        if highlighted then
            local btn = DEG.button_info[self.config.center.key]
            local has_cost = btn.cost and btn.cost > 0
            self.children.deg_button = UIBox {
                definition = {
                    n = G.UIT.C,
                    config = {
                        ref_table = self,
                        align = 'cm',
                        padding = 0.15,
                        r = 0.08,
                        hover = true,
                        shadow = true,
                        colour = G.C.MULT,
                        button = btn.name .. "_can_click",
                        func = btn.name .. "_can_click"
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "cm", maxw = 1.25 },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = btn.text,
                                        colour = G.C.UI.TEXT_LIGHT,
                                        scale = has_cost and 0.4 or 0.45,
                                        shadow = true
                                    }
                                },
                                {
                                    n = G.UIT.B,
                                    config = {
                                        w = 0.1,
                                        h = has_cost and 0.6 or 0.4
                                    }
                                }
                            },
                        },
                        has_cost and {
                            n = G.UIT.R,
                            config = { align = "cm", maxw = 1.25 },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = "$" .. btn.cost,
                                        colour = G.C.UI.TEXT_LIGHT,
                                        scale = has_cost and 0.4 or 0.45,
                                        shadow = true
                                    }
                                },
                            },

                        } or nil
                    }
                },
                config = {
                    align = btn.ui_config.align,
                    major = self,
                    parent = self,
                    offset = btn.ui_config.offset
                }
            }
        end
    end
end
