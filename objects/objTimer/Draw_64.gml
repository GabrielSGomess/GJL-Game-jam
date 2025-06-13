draw_set_font(fontTimer)

timer = max (0, timer);
var mins = floor(timer / 60);
var secs = floor(timer % 60);
var mins_txt = string(mins);
if (mins < 10) mins_txt = "0" + mins_txt;
var secs_txt = string(secs);
if (secs < 10) secs_txt = "0" + secs_txt;
var display = mins_txt + ":" + secs_txt;
draw_text(1200, 32, display);
show_debug_message("Valor real: " + string(timer) + " | Formatado: " + display);