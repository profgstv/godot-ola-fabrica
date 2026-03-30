extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var fabrica: Node2D = $"."

func dialog(message: String, speed: float, btn_0_msg: String, ...extra: Array) -> void:
	var buttons: Array[Global.DialogButton] 
	Global.dialog_button_0.message = btn_0_msg
	if extra.size() >= 3:
		Global.dialog_button_0.function = extra[extra.size() - 1]
	else:
		Global.dialog_button_0.function = func(): 
			player.set_physics_process(true)
			Global.dialog.kill_dialog()
	if extra:
		Global.dialog_button_1.message = extra[0]
		Global.dialog_button_1.function = extra[1]
		buttons= [Global.dialog_button_0, Global.dialog_button_1]
	else:
		buttons = [Global.dialog_button_0]
	Global.instance_dialog(
		fabrica,
		message,
		speed,
		func(): 
			player.set_physics_process(false)
			player.sprite_animation(player.sprite_direction, "idle"),
		buttons
	)

func _ready() -> void:
	dialog(
		"E aí, tudo bem? \nBora conhecer a Fabrica de Cultura 4.0 de São Bernardo do Campo/SP?\nUse as teclas direcionais ou clique/toque na tela para se mover.\nPara sair do jogo basta ir até um dos portões.\nSe quiser conhecer mais é só entrar na fábrica, ok?", 
		1.0,
		"Ok"
	)

func _on_exit_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		dialog(
			"Você está saindo para a tela inicial do jogo, ok?",
			3.5,
			"Cancelar",
			"Ok",
			func(): get_tree().change_scene_to_file("res://scenes/main/title-screen.tscn")
		)

func _on_enter_fabrica_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		dialog(
			"Você quer mesmo entrar?",
			3.5,
			"Não",
			"Sim",
			func(): get_tree().change_scene_to_file("res://scenes/main/title-screen.tscn")
		)
