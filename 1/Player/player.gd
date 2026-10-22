extends CharacterBody2D

const GRAVITY = 500.0

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY*delta
	move_and_slide()
