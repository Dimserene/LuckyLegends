SMODS.Atlas {
    key = "LLBack",
    path = "Backs.png",
    px = 71,
    py = 95
}

SMODS.Back {
    name = "Lucky's Deck",
    key = "lucky",
    atlas = "LLBack",
    pos = {x = 0, y = 0},
    config = {l6_luckystart = true, joker_slot = -1},
    loc_vars = function (self, info_queue, card)
        return {vars = {colours = {L6.C.secondary}}}
    end,
    apply = function ()
        G.E_MANAGER:add_event(Event({
            func = function ()
                local j = SMODS.add_card({set = 'Joker', area = G.jokers, key = pseudorandom_element(L6.legends_pool, pseudoseed('legendsch'))})
                j:start_materialize()
                return true
            end
        }))
    end
}