extends Node2D

@onready var mainGame = get_node("/root/MainGame")
var playing = false
func _process(_delta):
	if mainGame.playing() && !playing:
		playing = true
		%AnimationPlayer.play("Slide in")

func _on_animation_player_animation_finished(anim_name):
	%AnimationPlayer.pause()
	
	pass # Replace with function body.


func _on_main_game_state_changed(value):
	print(value)
	pass # Replace with function body.
