extends Panel

func _ready() -> void:
	$"Começar".grab_focus()

func _process(_delta: float) -> void:
	pass

func _on_começar_pressed() -> void:
	pass

func _on_escolher_cena_pressed() -> void:
	pass

func _on_sair_pressed() -> void:
	get_tree().quit()
