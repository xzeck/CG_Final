extends Node

func _ready():
	pass

func PlayTheme():
	get_node("AudioStreamPlayer").play()
	pass