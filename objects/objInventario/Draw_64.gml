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
			
			if(mouse_check_button_pressed(mb_left)){				
				if (itemSelecionado == -1){					
					show_debug_message(gridItens[# Informacoes.Itens, i]);
					itemSelecionado = gridItens[# Informacoes.Itens, i];
					posicaoSelecionada = i;					
				}else{
					show_debug_message(gridItens[# Informacoes.Itens, i]);
				
					if(itemSelecionado == gridItens[# Informacoes.Itens, i] and posicaoSelecionada != i and gridItens[# Informacoes.Sprite, i] == gridItens[# Informacoes.Sprite, posicaoSelecionada]){						
						gridItens[# Informacoes.Quantidade, i] += gridItens[# Informacoes.Quantidade, posicaoSelecionada];
						
						gridItens[# Informacoes.Itens, posicaoSelecionada] = -1;
						gridItens[# Informacoes.Quantidade, posicaoSelecionada] = -1;
						
						itemSelecionado = -1;
						posicaoSelecionada = -1;
					}else if(gridItens[# Informacoes.Itens, i] == -1){
						gridItens[# Informacoes.Itens, i] = gridItens[# Informacoes.Itens, posicaoSelecionada];
						gridItens[# Informacoes.Quantidade, i] = gridItens[# Informacoes.Quantidade, posicaoSelecionada];
						gridItens[# Informacoes.Sprite, i] = gridItens[# Informacoes.Sprite, posicaoSelecionada];
						
						gridItens[# Informacoes.Itens, posicaoSelecionada] = -1;
						gridItens[# Informacoes.Quantidade, posicaoSelecionada] = -1;
						gridItens[# Informacoes.Sprite, posicaoSelecionada] = -1;	
						
						itemSelecionado = -1;
						posicaoSelecionada = -1;
						
					}else if(gridItens[# Informacoes.Itens, posicaoSelecionada] != gridItens[# Informacoes.Itens, i] or  gridItens[# Informacoes.Sprite, posicaoSelecionada] != gridItens[# Informacoes.Sprite, i]){
						var item = gridItens[# Informacoes.Itens, i];
						var quantidade = gridItens[# Informacoes.Quantidade, i];
						var imagem = gridItens[# Informacoes.Sprite, i];
						
						gridItens[# Informacoes.Itens, i] = gridItens[# Informacoes.Itens, posicaoSelecionada];
						gridItens[# Informacoes.Quantidade, i] = gridItens[# Informacoes.Quantidade, posicaoSelecionada];
						gridItens[# Informacoes.Sprite, i] = gridItens[# Informacoes.Sprite, posicaoSelecionada];
						
						gridItens[# Informacoes.Itens, posicaoSelecionada] = item;
						gridItens[# Informacoes.Quantidade, posicaoSelecionada] = quantidade;
						gridItens[# Informacoes.Sprite, posicaoSelecionada] = imagem;
						
						itemSelecionado = -1;
						posicaoSelecionada = -1;						
					}					
				}				
			}
		}
		var _sprite = gridItens[# Informacoes.Sprite, i];
		
		if (gridItens[# Informacoes.Itens, i] != -1){
			draw_sprite_ext(_sprite, gridItens[# Informacoes.Itens, i], slotsX, slotsY, escala, escala, 0, c_white, 1);
			draw_text(slotsX + tamanhoSlot - 8, slotsY + tamanhoSlot - 8, gridItens[# Informacoes.Quantidade, i]);
		}		
		
		ix++;
		if(ix >= slotsH){
			ix = 0;
			iy++;
		}				
	}
	
	if(mouse_check_button_pressed(mb_right)){
		itemSelecionado = -1;
		posicaoSelecionada  = -1;
	}
	
	if(itemSelecionado != -1){
		draw_sprite_ext(_sprite, itemSelecionado, mouseX, mouseY, escala, escala, 0, c_white, 0.5);
	}	
}