/// @description
draw_sprite(sprSombraSlime, 0, x, y + 3);
draw_self();

if(destinoX < x){
	image_xscale = -1;	
}else{
	image_xscale = 1;
}