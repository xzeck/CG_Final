extends Area2D

export var velocity = Vector2()
export var Health = 10 setget Balloon_Health

var flare_scn = preload("res://scenes/flare.tscn")
func _ready():
	set_process(true)
	add_to_group("enemy")
	pass
	
func _process(delta):
	translate(velocity * delta)
	
	if self.get_position().y-16 >= get_viewport_rect().size.y:
		queue_free()
	pass

func Balloon_Health(new_value):
	Health = new_value
	if Health <= 0 : queue_free()
	pass

func create_flare():
	var flare = flare_scn.instance()
	flare.set_position(self.get_position())
	get_tree().get_root().add_child(flare)
