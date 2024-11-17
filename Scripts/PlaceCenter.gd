extends Node2D
@onready var screensize = get_viewport_rect().size
@onready var mainGame = get_node("/root/MainGame")

func _ready():
	position.x = screensize.x/2
