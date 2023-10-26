extends Node2D

var Cherry = preload("res://cherry.tscn")
const _min = -500
const _max = 1500

func _on_timer_timeout():
	var ch = Cherry.instantiate()
	var random_number = randi_range(_min, _max)
	ch.position = Vector2(random_number, randi_range(140, 280))
	add_child(ch)
