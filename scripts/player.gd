extends CharacterBody2D

@onready var sprites: AnimatedSprite2D = $Sprites

const SPEED = 300.0

var sprite_direction: String = "down"

func sprite_animation(dir: String, mov: String) -> void:
	sprite_direction = dir
	sprites.play(mov + "_" + dir)
	
func movement() -> void:
	var direction := Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	
	velocity = direction.normalized() * SPEED

	move_and_slide()

func animate() -> void:
	if velocity.x > 0 and abs(velocity.x) > abs(velocity.y):
		sprite_animation("right", "run")
	elif velocity.x < 0 and abs(velocity.x) > abs(velocity.y):
		sprite_animation("left", "run")
	elif velocity.y > 0 and abs(velocity.x) < abs(velocity.y):
		sprite_animation("down", "run")
	elif velocity.y < 0 and abs(velocity.x) < abs(velocity.y):
		sprite_animation("up", "run")
	elif velocity == Vector2.ZERO:
		sprite_animation(sprite_direction, "idle")

func _physics_process(_delta: float) -> void:
	movement()
	animate()
