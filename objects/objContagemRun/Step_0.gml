if (mostrar_texto) {
    tempo += 1;

    if (tempo > frame_delay) {
        tempo = 0;
        index += 1;

        if (index >= array_length(frases)) {
            // Libera movimento se o jogo estiver normal
            if (!global.jogo_pausado && !global.gameover_ativo) {
                global.podeMover = true;	
            }

            // Ativa o timer
            var timer = instance_find(objTimer, 0);
            if (timer != noone) {
                timer.ativo = true;
                timer.visible = true;
                timer.contagem_ativa = true;
            }

            // Ativa o dono
            var dono = instance_find(objOwner, 0);
            if (dono != noone) {
                dono.visible = true;
                dono.ativo = true;
            }

            // Ativa a barreira
            var barreira = instance_find(objBarreiraVoltar, 0);
            if (barreira != noone) {
                barreira.ativo = true;
                barreira.visible = true;
            }

            // Finaliza contagem
            instance_destroy();
        }
    }
}
