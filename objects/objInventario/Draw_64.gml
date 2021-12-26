/// @description 
var larguraTela = display_get_gui_width();
var alturaTela = display_get_gui_height();

var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);

if(inventario == true){
	var pontoX = larguraTela / 2 - inventarioLarg / 2; 
	var pontoY = alturaTela / 2 - inventarioAlt / 2;
	draw_sprite_ext(sprInventario, 0, pontoX, pontoY, escala, escala, 0, c_white, 1);
	
	var ix = 0;
	var iy = 0;	
	for(var i = 0; i < totalSlotes; i++){
		var slotsX = pontoX + inventarioX +((tamanhoSlot + divisoriaSlote) * ix);
		var slotsY = pontoY + inventarioY +((tamanhoSlot + divisoriaSlote) * iy);
		
		if(point_in_rectangle(mouseX, mouseY, slotsX, slotsY, slotsX + tamanhoSlot, slotsY + tamanhoSlot)){
			draw_sprite_ext(sprInventarioSeletor, 0, slotsX, slotsY, escala, escala, 0, c_white, 1);
		}
		
		ix++;
		if(ix >= slotsH){
			ix = 0;
			iy++;
		}				
	}	
}

