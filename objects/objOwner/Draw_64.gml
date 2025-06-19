if (ativo && instance_exists(objTimer)) {
    var tempo_max = objTimer.tempo_max;
    var tempo_atual = objTimer.timer;

    // Proporção do tempo decorrido
    var frac_tempo = clamp((tempo_max - tempo_atual) / tempo_max, 0, 1);

    // Posição na tela (da esquerda pra direita)
    var tela_inicio_x = 50;
    var tela_fim_x = display_get_gui_width() - 110;

    var dono_x = lerp(tela_inicio_x, tela_fim_x, frac_tempo);
    var dono_y = 15;

    // Desenha o sprite do "dono" na posição da interface
    draw_sprite(sprite_index, image_index, dono_x, dono_y);
}
