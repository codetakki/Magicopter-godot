extends Node2D


func _on_animated_sprite_2d_animation_finished():
	queue_free()	
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_entered():
	$AnimatedSprite2D.play("default")
	$ExplosionSfx.play()  
	pass # Replace with function body.
