/// @description Variaveis e Funções
enum Armas{
	espada,
	arco,
	tamanho,
}

direita = -1;
cima = -1;
esquerda = -1;
baixo = -1;
hVeloc = 0;
vVeloc = 0;
veloc = 2;
dir = 0;
velocDir = -1;
direcaoTransporte = -1
velocidadeTransporte = 6;
empurrarDir = 0;
efeitoDano = -1;
atacar = false;
tomandoDano = true;
resistencia = 0;
level = 1;
arma = 0;

estado = MovimentoPlayer;

resitenciaMaxima = [0, 100, 150, 200, 250, 300, 350];
tamanhoDano = [0, 1, 2, 3, 4, 5, 6];
vidaMaxima = [0, 20, 40, 60, 70, 90, 110];
experienciaMaxima = [0, 100, 150, 200, 250, 300, 350];

resistencia = resitenciaMaxima[level];
dano = tamanhoDano[level];
vida = vidaMaxima[level];
experiencia = 0;