/// @description Colisao Player
if(other.tomandoDano == true){
	var direcao = point_direction(x, y, other.x, other.y);
	with(other){
		empurrarDir = direcao;
		estado = PlayerTomandoDano;
		alarm[2] = 10;
		alarm[3] = 120;
		tomandoDano = false;
		vida -= 1;
	}	
}