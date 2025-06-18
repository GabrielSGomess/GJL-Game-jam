if(instance_exists(ObjNpc))
{
 x = npc.x;
 y = npc.y - 40;
} else {
	instance_destroy();
}

tempo_vida -= 1;
if(tempo_vida <= 0)
{
	instance_destroy();
}