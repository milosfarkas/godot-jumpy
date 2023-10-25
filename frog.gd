extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var chase = false
var SPEED = 50 


func _ready():
	$AnimatedSprite2D.play("idle")

func _physics_process(delta):
	velocity.y += gravity * delta

	var frogSprite = $AnimatedSprite2D
	if chase == true:
		if $AnimatedSprite2D.animation != "death":
			var player = get_node("../../Player/Player")
			var direction = (player.global_position - self.global_position).normalized()
			frogSprite.play("jump")
			frogSprite.flip_h = direction.x > 0		
			velocity.x = direction.x * SPEED
	else:
		if $AnimatedSprite2D.animation != "death":
			$AnimatedSprite2D.play("idle")
		frogSprite.play("idle")
		velocity.x = 0
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true


func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false

func death(goldAmount: int):
	Game.incGold(goldAmount)
	Utils.save_game()
	$AnimatedSprite2D.play("death")
	await $AnimatedSprite2D.animation_finished
	self.queue_free()


func _on_player_death_body_entered(body):
	if body.name == "Player":
		death(3)


func _on_player_collision_body_entered(body):
	if body.name == "Player":
		Game.player_hp -= 3
		death(-1)
