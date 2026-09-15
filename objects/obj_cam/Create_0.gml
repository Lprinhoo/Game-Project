resolution_w = 1600;
resolution_h =  900;

resolution_scale = 2;

cam = view_camera[0];

view_spd = 0.1;

view_target = obj_player;

global.view_width  = resolution_w / resolution_scale;
global.view_height = resolution_h / resolution_scale;


window_set_size(global.view_width*resolution_scale, 
                global.view_height*resolution_scale);

surface_resize(application_surface, 
			   global.view_width*resolution_scale, 
			   global.view_height*resolution_scale);
			   
display_set_gui_size(global.view_width, global.view_height);

alarm[0] = 1;

if(instance_exists(view_target)) {
	
	var x1 = view_target.x - global.view_width  / 2;
	var y1 = view_target.y - global.view_height / 2;
	
	x1 = clamp(x1, 0, room_width  - global.view_width);
	y1 = clamp(y1, 0, room_height - global.view_height);
		
	camera_set_view_pos(cam, x1, y1);
	
}