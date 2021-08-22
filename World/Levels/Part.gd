extends Area2D

onready var part_1 = preload("res://Assets/Parts/Scrap1.png")
onready var part_2 = preload("res://Assets/Parts/Scrap2.png")
onready var part_3 = preload("res://Assets/Parts/Scrap3.png")
onready var part_4 = preload("res://Assets/Parts/Scrap4.png")
onready var part_5 = preload("res://Assets/Parts/Scrap5.png")

onready var parts : Dictionary = {
	"part_1" : part_1,
	"part_2" : part_2,
	"part_3" : part_3,
	"part_4" : part_4,
	"part_5" : part_5,
}
func _ready():
	var part = randi() % 5 + 1
	$Sprite.texture = parts["part_" + str(part)]


func _on_Part_body_entered(body):
	if body.name == "Player":
		get_tree().call_group("World", "part_collected")
		get_tree().queue_delete(self)
