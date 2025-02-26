extends KinematicBody2D


export var speed = 100 

var target_position  # Use this variable

var character_position
onready var player = get_tree().get_root().find_node("player", true, false)



func _physics_process(delta):
	character_position = player.position 
	target_position = (character_position - position).normalized()
	
	
	
	
	if position.distance_to(character_position) > 3:
		move_and_slide(target_position * speed)
		look_at(character_position)
	
	
	if position.x < player.position.x:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false

	if player.dead:
		queue_free()

func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		body.queue_free()
		queue_free()
	elif "player" in body.name:
		body.takedmg()
		queue_free()
