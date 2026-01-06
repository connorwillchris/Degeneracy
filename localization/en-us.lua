return {
    descriptions = {
        Joker = {
            j_deg_break_limits = {
                name = "Break Limits",
                text = {
                    "1 random scoring card",
                    "is retriggered {C:attention}#1#{} times"
                }
            },
        },
        Other = {
            deg_locked = {
                name = "Locked",
                text = {
                    "Can't be manually {C:red}discarded{}",
                },
            },
            card_chips = {
                text = {
                    "{C:chips}#1#{} chips",
                },
            },
            deg_credits = {
                text = {
                    "{C:white,s:1}({C:attention,s:1}yellow {C:white,s:1}names are for people who contributed a lot)",
                    "{C:blue,s:2}Ideas",
                    "{C:attention,s:1}Gud{C:white,s:1}, Astro, Nrio & candycaneanniahlator",
                    "{C:blue,s:2}Programmers",
                    "{C:white,s:1}Jamirror, CG, TheOneGoofAli, {C:attention,s:1}Silverautumn NK,",
                    "{C:attention,s:1}cloudzXIII {C:white,s:1}&{C:attention,s:1} connorwillchris",
                    "{C:blue,s:2}Art",
                    "{C:attention,s:1}Gud",
                }
            }
        },
        Stake = {
            stake_deg_brass = {
                name = "Brass Stake",
                text = {
                    "{C:green}1 in 7{} cards in deck are {C:attention}locked",
                    "{C:inactive,s:0.8}(Can't be manually discarded)",
                    "{s:0.8}Applies all previous Stakes",
                },
            },
        },
    },
    misc = {
        challenge_names = {
            c_deg_inversion = "Inversion",
            c_deg_throwthekey = "Throw the key",
        },
        dictionary = {
            --[[k_deg_AAAA = "consumable",
            b_deg_AAAA_cards = "consumable Cards",]] --
        },
        labels = {
            deg_locked = "Locked"
        },
        ranks = {
            ["deg_0"] = "0",
            ["deg_-1"] = "-1",
            ["deg_-2"] = "-2",
            ["deg_-3"] = "-3",
            ["deg_-4"] = "-4",
            ["deg_-5"] = "-5",
            ["deg_-6"] = "-6",
            ["deg_-7"] = "-7",
            ["deg_-8"] = "-8",
            ["deg_-9"] = "-9",
            ["deg_-10"] = "-10",
            ["deg_-Jack"] = "-Jack",
            ["deg_-Queen"] = "-Queen",
            ["deg_-King"] = "-King",
            ["deg_-Ace"] = "-Ace",
            ["deg_0.5"] = "0.5",
            ["deg_pi"] = "Pi",
            ["deg_21"] = "21",
        },
        v_text = {
            ch_c_inversion = {
                "{C:hearts}hearts{} and {C:diamonds}diamonds{} have a negative rank",
            },
            ch_c_inversion_info = {
                "{C:inactive,s:0.8}(Take chips instead of adding chips)",
            },
            ch_c_throwthekey = {
                "{C:green}1 in 4{} cards in deck are {C:attention}locked",
            },
            ch_c_throwthekey_info = {
                "{C:inactive,s:0.8}(Can't be manually discarded)",
            },
        },
    }
}
