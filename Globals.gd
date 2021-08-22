extends Node
func _ready():
	randomize()
	load_game()
func instance_node(node, position, object_to_instance_to):
	var NODE = node.instance()
	NODE.position = position
	object_to_instance_to.add_child(NODE)

var score : int = 0
var highscore : int = 0
var skins_unlocked : int = 1
var levels_unlocked : int = 1


func quit_game():
	save_game()
	get_tree().quit()

var skins : Dictionary = {
	"YellowSub" : load("res://Assets/Player/Submarine.png"),
	"OrangeFish" : load("res://Assets/Player/OrangeFish.png"),
	"PurpleSub" : load("res://Assets/Player/PurpleSub.png"),
	"GreenSub" : load("res://Assets/Player/GreenSub.png")
}
onready var selected_skin = "YellowSub"


func _exit_tree():
	Globals.save_game()

# save and load

func file_data():
	var save_dict = {
		"highscore" : Globals.highscore,
		"selected_skin" : Globals.selected_skin,
		"skins_unlocked" : Globals.skins_unlocked,
		"levels_unlocked" : Globals.levels_unlocked
	}
	return save_dict
	
func loadGlobal(node_data : Dictionary):
	Globals.highscore = node_data.get("highscore",Globals.highscore)
	Globals.selected_skin = node_data.get("selected_skin", Globals.selected_skin)
	Globals.skins_unlocked = node_data.get("skins_unlocked", Globals.skins_unlocked)
	Globals.levels_unlocked = node_data.get("levels_unlocked", Globals.levels_unlocked)
func save_game():
	var save_file = File.new()
	save_file.open("user://savegame.save", File.WRITE)
	
	var node_data = file_data()

	# Store the save dictionary as JSON in the save file.

	save_file.store_line(to_json(node_data))
	save_file.close()
	
func load_game():
	var load_file = File.new()
	if !load_file.file_exists("user://savegame.save"):
		print(" no file to load, creating file through save_game()")
		save_game()
		return # Error! We don't have a save to load.
	load_file.open("user://savegame.save", File.READ)
	loadGlobal(parse_json(load_file.get_line()))
	load_file.close()

func delete_save():
	var save_dict = {
		"highscore" : 0,
		"selected_skin" : "YellowSub",
		"skins_unlocked" : 1,
		"levels_unlocked" : 1,
	}
	var save_file = File.new()
	save_file.open("user://savegame.save", File.WRITE)
	
	var node_data = save_dict

	# Store the save dictionary as JSON in the save file.
	save_file.store_line(to_json(node_data))
	save_file.close()
	load_game()
