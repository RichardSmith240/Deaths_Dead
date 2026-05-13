extends Node2D

@export var player_controler : PlayerController
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

func _process(delta):
	#sprite direction
	if player_controler.direction == 1:
		sprite.flip_h = true
	elif player_controler.direction == -1:
		sprite.flip_h = false 
	
	#walk/run
	if abs(player_controler.velocity.x) > 0.0:
		animation_player.play("walk")
	else:
		animation_player.play("idle")
	
	#jump/fall
	if player_controler.velocity.y < 0.0:
		animation_player.play("jump")
	elif player_controler.velocity.y > 0.0:
		animation_player.play("fall")
