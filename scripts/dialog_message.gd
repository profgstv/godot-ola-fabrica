extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var dialog_buttons: Array = [$Panel/Button0, $Panel/Button1]
@onready var label: Label = $Panel/Label

var dialog_ended: bool = false
var message: String
var speed: float
var buttons: Array
var init: Callable

func kill_dialog() -> void:
	queue_free()

func _ready() -> void:
	init.call()
	animation_player.play("panel_display")
	label.text = message
	for button in buttons:
		dialog_buttons[buttons.find(button)].text = button.message

func _process(_delta: float) -> void:
	if Input.is_anything_pressed() and animation_player.current_animation == "dialog_message":
		animation_player.advance(4.5)
	elif Input.is_action_pressed("ui_close_dialog") and dialog_ended:
		kill_dialog()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "panel_display":
		animation_player.play("dialog_message")
		animation_player.speed_scale = speed
	elif anim_name == "dialog_message":
		dialog_ended = true
		if buttons.size() < 2:
			dialog_buttons[0].position.x = 393.098
			dialog_buttons[1].visible = false
		else:
			dialog_buttons[0].position.x = 50.0
			dialog_buttons[1].visible = true
		dialog_buttons[0].grab_focus()

func _on_button_0_pressed() -> void:
	buttons[0].function.call()

func _on_button_1_pressed() -> void:
	buttons[1].function.call()
