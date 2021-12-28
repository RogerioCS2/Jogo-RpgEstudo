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

enum ItemInimigos{
	SlimeParte,
	OrcCapacete,
	OrcDente,
	Tamanho,
}

enum Informacoes{
	Itens,
	Quantidade,
	Sprite,
	Tamanho,
}

gridItens = ds_grid_create(Informacoes.Tamanho, totalSlotes);
ds_grid_set_region(gridItens, 0, 0, 1, totalSlotes -1, -1);

AdicionaItens(ArmasInventario.Arco, 1, sprArmas);
AdicionaItens(ArmasInventario.Espada, 2, sprArmas);
AdicionaItens(ArmasInventario.Cajado, 4, sprArmas);
AdicionaItens(ItemInimigos.SlimeParte, 3, sprItensInimigos);
AdicionaItens(ItemInimigos.OrcCapacete, 2, sprItensInimigos);
AdicionaItens(ItemInimigos.OrcDente, 3, sprItensInimigos);