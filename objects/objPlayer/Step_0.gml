/// @description Update

cima = keyboard_check(vk_up);
baixo = keyboard_check(vk_down);
direita = keyboard_check(vk_right);
esquerda = keyboard_check(vk_left);

hVeloc = (direita - esquerda) * veloc;
vVeloc = (baixo - cima) * veloc;

if( place_meeting(x + hVeloc, y, objParede)){
	while !place_meeting(x + sign(hVeloc), y, objParede){
		x += sign(hVeloc);			
	}
	hVeloc = 0;	
}

if( place_meeting(x, y + vVeloc, objParede)){
	while !place_meeting(x, y + sign(hVeloc), objParede){
		y += sign(vVeloc);			
	}
	vVeloc = 0;	
}

x += hVeloc;
y += vVeloc;

dir = floor((point_direction(x, y, mouse_x, mouse_y) +45) / 90);

if(hVeloc == 0 and vVeloc == 0){
	switch dir{
		case 0:
			sprite_index = sprParadoDireira;		
		break
		case 1:	
			sprite_index = sprParadoCima;
		break
		case 2:
			sprite_index = sprParadoEsquerda;
		break
		case 3:	
			sprite_index = sprParadoBaixo;
		break
		default:
			sprite_index = sprParadoDireira;
		break
	}
}else{
		switch dir{
		case 0:
			sprite_index = sprCorrendoDireita;		
		break
		case 1:	
			sprite_index = sprCorrendoCima;
		break
		case 2:
			sprite_index = sprCorrendoEsquerda;
		break
		case 3:	
			sprite_index = sprCorrendoBaixo;
		break
		default:
			sprite_index = sprCorrendoDireita;
		break
	}	
}

