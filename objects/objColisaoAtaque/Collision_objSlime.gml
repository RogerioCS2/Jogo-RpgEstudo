/// @description Variaveis
other.vida -= objPlayer.dano;
var direcao = point_direction(objPlayer.x, objPlayer.y, other.x, other.y);
other.empurrarDir = direcao;
other.empurrarVeloc = 8;
other.estado = SlimeTomandoDano;
other.alarm[1] = 5;
other.tomandoDano = true;
