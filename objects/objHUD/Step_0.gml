if (digitando_nome) {
    for (var k = ord("A"); k <= ord("Z"); k++) {
        if (keyboard_check_pressed(k)) {
            if (string_length(nome_recorde) < 3) {
                nome_recorde += chr(k);
            }
        }
    }

    if (keyboard_check_pressed(vk_backspace)) {
        if (string_length(nome_recorde) > 0) {
            nome_recorde = string_delete(nome_recorde, string_length(nome_recorde), 1);
        }
    }

    if (keyboard_check_pressed(vk_enter) && string_length(nome_recorde) == 3) {
        // Agora sim atualiza arrays e salva no ini
        for (var i = 2; i > pos_recorde; i--) {
            recordes_nomes[i] = recordes_nomes[i - 1];
            recordes_tempos[i] = recordes_tempos[i - 1];
        }
        recordes_nomes[pos_recorde] = nome_recorde;
        recordes_tempos[pos_recorde] = tempo_recorde;

        // Salva no ini
        ini_open("recordes.ini");
        for (var i = 0; i < 3; i++) {
            ini_write_string("recordes", "nome" + string(i), recordes_nomes[i]);
            ini_write_real("recordes", "tempo" + string(i), recordes_tempos[i]);
        }
        ini_close();

        // Atualiza estado
        digitando_nome = false;
        mostrar_leaderboard = true;
        global.jogo_pausado = true;
    }
}
