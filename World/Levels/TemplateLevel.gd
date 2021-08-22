extends Node2D

onready var level_name = name
onready var level_number = int(level_name[-1])
var game_paused : bool = false
var game_over : bool = false

var parts_collected : int = 0

func _ready():
	$Popups/PausePopup.hide()
	$Popups/GameOverPopup.hide()
	_update_parts_collected_label()
func player_died():
	get_tree().paused = true
	game_over = true
	$Popups/GameOverPopup.show()
func _RetryButton_pressed():
	get_tree().paused = false
	var _u = get_tree().reload_current_scene()
func _BackButton_pressed():
	get_tree().paused = false
	SceneChanger.change_scene("res://GUI/StartScreen.tscn")

# Pausing the game
func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		resume_pause_game()

func resume_pause_game():
	if !game_over:
		if game_paused:
			$Popups/PausePopup.hide()
			get_tree().paused = false
		else:
			$Popups/PausePopup.show()
			get_tree().paused = true
		game_paused = !game_paused
func part_collected():
	parts_collected += 1
	_update_parts_collected_label()
	if parts_collected >= $PartSpawner.parts_to_spawn:
		print("Player Wins, they collected all " + str(parts_collected) + " parts")
		if level_number == 1:
			Globals.levels_unlocked = 2
		elif level_number == 2:
			Globals.levels_unlocked = 3
		elif level_number == 3:
			Globals.levels_unlocked = 4
		elif level_number == 4:
			Globals.levels_unlocked = 5
		SceneChanger.change_scene("res://GUI/LevelPicker.tscn", 0.2)
		
		
func _update_parts_collected_label():
	var label = $GUIControl/PartsCollectedLabel
	label.text = str(parts_collected) + " / " + str($PartSpawner.parts_to_spawn)


