extends Node2D

var game_paused : bool = false
var game_over : bool = false
func _ready():
	
	Globals.score = 0
	$Popups/PausePopup.hide()
	$Popups/GameOverPopup.hide()
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
	$WorldScores/ScoreLabel.text = str(Globals.score)
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

func add_score(score_to_add):
	Globals.score += score_to_add


