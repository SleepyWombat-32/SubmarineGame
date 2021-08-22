extends Node2D

var enemy_1 = preload("res://World/Enemys/Enemy1.tscn")
export (String, "SetDifficulty", "GetsHarder") var spawn_type = "GetsHarder"
export (float) var time_between_spawns = 2.5

func _ready():
	$SpawnTimer.wait_time = time_between_spawns
	
func _on_SpawnTimer_timeout():
	var enemy_position = Vector2(rand_range(-200, 1200), rand_range(-200, 800))
	
	while enemy_position.x < 1100 and enemy_position.x > -100 and enemy_position.y < 700 and enemy_position.y > - 100:
		enemy_position = Vector2(rand_range(-200, 1200), rand_range(-200, 800))
	
	Globals.instance_node(enemy_1, enemy_position, $AddedNodes)
func _on_DifficultyTimer_timeout():
	if spawn_type == "GetsHarder":
		if $SpawnTimer.wait_time > 0.75:
			$SpawnTimer.wait_time -= 0.05
