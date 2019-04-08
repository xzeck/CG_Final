extends Sprite

export var velocity = Vector2()


func _ready():
	set_process(true)
	pass

func _process(delta):
	translate(velocity * delta)
	
	if self.get_position().y >= get_viewport_rect().size.y:
		self.set_position(Vector2(0,-180))
	pass
