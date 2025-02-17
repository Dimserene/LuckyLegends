SMODS.Atlas{
    key = "LLJoker",
    path = "Jokers.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'dex',
    atlas = "LLJoker",
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    config = {extra = {xmult = 1, xmult_mod = 1}},
    rarity = 4,
    cost = 10,
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

-- game init hook
local igo = Game.init_game_object
function Game:init_game_object()
    local ret = igo(self)
    ret.current_round.l6_dex = {hand = "High Card"}
    return ret
end

function SMODS.current_mod.reset_game_globals(run_start)
    local _poker_hands = {}
    for k, v in pairs(G.GAME.hands) do
        if v.visible then _poker_hands[#_poker_hands+1] = k end
    end
    G.GAME.current_round.l6_dex.hand = pseudorandom_element(_poker_hands, pseudoseed('dex_hand'))
end