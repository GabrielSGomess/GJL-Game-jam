if (!contando && instance_exists(objTimer) && objTimer.contagem_ativa) {
    contando = true;
    tempo = 0;
}

if (contando) {
    tempo += delta_time / 1000000;
}


