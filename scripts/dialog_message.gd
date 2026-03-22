extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var button_0: Button = $Panel/Button0
@onready var button_1: Button = $Panel/Button1
@onready var label: Label = $Panel/Label
@onready var player: CharacterBody2D = get_parent().player
@onready var parent = get_parent()

var message: String
var btn_0_msg: String
var btn_1_msg: String
var btn_1_func: Callable
var mobile_mode: bool

func _ready() -> void:
	parent.check_button.disabled = true
	mobile_mode = parent.touch_screen_joystick.visible
	parent.touch_screen_joystick.visible = false
	player.sprite_animation(player.sprite_direction, "idle")
	player.set_physics_process(false)
	label.text = message
	button_0.text = btn_0_msg
	button_1.text = btn_1_msg
	animation_player.play("panel_display")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	var speed: float
	if anim_name == "panel_display":
		animation_player.play("dialog_message")
		speed = 7.0/label.get_line_count()
		animation_player.speed_scale = speed
	elif anim_name == "dialog_message":
		if btn_1_msg == "":
			button_0.position.x = 393.098
			button_1.visible = false
		else:
			button_0.position.x = 50.0
			button_1.visible = true
		button_0.grab_focus()

func _on_button_0_pressed() -> void:
	player.set_physics_process(true)
	queue_free()
	parent.check_button.disabled = false
	parent.touch_screen_joystick.visible = mobile_mode 

func _on_button_1_pressed() -> void:
	btn_1_func.call()
