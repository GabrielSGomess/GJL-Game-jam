// Começa a contagem se ainda não estiver contando e o timer está ativo
if (!contando && instance_exists(objTimer) && objTimer.contagem_ativa) {
    contando = true;
    tempo = 0;
}

// Se está contando, acumula tempo com delta_time em segundos
if (contando) {
    tempo += delta_time / 1000000;
}

// Atualiza o tempo final arredondado para 3 casas decimais
other.tempo_final = round(tempo * 1000) / 1000;

// Se o tempo acabou E ainda não está digitando nome nem mostrando leaderboard
