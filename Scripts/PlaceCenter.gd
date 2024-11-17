extends Node2D
@onready var screensize = get_viewport_rect().size
@onready var mainGame = get_node("/root/MainGame")

func _ready():
	position.x = screensize.x/2

func _process(_delta):
	if mainGame.isMainMenu() :
		position.y += -200 * _delta
