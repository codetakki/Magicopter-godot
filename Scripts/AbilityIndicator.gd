@tool
extends Sprite2D
@onready var mainGame = get_node("/root/MainGame")

@export var percent = 1.0:
	get: 
		return clamp(percent, 0, 1)
	set(value):
		percent = clamp(value, 0, 1)
		set_sprite(value)
func set_sprite(value):
	offset.y = lerp(40, 0, value)
	region_rect.position.y = lerp(52, 12, value)
	
func _on_property_list_changed():
	set_sprite(clamp(percent, 0, 1))
	pass # Replace with function body.
	
func _process(delta):
	get_parent().visible = mainGame.playing()
