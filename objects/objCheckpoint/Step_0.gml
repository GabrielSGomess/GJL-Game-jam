if(place_meeting(x,y,objPlayer))
{
	// Salva APENAS a posição do ÍCONE, nunca valores aleatórios
    global.checkpoint_x = round(x);  // << Usamos round() para evitar decimais
    global.checkpoint_y = round(y);
    global.checkpoint_room = room;
    
}
