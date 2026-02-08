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

SMODS.Atlas {
    key = "deg_pure_ranks",
    path = "pure_ranks.png",
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
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then -- i assume you don't want these to appear in the normal deck
            -- the reason for "args.suit == ''" is because the ui that displays these ranks checks if they can appear by calling the in_pool function with an empty string (or if you have any of that rank)
            return false
        else
            return true -- assuming you want this ranks to always be able to appear in standards and such
        end
    end,
    key = '-1',
    shorthand = '-1',
    card_key = '-1',
    pos = { x = 0 },
    nominal = -1,
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
    akyrs_pure_rank_atlas = {
        atlas_key = 'deg_pure_ranks',
        pos = { x = 0, y = 0 }
    }
}

for _, v in ipairs({ -2 -3, -4, -5, -6, -7, -8, -9 }) do
    SMODS.Rank {
        in_pool = function(self, args)
            if args and ((args.suit == '') or (args.initial_deck)) then -- i assume you don't want these to appear in the normal deck
                -- the reason for "args.suit == ''" is because the ui that displays these ranks checks if they can appear by calling the in_pool function with an empty string (or if you have any of that rank)
                return false
            else
                return true -- assuming you want this ranks to always be able to appear in standards and such
            end
        end,
        key = v .. "",
        shorthand = v .. "",
        card_key = v .. "",
        pos = { x = (v * -1) - 1 },
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
        akyrs_pure_rank_atlas = {
            atlas_key = 'deg_pure_ranks',
            pos = { x = (v * -1) - 1, y = 0 }
        }
    }
end

SMODS.Rank {
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then -- i assume you don't want these to appear in the normal deck
            -- the reason for "args.suit == ''" is because the ui that displays these ranks checks if they can appear by calling the in_pool function with an empty string (or if you have any of that rank)
            return false
        else
            return true -- assuming you want this ranks to always be able to appear in standards and such
        end
    end,
    key = '-10',
    shorthand = '-10',
    card_key = '-T',
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
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'deg_-9' },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
    akyrs_pure_rank_atlas = {
        atlas_key = 'deg_pure_ranks',
        pos = { x = 8, y = 0 }
    }
}

SMODS.Rank {
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then -- i assume you don't want these to appear in the normal deck
            -- the reason for "args.suit == ''" is because the ui that displays these ranks checks if they can appear by calling the in_pool function with an empty string (or if you have any of that rank)
            return false
        else
            return true -- assuming you want this ranks to always be able to appear in standards and such
        end
    end,
    key = '-Jack',
    card_key = '-J',
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
    akyrs_pure_rank_atlas = {
        atlas_key = 'deg_pure_ranks',
        pos = { x = 9, y = 0 }
    }
}

SMODS.Rank {
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then -- i assume you don't want these to appear in the normal deck
            -- the reason for "args.suit == ''" is because the ui that displays these ranks checks if they can appear by calling the in_pool function with an empty string (or if you have any of that rank)
            return false
        else
            return true -- assuming you want this ranks to always be able to appear in standards and such
        end
    end,
    key = '-Queen',
    card_key = '-Q',
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
    akyrs_pure_rank_atlas = {
        atlas_key = 'deg_pure_ranks',
        pos = { x = 10, y = 0 }
    }
}

SMODS.Rank {
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then -- i assume you don't want these to appear in the normal deck
            -- the reason for "args.suit == ''" is because the ui that displays these ranks checks if they can appear by calling the in_pool function with an empty string (or if you have any of that rank)
            return false
        else
            return true -- assuming you want this ranks to always be able to appear in standards and such
        end
    end,
    key = '-King',
    card_key = '-K',
    pos = { x = 12 },
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
    akyrs_pure_rank_atlas = {
        atlas_key = 'deg_pure_ranks',
        pos = { x = 0, y = 1 }
    }
}

SMODS.Rank {
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then -- i assume you don't want these to appear in the normal deck
            -- the reason for "args.suit == ''" is because the ui that displays these ranks checks if they can appear by calling the in_pool function with an empty string (or if you have any of that rank)
            return false
        else
            return true -- assuming you want this ranks to always be able to appear in standards and such
        end
    end,
    key = '-Ace',
    card_key = '-A',
    pos = { x = 13 },
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
    akyrs_pure_rank_atlas = {
        atlas_key = 'deg_pure_ranks',
        pos = { x = 1, y = 1 }
    }
}


