extends Node

const DIALOG_MESSAGE: PackedScene = preload("res://scenes/templates/dialog_message.tscn")

var dialog

var dialog_button_0 = DialogButton.new()
var dialog_button_1 = DialogButton.new()

class DialogButton:
	var message: String
	var function: Callable

func instance_dialog(root_node, message: String, speed: float, init: Callable, buttons: Array[DialogButton]) -> void:
	dialog = DIALOG_MESSAGE.instantiate()
	dialog.init = init
	dialog.message = message
	dialog.speed = speed
	dialog.buttons = buttons
	root_node.add_child(dialog)
