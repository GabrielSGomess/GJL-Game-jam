moveX = keyboard_check(vk_right) - keyboard_check(vk_left);

/*
if (keyboard_check(ord("X")))
{
	moveX *= runSpeed;
}
else
{
	
}
*/
moveX *= moveSpeed;

// Lógica do pegador
if (!caught && keyboard_check_pressed(vk_space) && place_meeting(x, y, objCatcher)) {
    var catcher = instance_place(x, y, objCatcher);
    if (catcher != noone) {
        x = catcher.x; // Alinhar o x do jogador com o pegador
        y = catcher.bbox_bottom; // posicionar o jogador no fundo do agarrador
        caught = true;
    }
}

// Soltar o pegador se tiver fora dele
if (caught && !place_meeting(x, y, objCatcher)) {
    caught = false;
}

// Configurar para sair do pegador e pular junto 
if (caught && keyboard_check_pressed(vk_up)) {
    caught = false;
    moveY = -jumpSpeed;
    jumping = true;
    jumpTime = 1;
    coyoteTime = 0;
}

if (caught) {
    moveX = 0;
    moveY = 0;
}
else {
    if (place_meeting(x, y + 2, objGround))
    {
        moveSpeed = 7;
        moveY = 0;
        jumping = false;
        coyoteTime = maxCoyoteTime;
    }
    else
    {
        if (coyoteTime > 0)
        {
            coyoteTime -= 1;
        }
    }

    if (keyboard_check_pressed(vk_up) && (coyoteTime > 0 || place_meeting(x, y + 2, objGround)))
    {
        moveY = -jumpSpeed;
        jumping = true;
        jumpTime = 1;
        coyoteTime = 0;
    }

    if (!place_meeting(x, y + 2, objGround))
    {
        if (jumping && keyboard_check(vk_up) && jumpTime <= maxJumpTime)
        {
            moveY -= 1;
            moveSpeed = 6.5;
            jumpTime += 1;
        }
        else
        {
            jumping = false;
        }
    }

    if (!place_meeting(x, y + 2, objGround) && coyoteTime <= 0)
    {
        if (moveY < 0)
        {
            moveY += 2;
        }
        else if (moveY < 10)
        {
            moveSpeed = 6;
            moveY += 4;
        }
    }

    if (moveY < 0 && place_meeting(x, y + moveY, objGround))
    {
        while (place_meeting(x, y, objGround))
        {
            y += 1;
        }
        moveY = 2;
    }
}

// Movimento horizontal com colisão pixel a pixel
var signX = sign(moveX);
repeat(abs(moveX)) {
	if (!place_meeting(x + signX, y, objGround)) {
		x += signX;
	} else {
		break;
	}
}

// Movimento vertical com colisão pixel a pixel
var signY = sign(moveY);
repeat(abs(moveY)) {
	if (!place_meeting(x, y + signY, objGround)) {
		y += signY;
	} else {
		break;
	}
}

if (moveX != 0)
{
	image_xscale = sign(moveX);
}

// Troca de sprites conforme o estado do jogador
if (caught) {
    sprite_index = sprPlayerCatching;
}
else if (!place_meeting(x, y + 1, objGround)) {
    if (moveY < 0) {
        sprite_index = sprPlayerGoingUp;
    } else {
        sprite_index = sprPlayerGoingDown;
    }
}
else if (moveX != 0) {
    sprite_index = sprPlayerWalk; // (caso tenha sprite de andar)
}
else {
    sprite_index = sprPlayerIdle;
}

// colisao com o objfood e ganho de tempo e textp de poup
if (place_meeting(x, y, objFood)) {
    var food = instance_place(x, y, objFood);
    if (food != noone) {	
      objTimer.timer += food.tempo_extra;
      
	  var txt = instance_create_layer(food.x,food.y,"Instances",objTextpoup);
	  txt.text = "+" + string(food.tempo_extra) + "s";
		
        instance_destroy(food);
    }
	
}
// tecla para volta ao check point
var tecla_voltar = 82; // 82 é o código ASCII para 'R'
if (keyboard_check_pressed(tecla_voltar))
{
	if (variable_global_exists("checkpoint_x") 
        && variable_global_exists("checkpoint_y"))
	    && global.checkpoint_x != undefined
		&& global.checkpoint_y != undefined      
    {
        // Teleporta EXATAMENTE para o ícone
        x = global.checkpoint_x;
        y = global.checkpoint_y;
	}
}

show_debug_message(moveSpeed, moveSpeed);