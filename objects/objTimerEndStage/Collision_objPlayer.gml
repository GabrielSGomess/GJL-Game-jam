if (contando) {
    contando = false;

    var tempo_final = round(tempo * 100) / 100;
    var fase_nome = room_get_name(room);

    ini_open("dados.ini");
    var melhor_tempo_salvo = ini_read_real("tempos", fase_nome, -1); // aqui corrigido

    if (melhor_tempo_salvo == -1 || tempo_final < melhor_tempo_salvo) {
        ini_write_real("tempos", fase_nome, tempo_final); // aqui corrigido
        melhor_tempo = tempo_final;
    } else {
        melhor_tempo = melhor_tempo_salvo;
    }

    ini_close();

  
}
 room_restart();