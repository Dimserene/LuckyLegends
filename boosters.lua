SMODS.Atlas{
    key = "LLBooster",
    path = "Boosters.png",
    px = 71,
    py = 95
}

SMODS.Booster{
    key = 'legends_s',
    config = { extra = 2, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.choose,
                card.ability.extra,
                colours = {
                    G.C.RARITY[3],
                    G.C.RARITY[4],
                    G.C.SET.Jokers
                }
            }
        }
    end,
    group_key = 'k_l6_legendspack',
    cost = 4,
    weight = 0.2,
    atlas = "LLBooster",
    pos = {x = 0, y = 0},
    create_card = function(self, card, i)

        local weight = pseudorandom(pseudoseed('legends'))
        
        if weight <= 0.25 then
            return SMODS.create_card({ set = 'Joker', area = G.jokers, legendary = true })
        else
            return SMODS.create_card ({ set = 'Joker', area = G.jokers, rarity = 1 })
        end
    end
}

SMODS.Booster{
    key = 'legends_s_alt',
    config = { extra = 2, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.choose,
                card.ability.extra,
                colours = {
                    G.C.RARITY[3],
                    G.C.RARITY[4],
                    G.C.SET.Jokers
                }
            }
        }
    end,
    group_key = 'k_l6_legendspack',
    cost = 4,
    weight = 0.2,
    atlas = "LLBooster",
    pos = {x = 1, y = 0},
    create_card = function(self, card, i)

        local weight = pseudorandom(pseudoseed('legends'))
        
        if weight <= 0.25 then
            return SMODS.create_card({ set = 'Joker', area = G.jokers, legendary = true })
        else
            return SMODS.create_card ({ set = 'Joker', area = G.jokers, rarity = 1 })
        end
    end
}

SMODS.Booster{
    key = 'legends_m',
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.choose,
                card.ability.extra,
                colours = {
                    G.C.RARITY[3],
                    G.C.RARITY[4],
                    G.C.SET.Jokers
                }
            }
        }
    end,
    group_key = 'k_l6_legendspack',
    cost = 6,
    weight = 0.15,
    atlas = "LLBooster",
    pos = {x = 2, y = 0},
    create_card = function(self, card, i)

        local weight = pseudorandom(pseudoseed('legends'))
        
        if weight <= 0.25 then
            return SMODS.create_card({ set = 'Joker', area = G.jokers, legendary = true })
        else
            return SMODS.create_card ({ set = 'Joker', area = G.jokers, rarity = 1 })
        end
    end
}

SMODS.Booster{
    key = 'legends_l',
    config = { extra = 4, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.choose,
                card.ability.extra,
                colours = {
                    G.C.RARITY[3],
                    G.C.RARITY[4],
                    G.C.SET.Jokers
                }
            }
        }
    end,
    group_key = 'k_l6_legendspack',
    cost = 8,
    weight = 0.15,
    atlas = "LLBooster",
    pos = {x = 3, y = 0},
    create_card = function(self, card, i)

        local weight = pseudorandom(pseudoseed('legends'))
        
        if weight <= 0.25 then
            return SMODS.create_card({ set = 'Joker', area = G.jokers, legendary = true })
        else
            return SMODS.create_card ({ set = 'Joker', area = G.jokers, rarity = 1 })
        end
    end
}