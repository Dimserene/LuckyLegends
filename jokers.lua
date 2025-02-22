SMODS.Atlas{
    key = "LLJoker",
    path = "Jokers.png",
    px = 71,
    py = 95
}

-- DEX --

SMODS.Joker{
    key = 'dex',
    atlas = "LLJoker",
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    config = {extra = {xmult = 1, xmult_mod = 1}},
    rarity = 4,
    cost = 20,
    blueprint_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.xmult_mod, G.GAME.current_round.l6_dex.hand, card.ability.extra.xmult}}
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_l6_source_oc'), G.C.BLUE, G.C.WHITE, 0.8)
    end,

    calculate = function(self, card, context)
        if context.before and G.GAME.current_round.hands_played == 0 and context.scoring_name == G.GAME.current_round.l6_dex.hand and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
            return{
                message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.xmult}}
            }
        elseif context.joker_main and card.ability.extra.xmult > 1 then
            return {
                Xmult_mod = card.ability.extra.xmult,
                message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.xmult}}
            }
        end
    end
}

-- TY --

SMODS.Joker{

    key = 'ty',
    atlas = "LLJoker",
    pos = {x = 1, y = 0},
    soul_pos = {x = 1, y = 1},
    rarity = 4,
    cost = 20,
    perishable_compat = false,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        info_queue[#info_queue + 1] = {key = 'perishable', set = 'Other', vars = {G.GAME.perishable_rounds, G.GAME.perishable_rounds}}
        return { vars = { colours = { G.C.DARK_EDITION, G.C.PERISHABLE } } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_l6_source_oc'), G.C.BLUE, G.C.WHITE, 0.8)
    end,

    calculate = function(self, card, context)
        if context.setting_blind and G.GAME.blind.boss and not context.blueprint then

            local valid_pool = {}

            for _, j in pairs(G.jokers.cards) do
                if not (j == card) then
                    table.insert(valid_pool, j)
                end
            end

            if #valid_pool >= 1 then
                local new_joker = copy_card(pseudorandom_element(valid_pool, pseudoseed('ty_joker')), nil)
               
                new_joker:set_edition('e_negative', true)
                new_joker:set_perishable(true)
                new_joker:add_to_deck()

                G.jokers:emplace(new_joker)
                        
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                    { message = localize('k_duplicated_ex') })
            end
        end
    end
}

-- ALEX --

SMODS.Joker{

    key = 'alex',
    atlas = "LLJoker",
    pos = {x = 2, y = 0},
    soul_pos = {x = 2, y = 1},
    config = { extra = { rounds = 0, threshold = 2 }},
    rarity = 4,
    cost = 20,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.threshold, card.ability.extra.rounds, colours = { G.C.RARITY[4] } } 
        }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_l6_source_oc'), G.C.BLUE, G.C.WHITE, 0.8)
    end,

    calculate = function(self, card, context)

        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then

            if card.ability.extra.rounds < card.ability.extra.threshold then
                card.ability.extra.rounds = card.ability.extra.rounds + 1
            end
            
            if card.ability.extra.rounds >= card.ability.extra.threshold then
                local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
                return {
                    message = localize('k_active_ex')
                }
            else
                return {
                    message = card.ability.extra.rounds .. '/' .. card.ability.extra.threshold
                }
            end

        elseif context.selling_self and card.ability.extra.rounds >= card.ability.extra.threshold and not context.blueprint then
            
            for i = 1, 2, 1 do
                if #G.jokers.cards <= G.jokers.config.card_limit then 
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({set = 'Joker', area = G.jokers, legendary = true})
                            return true
                        end
                    }))
                else
                    return { message = localize('k_no_room_ex') }
                end
            end
        end
    end

}

-- ZACH/ZOEY -- 

SMODS.Joker{

    key = 'zach',
    atlas = "LLJoker",
    pos = {x = 3, y = 0},
    soul_pos = {x = 3, y = 1},
    config = { extra = { xmult = 1, xmult_mod = 1, odds = 15 }},
    rarity = 4,
    cost = 20,
    eternal_compat = false,
    blueprint_compat = true,

    loc_vars = function(self, info_queue, card)
        if G.P_CENTERS.j_l6_luckylegends_zoey.discovered then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_l6_luckylegends_zoey
        end
        return {
            vars = { card.ability.extra.xmult_mod, card.ability.extra.xmult, G.GAME.probabilities.normal or 1, card.ability.extra.odds } 
        }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_l6_source_oc'), G.C.BLUE, G.C.WHITE, 0.8)
    end,

    calculate = function(self, card, context)
        if context.playing_card_added and not context.repetition and not context.blueprint then
            if context.cards then -- why is cards sometimes a boolean wtf
                local hits = 0
                for _, v in ipairs(context.cards) do
                    if not (v == true) and v:get_id() == 11 then
                        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
                        hits = hits + 1
                    end
                end

                if hits > 0 then
                    return {
                        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
                    }
                end
            end
        elseif context.joker_main and card.ability.extra.xmult > 1 then
            return {
                Xmult_mod = card.ability.extra.xmult,
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
            }
        elseif context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
            if pseudorandom('zach_crack') <= G.GAME.probabilities.normal / card.ability.extra.odds then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true

                        SMODS.eval_this(card, {message = localize('k_l6_zach_crack')})
                
                        if #G.jokers.cards <= G.jokers.config.card_limit then 
                            SMODS.add_card({set = 'Joker', area = G.jokers, key = 'j_l6_luckylegends_zoey'})
                        else
                            SMODS.eval_this(card, {message = localize('k_no_room_ex')})
                        end

						-- This part destroys the card.
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))

						return true
                        
                    end
                }))
                
            else
                return {
                    message = localize('k_l6_zach_safe')
                }
            end
        end
    end
}

