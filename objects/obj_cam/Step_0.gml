camera_set_view_size(cam, global.view_width, global.view_height);

if(instance_exists(view_target)) {
	
	var x1 = view_target.x - global.view_width  / 2;
	var y1 = view_target.y - global.view_height / 2;
	
	x1 = clamp(x1, 0, room_width  - global.view_width);
	y1 = clamp(y1, 0, room_height - global.view_height);
	
	var cx = camera_get_view_x(cam);
	var cy = camera_get_view_y(cam);
	
	camera_set_view_pos(cam, lerp(cx, x1, view_spd), lerp(cy, y1, view_spd));
	
}