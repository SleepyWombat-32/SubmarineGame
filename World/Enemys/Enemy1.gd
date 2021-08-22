extends Area2D

export (int) var damage = 1


var can_attack : bool = true
var speed : int = 200
onready var player = get_node("../").get_node("../").get_node("../Player")
onready var playerpos = player.position
var normalized_p_a_diff

func _ready():
	var p_a_diff = playerpos - position 
	normalized_p_a_diff = p_a_diff.normalized()
	if normalized_p_a_diff.x > 0.01:
		$Body.scale.x = -1
	if normalized_p_a_diff.x < 0.01:
		$Body.scale.x = 1
func _physics_process(delta):
	position.x += speed * delta * normalized_p_a_diff.x
	position.y += speed * delta * normalized_p_a_diff.y

func _on_Enemy1_body_entered(body):
	if body.name == "Player" and can_attack:
		can_attack = false
		get_tree().call_group("Player","take_damage", damage)


func _on_DeleteTimer_timeout():
	get_tree().call_group("World", "add_score", 10)
	queue_free()
