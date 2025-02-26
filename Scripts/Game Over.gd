extends Panel


onready var backgroundMusic = get_parent().get_parent().get_node("BG")

func _ready():
	visible = false

func gameOver():
	visible = true
	backgroundMusic.stop()
	$AnimationPlayer.play("Slide")
	get_node("AudioStreamPlayer2D").play()


func _on_Restart_pressed():
	get_tree().reload_current_scene()


func _on_Exit_pressed():
	get_tree().quit()
