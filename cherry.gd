extends Area2D




func _on_body_entered(body):
	if body.name == "Player":
		Game.incGold(5)
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", position - Vector2(0, 150), 1)
		tween.tween_property(self, "modulate:a", 0, 1)
		tween.tween_callback(queue_free)
	
