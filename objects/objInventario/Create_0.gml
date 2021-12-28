/// @description 
inventario = false;
escala = 3;

inventarioX = 15 * escala;
inventarioY = 24 * escala;
slotsH = 8;
slotsV = 3;

totalSlotes = slotsH * slotsV;
tamanhoSlot = 16 * escala;
divisoriaSlote = 1 * escala;

inventarioLarg = sprite_get_width(sprInventario) * escala;
inventarioAlt = sprite_get_height(sprInventario) * escala;

itemSelecionado = -1;
posicaoSelecionada = -1;

enum ArmasInventario{
	Espada,
	Arco,
	Cajado,
	Tamanho,
}

enum Informacoes{
	Itens,
	Quantidade,
	Tamanho,
}

gridItens = ds_grid_create(Informacoes.Tamanho, totalSlotes);
ds_grid_set_region(gridItens, 0, 0, 1, totalSlotes -1, -1);

gridItens[# Informacoes.Itens, 0] = ArmasInventario.Espada;
gridItens[# Informacoes.Quantidade, 0] = 3;

gridItens[# Informacoes.Itens, 1] = ArmasInventario.Arco;
gridItens[# Informacoes.Quantidade, 1] = 2;

gridItens[# Informacoes.Itens, 2] = ArmasInventario.Cajado;
gridItens[# Informacoes.Quantidade, 2] = 1;

gridItens[# Informacoes.Itens, 3] = ArmasInventario.Arco;
gridItens[# Informacoes.Quantidade, 3] = 1;