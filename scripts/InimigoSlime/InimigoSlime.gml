// Script assets have changed for v2.3.0 see
function Colisao(){
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
	
function ChecarPlayer(){
	if(distance_to_object(objPlayer) <= distVisao){
		estado = SlimePerseguindo;
	}
}

function EscolheEstado(){
	proximoEstado = choose(SlimeAndando, SlimeParado);
	if(proximoEstado == SlimeAndando){
		estado = SlimeAndando;	
		destinoX = irandom_range(0, room_width);
		destinoY = irandom_range(0, room_height);
	}else{
		estado = SlimeParado;		
	}
	ChecarPlayer();
}

function SlimeAndando(){
	ChecarPlayer();	
	image_speed = 1;
	if(distance_to_point(destinoX, destinoY) > veloc){
		var direcao = point_direction(x, y, destinoX, destinoY);
		hVeloc = lengthdir_x(veloc, direcao);
		vVeloc = lengthdir_y(veloc, direcao);
		Colisao();
	}else{
		x = destinoX;
		y = destinoY;
	}
}

function SlimeParado(){
	image_speed = 0.5;	
	ChecarPlayer();
}

function SlimePerseguindo(){
	image_speed = 1.5;
	destinoX = objPlayer.x;
	destinoY = objPlayer.y;
	
	var direcao = point_direction(x, y, destinoX, destinoY);
	hVeloc = lengthdir_x(velocPerseg, direcao);
	vVeloc = lengthdir_y(velocPerseg, direcao);
	Colisao();
	if(distance_to_object(objPlayer) >= distPerdaVisao){
		estado = EscolheEstado;
		alarm[0] = irandom_range(120, 240);
	}
}

function SlimeTomandoDano(){
	empurrarVeloc = lerp(empurrarVeloc, 0, 0.2);
	
	hVeloc = lengthdir_x(empurrarVeloc, empurrarDir);
	vVeloc = lengthdir_y(empurrarVeloc, empurrarDir);
	Colisao();
}