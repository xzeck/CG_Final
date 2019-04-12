extends "res://scripts/enemy.gd"

func _ready():
	connect("area_entered", self, "_on_area_entered")
	pass

func _on_area_entered(other):
	if other.is_in_group("ship"):
		other.Health_Ship -=30
		create_flare()
		queue_free()
	pass