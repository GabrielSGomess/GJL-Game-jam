moveX = keyboard_check(vk_right) - keyboard_check(vk_left);

if (keyboard_check(ord("X")))
{
	moveX *= runSpeed;
}
else
{
	moveX *= moveSpeed;
}

if (place_meeting(x, y + 2, objGround))
{
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

if (keyboard_check_pressed(vk_space) && (coyoteTime > 0 || place_meeting(x, y + 2, objGround)))
{
	moveY = -jumpSpeed;
	jumping = true;
	jumpTime = 1;
	coyoteTime = 0;
}

if (!place_meeting(x, y + 2, objGround))
{
	if (jumping && keyboard_check(vk_space) && jumpTime <= maxJumpTime)
	{
		moveY -= 1;
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

// colisao com o objfood e ganho de tempo
if (place_meeting(x, y, objFood)) {
	var food = instance_place(x, y, objFood);
	if (food != noone) {
		with (objTimer) 
		{
			timer += food.tempo_extra;
		}
		instance_destroy(food);
	}
}