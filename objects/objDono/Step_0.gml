if(instance_exists(objTimer)){	
	var tempo_atual = objTimer.timer;
	var tempo_max = objTimer.tempo_max;
	var frac_tempo = clamp((tempo_max - tempo_atual) / tempo_max, 0, 1);
	
	
	x = lerp(pos_inicial_x, pos_final_x, frac_tempo);
}