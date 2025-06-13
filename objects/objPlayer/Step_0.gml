moveX = keyboard_check(vk_right)- keyboard_check(vk_left);

//Movimento de corrida
if keyboard_check(ord("X"))
{
	moveX *= runSpeed;
} else 
{
	moveX *= moveSpeed;
}


//colisão com o chão
if(place_meeting(x, y+2, objGround))
{
	moveY = 0;
	jumping = false;
	if (keyboard_check_pressed(vk_space))
	{
	moveY = -jumpSpeed;
	jumping = true;
	jumpTime = 1;
	}
} else 
{
	if (jumping && keyboard_check(vk_space) && jumpTime <= maxJumpTime)
	{
		moveY -= 1;
		jumpTime += 1;
	} else 
	{
		jumping = false;
	}
}


if (!place_meeting(x, y + 2, objGround)) 
{
    if (moveY < 0) 
	{
        moveY += 2; 
    } else if (moveY < 10) 
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
move_and_collide(moveX, moveY, objGround);

if (moveX !=0) image_xscale = sign(moveX);
