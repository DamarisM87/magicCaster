extends KinematicBody2D

export var HP = 1
export var gravity = 450
export var jumpForce = -250
var velocity = Vector2.ZERO
var dead = false

func _ready():
	$Sprite/AnimationPlayer.play("Idle")


func _physics_process(delta):
	if !dead:
		velocity.y += gravity * delta
		
		if Input.is_action_pressed("Up") and is_on_floor() == true:
			velocity.y = jumpForce
			get_node("Jump sound").play()
		
		velocity = move_and_slide(velocity, Vector2.UP)



func takedmg():
	if !dead:
		HP -=1	
		if HP <= 0:
			$Sprite/AnimationPlayer.play("Die")
			dead = true
		else:
			$Sprite/AnimationPlayer.play("Hit")



func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Hit":
		$Sprite/AnimationPlayer.play("Idle")
