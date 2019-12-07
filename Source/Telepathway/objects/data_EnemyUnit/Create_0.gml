properties = ds_map_create();
Data_registerEnemyUnit(EnemyUnit.Soldier, 2, false, AttackReach.BasicStrike, 0);
Data_registerEnemyUnit(EnemyUnit.Assassin, 3, true, AttackReach.BasicStrike, 0);
Data_registerEnemyUnit(EnemyUnit.Gunner, 2, false, AttackReach.GunStrike, 0);
Data_registerEnemyUnit(EnemyUnit.Drone, 4, true, AttackReach.DroneStrike, 1);
Data_registerEnemyUnit(EnemyUnit.Grenadier, 3, false, AttackReach.GrenadeStrike, 0);
Data_registerEnemyUnit(EnemyUnit.Tank, 1, false, AttackReach.LineStrike, 1);
Data_registerEnemyUnit(EnemyUnit.ESP, 1, false, AttackReach.BasicStrike, 1);
