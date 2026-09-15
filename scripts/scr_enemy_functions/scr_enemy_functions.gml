function enemy_set_variables() {
	
	hspd = 2;
	
	timer = 300;
	
}

function enemy_set_moviment() {
	
	timer --;
	
	if(timer <= 0) {
		timer = 300;
		hspd *= -1;
	}
	
	enemy_set_sprite();
	
}

function enemy_set_colision() {

	var col = instance_place(x + hspd, y, obj_solid);

	if(col) {
	
		if(hspd > 0) {x = col.bbox_left + (x - bbox_right)}
	
		if(hspd < 0) {x = col.bbox_right + (x - bbox_left)}
	
		hspd *= -1;
	}

	x += hspd;
	
}

function enemy_set_sprite() {
	
	if(hspd != 0) {
		sprite_index = spr_enemy_move;
		image_xscale = 3 * sign(hspd)
	} else {
		sprite_index = spr_enemy_idle;	
	}
	
	image_speed  = 0.5;
	
}