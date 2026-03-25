extends CharacterBody2D

@onready var sprites: AnimatedSprite2D = $Sprites

const SPEED = 300.0

var sprite_direction: String = "down"

var stop_movement: bool = false

func sprite_animation(dir: String, mov: String) -> void:
	sprite_direction = dir
	sprites.play(mov + "_" + dir)
	
func movement() -> void:
	var direction: Vector2
	var dist_to_mouse: Vector2 = get_global_mouse_position() - global_position
	
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		stop_movement = false
		direction = Vector2(
			Input.get_axis("ui_left", "ui_right"),
			Input.get_axis("ui_up", "ui_down")
		)
	elif stop_movement == false:
		direction = dist_to_mouse
		if direction.length() <= 5.0:
			global_position = get_global_mouse_position()
			stop_movement = true
		else:
			stop_movement = false
	elif dist_to_mouse.length() >= 150.0:
		stop_movement = false
	else:
		direction = Vector2.ZERO
	
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
