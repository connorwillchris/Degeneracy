SMODS.ConsumableType {
    key = "rankups",
    primary_colour = HEX('a389e8'),
    secondary_colour = HEX('5979cb'),
    collection_rows = { 7, 6 },
    shop_rate = 1,
    default = "c_deg_reality",
    loc_txt = {
        name = 'Rank ups',
        collection = 'Rank up Cards',
        undiscovered = {
            name = '???',
            text = { '??????' },
        },
    },
    text_colour = G.C.WHITE
}

SMODS.UndiscoveredSprite {
    key = "rankups",
    atlas = "consumables",
    pos = { x = 9, y = 2 },
}
--[[
SMODS.Consumable {
    in_pool = function(self,args)
        return false
    end,
    key = "a",
	set = "rankups",
    atlas = "consumables",
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 3,},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            local _rank = pseudorandom_element(SMODS.Ranks, "reality")
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    assert(SMODS.change_base(G.hand.highlighted[i], nil, _rank.key))
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}

SMODS.Consumable {
    in_pool = function(self,args)
        return false
    end,
    key = "b",
	set = "rankups",
    atlas = "consumables",
    pos = { x = 1, y = 0 },
    config = { max_highlighted = 3,},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}

SMODS.Consumable {
    in_pool = function(self,args)
        return false
    end,
    key = "c",
	set = "rankups",
    atlas = "consumables",
    pos = { x = 2, y = 0 },
    config = { max_highlighted = 3,},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}

SMODS.Consumable {
    in_pool = function(self,args)
        return false
    end,
    key = "d",
	set = "rankups",
    atlas = "consumables",
    pos = { x = 3, y = 0 },
    config = { max_highlighted = 3,},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}

SMODS.Consumable {
    in_pool = function(self,args)
        return false
    end,
    key = "e",
	set = "rankups",
    atlas = "consumables",
    pos = { x = 4, y = 0 },
    config = { max_highlighted = 3,},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}

SMODS.Consumable {
    in_pool = function(self,args)
        return false
    end,
    key = "f",
	set = "rankups",
    atlas = "consumables",
    pos = { x = 5, y = 0 },
    config = { max_highlighted = 3,},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}

SMODS.Consumable {
    in_pool = function(self,args)
        return false
    end,
    key = "g",
	set = "rankups",
    atlas = "consumables",
    pos = { x = 6, y = 0 },
    config = { max_highlighted = 3,},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}

SMODS.Consumable {
    in_pool = function(self,args)
        return false
    end,
    key = "h",
	set = "rankups",
    atlas = "consumables",
    pos = { x = 7, y = 0 },
    config = { max_highlighted = 3,},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}

SMODS.Consumable {
    in_pool = function(self,args)
        return false
    end,
    key = "i",
	set = "rankups",
    atlas = "consumables",
    pos = { x = 8, y = 0 },
    config = { max_highlighted = 3,},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}

SMODS.Consumable {
    in_pool = function(self,args)
        return false
    end,
    key = "j",
	set = "rankups",
    atlas = "consumables",
    pos = { x = 9, y = 0 },
    config = { max_highlighted = 3,},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}

SMODS.Consumable {
    in_pool = function(self,args)
        return false
    end,
    key = "k",
	set = "rankups",
    atlas = "consumables",
    pos = { x = 0, y = 1 },
    config = { max_highlighted = 3,},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end
}
--]]