
// ========== CONFIGURAÇÃO BÁSICA ==========
// Agora responsivo à resolução real da janela
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
var cx = gui_w / 2;
var cy = gui_h / 2;
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// ================= MENU =================
if (room == rmMenu) {
    draw_sprite(sprCapaFundo, 0, 0, 0);

    draw_sprite(sprBotaoStart, 0, cx - 100, cy + 200);
    draw_sprite(sprBotaoCredits, 0, cx - 550, cy + 200);
    draw_sprite(sprBotaoExit, 0, cx + 350, cy + 200);

    if (mx > cx - 100 && mx < cx - 100 + sprite_get_width(sprBotaoStart)
        && my > cy + 200 && my < cy + 200 + sprite_get_height(sprBotaoStart)
        && mouse_check_button_pressed(mb_left)) {
        room_goto(Level);
    }

    if (mx > cx - 550 && mx < cx - 550 + sprite_get_width(sprBotaoCredits)
        && my > cy + 200 && my < cy + 200 + sprite_get_height(sprBotaoCredits)
        && mouse_check_button_pressed(mb_left)) {
        room_goto(rmCredits);
    }

    if (mx > cx + 350 && mx < cx + 350 + sprite_get_width(sprBotaoExit)
        && my > cy + 200 && my < cy + 200 + sprite_get_height(sprBotaoExit)
        && mouse_check_button_pressed(mb_left)) {
        game_end();
    }
}

// ================ GAME OVER ================
if (global.gameover_ativo) {
    draw_sprite(sprFundoGameOver, 0, cx - sprite_get_width(sprFundoGameOver)/2, cy - sprite_get_height(sprFundoGameOver)/2);

    draw_set_font(fontGameOver);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(cx, cy - 60, "Your owner arrived");
    draw_text(cx, cy - 40, "before you");

    // Botão TRY AGAIN
    var try_x = cx - sprite_get_width(sprBotaoTryAgain)/2;
    var try_y = cy - 20;
    draw_sprite(sprBotaoTryAgain, 0, try_x, try_y);

    if (mouse_check_button_pressed(mb_left)
        && mx > try_x && mx < try_x + sprite_get_width(sprBotaoTryAgain)
        && my > try_y && my < try_y + sprite_get_height(sprBotaoTryAgain)) {
        room_restart();
    }

    // Botão MENU
    var menu_x = cx - sprite_get_width(sprBotaoMenu)/2;
    var menu_y = cy + 50;
    draw_sprite(sprBotaoMenu, 0, menu_x, menu_y);

    if (mouse_check_button_pressed(mb_left)
        && mx > menu_x && mx < menu_x + sprite_get_width(sprBotaoMenu)
        && my > menu_y && my < menu_y + sprite_get_height(sprBotaoMenu)) {
        room_goto(rmMenu);
    }
}

// ================ DONO NA TELA ================
var dono = instance_find(objOwner, 0);
if (dono != noone && dono.ativo && !global.jogo_pausado && instance_exists(objTimer)) {
    var tempo_max = objTimer.tempo_max;
    var tempo_atual = objTimer.timer;
    var frac_tempo = clamp((tempo_max - tempo_atual) / tempo_max, 0, 1);
    var tela_inicio_x = 0;
	var tela_fim_x = gui_w - 260;
	var dono_x = lerp(tela_inicio_x, tela_fim_x, frac_tempo);

    var dono_y = 15;
    draw_sprite(dono.sprite_index, dono.image_index, dono_x, dono_y);
}

