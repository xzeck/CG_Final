extends Node2D

export var velocity = Vector2()

func _process(delta):
	translate(velocity * delta)
	
	if self.get_position().y - 16 >= get_viewport_rect().size.y:
		queue_free()
	pass