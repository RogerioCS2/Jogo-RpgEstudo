// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerColisao(){
	if(place_meeting(x + hVeloc, y, objParede)){
		while !place_meeting(x + sign(hVeloc), y, objParede){
			x += sign(hVeloc);			
		}
		hVeloc = 0;	
	}

	if(place_meeting(x, y + vVeloc, objParede)){
		while !place_meeting(x, y + sign(hVeloc), objParede){
			y += sign(vVeloc);			
		}
		vVeloc = 0;	
	}

	x += hVeloc;
	y += vVeloc;
}


function MovimentoPlayer(){
	cima = keyboard_check(vk_up);
	baixo = keyboard_check(vk_down);
	direita = keyboard_check(vk_right);
	esquerda = keyboard_check(vk_left);
	
	/*
	MOVIMENTO VERSÃO ANTERIOR
		hVeloc = (direita - esquerda) * veloc;
		vVeloc = (baixo - cima) * veloc;	
	*/
	
	hVeloc = (direita - esquerda);
	vVeloc = (baixo - cima);
	
	velocDir = point_direction(x, y, x + hVeloc, y + vVeloc);
	
	if(hVeloc != 0 or vVeloc != 0){
		veloc = 2;
	}else{
		veloc = 0;
	}
	
	hVeloc = lengthdir_x(veloc, velocDir);
	vVeloc = lengthdir_y(veloc, velocDir);
	
	PlayerColisao();

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
	
	if(resistencia >= 10){
		if(mouse_check_button_pressed(mb_right)){
			resistencia -= 10;
			alarm[1] = 180;
			alarm[0] = 12;
			direcaoTransporte = point_direction(x, y, mouse_x, mouse_y);
			estado = Transport; 		
		}
	}
	
	if(mouse_check_button_pressed(mb_left)){
		image_index = 0;
		switch dir{
			case 0:
				sprite_index = sprAtacandoDireita;		
			break
			case 1:	
				sprite_index = sprAtacandoCima;
			break
			case 2:
				sprite_index = sprAtacandoEsquerda;
			break
			case 3:	
				sprite_index = sprAtacandoBaixo;
			break
			default:
				sprite_index = sprAtacandoDireita;
			break
		}
		estado = PersonagemAtacando;
	}
}

function Transport(){
	hVeloc = lengthdir_x(velocidadeTransporte, direcaoTransporte); 	
	vVeloc = lengthdir_y(velocidadeTransporte, direcaoTransporte);
	
	PlayerColisao();
	
	var transpIntancia = instance_create_layer(x, y, "Instances", odjTransporte);
	transpIntancia.sprite_index = sprite_index;
}

function PersonagemAtacando(){
	if(image_index >= 1){
		if(atacar == false){
			switch dir{
				case 0:
					instance_create_layer(x + 10, y, "Instances", objColisaoAtaque);		
				break
				case 1:
					instance_create_layer(x, y - 10, "Instances", objColisaoAtaque);		
				break
				case 2:
					instance_create_layer(x - 10, y, "Instances", objColisaoAtaque);		
				break
				case 3:
					instance_create_layer(x, y + 10, "Instances", objColisaoAtaque);		
				break
				default:
					instance_create_layer(x + 10, y, "Instances", objColisaoAtaque);		
				break
			}
			atacar = true;
		}
	}
	
	if (FimAnimacao()){
		estado = MovimentoPlayer;	
		atacar = false;
	}
}

