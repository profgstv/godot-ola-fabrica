extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var fabrica: Node2D = $"."

var init_dialog: Callable = func(): 
			player.set_physics_process(false)
			player.sprite_animation(player.sprite_direction, "idle")

var quit_dialog: Callable = func(): 
			player.set_physics_process(true)
			Global.dialog.kill_dialog()

func _ready() -> void:
	Global.instance_dialog(
		fabrica,
		"E aí, tudo bem? \nBora conhecer a Fabrica de Cultura 4.0 de São Bernardo do Campo/SP?\nUse as teclas direcionais ou clique/toque na tela para se mover.\nPara sair do jogo basta ir até um dos portões.\nSe quiser conhecer mais é só entrar na fábrica, ok?",
		1.0,
		init_dialog,
		[
			Global.DialogButton.new("Ok", quit_dialog)
		]
	)

func _on_exit_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.instance_dialog(
			fabrica,
			"Você está saindo para a tela inicial do jogo, ok?",
			3.5,
			init_dialog,
			[
				Global.DialogButton.new("Cancelar", quit_dialog),
				Global.DialogButton.new("Ok", func(): get_tree().change_scene_to_file("res://scenes/main/title-screen.tscn"))
			]
		)

func _on_enter_fabrica_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.instance_dialog(
			fabrica,
			"Você quer mesmo entrar?",
			3.5,
			init_dialog,
			[
				Global.DialogButton.new("Não", quit_dialog),
				Global.DialogButton.new("Sim", func(): get_tree().change_scene_to_file("res://scenes/main/title-screen.tscn"))
			]
		)
