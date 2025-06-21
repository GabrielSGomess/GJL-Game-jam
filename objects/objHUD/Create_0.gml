global.gameover_ativo = false;
fase_nome = room_get_name(room);

// Inicializa arrays de recordes
recordes_nomes = array_create(3, "---");
recordes_tempos = array_create(3, 9999.999);

// Controle da tela de digitação de nome
digitando_nome = false;
nome_recorde = "";
tempo_recorde = 0;
pos_recorde = -1;

// Número máximo de letras
max_letras = 3;

// Mostrar leaderboard depois da digitação
mostrar_leaderboard = false;
global.jogo_pausado = false;

