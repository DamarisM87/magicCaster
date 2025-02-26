extends ColorRect


func _ready():
	visible = false



func _process(delta):
	if Input.is_action_just_released("ui_cancel"):
		visible = !visible
		get_tree().paused =  !get_tree().paused


func _on_Restart_pressed():	
	get_tree().paused =  !get_tree().paused
	get_tree().reload_current_scene()
	


func _on_Exit_pressed():
	get_tree().paused =  !get_tree().paused
	get_tree().quit()
