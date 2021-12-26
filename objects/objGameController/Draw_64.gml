/// @description Elementos de Tela
var vidaMaxima = objPlayer.vidaMaxima[objPlayer.level];
var vida = objPlayer.vida;
var maximaEstamina = objPlayer.resitenciaMaxima[objPlayer.level];
var estamina = objPlayer.resistencia;
var experienciaMaxima = objPlayer.experienciaMaxima[objPlayer.level];
var experiencia = objPlayer.experiencia;

var escala = 3;
draw_sprite_ext(sprHudBarraVida, 1, 13, 18, (vida/vidaMaxima) * escala, escala, 0, c_white, 1);
draw_sprite_ext(sprHudBarraEstamina, 1, 13, 42, (estamina/maximaEstamina) * escala, escala, 0, c_white, 1);
draw_sprite_ext(sprHudPlayer, 1, 10, 30, escala, escala, 0, c_white, 1);
draw_sprite_ext(sprHudExperiencia, 1, 10, 60, 1, 1, 0, c_white, 1);
draw_sprite_ext(sprHudExperienciaBarra, 1, 10, 63, (experiencia / experienciaMaxima), 1, 0, c_white, 1);





