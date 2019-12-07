// EnemyAI_populateDistances()

__EnemyAI_floodfill(soldier_distance, AttackReach.BasicStrike, 2, false);
__EnemyAI_floodfill(assassin_distance, AttackReach.BasicStrike, 3, true);
__EnemyAI_floodfill(gunner_distance, AttackReach.GunStrike, 2, false);
__EnemyAI_floodfill(drone_distance, AttackReach.DroneStrike, 4, true);
__EnemyAI_floodfill(grenadier_distance, AttackReach.GrenadeStrike, 3, false);

// fluke it, I'm dummying out the line-movers
//__EnemyAI_linefill(charger_distance, AttackReach.BasicStrike, true);
//__EnemyAI_linefill(gridbane_distance, AttackReach.LineStrike, false);

__EnemyAI_floodfill(esp_distance, AttackReach.BasicStrike, 1, false);
__EnemyAI_floodfill(tank_distance, AttackReach.LineStrike, 1, false);
