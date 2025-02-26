extends Node2D


onready var timer = get_parent().get_node("Timer")
onready var positions : Array 
onready var player = get_parent().get_node("player")
var chosenSpawnLocation = 0
var Enemy = preload("res://Scenes/EnemyEagle.tscn")



func _ready():
	for c in get_children():
		positions.append(c.get_global_position())
		


func _on_Timer_timeout():
	if !player.dead:
		chosenSpawnLocation = randi()%8
		print(chosenSpawnLocation)
		var e = Enemy.instance()
		e.position = positions[chosenSpawnLocation]
		get_tree().get_root().call_deferred("add_child",e)
		
		timer.wait_time = int(randi()%4+1)
		timer.start()
