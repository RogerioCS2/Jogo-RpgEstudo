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
		
		if (gridItens[# Informacoes.Itens, i] != -1){
			draw_sprite_ext(sprItens, gridItens[# 0, i], slotsX, slotsY, escala, escala, 0, c_white, 1);
			//draw_set_font(fnt_dano);
			//draw_set_align(fa_center);	
			draw_text(slotsX + tamanhoSlot - 8, slotsY + tamanhoSlot - 8, gridItens[# Informacoes.Quantidade, i]);						
		}
		
		ix++;
		if(ix >= slotsH){
			ix = 0;
			iy++;
		}				
	}	
}