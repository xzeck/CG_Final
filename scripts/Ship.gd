#Ship Script

extends Area2D

func _ready():
	set_process(true)
	pass

func _process(delta):
	var motion = (get_global_mouse_position().x - self.get_position().x) * 0.2
	translate(Vector2(motion, 0))
	
	var viewsize = get_viewport_rect().size
	print(viewsize)
	var pos = self.get_position()
	pos.x = clamp(pos.x, 0+40,(viewsize.x - 40))
	self.set_position(pos)
	pass

