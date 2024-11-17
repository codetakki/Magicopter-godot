extends Camera2D
@onready var mainGame = get_node("/root/MainGame")
var playerDead = false
func _ready():
	position.y = %Player.position.y + 100

var time = 0.0
func _process(_delta):
	time += _delta
	if mainGame.isMainMenu():
		position.y += -200 * _delta
		return
	if !playerDead:
		position.y = %Player.position.y


func _on_player_died():
	playerDead = true
	pass # Replace with function body.
