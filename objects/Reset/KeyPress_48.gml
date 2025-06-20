if (file_exists("dados.ini")) {
    file_delete("dados.ini");
    show_debug_message("Arquivo dados.ini deletado!");
} else {
    show_debug_message("Arquivo dados.ini não existe.");
}
