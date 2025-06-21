// No Step do objHUD, controle de input para digitação do nome
if (digitando_nome) {
    // Usar keyboard_check_pressed para detectar apenas o "primeiro frame" da tecla
    // Só aceitar letras A-Z
    for (var k = ord("A"); k <= ord("Z"); k++) {
        if (keyboard_check_pressed(k)) {
            if (string_length(nome_recorde) < 3) {
                nome_recorde += chr(k);
            }
        }
    }

    // Apagar com backspace
    if (keyboard_check_pressed(vk_backspace)) {
        if (string_length(nome_recorde) > 0) {
            nome_recorde = string_delete(nome_recorde, string_length(nome_recorde), 1);
        }
    }

    // Confirmar com Enter (só se nome tiver 3 letras)
    if (keyboard_check_pressed(vk_enter) && string_length(nome_recorde) == 3) {
        // Aqui você salva o recorde e muda o estado para mostrar leaderboard
        digitando_nome = false;
        mostrar_leaderboard = true;
        global.jogo_pausado = true;

        // Salvar no ini (exemplo)
        ini_open("recordes.ini");
        for (var i = 2; i > pos_recorde; i--) {
            ini_write_string("recordes", "nome" + string(i), recordes_nomes[i - 1]);
            ini_write_real("recordes", "tempo" + string(i), recordes_tempos[i - 1]);
            recordes_nomes[i] = recordes_nomes[i - 1];
            recordes_tempos[i] = recordes_tempos[i - 1];
        }
        ini_write_string("recordes", "nome" + string(pos_recorde), nome_recorde);
        ini_write_real("recordes", "tempo" + string(pos_recorde), tempo_recorde);
        ini_close();
    }
}

