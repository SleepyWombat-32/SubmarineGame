extends Popup

onready var yellowsub = $YellowSub
onready var purplesub = $PurpleSub
onready var greensub = $GreenSub
onready var orangefish = $OrangeFish

func change_skin(skin):
	Globals.selected_skin = skin

func _on_BackButton_pressed():
	var anim_player = get_node("../AnimationPlayer")
	anim_player.play_backwards("SkinsMove")
	yield(anim_player, "animation_finished")
	hide()



func _on_SkinsButton_pressed():
	if Globals.skins_unlocked == 1:
		yellowsub.show()
		purplesub.hide()
		greensub.hide()
		orangefish.hide()
	elif Globals.skins_unlocked == 2:
		yellowsub.show()
		purplesub.show()
		greensub.hide()
		orangefish.hide()
	elif Globals.skins_unlocked == 3:
		yellowsub.show()
		purplesub.show()
		greensub.show()
		orangefish.hide()
	else:# Globals.skins_unlocked == 4:
		yellowsub.show()
		purplesub.show()
		greensub.show()
		orangefish.show()


