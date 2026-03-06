extends RichTextLabel

var vel: float = 0.25

func _ready() -> void:
	visible_characters = 0

func _process(delta: float) -> void:
	if visible_ratio == 1:
		visible_characters = -1
	else:
		visible_ratio += vel * delta
