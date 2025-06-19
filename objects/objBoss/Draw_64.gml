if(instance_exists(objTimer)){
	var tempo_max = objTimer.tempo_max;
    var tempo_atual = objTimer.timer;
	
	var tela_inicio_x = 50;
	var tela_fim_x = display_get_gui_width() - 110;
	
	var frac_tempo = clamp((tempo_max - objTimer.timer) / tempo_max, 0, 1);
	
	var dono_x = lerp(tela_inicio_x, tela_fim_x, frac_tempo);
	
	var dono_y = 15;
	
	draw_sprite(sprite_index, image_index, dono_x, dono_y);
}