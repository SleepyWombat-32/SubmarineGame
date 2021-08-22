extends Control
onready var level1_locked = $VBoxContainer/Level1/Locked
onready var level2_locked = $VBoxContainer/Level2/Locked
onready var level3_locked = $VBoxContainer/Level3/Locked
onready var level4_locked = $VBoxContainer/Level4/Locked
onready var level5_locked = $VBoxContainer/Level5/Locked
func _ready():
	if Globals.levels_unlocked == 1:
		level1_locked.hide()
		level2_locked.show()
		level3_locked.show()
		level4_locked.show()
		level5_locked.show()
	elif Globals.levels_unlocked == 2:
		level1_locked.hide()
		level2_locked.hide()
		level3_locked.show()
		level4_locked.show()
		level5_locked.show()
	elif Globals.levels_unlocked == 3:
		level1_locked.hide()
		level2_locked.hide()
		level3_locked.hide()
		level4_locked.show()
		level5_locked.show()
	elif Globals.levels_unlocked == 4:
		level1_locked.hide()
		level2_locked.hide()
		level3_locked.hide()
		level4_locked.hide()
		level5_locked.show()
	elif Globals.levels_unlocked == 5:
		level1_locked.hide()
		level2_locked.hide()
		level3_locked.hide()
		level4_locked.hide()
		level5_locked.hide()
	else:
		level1_locked.hide()
		level2_locked.hide()
		level3_locked.hide()
		level4_locked.hide()
		level5_locked.hide()


func _on_LevelButton_pressed(level_num):
	SceneChanger.change_scene("res://World/Levels/Level" + str(level_num) + ".tscn")


func _on_BackButton_pressed():
	SceneChanger.change_scene("res://GUI/GamemodeSwitcher.tscn")
