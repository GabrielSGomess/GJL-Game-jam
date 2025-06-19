if (mostrar_texto && index < array_length(frases)) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fontRun); // ou qualquer fonte que esteja usando
    draw_text(display_get_gui_width()/2, display_get_gui_height()/2, frases[index]);
}
