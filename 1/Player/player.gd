extends CharacterBody2D

const GRAVITY = 500.0
const JUMP_SPEED = 170.0

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY*delta
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y -= JUMP_SPEED
	elif Input.is_action_just_released("jump") and velocity.y<0:
		velocity.y *= 0.5
	
	move_and_slide()
