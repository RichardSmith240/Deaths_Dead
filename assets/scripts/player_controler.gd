extends CharacterBody2D
class_name PlayerController

@export var speed = 10.0
@export var jump_velocity = 10.0

var speed_muliplier = 10.0
var jump_multiplier = -25.0
var direction = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity * jump_multiplier

	# Get the input direction and handle the movement/deceleration.
	direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * (speed * speed_muliplier) 
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_muliplier)

	move_and_slide()
