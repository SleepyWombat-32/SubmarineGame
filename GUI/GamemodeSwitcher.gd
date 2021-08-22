extends Control



func _on_ClassicArcadeButton_pressed():
	SceneChanger.change_scene("res://World/World.tscn")


func _on_LevelsButton_pressed():
	SceneChanger.change_scene("res://GUI/LevelPicker.tscn")


func _on_BackButton_pressed():
	SceneChanger.change_scene("res://GUI/StartScreen.tscn")
