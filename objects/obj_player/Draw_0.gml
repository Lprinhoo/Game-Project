draw_self();

if(key_dash && vspd != 0 && hspd != 0) {
	var offset = 20;
	var dir = sign(image_xscale) * 2
	draw_sprite_ext(spr_player_dash, image_index, x - (offset * dir), y + offset, 3, 3, 0, c_white, 1);
}