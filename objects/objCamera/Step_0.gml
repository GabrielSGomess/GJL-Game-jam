if not instance_exists(target) exit;
x = lerp(x, target.x, 0.1);
y = lerp(y, target.y-camHeight/5, 0.1);
camera_set_view_pos(view_camera[0], x-camWidth/2, y-camHeight/3);