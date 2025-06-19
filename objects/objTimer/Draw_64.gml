#region cronometro
draw_set_font(fontTimer)
draw_set_color(c_white);

timer = max (0, timer);

var mins = floor(timer / 60);

var secs = floor(timer % 60);

var mins_txt = string(mins);
if (mins < 10) mins_txt = "0" + mins_txt;
var secs_txt = string(secs);

if (secs < 10) secs_txt = "0" + secs_txt;
var display = mins_txt + ":" + secs_txt;

draw_text(1290, 19, display);
#endregion
