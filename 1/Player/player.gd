extends CharacterBody2D

const GRAVITY = 500.0
const JUMP_SPEED = 170.0
const RUN_SPEED = 90.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("move_left", "move_right")
	
	velocity.y += GRAVITY*delta
	velocity.x = direction*RUN_SPEED
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y -= JUMP_SPEED
	elif Input.is_action_just_released("jump") and velocity.y<0:
		velocity.y *= 0.5
	
	
	
	move_and_slide()
