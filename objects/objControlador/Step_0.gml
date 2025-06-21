if (!audio_is_playing(global.bgm_id)) {
    global.bgm_id = audio_play_sound(sndBGM, 1, true);
}