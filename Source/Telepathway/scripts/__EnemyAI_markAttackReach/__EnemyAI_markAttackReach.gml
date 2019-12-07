// __GameGrid_markAttackReach(x,y,dist,isCore)

var _x = argument0;
var _y = argument1;
var _dist = argument2;
var _is_core = argument3;

if (GameGrid_getFieldType(_x, _y) != FieldType.Floor)
	exit;	

var _mark = AttackReach.None;
if (_dist <= 2)
	_mark |= AttackReach.GrenadeStrike;

if (_is_core) {
	_mark |= AttackReach.IsDirect;
	_mark |= AttackReach.GunStrike;
	
	if (_dist <= 2)
		_mark |= AttackReach.DroneStrike;
	
	if (_dist <= 1)
		_mark |= AttackReach.BasicStrike;
}

attack_reach[# _x, _y] |= _mark;
