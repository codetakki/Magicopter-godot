extends Camera2D
@onready var mainGame = get_node("/root/MainGame")
var playerDead = false
func _ready():
	position.y = %Player.position.y + 100

func _process(_delta):
	if mainGame.isMainMenu():
		return
	if !playerDead:
		position.y = %Player.position.y


func _on_player_died():
	playerDead = true
	pass # Replace with function body.
