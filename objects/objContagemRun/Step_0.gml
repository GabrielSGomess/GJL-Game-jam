if (mostrar_texto) {
    tempo += 1;

    if (tempo > frame_delay) {
        tempo = 0;
        index += 1;

        if (index >= array_length(frases)) {
            global.podeMover = true;

            // Ativa o timer e o dono
            var timer = instance_find(objTimer, 0);
            if (timer != noone) {
                timer.ativo = true;
                timer.visible = true;
            }
			if (instance_exists(objTimer)) {
			    objTimer.contagem_ativa = true;
			}

            var dono = instance_find(objOwner, 0);
            if (dono != noone) {
                dono.ativo = true;
                dono.visible = true;
            }

            var barreira = instance_find(objBarreiraVoltar, 0);
            if (barreira != noone) {
                barreira.ativo = true;
                barreira.visible = true;
            }

            instance_destroy(); // remove contagem
        }
    }
}
