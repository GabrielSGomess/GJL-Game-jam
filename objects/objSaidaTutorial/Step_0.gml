if (place_meeting(x, y, objPlayer)) {
    global.podeMover = false;

    instance_create_layer(x, y, "Instances", objContagemRun);

    instance_destroy();
}

visible = false;
