if not instance_exists(target) exit;
x = lerp(x, target.x, 0.15);
y = lerp(y, target.y-camHeight/6, 0.15);
camera_set_view_pos(view_camera[0], x-camWidth/2, y-camHeight/3);