SMODS.Rank {
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then -- i assume you don't want these to appear in the normal deck
            -- the reason for "args.suit == ''" is because the ui that displays these ranks checks if they can appear by calling the in_pool function with an empty string (or if you have any of that rank)
            return false
        else
            return true -- assuming you want this ranks to always be able to appear in standards and such
        end
    end,
    key = '-11',
    card_key = '-11',
    pos = { x = 14 },
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
    shorthand = '-11',
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'deg_-Ace' },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
    akyrs_pure_rank_atlas = {
        atlas_key = 'deg_pure_ranks',
        pos = { x = 2, y = 1 }
    }
}

SMODS.Rank {
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then -- i assume you don't want these to appear in the normal deck
            -- the reason for "args.suit == ''" is because the ui that displays these ranks checks if they can appear by calling the in_pool function with an empty string (or if you have any of that rank)
            return false
        else
            return true -- assuming you want this ranks to always be able to appear in standards and such
        end
    end,
    key = '0',
    card_key = '0',
    pos = { x = 15 },
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
    next = { "deg_1" },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
}

SMODS.Rank {
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then -- i assume you don't want these to appear in the normal deck
            -- the reason for "args.suit == ''" is because the ui that displays these ranks checks if they can appear by calling the in_pool function with an empty string (or if you have any of that rank)
            return false
        else
            return true -- assuming you want this ranks to always be able to appear in standards and such
        end
    end,
    key = '0.5',
    card_key = '0.5',
    pos = { x = 16 },
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
    next = { "deg_1" },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
}

SMODS.Rank {
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then -- i assume you don't want these to appear in the normal deck
            -- the reason for "args.suit == ''" is because the ui that displays these ranks checks if they can appear by calling the in_pool function with an empty string (or if you have any of that rank)
            return false
        else
            return true -- assuming you want this ranks to always be able to appear in standards and such
        end
    end,
    key = '1',
    card_key = '1',
    pos = { x = 17 },
    nominal = 1,
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
    shorthand = '1',
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { "2" },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
}

SMODS.Rank {
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then -- i assume you don't want these to appear in the normal deck
            -- the reason for "args.suit == ''" is because the ui that displays these ranks checks if they can appear by calling the in_pool function with an empty string (or if you have any of that rank)
            return false
        else
            return true -- assuming you want this ranks to always be able to appear in standards and such
        end
    end,
    key = 'pi',
    card_key = 'pi',
    pos = { x = 18 },
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
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then -- i assume you don't want these to appear in the normal deck
            -- the reason for "args.suit == ''" is because the ui that displays these ranks checks if they can appear by calling the in_pool function with an empty string (or if you have any of that rank)
            return false
        else
            return true -- assuming you want this ranks to always be able to appear in standards and such
        end
    end,
    key = '11',
    card_key = '11',
    pos = { x = 19 },
    nominal = 11,
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
    shorthand = '11',
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { "deg_12" },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
}

SMODS.Rank {
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then -- i assume you don't want these to appear in the normal deck
            -- the reason for "args.suit == ''" is because the ui that displays these ranks checks if they can appear by calling the in_pool function with an empty string (or if you have any of that rank)
            return false
        else
            return true -- assuming you want this ranks to always be able to appear in standards and such
        end
    end,
    key = '12',
    card_key = '12',
    pos = { x = 20 },
    nominal = 12,
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
    shorthand = '12',
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { "deg_13" },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
}

SMODS.Rank {
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then -- i assume you don't want these to appear in the normal deck
            -- the reason for "args.suit == ''" is because the ui that displays these ranks checks if they can appear by calling the in_pool function with an empty string (or if you have any of that rank)
            return false
        else
            return true -- assuming you want this ranks to always be able to appear in standards and such
        end
    end,
    key = '13',
    card_key = '13',
    pos = { x = 21 },
    nominal = 13,
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
    shorthand = '13',
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { "deg_13" },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
}

SMODS.Rank {
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then -- i assume you don't want these to appear in the normal deck
            -- the reason for "args.suit == ''" is because the ui that displays these ranks checks if they can appear by calling the in_pool function with an empty string (or if you have any of that rank)
            return false
        else
            return true -- assuming you want this ranks to always be able to appear in standards and such
        end
    end,
    key = '21',
    card_key = '21',
    pos = { x = 22 },
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
    straight_edge = true,
    next = { "deg_21" },
    lc_atlas = "cards_lc",
    hc_atlas = "cards_hc",
}
