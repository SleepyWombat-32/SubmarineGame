extends AudioStreamPlayer

var music_num : int = 1
var target_num : int = 3
func _on_BGmusic_finished():
	if music_num < target_num:
		music_num += 1
		stream = load("res://Music/SubMusicPart" + str(music_num) + ".wav")
		playing = true
	else:
		music_num = 1
		stream = load("res://Music/SubMusicPart" + str(music_num) + ".wav")
		playing = true
