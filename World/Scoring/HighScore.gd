extends Label

func _ready():
	text = str(Globals.highscore)

func _process(_delta):
	if Globals.highscore >= 100:
		if Globals.skins_unlocked <= 1:
			Globals.skins_unlocked = 2
	if Globals.highscore >= 150:
		if Globals.skins_unlocked <= 2:
			Globals.skins_unlocked = 3
	if Globals.highscore >= 300:
		if Globals.skins_unlocked <= 3:
			Globals.skins_unlocked = 4
				
	
	if Globals.score > Globals.highscore:
		Globals.highscore = Globals.score

func _exit_tree():
	Globals.save_game()

