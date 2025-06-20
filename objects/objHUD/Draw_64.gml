if (room == rmMenu) {
    var cx = display_get_gui_width() / 2;
    var cy = display_get_gui_height() / 2;

    // Start
    if (mouse_x > cx - 100 && mouse_x < cx - 100 + sprite_get_width(sprBotaoStart)
        && mouse_y > cy - -230 && mouse_y < cy - -230 + sprite_get_height(sprBotaoStart)
        && mouse_check_button_pressed(mb_left)) {
        room_goto(Level); // ou rmFase1 se tiver macro
    }

    // Credits
    if (mouse_x > cx - 550 && mouse_x < cx - 550 + sprite_get_width(sprBotaoCredits)
        && mouse_y > cy + 230 && mouse_y < cy + 230 + sprite_get_height(sprBotaoCredits)
        && mouse_check_button_pressed(mb_left)) {
        room_goto(rmCredits); // se tiver room de créditos
    }

    // Exit
    if (mouse_x > cx - -350 && mouse_x < cx - -350 + sprite_get_width(sprBotaoExit)
        && mouse_y > cy + 230 && mouse_y < cy + 230 + sprite_get_height(sprBotaoExit)
        && mouse_check_button_pressed(mb_left)) {
        game_end();
    }
}
if (room == rmMenu) {
    draw_sprite(sprCapaFundo, 0, 0, 0);

    var cx = display_get_gui_width() / 2;
    var cy = display_get_gui_height() / 2;

    // Botões do menu
    draw_sprite(sprBotaoStart, 0, cx - 100, cy - -230);
    draw_sprite(sprBotaoCredits, 0, cx - 550, cy + 230);
    draw_sprite(sprBotaoExit, 0, cx - -350, cy + 230);
}
if (instance_exists(objTimer) && objTimer.contagem_ativa) {
	if (global.gameover_ativo) {
    var cx = display_get_gui_width() / 2;
    var cy = display_get_gui_height() / 2;

    // Fundo pop-up centralizado
    draw_sprite(sprFundoGameOver, 0, cx - sprite_get_width(sprFundoGameOver)/2, cy - sprite_get_height(sprFundoGameOver)/2);

    // Mensagem
    draw_set_font(fontGameOver);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(cx, cy - 50, "Your owner arrived before you");

    // Botões
    draw_sprite(sprBotaoTryAgain, 0, cx - 20, cy + 30);
    draw_sprite(sprBotaoMenu, 0, cx + 20, cy + 30);
}
	if (global.gameover_ativo) {
    var cx = display_get_gui_width() / 2;
    var cy = display_get_gui_height() / 2;

    // Try Again
	 if (mouse_x > cx - 100 && mouse_x < cx - 100 + sprite_get_width(sprBotaoTryAgain)
        && mouse_y > cy + 30 && mouse_y < cy + 30 + sprite_get_height(sprBotaoTryAgain)
        && mouse_check_button_pressed(mb_left)) {
        room_restart();
    }


    // Menu
     if (mouse_x > cx + 20 && mouse_x < cx + 20 + sprite_get_width(sprBotaoMenu)
        && mouse_y > cy + 30 && mouse_y < cy + 30 + sprite_get_height(sprBotaoMenu)
        && mouse_check_button_pressed(mb_left)) {
        room_goto(rmMenu); // substitua se seu menu tiver outro nome
    }
}

    // Desenha um fundo maior para os dois textos
    draw_sprite(sprFundoTempo, 0, 1170, 0);

    draw_set_font(fontTimer);
    draw_set_color(c_white);

    // Tempo atual formatado
    var timer_atual = max(0, objTimer.timer);
    var mins_atual = floor(timer_atual / 60);
    var secs_atual = floor(timer_atual % 60);

    var mins_txt_atual = string(mins_atual);
    if (mins_atual < 10) mins_txt_atual = "0" + mins_txt_atual;
    var secs_txt_atual = string(secs_atual);
    if (secs_atual < 10) secs_txt_atual = "0" + secs_txt_atual;
    var display_atual = mins_txt_atual + ":" + secs_txt_atual;

    draw_text(1270, 20, "Time: " + display_atual);

    // Melhor tempo formatado
    if (instance_exists(objTimerEndStage)) {
        if (objTimerEndStage.melhor_tempo != -1) {

            var melhor = max(0, objTimerEndStage.melhor_tempo);
            var mins_melhor = floor(melhor / 60);
            var secs_melhor = floor(melhor % 60);

            var mins_txt_melhor = string(mins_melhor);
            if (mins_melhor < 10) mins_txt_melhor = "0" + mins_txt_melhor;
            var secs_txt_melhor = string(secs_melhor);
            if (secs_melhor < 10) secs_txt_melhor = "0" + secs_txt_melhor;
            var display_melhor = mins_txt_melhor + ":" + secs_txt_melhor;

            draw_text(1270, 40, "Best Time: " + display_melhor);
        }
        else {
            draw_text(1270, 40, "No record yet!");
        }
    }
}

