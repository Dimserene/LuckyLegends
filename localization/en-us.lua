-- mod prefix is p_l6_luckylegends -- lowercase L6, not 16!!

return {
    descriptions = {
        Back = {
            b_l6_luckylegends_lucky = {
                name = "Lucky's Deck",
                text = {
                    "Start with a random",
                    "{V:1}Lucky Legends{} Joker",
                    "{C:red}-1{} Joker slot"
                }
            }
        },
        Joker = {
            j_l6_luckylegends_dex = {
                name = "Dex",
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult if",
                    "first hand is a {C:attention}#2#{}",
                    "{s:0.8}Hand changes every round",
                    "{C:inactive}Currently {X:mult,C:white}X#3#{} {C:inactive}Mult",
                    "{s:0.8,C:inactive}Comin' in hot!"
                }
            },
            j_l6_luckylegends_ty = {
                name = "Ty",
                text = {
                    "Creates a {V:1}Negative{} {V:2}Perishable{}",
                    "copy of another owned Joker",
                    "when Boss Blind is selected",
                    "{s:0.8,C:inactive}We stand together."
                }
            },
            j_l6_luckylegends_alex = {
                name = "Alex",
                text = {
                    "After {C:attention}#1#{} {C:inactive}[#2#/#1#]{} rounds,",
                    "sell this joker to create",
                    "{C:attention}2{} random {V:1}Legendary{} Jokers",
                    "{C:inactive}(Must have room)",
                    "{s:0.8,C:inactive}Too busy daydreaming..."
                }
            },
            j_l6_luckylegends_zach = {
                name = "Zach",
                text = {
                    "{X:mult,C:white}X#1#{} Mult for every {C:attention}Jack{} added to deck",
                    "{C:inactive}Currently {}{X:mult,C:white}X#2#{} {C:inactive}Mult{}",
                    "{C:green}#3#{} in {C:green}#4#{} chance to {C:attention}self-destruct",
                    "and create a copy of {C:attention}Zoey{}",
                    "{s:0.8,C:inactive}Just going through life."
                }
            },
            j_l6_luckylegends_zoey = {
                name = "Zoey",
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "for every card",
                    "turned into a {C:attention}Queen{}",
                    "{C:inactive}Currently {X:mult,C:white}X#2#{} {C:inactive}Mult",
                    "{s:0.8,C:inactive}I found you. I found... me."
                }
            },
            j_l6_luckylegends_molly = {
                name = "Molly",
                text = {
                    "{V:1}Holographic{} and {V:1}Polychrome{}",
                    "{C:attention}playing cards{} are retriggered",
                    "{C:attention}#1#{} additional times",
                    "{s:0.8,C:inactive}Young, wild, and queer!"
                }
            },
            j_l6_luckylegends_kim = {
                name = "Kim",
                text = {
                    "Destroys scored {C:attention}Steel{}",
                    "and {C:attention}Gold{} cards",
                    "Gains {X:mult,C:white}X#2#{} Mult per card destroyed",
                    "{C:inactive}Currently {}{X:mult,C:white}X#1#{} {C:inactive}Mult{}",
                    "{s:0.8,C:inactive}Burn it all down."
                }
            },
            j_l6_luckylegends_alexia = {
                name = "Alexia",
                text = {
                    "{X:mult,C:white}X#1#{} Mult for every",
                    "scored {C:attention}5{} and {C:attention}6{}",
                    "Gains {X:mult,C:white}X#2#{} Mult when any",
                    "{V:1}Lucky Legends{} Joker is added",
                    "{s:0.8,C:inactive}I love my friends!"
                }
            },
            j_l6_luckylegends_sasha = {
                name = "Sasha",
                text = {
                    "This Joker gains {X:mult,C:white}X#2#{} Mult for",
                    "every {V:1}Tarot{}, {V:2}Planet{}, {V:3}Spectral{}",
                    "and {V:4}Joker{} card {C:attention}seen{} this run {C:inactive}",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult){}",
                    "{s:0.8,C:inactive}I wanna see the world..."
                }
            },
            j_l6_luckylegends_jonah = {
                name = "Jonah",
                text = {
                    "{C:attention}Kings{} and {C:attention}Jacks{} give",
                    "{V:1}$#1#{} when scored",
                    "or held in hand when scoring",
                    "{s:0.8,C:inactive}God's freakiest soldier."
                }
            },
            j_l6_luckylegends_marco = {
                name = "Marco",
                text = {
                    "This Joker gives {X:mult,C:white}X#2#{} Mult",
                    "for every {V:1}Heart{} card in deck",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult)",
                    "{s:0.8,C:inactive}We all just want to be loved."
                }
            },
            j_l6_luckylegends_panda = {
                name = "Panda",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if no",
                    "{V:2}Common{} Jokers are owned",
                    "{C:inactive}(Currently {}{V:1}#2#{}{C:inactive})",
                    "{s:0.8,C:inactive}AG@&4TDHSYA!!?1@."
                }
            },
            j_l6_luckylegends_cat = {
                name = "Cat",
                text = {
                    "Played {C:attention}Lucky Cards{}",
                    "{C:attention}always{} trigger",
                    "{s:0.8,C:inactive}Meow."
                }
            },
            j_l6_luckylegends_ken = {
                name = "Ken",
                text = {
                    "Sell this Joker to immediately",
                    "{C:attention}remove{} all {C:attention}stickers",
                    "from every other owned Joker",
                    "{s:0.8,C:inactive}Discipline is a key virtue."
                }
            },
            j_l6_luckylegends_chris = {
                name = "Chris",
                text = {
                    "All {V:1}Tarot{} and {V:2}Spectral{}",
                    "cards and packs are {C:attention}free{}",
                    "Creates a {V:3}Negative{} copy of",
                    "{C:attention}The Fool{} at end of shop",
                    "{s:0.8,C:inactive}Always glad to assist!"
                }
            }
        },
        Tag = {
            tag_l6_luckylegends_legends = {
                name = "Legends Tag",
                text = {
                    "Gives a free",
                    "{V:1}Mega Legends Pack"
                }
            }
        },
        Other = {
            p_l6_luckylegends_legends_s = {
                name = "Legends Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to {C:attention}#2#{}",
                    "{V:1}Rare{} or {V:2}Legendary{} {V:3}Jokers{}"
                }
            },
            p_l6_luckylegends_legends_s_alt = {
                name = "Legends Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to {C:attention}#2#{}",
                    "{V:1}Rare{} or {V:2}Legendary{} {V:3}Jokers{}"
                }
            },
            p_l6_luckylegends_legends_m = {
                name = "Jumbo Legends Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to {C:attention}#2#{}",
                    "{V:1}Rare{} or {V:2}Legendary{} {V:3}Jokers{}"
                }
            },
            p_l6_luckylegends_legends_l = {
                name = "Mega Legends Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to {C:attention}#2#{}",
                    "{V:1}Rare{} or {V:2}Legendary{} {V:3}Jokers{}"
                }
            }
        },
    },
    misc = {
        challenge_names = {
            c_l6_luckylegends_legends = 'Legends Challenge'
        },
        v_text = {
            ch_c_l6_eternal_rares_legendaries = {'All Rare and Legendary Jokers are Eternal (if compatible)'},
            ch_c_l6_score_req_multiplier =  {'Score requirements multiplied by x2'},
            ch_c_l6_random_legends_joker_start = {'Start with a random Lucky Legends Joker'}
        },
        dictionary = {

            k_l6_legendspack = 'Legends Pack',

            k_l6_source_oc = 'OC',
            k_l6_source_okame = 'Instagram @0kame_san',
            k_l6_source_ocpoke = 'Pokémon (OC)',
            k_l6_source_panda = 'apandah youtube dot com',
            k_l6_source_tism = 'im autistic af lmaoo',

            k_l6_zach_crack = 'Crack!',
            k_l6_zach_safe = 'Nah.',
            k_l6_alexia_upgrade = 'Friend!',
            k_l6_chris_spawn_fool = 'Take this!',

            k_l6_active = 'Active',
            k_l6_inactive = 'Inactive'

        }
    }
}