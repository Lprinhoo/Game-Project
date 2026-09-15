function player_get_control() {
	
	key_left  = keyboard_check(vk_left) || keyboard_check(ord("A"));
		key_left = clamp(key_left, 0, 1);
	
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
		key_right = clamp(key_right, 0, 1);
		
	key_jump = keyboard_check(vk_space);
		key_jump = clamp(key_jump, 0, 1);
		
	key_dash = keyboard_check(vk_shift);
		key_dash = clamp(key_dash, 0, 1);
	
}
	
function player_set_variables() {
	hspd = 0;
	vspd = 0;

	grv  = 0.275;	
	
	coyote_count = 0;
	has_jump     = false;
	dash         = true;
}

function player_set_sprite() {
	var on_ground = place_meeting(x, y + 1, obj_solid);
	var img_spd = 0.5;
	
	if(hspd != 0) {
		sprite_index = spr_player_move;
		image_speed = img_spd;
	} else {
		sprite_index = spr_player_idle;	
		image_speed = img_spd;
	}

	if(!on_ground) {
		if(vspd < 0) {
			sprite_index = spr_player_jump;
		
			if(image_index > image_number - 1) {
				image_index = image_number - 1;
				image_speed = 0;	
			} else {
				image_speed = img_spd;	
			}
		} else {
			sprite_index = spr_player_fall;	
		
			if(image_index > image_number - 1) {
				image_index = image_number - 1;
				image_speed = 0;	
			} else {
				image_speed = img_spd;	
			}
		}
	}

	mask_index   = spr_player_idle;
	if (hspd != 0) {
	    image_xscale = sign(hspd) * 3;
	}
	
}
	
function player_set_moviment() {
	
	player_get_control();

	var max_hspd   = 4;
	var max_vspd   = 6;
	var max_coyote = 12;
	var on_ground  = place_meeting(x, y + 1, obj_solid);
	var dir = key_right - key_left;

	hspd = dir * max_hspd;

	if(on_ground) {
		
		coyote_count = max_coyote;
		has_jump     = false;
		dash		 = true;

	} else {
		if(coyote_count > 0) {coyote_count--;}
		vspd = min(vspd + grv, max_vspd);
		
		if(key_dash && dash) {
			x += sign(hspd) * 100;
			dash = false;
		}
	}
	
	if(key_jump) {
		if(coyote_count > 0 && !has_jump) {
			vspd		 = -max_vspd;
			has_jump     = true;
			coyote_count = 0;
		}
	}

	player_set_sprite();

	
}
	
function player_set_colision() {
	var col = instance_place(x + hspd, y, obj_solid);

	if(col) {
	
		if(hspd > 0) {x = col.bbox_left + (x - bbox_right)}
	
		if(hspd < 0) {x = col.bbox_right + (x - bbox_left)}
	
		hspd = 0;
	}

	x += hspd;

	col = instance_place(x, y + vspd, obj_solid);

	if(col) {
	
		if(vspd > 0) {y = col.bbox_top+ (y - bbox_bottom)}
	
		if(vspd < 0) {y = col.bbox_bottom + (y - bbox_top)}
	
		vspd = 0;
	}

	y += vspd;	
}