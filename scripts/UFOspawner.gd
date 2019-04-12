extends Node

const path_UFO_Red = preload("res://scenes/RandomUFO_Red.tscn")
const path_UFO_Green = preload("res://scenes/RandomUFO_Green.tscn")

func _ready():
	$Timer.wait_time = rand_range(1,20)
	$Timer.connect("timeout", self, "spawn_UFO")
	$Timer.start()
	pass 

func spawn_UFO():
	randomize()
	
	var RandomUFONumber = randi()%2+1
	print(RandomUFONumber)
	var UFOInstance; 
	var pos = Vector2()
	
	if RandomUFONumber == 1:
		UFOInstance = path_UFO_Red.instance()
	if RandomUFONumber == 2:
		UFOInstance = path_UFO_Green.instance()
	
	pos.x = rand_range(0+16, get_viewport().get_visible_rect().size.x -16)
	pos.y = -144
	UFOInstance.position = pos
	get_node("UFOContainer").add_child(UFOInstance)
	$Timer.wait_time = rand_range(1,20)
	$Timer.start()
	pass