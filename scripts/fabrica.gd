extends Node2D

@onready var player: CharacterBody2D = $Player

const DIALOG_MESSAGE: PackedScene = preload("res://scenes/templates/dialog_message.tscn")

func instance_dialog(message: String, btn_0_msg: String, btn_1_msg: String, btn_1_func: Callable) -> void:
	var dialog = DIALOG_MESSAGE.instantiate()
	dialog.message = message
	dialog.btn_0_msg = btn_0_msg
	dialog.btn_1_msg = btn_1_msg
	dialog.btn_1_func = btn_1_func
	call_deferred("add_child", dialog)

func _ready() -> void:
	instance_dialog("E aí, tudo bem? \n\nBora conhecer meu mundo na Fabrica de Cultura 4.0 de São Bernardo do Campo/SP?\nPara sair do jogo basta ir até um dos portões.\nSe quiser conhecer mais é só entrar na fábrica, ok?\nObrigado!", "Ok", "", func(): pass)

func _on_exit_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		instance_dialog("Você está saindo para a tela inicial o jogo, ok?", "Cancelar", "Ok", func(): 
			get_tree().change_scene_to_file("res://scenes/main/title-screen.tscn")
			pass
			)

func _on_enter_fabrica_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		instance_dialog("Você quer mesmo entrar?", "Não", "Sim", func(): 
			get_tree().change_scene_to_file("res://scenes/main/title-screen.tscn")
			pass
			)
