// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MovimentoPlayer(){
	cima = keyboard_check(vk_up);
	baixo = keyboard_check(vk_down);
	direita = keyboard_check(vk_right);
	esquerda = keyboard_check(vk_left);

	hVeloc = (direita - esquerda) * veloc;
	vVeloc = (baixo - cima) * veloc;
	
	/*
	
	*/

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
	
	if(mouse_check_button_pressed(mb_right)){
		alarm[0] = 12;
		direcaoTransporte = point_direction(x, y, mouse_x, mouse_y);
		estado = Transport; 		
	}
}

function Transport(){
	hVeloc = lengthdir_x(velocidadeTransporte, direcaoTransporte); 	
	vVeloc = lengthdir_y(velocidadeTransporte, direcaoTransporte);
	
	x += hVeloc;
	y += vVeloc;
	
	var transpIntancia = instance_create_layer(x, y, layer, odjTransporte);
	transpIntancia.sprite_index = sprite_index;
}