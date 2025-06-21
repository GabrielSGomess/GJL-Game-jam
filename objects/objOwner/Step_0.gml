if (global.jogo_pausado) {
    exit;
}

if (ativo && instance_exists(objTimer) && objTimer.timer <= 0) {
    instance_destroy();
}

