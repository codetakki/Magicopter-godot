extends Node2D

var spaceMax = 140
var spaceMin = 100
@onready var screen = get_viewport_rect()
@onready var screensize = screen.size
@onready var player = get_node("../Player")

func _ready():
	var space = randi_range(spaceMin, spaceMax)
	%MiddleBlock.scale.x = space
	%"Right block".position = Vector2(space/2.0, 0)
	%"Left block".position = Vector2(space/2.0 * -1, 0)
	%Label.text = str(space)
	var topPosition = player.position.y - screensize.y 
	global_position = Vector2(randf_range(space , screensize.x-space), topPosition) 

func _on_middle_block_area_exited(area):
	print("collsition")
	if get_node("/root/MainGame").add_score():
		%ScoreSfx.play()
	pass # Replace with function body.
	
var destroyed = false
func destroy():
	destroyed = true
	%DestroyEffect.visible = true 
	%"Left block".visible=false 
	%"Right block".visible=false
	pass 


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	pass # Replace with function body.
