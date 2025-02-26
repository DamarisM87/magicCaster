extends Node2D


onready var timer = get_parent().get_node("Timer")
onready var player = get_parent().get_node("player")
onready var positions: Array
var chosenSpawnLocations = 0
var Enemy = preload("res://Scenes/EnemyEagle.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	for c in get_children():
		positions.append(c.get_global_position())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	if !player.dead:
		var chosenSpawnLocation = randi() % 8   # from 0 to 7
		var e = Enemy.instance()
		e.position = positions[chosenSpawnLocation]
		get_tree().get_root().call_deferred("add_child",e)		
		timer.wait_time = randi() % 5 + 1  #from 1 to 5 seconds, decrease the number to make it more challenging
		timer.start()
		
