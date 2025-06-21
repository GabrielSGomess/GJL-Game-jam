if (place_meeting(x, y, objPlayer) && !activated) {
    activated = true;  // Marca essa instância como ativada

    global.checkpoint_x = round(x);
    global.checkpoint_y = round(y);
    global.checkpoint_room = room;

    var txt = instance_create_layer(x, y - 32, "Instances", objTextpoup);
    objTextpoup.texto = "Checkpoint!";

}
 visible = false