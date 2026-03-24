extends Control

@onready var começar: Button = $PanelControl/MenuPrincipal/Começar
@onready var sair: Button = $PanelControl/MenuPrincipal/Sair
@onready var animation_player: AnimationPlayer = $PanelControl/AnimationPlayer

func _process(_delta: float) -> void:
	if animation_player.current_animation == "press_button_animation" and Input.is_anything_pressed():
		animation_player.play("turn_to_menu_panel_animation")
	if começar.is_hovered():
		começar.grab_focus()
	elif sair.is_hovered():
		sair.grab_focus()

func _on_começar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main/fabrica.tscn")

func _on_sair_pressed() -> void:
	get_tree().quit()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "turn_to_menu_panel_animation":
		começar.grab_focus()
