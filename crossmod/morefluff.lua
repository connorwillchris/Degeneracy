SMODS.Atlas({
    key = "deg_colours",
    path = "colours.png",
    px = 71,
    py = 95
})

FLUFF.Colour {
    key = "poker_green",
    name = "Poker Green",
    atlas = "deg_colours",
    pos = { x = 0, y = 0 },
    config = {
        upgrade_rounds = 7,
    },
    can_use = function(self, card)
        return true
    end,
    colour_effect = function(self, card, area)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                SMODS.calculate_context({ playing_card_added = true, cards = SMODS.add_card { set = "Base", rank = 'deg_21' } })
                return true
            end
        }))
    end
}
