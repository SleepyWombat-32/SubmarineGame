extends CanvasLayer

onready var heart_1 = $Control/Heart1
onready var heart_2 = $Control/Heart2
onready var heart_3 = $Control/Heart3
func _update_health(health):
	if health >= 1:
		heart_1.show()
	else:
		heart_1.hide()
	if health >= 2:
		heart_2.show()
	else:
		heart_2.hide()
	if health >= 3:
		heart_3.show()
	else:
		heart_3.hide()
