extends Node2D


var part = preload("res://World/Levels/Part.tscn")
export (float) var time_between_spawns = 2.5
export (int) var parts_to_spawn = 2
var parts_spawned : int = 0
func _ready():
	$SpawnTimer.wait_time = time_between_spawns
	
func _on_SpawnTimer_timeout():
	if parts_spawned < parts_to_spawn:
		var part_position = Vector2(rand_range(20, 1004), rand_range(20, 580))
		Globals.instance_node(part, part_position, $Parts)
		parts_spawned += 1
