local cards = {}
local suit_table = {
    "C", "H", "S", "D"
}
local table_generator = function()
    local returntable = {}
    for i = 2, 10 do
        table.insert(returntable, tostring(i))
    end
    returntable[11] = "J"
    returntable[12] = "Q"
    returntable[13] = "K"
    returntable[14] = "A"
    return returntable
end
for k, v in pairs(table_generator()) do
    for kk, vv in pairs(suit_table) do
        table.insert(cards, { s = vv, r = ((vv == "H" or vv == "D") and "deg_-" or "") .. (v ~= "10" and v or "T") })
    end
end

SMODS.Challenge {
    key = "inversion",
    deck = {
        type = 'Challenge Deck',
        cards = cards
    },
    rules = {
        custom = {
            { id = "inversion" },
            { id = "inversion_info" },
        },
    },
}

SMODS.Challenge {
    key = "throwthekey",
    deck = {
        type = 'Challenge Deck',
    },
    rules = {
        custom = {
            { id = "throwthekey" },
            { id = "throwthekey_info" },
        },
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = 1, #G.playing_cards do
                    if SMODS.pseudorandom_probability(self, 'deg_seed', 1, 4, 'brass') then
                        SMODS.Stickers["deg_locked"]:apply(G.playing_cards[i], true)
                    end
                end
                return true
            end
        }))
    end
}
