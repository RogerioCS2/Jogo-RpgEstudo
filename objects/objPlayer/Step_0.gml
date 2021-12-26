/// @description Update
script_execute(estado);
depth = -y;

if(alarm[1] <= 0){
	resistencia	+= 1;	
}

resistencia = clamp(resistencia, 0, resitenciaMaxima[objPlayer.level]);

if(keyboard_check_pressed(ord("E"))){
	arma += 1;	
}

if(keyboard_check_pressed(ord("Q"))){
	arma -= 1;	
}

if(arma > Armas.tamanho){
	arma = 0; 
}else if(arma < 0){
	arma = Armas.tamanho - 1;
}