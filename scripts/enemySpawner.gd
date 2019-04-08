extends Node

const path_enemy_Red = preload("res://scenes/enemy_fast_Red.tscn")
const path_enemy_yellow = preload("res://scenes/enemy_fast_yellow.tscn")

func _ready():
 
 # Set timer
 $Timer.wait_time = rand_range(1, 30)
 $Timer2.wait_time = rand_range(1, 25)
 $Timer.connect("timeout", self, "spawn_red")
 $Timer2.connect("timeout", self, "spawn_yellow")
 $Timer.start()
 $Timer2.start()
 
 pass
 
func spawn_red():
 
 randomize()
  
 var enemy = path_enemy_Red.instance()
 var pos   = Vector2()
 
 pos.x = rand_range(0 + 40, get_viewport().get_visible_rect().size.x - 40)
 pos.y = -114
 
 enemy.position = pos
 
 get_node("EnemyContainer").add_child(enemy)
 
 # Set timer again
 $Timer.wait_time = rand_range(1, 3)
 $Timer.start()


func spawn_yellow():
	randomize()
  
 var enemy = path_enemy_yellow.instance()
 var pos   = Vector2()
 
 pos.x = rand_range(0 + 40, get_viewport().get_visible_rect().size.x - 40)
 pos.y = -114
 
 enemy.position = pos
 
 get_node("EnemyContainer").add_child(enemy)
 
 # Set timer again
 $Timer2.wait_time = rand_range(1, 3)
 $Timer2.start()