SMODS.Atlas {
	key = "cards_lc",
	path = "ranks_lc.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "cards_hc",
	path = "ranks_hc.png",
	px = 71,
	py = 95
}

local ref = next
next = function(a, ...)
    if type(a) ~= "table" then
        return nil
    else
        return ref(a, ...)
    end
end

SMODS.Rank {
    in_pool = function() return false end,
    key = '-2',
    shorthand = '-2',
    card_key = '-2',
    pos = { x = 0 },
    nominal = -2,
    suit_map = {
        Hearts = 0,
        Clubs = 1,
        Diamonds = 2,
        Spades = 3,
        bunc_Fleurons = 4,
        bunc_Halberds = 5,
        paperback_Stars = 6,
        paperback_Crowns = 7,
    },
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'deg_0' },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
}

for _, v in ipairs({ -3, -4, -5, -6, -7, -8, -9}) do
    SMODS.Rank {
        in_pool = function(self, args)
            return not args.initial_deck
        end,
        key = v .. "",
        shorthand = v .. "",
        card_key = v .. "",
        pos = { x = ( v * -1 ) - 2 },
        nominal = v,
        suit_map = {
            Hearts = 0,
            Clubs = 1,
            Diamonds = 2,
            Spades = 3,
            bunc_Fleurons = 4,
            bunc_Halberds = 5,
            paperback_Stars = 6,
            paperback_Crowns = 7,
        },
        strength_effect = {
            fixed = 1,
            random = false,
            ignore = false
        },
        next = { "deg_" .. (v + 1) },
        lc_atlas = "cards_lc",
        hc_atlas = "cards_hc",
    }
end 

SMODS.Rank {
    in_pool = function() return false end,
    key = '-10',
    shorthand = '-10',
    card_key = '-T',
    pos = { x = 8 },
    nominal = -10,
    suit_map = {
        Hearts = 0,
        Clubs = 1,
        Diamonds = 2,
        Spades = 3,
        bunc_Fleurons = 4,
        bunc_Halberds = 5,
        paperback_Stars = 6,
        paperback_Crowns = 7,
    },
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'deg_-9' },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
}

SMODS.Rank {
    in_pool = function() return false end,
    key = '-Jack',
    card_key = '-J',
    pos = { x = 9 },
    nominal = -10,
    suit_map = {
        Hearts = 0,
        Clubs = 1,
        Diamonds = 2,
        Spades = 3,
        bunc_Fleurons = 4,
        bunc_Halberds = 5,
        paperback_Stars = 6,
        paperback_Crowns = 7,
    },
    face_nominal = 0.1,
    face = true,
    shorthand = '-J',
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'deg_-10' },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
}

SMODS.Rank {
    in_pool = function() return false end,
    key = '-Queen', 
    card_key = '-Q',
    pos = { x = 10 },
    nominal = -10,
    suit_map = {
        Hearts = 0,
        Clubs = 1,
        Diamonds = 2,
        Spades = 3,
        bunc_Fleurons = 4,
        bunc_Halberds = 5,
        paperback_Stars = 6,
        paperback_Crowns = 7,
    },
    face_nominal = 0.2,
    face = true,
    shorthand = '-Q',
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'deg_-Jack' },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
}

SMODS.Rank {
    in_pool = function() return false end,
    key = '-King',
    card_key = '-K',
    pos = { x = 11 },
    nominal = -10,
    suit_map = {
        Hearts = 0,
        Clubs = 1,
        Diamonds = 2,
        Spades = 3,
        bunc_Fleurons = 4,
        bunc_Halberds = 5,
        paperback_Stars = 6,
        paperback_Crowns = 7,
    },
    face_nominal = 0.3,
    face = true,
    shorthand = '-K',
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'deg_-Queen' },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
}

SMODS.Rank {
    in_pool = function() return false end,
    key = '-Ace',
    card_key = '-A',
    pos = { x = 12 },
    nominal = -11,
    suit_map = {
        Hearts = 0,
        Clubs = 1,
        Diamonds = 2,
        Spades = 3,
        bunc_Fleurons = 4,
        bunc_Halberds = 5,
        paperback_Stars = 6,
        paperback_Crowns = 7,
    },
    face_nominal = 0.4,
    shorthand = '-A',
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'deg_-King' },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
}

SMODS.Rank {
    in_pool = function() return false end,
    key = '0',
    card_key = '0',
    pos = { x = 13 },
    nominal = 0,
    suit_map = {
        Hearts = 0,
        Clubs = 1,
        Diamonds = 2,
        Spades = 3,
        bunc_Fleurons = 4,
        bunc_Halberds = 5,
        paperback_Stars = 6,
        paperback_Crowns = 7,
    },
    face_nominal = 0,
    shorthand = '0',
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { "Ace" },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
}

SMODS.Rank {
    in_pool = function() return false end,
    key = '0.5',
    card_key = '0.5',
    pos = { x = 14 },
    nominal = 0.5,
    suit_map = {
        Hearts = 0,
        Clubs = 1,
        Diamonds = 2,
        Spades = 3, 
        bunc_Fleurons = 4,
        bunc_Halberds = 5,
        paperback_Stars = 6,
        paperback_Crowns = 7,
    },
    face_nominal = 0,
    shorthand = '0.5',
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { "Ace" },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
}

SMODS.Rank {
    in_pool = function() return false end,
    key = 'pi',
    card_key = 'pi',
    pos = { x = 15 },
    nominal = 3.141,
    suit_map = {
        Hearts = 0,
        Clubs = 1,
        Diamonds = 2,
        Spades = 3,
        bunc_Fleurons = 4,
        bunc_Halberds = 5,
        paperback_Stars = 6,
        paperback_Crowns = 7,
    },
    face_nominal = 0,
    shorthand = 'Pi',
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { "4" },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
}

SMODS.Rank {
    in_pool = function() return false end,
    key = '21',
    card_key = '21',
    pos = { x = 16 },
    nominal = 21,
    suit_map = {
        Hearts = 0,
        Clubs = 1,
        Diamonds = 2,
        Spades = 3,
        bunc_Fleurons = 4,
        bunc_Halberds = 5,
        paperback_Stars = 6,
        paperback_Crowns = 7,
    },
    face_nominal = 0,
    shorthand = '21',
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { "21" },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
}