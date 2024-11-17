extends Node2D

func _ready():
	$AnimatedSprite2D.play("default")
	$ExplosionSfx.play()  

func _on_animated_sprite_2d_animation_finished():
	queue_free()	
	pass # Replace with function body.
