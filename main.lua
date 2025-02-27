assert(SMODS.load_file('globals.lua'))()
assert(SMODS.load_file('jokers.lua'))()
assert(SMODS.load_file('boosters.lua'))()
assert(SMODS.load_file('tags.lua'))()
assert(SMODS.load_file('challenges.lua'))()

local legends_pool = {
    'j_l6_luckylegends_dex',
    'j_l6_luckylegends_ty',
    'j_l6_luckylegends_alex',
    'j_l6_luckylegends_zach',
    'j_l6_luckylegends_molly',
    'j_l6_luckylegends_kim',
    'j_l6_luckylegends_alexia',
    'j_l6_luckylegends_sasha',
    'j_l6_luckylegends_jonah'
}

-- FUNCS/HOOKS for jokers and challenge setup

-- reset_game_globals
function SMODS.current_mod.reset_game_globals(run_start)
    local poker_hands = {}
    for k, v in pairs(G.GAME.hands) do
        if v.visible then poker_hands[#poker_hands+1] = k end
    end
    G.GAME.current_round.l6_dex.hand = pseudorandom_element(poker_hands, pseudoseed('dex_hand'))

    if run_start then
        G.GAME.l6_cards_seen = {} -- reset seen cards so it doesn't carry into future runs
        if G.GAME.modifiers['l6_random_legends_joker_start'] then -- add legends challenge starter joker
            local card = SMODS.add_card({set = 'Joker', area = G.jokers, key = pseudorandom_element(legends_pool, pseudoseed('legendsch'))})
            if card.config.center.eternal_compat then
                card:add_sticker('eternal', true)
            end
        end
        if G.GAME.modifiers['l6_score_req_multiplier'] then -- set extra score scaling
            G.GAME.starting_params.ante_scaling = G.GAME.modifiers['l6_score_req_multiplier']
        end
    end
end


-- emplace hook
local empl = CardArea.emplace
function CardArea.emplace(self, card, location, stay_flipped)
    empl(self, card, location, stay_flipped)

    if (not self.config.collection) then
        if  G.GAME.l6_cards_seen then
            if card.ability.set == 'Tarot' or card.ability.set == 'Spectral' or card.ability.set == 'Planet' or card.ability.set == 'Joker' then -- add to seen cards table if not present

                local isFound = false
                for _, c in pairs(G.GAME.l6_cards_seen) do
                    if c == card.ability.name then isFound = true break end
                end
    
                if not isFound then
                    -- print(card.ability.name)
                    table.insert(G.GAME.l6_cards_seen, card.ability.name)
                end
                
            end
        end
        if G.GAME.modifiers['l6_eternal_rares_legendaries'] and card.ability.set == 'Joker' and (card.config.center.rarity >= 3) then
            if card.config.center.eternal_compat then
                card:add_sticker('eternal', true)
            end
        end
    end

    if self == G.jokers then
        local effects
        SMODS.calculate_context({l6_joker_added = card}, effects)
    end

end