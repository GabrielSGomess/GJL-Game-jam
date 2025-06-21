tempo = 0;
contando = false;
contagem_ativada = false;
melhor_tempo = -1;
game_frame_rate = 60;
fase_nome = room_get_name(room); // guarde isso se quiser reutilizar
// Create Event
fim_ativado = false;
mask_index = sprite_index; // garante máscara igual ao sprite


ini_open("dados.ini");
melhor_tempo = ini_read_real("tempos", fase_nome, -1); // aqui corrigido
ini_close();

