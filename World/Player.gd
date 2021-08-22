extends KinematicBody2D

var health : int = 3



var last_direction : Vector2 = Vector2(0, 1)


# Movement 

var max_speed : int = 300
var acceleration : int = 300
var motion : Vector2 = Vector2()

func _ready():
	$Body/Sprite.texture = Globals.skins[Globals.selected_skin]
	if $Body/Sprite.texture == "res://Assets/Player/OrangeFish.png":
func _physics_process(delta):
	var direction: Vector2
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	# If input is digital, normalize it for diagonal movement
	if abs(direction.x) == 1 and abs(direction.y) == 1:
		direction = direction.normalized()
	
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(acceleration * delta)
	else:
		apply_movement(axis * acceleration * delta)
	motion = move_and_slide(motion)
	
	_screen_wrap()
func get_input_axis():
	var axis : Vector2 = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	axis.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	if axis.x > 0:
		$Body.scale.x = -1
	if axis.x < 0:
		$Body.scale.x = 1
	return axis.normalized()

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

func apply_movement(acceleration_amount):
	motion += acceleration_amount
	motion = motion.clamped(max_speed)

func _screen_wrap():
	if position.y <= -10:
		position.y = 605
	if position.y >= 610:
		position.y = -5
	if position.x <= -10:
		position.x = 1029
	if position.x >= 1034:
		position.x = -5

func take_damage(damage):
	health -= damage
	get_tree().call_group("GUI", "_update_health", health)
	if health <= 0:
		get_tree().call_group("World", "player_died")
