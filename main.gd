extends Node2D


func _ready():
	Utils.load_game()
	

func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://world.tscn") # Replace with function body.

func _process(_delta):
	var screen_size = get_viewport_rect().size
	var center = Vector2(screen_size.x / 2, screen_size.y / 3)
	
	var container: Container = $CenterContainer
	var offset = container.size / 2
	container.global_position = center - offset
