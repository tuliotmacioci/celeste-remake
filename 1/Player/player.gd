extends CharacterBody2D

const GRAVITY = 500.0
const JUMP_SPEED = 170.0
const RUN_SPEED = 90.0

var facing = 1.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var hair: Node2D = $Hair

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("move_left", "move_right")

	if direction != 0.0:
		facing = direction

	velocity.y += GRAVITY * delta
	velocity.x = direction * RUN_SPEED

	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -JUMP_SPEED
	elif Input.is_action_just_released("jump") and velocity.y < 0.0:
		velocity.y *= 0.5

	sprite.flip_h = facing < 0.0
	hair.facing = facing

	if not is_on_floor():
		sprite.play("jump" if velocity.y < 0.0 else "fall")
	elif velocity.x != 0.0:
		sprite.play("run")
	else:
		sprite.play("idle")

	move_and_slide()
