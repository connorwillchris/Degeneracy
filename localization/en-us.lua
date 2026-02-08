return {
    descriptions = {
        Back = {
            b_deg_giant_rat = {
                name = "Giant Rat Deck",
                text = {
                    "Played cards are",
                    "{C:attention}returned{} to deck",
                },
            },
        },

        Joker = {
            -- CREDITS JOKERS
            j_deg_cloudzXIII = {
                name = "cloudzXIII",
                text = {
                    ""
                }
            },
            j_deg_gud = {
                name = "Gud",
                text = {
                    ""
                }
            },
            --ADDITIONS
            j_deg_break_limits = {
                name = "Break Limits",
                text = {
                    "1 random scoring card",
                    "is retriggered {C:attention}#1#{} times"
                }
            },
            j_deg_birthday_card = {
                name = "Birthday Card",
                text = {
                    "If sum of scored cards",
                    "equals {C:attention}21{} and",
                    "played hand contains",
                    "{C:attention}5{} cards, gain",
                    "a random {C:attention}Booster Pack{} Tag",
                    "{C:inactive}(Aces count as 1)",
                }
            },
            j_deg_radiation_detector = {
                name = "Radiation Detector",
                text = {
                    "If {C:attention}first hand{} of round is",
                    "a single card, convert",
                    "a random card {C:attention}held in hand",
                    "into played card"
                }
            },
            j_deg_sweep_the_leg = {
                name = "Sweep The Leg",
                text = {
                    "Reduce {C:attention}Blind requirements{}",
                    "by {C:attention}5%{}, then",
                    "{C:mult}+#1#{} Mult",
                }
            },
            j_deg_escardgot = {
                name = "Plate of Escardgot",
                text = {
                    {
                        "{C:white,X:mult}X#2#{} Mult",
                        "{C:inactive}({C:attention}#1#{}{C:inactive} Rounds Left)"
                    },
                    {
                        "Use this Joker to",
                        "decrease the remaining",
                        "{C:attention}rounds{} and rank of",
                        "{C:attention}1{} selected card",
                        "by {C:attention}1",
                    }
                }
            },
            j_deg_memory_card = {
                name = "Memory Card",
                text = {
                    "Select {C:attention}1{} card",
                    "to {C:attention}remember{} it.",
                    "Add a permanent copy",
                    "to deck when a",
                    "{C:attention}Boss Blind{} is defeated",
                }
            },
            j_deg_fake_id = {
                name = "Fake ID",
                text = {
                    "Prevent Death {C:attention}once{}",
                    "and set money to {C:red}$0{}",
                    "{C:red,E:2}self destructs{}",
                }
            },
            j_deg_expulsion = {
                name = "Expulsion",
                text = {
                    "{C:attention}2X{} Base Blind Size,",
                    "{C:attention}+2{} Hand Size"
                }
            },
            j_deg_report_card = {
                name = "Report Card",
                text = {
                    {
                        "Add a random {C:attention}Ace{} to",
                        "your deck",
                        "at end of round,",
                    },
                    {
                        "If you have at least {C:attention}$#1#{},",
                        "add a {C:dark_edition}Foil{} {C:attention}Ace{}",
                        "instead and {C:red}-$#1#{}"
                    }
                }
            },
            j_deg_communist_party_card = {
                name = "Communist Party Card",
                text = {
                    "If {C:attention}first hand{} of round",
                    "convert all cards",
                    "{C:attention}held in hand{} into",
                    "a random suit from scored hand"
                }
            },
            j_deg_blood_donor = {
                name = "Blood Donor",
                text = {
                    "Played cards with",
                    "{C:hearts}Heart{} suit",
                    "decrease in rank by {C:attention}1{}",
                    "and give {C:white,X:mult}X#1#{} Mult when scored",
                }
            },
            j_deg_cardiovascular_exercise = {
                name = "Cardiovascular Exercise",
                text = {
                    "{C:mult}#1#{} Mult",
                    "Earn {C:money}$#2#{} per {C:attention}trigger{}",
                    "at end of round",
                    "{C:inactive}(Currently {C:money}$#3#{}{C:inactive})"
                }
            },
            j_deg_untitled = {
                name = "???",
                text = {
                    "Cards with a {C:dark_edition}Negative{} rank",
                    "score {C:mult}+Mult{}",
                    "instead of {C:chips}-Chips",
                    "{C:inactive}(ex: {C:chips}-4{}{C:inactive} Chips -> {C:mult}+4{}{C:inactive} Mult)"
                }
            },
            -- VANILLA
            j_deg_fibonacci = {
                name = "Fibonacci",
                text = {
                    "Each played {C:attention}Ace{},",
                    "{C:attention}1{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, {C:attention}8{},",
                    "{C:attention}13{} or {C:attention}21{} gives",
                    "{C:mult}+#1#{} Mult when scored",
                },
            },
            j_deg_business = {
                name = "Partnership Card",
                text = {
                    "Played {C:attention}face{} cards have",
                    "a {C:green}#1# in #2#{} chance to",
                    "give {C:money}$2{} when scored",
                }
            },
        },
        Other = {
            deg_negative_mult = {
                text = {
                    "{C:mult}#1#{} Mult",
                },
            },
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
                    "{C:attention,s:1}Gud{C:white,s:1}, Astro, Nrio, candycaneanniahlator & {C:attention}Tech{}",
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
        Colour = {
            c_deg_poker_green = {
                name = "Poker Green",
                text = {
                    "Add a random {C:attention}21{} to",
                    "your hand for",
                    "every {C:attention}#4#{} rounds",
                    "this has been held",
                    "{C:inactive}(Currently {C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
                },
            },
        },
        Mod = {
            Degeneracy = {
                name = "Degeneracy",
                text = {
                    "Adds {C:attention}Jokers{}, {C:attention}Ranks{}, and more content",
                    "based on {C:attention}Dungeons and Degenerate Gamblers{}!",
                }
            },
        },
    },
    misc = {
        challenge_names = {
            c_deg_inversion = "Inversion",
            c_deg_throwthekey = "Throw the key",
        },
        dictionary = {
            deg_content_edits = "Content edits",
            deg_content_edits_desc = "Edits some content in base game to work with this mod's content",

            k_programmer_badge = "Programmer",
            k_artist_badge = "Artist",
            k_ideas_badge = "Ideas",
            --[[k_deg_AAAA = "consumable",
            b_deg_AAAA_cards = "consumable Cards",]] --
            b_deg_wiki_page = "Wiki Page",
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
            ["deg_-11"] = "-11",
            ["deg_0.5"] = "0.5",
            ["deg_1"] = "1",
            ["deg_pi"] = "Pi",
            ["deg_11"] = "11",
            ["deg_12"] = "12",
            ["deg_13"] = "13",
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
