// Desenha o texto com transparência e cor
draw_set_alpha(alpha);
draw_set_color(cor);
draw_set_font(fntClockPlusTen);
draw_text(x,y,texto);
// Reseta configurações de desenho  
draw_set_alpha(1);
draw_set_color(c_white);