moveX = keyboard_check(ord("D")) - keyboard_check(ord("A"));
moveX *= moveSpeed;
var tecla_pulo_press= keyboard_check_pressed(ord("W"));
var tecla_pulo_segura = keyboard_check(ord("W"));
var acabou_de_sair_do_catcher = false;
   

// Lógica do pegador
if (!caught && keyboard_check_pressed(vk_space) && place_meeting(x, y, objCatcher)) {
    var catcher = instance_place(x, y, objCatcher);
    if (catcher != noone) {
        x = catcher.x +1;
        y = catcher.bbox_bottom;
        caught = true;
		
    }
}

if (caught && !place_meeting(x, y, objCatcher)) {
    caught = false;
}

if (caught && keyboard_check_pressed(ord("W"))) {
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
}
else {
    if (place_meeting(x, y + 2, objGround))
    {
        moveSpeed = 7;
        moveY = 0;
        jumping = false;
        coyoteTime = maxCoyoteTime;
		usou_pulo_duplo = false;
		pode_pular_duplo = true;
    }
    else
    {
		if (pulo_duplo && !usou_pulo_duplo && moveY > 0 && !jumping && !pode_pular_duplo)
		{
		pode_pular_duplo = true;
		}

        if (coyoteTime > 0)
        {
            coyoteTime -= 1;
        }
    }
 
	if (tecla_pulo_segura && !jumping && (coyoteTime > 0 || place_meeting(x, y + 2, objGround))) {
    moveY = -jumpSpeed;
    jumping = true;
    jumpTime = 1;
    coyoteTime = 0;
    usou_pulo_duplo = false;
    pode_pular_duplo = false;
	}
	// Pulo duplo só com tecla pressionada nova
	else if (tecla_pulo_press && pulo_duplo && !usou_pulo_duplo && pode_pular_duplo) {
    moveY = -jumpSpeed;
    jumping = true;
    jumpTime = 1;
    usou_pulo_duplo = true;
    pode_pular_duplo = false;
}
    if (!place_meeting(x, y + 2, objGround))
    {
        if (jumping && tecla_pulo_segura && jumpTime <= maxJumpTime)
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
var onGround = place_meeting(x, y + 1, objGround);

if (caught) {
    sprite_index = sprPlayerCatching;
}
else if (!onGround) {
    if (moveY < 0) {
        sprite_index = sprPlayerGoingUp;
    } else {
        sprite_index = sprPlayerGoingDown;
    }
}
else if (moveX != 0) {
    sprite_index = sprPlayerWalk;
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
        x = global.checkpoint_x;
        y = global.checkpoint_y;
	}
}