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
    'j_l6_luckylegends_jonah',
    'j_l6_luckylegends_marco',
    'j_l6_luckylegends_panda',
    'j_l6_luckylegends_cat',
    'j_l6_luckylegends_ken',
    'j_l6_luckylegends_chris'
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
            SMODS.add_card({set = 'Joker', area = G.jokers, key = pseudorandom_element(legends_pool, pseudoseed('legendsch'))})
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
        if next(SMODS.find_card('j_l6_luckylegends_chris', false)) then
            if card.ability.set == 'Tarot' or card.ability.set == 'Spectral' then
                card.cost = 0
            elseif card.ability.set == 'Booster' then
                if card.config.center.key:find('arcana') or card.config.center.key:find('spectral') then
                    card.cost = 0
                end
            end
        end
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
        if G.GAME.modifiers['l6_eternal_rares_legendaries'] and card.ability.set == 'Joker' and (card.config.center.rarity >= 3) then -- force apply eternal if eternal rares & legendaries is on
            if card.config.center.eternal_compat and not card.ability.perishable then
                card:add_sticker('eternal', true)
            end
        end
    end

    if self == G.jokers then
        local effects
        SMODS.calculate_context({l6_joker_added = card}, effects)
    end
end

-- lucky card calc change to work with cat
SMODS.Enhancement:take_ownership('m_lucky',
    {
        calculate = function (self, card, context)
            if context.main_scoring and context.cardarea == G.play then
                local hascat = next(SMODS.find_card('j_l6_luckylegends_cat', false))
                return 
                    {
                        dollars = (hascat or pseudorandom('lucky_money') < G.GAME.probabilities.normal/20) and 20 or nil,
                        mult = (hascat or pseudorandom('lucky_mult') < G.GAME.probabilities.normal/5) and 20 or nil
                    }
            end
        end
    }
)

-- game init hook (for variables)
local igo = Game.init_game_object
function Game:init_game_object()
    local ret = igo(self)
    ret.current_round.l6_dex = {hand = "High Card"}
    ret.pool_flags.l6_zoey_nat_spawn = false
    ret.l6_cards_seen = {}
    return ret
end

-- card base changed context hook (for zoey)
local cb = Card.set_base
function Card:set_base(card, initial)
    local old_card
    if self.base then
        old_card = {id = self:get_id(), suit = self.base.suit}
    end
    cb(self, card, initial)

    if G.hand and self and self.base and old_card then
        local effects
        SMODS.calculate_context({l6_base_changed = true, l6_other_card = {id = self:get_id(), suit = self.base.suit}, l6_old_card = old_card}, effects)
    end
end