extends Node

const DIALOG_MESSAGE: PackedScene = preload("res://scenes/templates/dialog_message.tscn")

var dialog: CanvasLayer

class DialogButton:
	var message: String
	var function: Callable
	
	func _init(button_label: String, button_func: Callable):
		message = button_label
		function = button_func
		pass
	pass

func instance_dialog(root_node: Node2D, message: String, speed: float, init: Callable, buttons: Array[DialogButton]) -> void:
	dialog = DIALOG_MESSAGE.instantiate()
	dialog.init = init
	dialog.message = message
	dialog.speed = speed
	dialog.buttons = buttons
	root_node.add_child(dialog)
