-- set custom globals
L6 = {
    C = {
        main =  HEX('fc7b03'),
        secondary = HEX('ffa185'),
        okame = HEX('d99071')
    },

    funcs = {
        
        flip_unflip = function (card, i, context, amount, t, func)
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = (i - 1) * t,
                blockable = false,
                func = function() 
                    card:flip()
                    play_sound('card1')
                    card:juice_up(0.3, 0.3)
                    return true
                end 
            }))
    
            G.E_MANAGER:add_event(Event({
                func = function()
                    func()
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = ((i - 1) * t) + (amount * t),
                blockable = false,
                func = function()
                    if not context.individual and not context.cardarea == G.play and not context.other_card == card then return false end
                    G.E_MANAGER:add_event(Event({
                        blockable = false,
                        trigger = 'after',
                        delay = 0.35,
                        func = function() 
                            card:flip()
                            play_sound('tarot2')
                            card:juice_up(0.3, 0.3)
                            return true 
                        end 
                    }))
                    return true
                end
            }))
        end
    
    },
    
    legends_pool = {
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
}