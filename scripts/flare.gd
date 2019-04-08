extends Sprite

func _ready():
	get_node("flareAnimation").play("fadeout")
	yield(get_node("flareAnimation"), "animation_finished")
	queue_free()
	pass