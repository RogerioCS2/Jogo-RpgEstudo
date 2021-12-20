/// @description 
draw_sprite(sprSombraPlayer, 0, x, y + 6);
draw_self();

if(alarm[3] > 0){
	if(image_alpha >= 1){
		efeitoDano = -0.05; 		
	}else if(image_alpha <= 0){
		efeitoDano = 0.05;		
	}
	image_alpha += efeitoDano;
}else{
	image_alpha = 1;	
}

