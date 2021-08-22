extends Control

func _ready():
	Globals.load_game()
	$HighscoreLabel/Number.text = str(Globals.highscore)

func _on_DeleateSave_pressed():
	$HighscoreLabel.hide()
	$AnimationPlayer.play("DeleteSaveMove")
	$Popup.show()
func _on_YesButton_pressed():
	Globals.delete_save()
	$HighscoreLabel/Number.text = str(Globals.highscore)
	$AnimationPlayer.play_backwards("DeleteSaveMove")
	yield($AnimationPlayer, "animation_finished")
	$HighscoreLabel.show()
	$Popup.hide()
func _on_NoButton_pressed():
	$AnimationPlayer.play_backwards("DeleteSaveMove")
	yield($AnimationPlayer, "animation_finished")
	$HighscoreLabel.show()
	$Popup.hide()
func _on_StartGameButton_pressed():
	SceneChanger.change_scene("res://GUI/GamemodeSwitcher.tscn", 0.25)
func _on_QuitButton_pressed():

	Globals.quit_game()
func _on_SkinsButton_pressed():
	$SkinsPopup.show()
	$AnimationPlayer.play("SkinsMove")

