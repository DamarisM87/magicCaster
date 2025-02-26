extends RigidBody2D


var direction = Vector2.ZERO

func _physics_process(delta):
	position += direction * delta * 200

