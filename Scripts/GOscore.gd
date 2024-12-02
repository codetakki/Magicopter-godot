extends Label
@onready var mainGame = get_node("/root/MainGame")

func _process(delta):
	text = "Score:"+str(mainGame.score)
