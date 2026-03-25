extends Node2D

@onready var player: CharacterBody2D = $Player

const DIALOG_MESSAGE: PackedScene = preload("res://scenes/templates/dialog_message.tscn")

func instance_dialog(message: String, speed: float, btn_0_msg: String, btn_1_msg: String, btn_1_func: Callable) -> void:
	var dialog = DIALOG_MESSAGE.instantiate()
	dialog.message = message
	dialog.speed = speed
	dialog.btn_0_msg = btn_0_msg
	dialog.btn_1_msg = btn_1_msg
	dialog.btn_1_func = btn_1_func
	call_deferred("add_child", dialog)

func _ready() -> void:
	instance_dialog("E aí, tudo bem? \nBora conhecer a Fabrica de Cultura 4.0 de São Bernardo do Campo/SP?\nUse as teclas direcionais ou clique/toque na tela para se mover.\nPara sair do jogo basta ir até um dos portões.\nSe quiser conhecer mais é só entrar na fábrica, ok?", 1.0, "Ok", "", func(): pass)

func _on_exit_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		instance_dialog("Você está saindo para a tela inicial do jogo, ok?", 3.5, "Cancelar", "Ok", func(): 
			get_tree().change_scene_to_file("res://scenes/main/title-screen.tscn")
			pass
			)

func _on_enter_fabrica_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		instance_dialog("Você quer mesmo entrar?", 3.5, "Não", "Sim", func(): 
			get_tree().change_scene_to_file("res://scenes/main/title-screen.tscn")
			pass
			)
