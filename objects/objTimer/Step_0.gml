if (global.jogo_pausado) {
    exit;
}
if (contagem_ativa) {
    timer -= delta_time / 1000000;

    if (timer <= 0) {
        timer = 0;
        contagem_ativa = false;

        if (!global.gameover_ativo) {
            global.gameover_ativo = true;
            
        }
    }
}
