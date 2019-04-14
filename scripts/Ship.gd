#Ship Script

extends Area2D
const scn_laser = preload("res://scenes/laser_ship.tscn")
const scn_explo = preload("res://scenes/Explosion.tscn")
signal health_changed

var Health_Ship = 4 setget Player_Health
var pos
func _ready():
	set_process(true)
	set_process_input(true)
	add_to_group("ship")
	pass

func _process(delta):
	var motion = (get_global_mouse_position().x - self.get_position().x) * 0.2
	translate(Vector2(motion, 0))
	
	var viewsize = get_viewport_rect().size
	# print(viewsize)
	pos = self.get_position()
	pos.x = clamp(pos.x, 0+40,(viewsize.x - 40))
	self.set_position(pos)
	pass

func _input(event):
	if event is InputEventKey and event.get_scancode() == KEY_SPACE:
		if !event.is_pressed():
			shoot()
	pass

func shoot():
	var CannonPos = get_node("cannon/cannon_position").get_global_position()
	create_laser(CannonPos)
	LaserSound.play("LaserShoot")
	pass

func Player_Health(new_value):
	Health_Ship = new_value
	emit_signal("health_changed", Health_Ship)
	if Health_Ship <= 0 : 
		var explo_instance = scn_explo.instance()
		explo_instance.set_position(pos)
		get_tree().get_root().add_child(explo_instance)
		queue_free()
	pass


func create_laser(pos):
	var laser = scn_laser.instance()
	laser.set_position(pos)
	get_tree().get_root().add_child(laser)
	pass
	
