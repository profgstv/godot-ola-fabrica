extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var fabrica: Node2D = $"."

var dialog_button_0 = Global.DialogButton.new()
var dialog_button_1 = Global.DialogButton.new()


func _ready() -> void:
	dialog_button_0.message = "Ok"
	dialog_button_0.function = func(): 
		player.set_physics_process(true)
		Global.dialog.kill_dialog()
	
	Global.instance_dialog(
		fabrica,
		"E aí, tudo bem? \nBora conhecer a Fabrica de Cultura 4.0 de São Bernardo do Campo/SP?\nUse as teclas direcionais ou clique/toque na tela para se mover.\nPara sair do jogo basta ir até um dos portões.\nSe quiser conhecer mais é só entrar na fábrica, ok?", 
		1.0,
		func(): player.set_physics_process(false),
		dialog_button_0
	)

func _on_exit_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		dialog_button_0.message = "Cancelar"
		dialog_button_1.message = "Ok"
		dialog_button_1.function = func(): get_tree().change_scene_to_file("res://scenes/main/title-screen.tscn")
		Global.instance_dialog(
			fabrica,
			"Você está saindo para a tela inicial do jogo, ok?",
			3.5,
			func(): 
				player.set_physics_process(false)
				player.sprite_animation(player.sprite_direction, "idle"),
			dialog_button_0,
			dialog_button_1
		)

func _on_enter_fabrica_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		dialog_button_0.message = "Não"
		dialog_button_1.message = "Sim"
		dialog_button_1.function = func(): get_tree().change_scene_to_file("res://scenes/main/title-screen.tscn")
		Global.instance_dialog(
			fabrica,
			"Você quer mesmo entrar?",
			3.5,
			func(): 
				player.set_physics_process(false)
				player.sprite_animation(player.sprite_direction, "idle"),
			dialog_button_0,
			dialog_button_1
		)
