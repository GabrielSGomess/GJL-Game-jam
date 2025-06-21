// ========== CONFIG GERAL ==========
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
var cx = gui_w / 2;
var cy = gui_h / 2;
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// ========== FUNDO ==========
draw_sprite(sprCredits, 0, 0, 0);

// ========== TEXTO DE CRÉDITOS ==========
draw_set_font(fontCredits);
draw_set_color(c_white);
draw_set_halign(fa_center);

var inicio_y = cy - array_length(creditos_texto) * 20 / 2;

for (var i = 0; i < array_length(creditos_texto); i++) {
    draw_text(cx, inicio_y  + i * 30, creditos_texto[i]);
}

// ========== BOTÃO MENU ==========
var menu_x = cx - sprite_get_width(sprBotaoMenu) / 2;
var menu_y = gui_h - 100;

draw_sprite(sprBotaoMenu, 0, menu_x, menu_y);

// Clique no botão
if (mouse_check_button_pressed(mb_left)
    && mx > menu_x && mx < menu_x + sprite_get_width(sprBotaoMenu)
    && my > menu_y && my < menu_y + sprite_get_height(sprBotaoMenu)) {
    room_goto(rmMenu);
}
