/// @description Update
script_execute(estado);
depth = -y;

if(alarm[1] <= 0){
	resistencia	+= 1;	
}

resistencia = clamp(resistencia, 0, resitenciaMaxima[objPlayer.level]);

