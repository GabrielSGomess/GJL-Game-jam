if (instance_exists(objTimer) && objTimer.contagem_ativa) {

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