// ================ HUD DE TEMPO ================
if (instance_exists(objTimer) && objTimer.contagem_ativa && !global.gameover_ativo && room != rmMenu && !global.jogo_pausado) {
    var hud_x = gui_w - 150;
	draw_sprite(sprFundoTempo, 0, hud_x - 50, 0);
    draw_set_font(fontTimer);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    var timer_atual = max(0, objTimer.timer);
    var mins_atual = floor(timer_atual / 60);
    var secs_atual = floor(timer_atual % 60);
    var mins_txt = string_replace_all(string_format(mins_atual, 2, 0), " ", "0");
    var secs_txt = string_replace_all(string_format(secs_atual, 2, 0), " ", "0");
    draw_text(hud_x, 15, "Time: " + mins_txt + ":" + secs_txt);

    if (instance_exists(objTimerEndStage)) {
        var melhor = objTimerEndStage.melhor_tempo;
        if (melhor != -1) {
            var mins = floor(melhor / 60);
            var secs = floor(melhor) mod 60;
            var ms   = floor((melhor - floor(melhor)) * 1000);
            var mins_m = string_replace_all(string_format(mins, 2, 0), " ", "0");
            var secs_m = string_replace_all(string_format(secs, 2, 0), " ", "0");
            var ms_m   = string_replace_all(string_format(ms, 3, 0), " ", "0");
            draw_text(hud_x, 40, "Best Time");
            draw_text(hud_x, 60, mins_m + ":" + secs_m + ":" + ms_m);
        } else {
            draw_text(hud_x, 40, "No record");
			draw_text(hud_x, 60, "yet!");

        }
    }
}

	// ================ TELA DE RECORDES ================
	if (digitando_nome) {
	    draw_sprite(sprFundoGameOver, 0, cx - sprite_get_width(sprFundoGameOver)/2, cy - sprite_get_height(sprFundoGameOver)/2);
	    draw_set_font(fontGameOver);
	    draw_set_color(c_white);
	    draw_set_halign(fa_center);
	    draw_text(cx, cy - 80, "NEW RECORD!");
	    draw_text(cx, cy - 40, "Enter your initials:");
	    draw_text(cx, cy, nome_recorde + string_repeat("_", max_letras - string_length(nome_recorde)));
	}

	if (mostrar_leaderboard && !digitando_nome) {
	    draw_sprite(sprFundoGameOver, 0, cx - sprite_get_width(sprFundoGameOver)/2, cy - sprite_get_height(sprFundoGameOver)/2);
	    draw_set_font(fontGameOver);
	    draw_set_color(c_white);
	    draw_set_halign(fa_center);
	    draw_text(cx, cy - 110, "TOP 3 RECORDS");

	    for (var i = 0; i < 3; i++) {
		var tempo = recordes_tempos[i];
		if (tempo < 9999.999) {
        var mins = floor(tempo / 60);
        var secs = floor(tempo) mod 60;
        var ms = floor((tempo - floor(tempo)) * 1000);

        var mins_txt = string_replace_all(string_format(mins, 2, 0), " ", "0");
        var secs_txt = string_replace_all(string_format(secs, 2, 0), " ", "0");
        var ms_txt   = string_replace_all(string_format(ms, 3, 0), " ", "0");

        var tempo_txt = mins_txt + ":" + secs_txt + ":" + ms_txt;
        draw_text(cx, cy - 90 + i * 30, recordes_nomes[i] + " - " + tempo_txt);
    } else {
        draw_text(cx, cy - 90 + i * 30, "--- - 00:00:000");
    }
}


    // Botão TRY AGAIN
    var try_x = cx - sprite_get_width(sprBotaoTryAgain) / 2;
    var try_y = cy - 20;
    draw_sprite(sprBotaoTryAgain, 0, try_x, try_y);

    if (mouse_check_button_pressed(mb_left)
        && mx > try_x && mx < try_x + sprite_get_width(sprBotaoTryAgain)
        && my > try_y && my < try_y + sprite_get_height(sprBotaoTryAgain)) {
        mostrar_leaderboard = false;
        global.jogo_pausado = false;
        digitando_nome = false;
        room_restart();
    }

    // Botão MENU
    var menu_x = cx - sprite_get_width(sprBotaoMenu) / 2;
    var menu_y = cy + 50;
    draw_sprite(sprBotaoMenu, 0, menu_x, menu_y);

    if (mouse_check_button_pressed(mb_left)
        && mx > menu_x && mx < menu_x + sprite_get_width(sprBotaoMenu)
        && my > menu_y && my < menu_y + sprite_get_height(sprBotaoMenu)) {
        mostrar_leaderboard = false;
        global.jogo_pausado = false;
        digitando_nome = false;
        room_goto(rmMenu);
    }
}
