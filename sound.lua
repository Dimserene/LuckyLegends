SMODS.Sound {
    key = 'musiclegends',
    path = 'music_legends.ogg',
    pitch = 0.7,
    volume = 1,
    select_music_track = function (self)
        if G.STATE == G.STATES.SMODS_BOOSTER_OPENED and SMODS.OPENED_BOOSTER.config.center.group_key == "k_l6_legendspack" then
            return 1000
        end
    end
}