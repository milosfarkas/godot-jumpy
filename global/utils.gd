extends Node

const save_path = "res://savegame.bin"


func save_game():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	var data: Dictionary = {
		"player_hp": Game.player_hp,
		"gold": Game.gold
	}
	var js = JSON.stringify(data)
	file.store_line(js)
	

func load_game():
	var file = FileAccess.open(save_path, FileAccess.READ)
	if FileAccess.file_exists(save_path):
		if not file.eof_reached():
			var currentline = JSON.parse_string(file.get_line())
			if currentline:
				Game.player_hp = currentline["player_hp"]
				Game.gold = currentline["gold"]
				if Game.player_hp < 1:
					Game.player_hp = 10
					Game.gold = 0
					Utils.save_game()
