/// @description 
proximoLevel = 100;
levelJogo = objPlayer.level;

function AlterandoLevel(){
	if(objPlayer.experiencia > proximoLevel){				
		levelJogo++;		
		objPlayer.level++;
		var experiencia = objPlayer.experiencia;
		experiencia = experiencia - experienciaMaxima[level];
		proximoLevel *= 2;
	}
}