/// @description Elementos de Tela
var vidaMaxima = objPlayer.vidaMaxima;
var vida = objPlayer.vida;
var maximaEstamina = objPlayer.resitenciaMaxima;
var estamina = objPlayer.resistencia;

var escala = 3;
draw_sprite_ext(sprHudBarraVida, 1, 13, 18, (vida/vidaMaxima) * escala, escala, 0, c_white, 1);
draw_sprite_ext(sprHudBarraEstamina, 1, 13, 42, (estamina/maximaEstamina) * escala, escala, 0, c_white, 1);
draw_sprite_ext(sprHudPlayer, 1, 10, 30, escala, escala, 0, c_white, 1);