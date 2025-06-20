#region timer
if (is_counting){

timer = timer - delta_time/1000000
if(timer <=0){
	timer = 0
	is_counting = false
 }
}
 #endregion
 if (timer <= 0 && !global.gameover_ativo) {
    timer = 0;
    is_counting = false;
    contagem_ativa = false;
    global.gameover_ativo = true;
}