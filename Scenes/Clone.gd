extends AnimatedSprite2D

@onready var screenSize = get_viewport_rect().size
@onready var parent = get_parent()
var operator = 1
func _process(_delta):
	global_position.y = parent.position.y
	
	if (parent.position.x > screenSize.x / 2):
		operator = -1
	else: 
		operator = 1
	
	global_position.x = parent.position.x + (screenSize.x) * operator
	
