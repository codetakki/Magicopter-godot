extends Timer
@onready var mainGame = get_node("/root/MainGame")

func _ready():
	wait_time = 1.5 - (0.1 -1.5) * mainGame.difficulty
func _physics_process(delta):
	wait_time = lerp(1.5, 0.85, mainGame.difficulty)
	
