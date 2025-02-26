extends Sprite


#####################################################
#	 		Write the code so that would:			#
#	1. Rotate the wizard's staff to aim at mouse	#
#	2. Shoot the bullet towards mouse				#
#	3. Rotate the bullet toward the mouse direction #
#####################################################


var bullet_speed = 400
var bullet = preload("res://Scenes/Fireball.tscn")
onready var player = get_parent()


func _physics_process(delta):
	if !player.dead:
		look_at(get_global_mouse_position())
		if Input.is_action_just_pressed("Shoot") :
			fire()
	else:
		queue_free()
	
func fire():
	var b = bullet.instance()
	get_tree().root.add_child(b)
	b.position = $firePosition.global_position
	b.direction = (get_global_mouse_position() - b.position).normalized()
	b.look_at(get_global_mouse_position())
