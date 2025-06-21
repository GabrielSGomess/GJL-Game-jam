if not instance_exists(target) exit;
x = lerp(x, target.x, 0.15);
y = lerp(y, target.y-camHeight/6, 0.15);
camera_set_view_pos(view_camera[0], x-camWidth/2, y-camHeight/3);

var cam_x = camera_get_view_x (view_camera[0]);


layer_x("Background4",  cam_x * 0.15);
layer_x("Background3",  cam_x * 0.075);
layer_x("Background2", cam_x * 0.075);
layer_x("Background1", cam_x * 0.15);
