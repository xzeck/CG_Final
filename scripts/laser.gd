extends Area2D

export var velocity = Vector2()

const flare_scn = preload("res://scenes/flare.tscn")


func _ready():
	set_process(true)
	create_flare()
	
	yield(get_node("vis_notifier"),"exit_screen")
	queue_free()
	pass
	
func _process(delta):
	translate(velocity * delta)
	pass
	
func create_flare():
	var flare = flare_scn.instance()
	flare.set_position(self.get_position())
	get_tree().get_root().add_child(flare)