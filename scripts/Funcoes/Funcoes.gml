// Script assets have changed for v2.3.0 see
function FimAnimacao(){
	/// @description animation_end(sprite_index,image_index, rate)
    /// @param {real} <sprite_index> The index of the sprite being animated
    /// @param {real} <image_index> The current frame value
    /// @param {real} <rate> -See Below-
    ///     The rate of change in frames per step if not
    ///     using built in image_index/image_speed.  
    ///     Don't use if you don't think you need this.  You probably don't.
 
    //returns true if the animation will loop this step.
 
    //Script courtesy of PixellatedPope & Minty Python from the GameMaker subreddit discord 
    //https://www.reddit.com/r/gamemaker/wiki/discord
 
    var _sprite = sprite_index;
    var _image = image_index;
    if(argument_count > 0)   _sprite = argument[0];
    if(argument_count > 1)  _image = argument[1];
    var _type = sprite_get_speed_type(sprite_index);
    var _spd = sprite_get_speed(sprite_index)*image_speed;
    if(_type == spritespeed_framespersecond)
        _spd = _spd/room_speed;
    if(argument_count > 2) _spd = argument[2];
    return _image + _spd >= sprite_get_number(_sprite);			
}

function AdicionaItens(){
	///@arg Itens
	///@arg Quantidade
	///@arg Sprite
	
	var grid = objInventario.gridItens;
	var checagem = 0;
	while (grid[# Informacoes.Itens, checagem] != -1){
		checagem++;		
	}
	
	grid[# 0, checagem] = argument[0];
	grid[# 1, checagem] = argument[1];
	grid[# 2, checagem] = argument[2];
}