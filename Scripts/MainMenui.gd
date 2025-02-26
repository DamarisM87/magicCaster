extends Control



func _on_Start_mouse_entered():
	$Hover.play()


func _on_Exit_mouse_entered():
	$Hover.play()


func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_Exit_pressed():
	get_tree().quit()
	
