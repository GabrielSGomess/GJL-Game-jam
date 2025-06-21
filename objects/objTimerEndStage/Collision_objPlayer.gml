if (!fim_ativado) {
    fim_ativado = true;

    var tempo_final_resultado = round(tempo * 1000) / 1000;

    with (objHUD) {
        ini_open("recordes.ini");

        for (var i = 0; i < 3; i++) {
            recordes_nomes[i] = ini_read_string("recordes", "nome" + string(i), "---");
            recordes_tempos[i] = ini_read_real("recordes", "tempo" + string(i), 9999.999);
        }

        ini_close();

        var bateu = false;
        for (var i = 0; i < 3; i++) {
            if (tempo_final_resultado < recordes_tempos[i]) {
                digitando_nome = true;
                nome_recorde = "";
                tempo_recorde = tempo_final_resultado;
                pos_recorde = i;
                bateu = true;

                // Atualiza melhor_tempo no objTimerEndStage
                with (objTimerEndStage) {
                    melhor_tempo = tempo_final_resultado;
                }

                // Salva no .ini
                ini_open("dados.ini");
                ini_write_real("tempos", fase_nome, tempo_final_resultado);
                ini_close();

                break;
            }
        }

        if (!bateu) {
            mostrar_leaderboard = true;
        }

        global.jogo_pausado = true;
        global.podeMover = false;
    }

    show_debug_message("Colidiu com jogador!");
}
