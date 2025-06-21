// Pegando input logo no começo
var tecla_pulo_press = keyboard_check_pressed(ord("W"));
var tecla_pulo_segura = keyboard_check(ord("W"));

if (global.podeMover && (moveX != 0 || moveY != 0)) {
    image_speed = 1;
}

if (global.jogo_pausado || global.gameover_ativo || !global.podeMover) {
    moveX = 0;
    moveY = 0;
    moveSpeed = 0;

    sprite_index = sprPlayerIdle;
    image_speed = 0;

    exit;
}

moveX = keyboard_check(ord("D")) - keyboard_check(ord("A"));
moveX *= moveSpeed;
var acabou_de_sair_do_catcher = false;

if (!caught && keyboard_check_pressed(vk_space) && place_meeting(x, y, objCatcher)) {
    var catcher = instance_place(x, y, objCatcher);
    if (catcher != noone) {
        x = catcher.x - 5;
        y = catcher.bbox_bottom - 5;
        caught = true;
    }
}

if (caught && !place_meeting(x, y, objCatcher)) {
    caught = false;
}

if (caught && tecla_pulo_press) {
    caught = false;
    moveY = -jumpSpeed;
    jumping = true;
    jumpTime = 1;
    coyoteTime = 0;
    if (!acabou_de_sair_do_catcher) {
        usou_pulo_duplo = false;
        pode_pular_duplo = false;
    }
}

if (caught) {
    moveX = 0;
    moveY = 0;
} else {
    if (place_meeting(x, y + 2, objGround)) {
        moveSpeed = 7;
        moveY = 0;
        jumping = false;
        coyoteTime = maxCoyoteTime;
        usou_pulo_duplo = false;
        pode_pular_duplo = true;
    } else {
        if (pulo_duplo && !usou_pulo_duplo && moveY > 0 && !jumping && !pode_pular_duplo) {
            pode_pular_duplo = true;
        }

        if (coyoteTime > 0) {
            coyoteTime -= 1;
        }
    }

    if (tecla_pulo_press && !jumping && (coyoteTime > 0 || place_meeting(x, y + 2, objGround))) {
        moveY = -jumpSpeed;
        jumping = true;
        jumpTime = 1;
        coyoteTime = 0;
        usou_pulo_duplo = false;
        pode_pular_duplo = false;
    } else if (tecla_pulo_press && pulo_duplo && !usou_pulo_duplo && pode_pular_duplo) {
        moveY = -jumpSpeed;
        jumping = true;
        jumpTime = 1;
        usou_pulo_duplo = true;
        pode_pular_duplo = false;
    }

    if (!place_meeting(x, y + 2, objGround)) {
        if (jumping && tecla_pulo_segura && jumpTime <= maxJumpTime) {
            moveY -= 1;
            moveSpeed = 6.5;
            jumpTime += 1;
        } else {
            jumping = false;
        }
    }

    if (!place_meeting(x, y + 2, objGround) && coyoteTime <= 0) {
        if (moveY < 0) {
            moveY += 2;
        } else if (moveY < 10) {
            moveSpeed = 6;
            moveY += 4;
        }
    }

    if (moveY < 0 && place_meeting(x, y + moveY, objGround)) {
        while (place_meeting(x, y, objGround)) {
            y += 1;
        }
        moveY = 2;
    }
}

var podeAndarX = true;
var signX = sign(moveX);
repeat(abs(moveX)) {
    podeAndarX = !place_meeting(x + signX, y, objGround);

    if (place_meeting(x + signX, y, objBarreiraVoltar)) {
        var barreira = instance_place(x + signX, y, objBarreiraVoltar);
        if (barreira != noone && barreira.ativo) {
            podeAndarX = false;
        }
    }

    if (podeAndarX) {
        x += signX;
    } else {
        break;
    }
}

var podeAndarY = true;
var signY = sign(moveY);
repeat(abs(moveY)) {
    podeAndarY = !place_meeting(x, y + signY, objGround);

    if (place_meeting(x, y + signY, objBarreiraVoltar)) {
        var barreira = instance_place(x, y + signY, objBarreiraVoltar);
        if (barreira != noone && barreira.ativo) {
            podeAndarY = false;
        }
    }

    if (podeAndarY) {
        y += signY;
    } else {
        break;
    }
}

if (moveX != 0) {
    image_xscale = sign(moveX);
}

var onGround = place_meeting(x, y + 4, objGround); // Aumentei a distância para detectar o chão

if (tem_coleira) {
    if (caught) {
        sprite_index = sprPlayerCatchingCollar;
    } else if (onGround) {
        if (moveX != 0) {
            sprite_index = sprPlayerWalkCollar;
        } else {
            sprite_index = sprPlayerIdleCollar;
        }
    } else {
        // No ar
        if (moveY < 0) {
            sprite_index = sprPlayerGoingUpCollar;
        } else {
            sprite_index = sprPlayerGoingDownCollar;
        }
    }
} else {
    if (caught) {
        sprite_index = sprPlayerCatching;
    } else if (onGround) {
        if (moveX != 0) {
            sprite_index = sprPlayerWalk;
        } else {
            sprite_index = sprPlayerIdle;
        }
    } else {
        // No ar
        if (moveY < 0) {
            sprite_index = sprPlayerGoingUp;
        } else {
            sprite_index = sprPlayerGoingDown;
        }
    }
}
if (place_meeting(x, y, objFood)) {
    var food = instance_place(x, y, objFood);
    if (food != noone) {
        objTimer.timer += food.tempo_extra;

        var txt = instance_create_layer(food.x, food.y, "Instances", objTextpoup);
        txt.text = "+" + string(food.tempo_extra) + "s";

        instance_destroy(food);
    }
}