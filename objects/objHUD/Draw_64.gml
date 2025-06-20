// ================= MENU =================
if (room == rmMenu) {
    draw_sprite(sprCapaFundo, 0, 0, 0);

    var cx = display_get_gui_width() / 2;
    var cy = display_get_gui_height() / 2;

    // Botões
    draw_sprite(sprBotaoStart, 0, cx - 100, cy - -230);
    draw_sprite(sprBotaoCredits, 0, cx - 550, cy + 230);
    draw_sprite(sprBotaoExit, 0, cx + 350, cy + 230);

    // Interações
    if (mouse_x > cx - 100 && mouse_x < cx - 100 + sprite_get_width(sprBotaoStart)
        && mouse_y > cy - -230 && mouse_y < cy - -230 + sprite_get_height(sprBotaoStart)
        && mouse_check_button_pressed(mb_left)) {
        room_goto(Level); // ou rmFase1
    }

    if (mouse_x > cx - 550 && mouse_x < cx - 550 + sprite_get_width(sprBotaoCredits)
        && mouse_y > cy + 230 && mouse_y < cy + 230 + sprite_get_height(sprBotaoCredits)
        && mouse_check_button_pressed(mb_left)) {
        room_goto(rmCredits);
    }

    if (mouse_x > cx + 350 && mouse_x < cx + 350 + sprite_get_width(sprBotaoExit)
        && mouse_y > cy + 230 && mouse_y < cy + 230 + sprite_get_height(sprBotaoExit)
        && mouse_check_button_pressed(mb_left)) {
        game_end();
    }
}

// ================ GAME OVER ================
if (global.gameover_ativo) {
    var cx = display_get_gui_width() / 2;
    var cy = display_get_gui_height() / 2;

    // Corrige posição do mouse na GUI
    var mx = display_mouse_get_x();
    var my = display_mouse_get_y();

    // Fundo Game Over
    draw_sprite(sprFundoGameOver, 0, cx - sprite_get_width(sprFundoGameOver)/2, cy - sprite_get_height(sprFundoGameOver)/2);

    // Texto Game Over
    draw_set_font(fontGameOver);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(cx, cy - 50, "Your owner arrived before you");
	


    // ===== BOTÃO TRY AGAIN =====
    var try_x = cx - sprite_get_width(sprBotaoTryAgain)/2;
    var try_y = cy + -20;

    draw_sprite(sprBotaoTryAgain, 0, try_x, try_y);

    if (mouse_check_button_pressed(mb_left)
        && mx > try_x && mx < try_x + sprite_get_width(sprBotaoTryAgain)
        && my > try_y && my < try_y + sprite_get_height(sprBotaoTryAgain)) {
        
        room_restart();
    }

    // ===== BOTÃO MENU =====
    var menu_x = cx - sprite_get_width(sprBotaoMenu)/2;
    var menu_y = cy + 50;

    draw_sprite(sprBotaoMenu, 0, menu_x, menu_y);

    if (mouse_check_button_pressed(mb_left)
        && mx > menu_x && mx < menu_x + sprite_get_width(sprBotaoMenu)
        && my > menu_y && my < menu_y + sprite_get_height(sprBotaoMenu)) {
        
        room_goto(rmMenu);
    }
}



// =============== HUD DO TEMPO ===============
if (instance_exists(objTimer) && objTimer.contagem_ativa && !global.gameover_ativo && room != rmMenu) {
    draw_sprite(sprFundoTempo, 0, 1170, 0);
    draw_set_font(fontTimer);
    draw_set_color(c_white);
	

    // Tempo atual formatado (MM:SS)
    var timer_atual = max(0, objTimer.timer);
    var mins_atual = floor(timer_atual / 60);
    var secs_atual = floor(timer_atual % 60);
    var display_atual = string_format(mins_atual, 2, 0) + ":" + string_format(secs_atual, 2, 0);
    draw_text(1270, 20, "Time: " + display_atual);



   // Melhor tempo formatado (MM:SS:MMM)
// =============== HUD DO TEMPO ===============
if (instance_exists(objTimer) && objTimer.contagem_ativa && !global.gameover_ativo && room != rmMenu) {
    draw_sprite(sprFundoTempo, 0, 1170, 0);
    draw_set_font(fontTimer);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    // Tempo atual formatado (MM:SS)
    var timer_atual = max(0, objTimer.timer);
    var mins_atual = floor(timer_atual / 60);
    var secs_atual = floor(timer_atual % 60);

    var mins_txt = string_format(mins_atual, 2, 0);
    var secs_txt = string_format(secs_atual, 2, 0);

    // Garante que espaços serão substituídos por 0
    mins_txt = string_replace_all(mins_txt, " ", "0");
    secs_txt = string_replace_all(secs_txt, " ", "0");

    draw_text(1220, 10, "Time: " + mins_txt + ":" + secs_txt);

    // Melhor tempo formatado (MM:SS:MMM)
    if (instance_exists(objTimerEndStage)) {
        if (objTimerEndStage.melhor_tempo != -1) {
            var melhor = max(0, objTimerEndStage.melhor_tempo);

            var mins = floor(melhor / 60);
            var secs = floor(melhor) mod 60;
            var ms = floor((melhor - floor(melhor)) * 1000);

            var mins_m = string_format(mins, 2, 0);
            var secs_m = string_format(secs, 2, 0);
            var ms_m   = string_format(ms, 3, 0);

            mins_m = string_replace_all(mins_m, " ", "0");
            secs_m = string_replace_all(secs_m, " ", "0");
            ms_m   = string_replace_all(ms_m,   " ", "0");

            draw_text(1220, 40, "Best Time");
            draw_text(1220, 60, mins_m + ":" + secs_m + ":" + ms_m);
        } else {
            draw_text(1220, 40, "No record yet!");
        }
    }
 }
}