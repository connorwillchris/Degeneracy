local function get_negative_ranks()
    local negative = {}
    local key = {}
    for _, rank_key in ipairs(SMODS.Rank.obj_buffer) do
        local rank = SMODS.Ranks[rank_key]
        if rank_key:sub(1, 5) == "deg_-" then
            table.insert(negative, rank)
            table.insert(key, rank_key)
        end
    end
    return negative, key
end

SMODS.Joker {
    key = "untitled",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    rarity = 2,
    cost = 7,
    atlas = 'deg_jokers',
    pos = { x = 0, y = 2 },

    config = {
        extra = {
        }
    },
    add_to_deck = function(self, card, from_debuff)
        local negative = get_negative_ranks()
        for k, v in ipairs(negative) do
            G.GAME.deg.og_negative_vals[v.key] = v.nominal
            v.nominal = 0
        end
        -- when G.GAME.deg_t2 is true it adds the mult stuff on the card
        G.GAME.deg_t2 = true
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.deg_t2 = false
        local negative = get_negative_ranks()

        for k, v in ipairs(negative) do
            if G.GAME.deg.og_negative_vals[v.key] then
                v.nominal = G.GAME.deg.og_negative_vals[v.key]
            end
        end
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local _, rank_key = get_negative_ranks()

            for _, v in ipairs(rank_key) do
                if context.other_card.config.card.value == v then
                    return {
                        mult = -G.GAME.deg.og_negative_vals[v] -- give mult equivalent to it's chip value
                    }
                end
            end
        end
    end
}
