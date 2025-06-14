// Input movement
moveX = keyboard_check(vk_right) - keyboard_check(vk_left);

// Run speed
if (keyboard_check(ord("X")))
{
	moveX *= runSpeed;
}
else
{
	moveX *= moveSpeed;
}

// === Coyote Time Setup ===
// coyoteTime and maxCoyoteTime must be defined in the Create Event:
// coyoteTime = 0;
// maxCoyoteTime = 5;

// Ground check
if (place_meeting(x, y + 2, objGround))
{
	moveY = 0;
	jumping = false;
	coyoteTime = maxCoyoteTime; // Reset coyote time when on ground
}
else
{
	if (coyoteTime > 0)
	{
		coyoteTime -= 1;
	}
}

// Jump initiation 
if (keyboard_check_pressed(vk_space) && (coyoteTime > 0 || place_meeting(x, y + 2, objGround)))
{
	moveY = -jumpSpeed;
	jumping = true;
	jumpTime = 1;
	coyoteTime = 0; // Disable coyote time after jump
}

// Variable jump height (hold jump)
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

// Gravity
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

// Ceiling collision fix
if (moveY < 0 && place_meeting(x, y + moveY, objGround))
{
	while (place_meeting(x, y, objGround))
	{
		y += 1;
	}
	moveY = 2;
}

// Movement and collision
move_and_collide(moveX, moveY, objGround);

// Flip sprite
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