SMODS.Joker{

    key = 'zoey',
    atlas = "LLJoker",
    pos = {x = 4, y = 0},
    soul_pos = {x = 4, y = 1},
    config = { extra = { xmult = 1, xmult_mod = 1 }},
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    yes_pool_flag = 'l6_zoey_nat_spawn',

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.xmult_mod, card.ability.extra.xmult } 
        }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_l6_source_oc'), G.C.BLUE, G.C.WHITE, 0.8)
    end,

    calculate = function(self, card, context)
        if context.l6_base_changed and not context.blueprint and not context.repetition then
            if context.l6_other_card.id and context.l6_other_card.id == 12 and context.l6_old_card.id and not (context.l6_old_card.id == 12) then -- changing a queen into a queen shouldn't count
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
                return{
                    message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.xmult}}
                }
            end
        elseif context.joker_main and card.ability.extra.xmult > 1 then
            return {
                Xmult_mod = card.ability.extra.xmult,
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
            }
        end
    end
}

-- MOLLY --

SMODS.Joker{

    key = 'molly',
    atlas = "LLJoker",
    pos = {x = 0, y = 2},
    soul_pos = {x = 0, y = 3},
    config = { extra = { retriggers = 2 }},
    rarity = 4,
    cost = 20,
    eternal_compat = false,
    blueprint_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
        info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
        return {
            vars = { card.ability.extra.retriggers, colours = {G.C.DARK_EDITION} } 
        }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_l6_source_oc'), G.C.BLUE, G.C.WHITE, 0.8)
    end,

    calculate = function(self, card, context)
        if context.repetition and not context.repetition_only and context.cardarea == G.play then
            if context.other_card.edition and (context.other_card.edition.holo or context.other_card.edition.polychrome) then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.retriggers,
                    card = context.other_card
                }
            end
        end
    end
}

-- KIM --

SMODS.Joker {
    key = 'kim',
    unlocked = true,
    config = { extra = { xmult = 1, xmult_mod = 1, upgraded = false } },
    rarity = 2,
    atlas = "LLJoker",
    pos = { x = 1, y = 2 },
    soul_pos = {x = 1, y = 3},
    cost = 20,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_mod } }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_l6_source_oc'), G.C.BLUE, G.C.WHITE, 0.8)
    end,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.xmult > 1 then
            return {
                Xmult_mod = card.ability.extra.xmult,
                message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.xmult}}
            }
        elseif context.destroy_card and context.cardarea == G.play and not context.blueprint then
            if context.destroy_card.config.center == G.P_CENTERS.m_steel or context.destroy_card.config.center == G.P_CENTERS.m_gold then
                card.ability.extra.upgraded = true
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
                return {
                    remove = true
                }
            end
        elseif context.after and not context.blueprint and card.ability.extra.upgraded then
            card.ability.extra.upgraded = false
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
            }
        end
    end
}

-- FUNCS/HOOKS --

-- game init hook
local igo = Game.init_game_object
function Game:init_game_object()
    local ret = igo(self)
    ret.current_round.l6_dex = {hand = "High Card"}
    ret.pool_flags.l6_zoey_nat_spawn = false
    return ret
end

-- card changed context hook
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

-- reset_game_globals
function SMODS.current_mod.reset_game_globals(run_start)
    local _poker_hands = {}
    for k, v in pairs(G.GAME.hands) do
        if v.visible then _poker_hands[#_poker_hands+1] = k end
    end
    G.GAME.current_round.l6_dex.hand = pseudorandom_element(_poker_hands, pseudoseed('dex_hand'))
end


-- SMODS.Joker {
--     key = 'jimbo',
--     unlocked = true,
--     config = { extra = { } },
--     rarity = 2,
--     atlas = "LLJoker",
--     pos = { x = 0, y = 0 },
--     soul_pos = {x = 0, y = 1},
--     cost = 20,
--     blueprint_compat = true,
--     loc_vars = function(self, info_queue, card)
--         return { vars = { } }
--     end,
--     set_badges = function(self, card, badges)
--         badges[#badges + 1] = create_badge(localize('k_l6_source_oc'), G.C.BLUE, G.C.WHITE, 0.8)
--     end,
--     calculate = function(self, card, context)
--
--     end
-- }