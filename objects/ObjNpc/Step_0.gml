if (!falou && place_meeting(x, y, objPlayer)) {
    var fala = instance_create_layer(x, y - 32, "Instances", objBalaoFala);
    fala.texto = "Corre, chefe!";
    fala.npc = id;
	falou = true; // só fala uma vez
}