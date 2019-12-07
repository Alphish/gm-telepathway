/// @function MouseInputRouter_tryHover(clickable)
/// @param {instanceId} clickable

var _clickable = argument0;

if (ctrl_MouseInputRouter.hover_object == noone || ctrl_MouseInputRouter.hover_object.depth > _clickable.depth)
	ctrl_MouseInputRouter.hover_object = _clickable;
