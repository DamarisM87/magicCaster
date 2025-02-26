extends Control

var scoooore = 0

func _ready():
	$Score.text = "Score: 0"


func updateScore(points):
	scoooore += points
	$Score.text = "Score: "+ str(scoooore)
