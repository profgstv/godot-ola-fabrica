extends Node

const DIALOG_MESSAGE: PackedScene = preload("res://scenes/templates/dialog_message.tscn")
var dialog

class DialogButton:
	var message: String
	var function: Callable

func instance_dialog(root_node, message: String, speed: float, init: Callable, ...buttons: Array) -> void:
	dialog = DIALOG_MESSAGE.instantiate()
	dialog.init = init
	dialog.message = message
	dialog.speed = speed
	dialog.buttons = buttons
	root_node.add_child(dialog)
