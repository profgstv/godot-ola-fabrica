extends Control

@onready var dialog_message: RichTextLabel = $EstamosNaFabrica
@onready var começar: Button = $MenuPrincipal/Começar
@onready var sair: Button = $MenuPrincipal/Sair

var dialog_display_vel = 0.25

func _ready() -> void:
	dialog_message.visible_characters = 0
	começar.grab_focus()
	pass

func _process(delta: float) -> void:
	if dialog_message.visible_ratio == 1:
		dialog_message.visible_characters = -1
	else:
		dialog_message.visible_ratio += delta * dialog_display_vel
	if começar.is_hovered():
		começar.grab_focus()
	elif sair.is_hovered():
		sair.grab_focus()

func _on_começar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/first_steps.tscn")
	pass

func _on_sair_pressed() -> void:
	get_tree().quit()
	pass
