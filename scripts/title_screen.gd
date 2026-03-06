extends Control

@onready var dialog_message = $EstamosNaFabrica
@onready var main_menu = $MenuPrincipal

var dialog_display_vel = 0.25

func _ready() -> void:
	dialog_message.visible_characters = 0
	main_menu.get_node("Começar").grab_focus()
	pass

func _process(delta: float) -> void:
	if dialog_message.visible_ratio == 1:
		dialog_message.visible_characters = -1
	else:
		dialog_message.visible_ratio += delta * dialog_display_vel

func _on_começar_pressed() -> void:
	pass

func _on_sair_pressed() -> void:
	get_tree().quit()
	pass
