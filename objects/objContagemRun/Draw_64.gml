if (mostrar_texto && index < array_length(frases)) {
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    var cx = gui_w / 2;
    var cy = gui_h / 2;

    var spr = frases[index];
    draw_sprite(spr, 0, cx - sprite_get_width(spr) / 2, cy - sprite_get_height(spr) / 2);
}
