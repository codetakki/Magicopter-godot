extends "res://Scripts/PlaceCenter.gd"

func _process(_delta):
	if mainGame.dead() :
		position.y = lerp(position.y, -200.0,0.1)
