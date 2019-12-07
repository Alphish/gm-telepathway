/// @function __Editor_makeActorInfo(x,y,type,name)

var _actor_info = ds_map_create();

_actor_info[? "x"] = argument0;
_actor_info[? "y"] = argument1;
_actor_info[? "type"] = argument2;
_actor_info[? "name"] = argument3;

return _actor_info;
