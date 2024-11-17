extends "res://Scripts/PlaceCenter.gd"

var vel = 0.0
func _process(_delta):
	if !mainGame.isMainMenu() :
		position.y += lerp(vel, 200.0,1) * _delta
