/// @description

if(tomandoDano){
	gpu_set_fog(true, c_red, 0, 0);
	draw_sprite(sombra, image_index, x, y + 6);
	draw_self();
	gpu_set_fog(false, c_red, 0, 0);
}else{
	draw_sprite(sombra, image_index, x, y + 6);
	draw_self();	
}

if(destinoX < x){
	image_xscale = -1;	
}else{
	image_xscale = 1;
}