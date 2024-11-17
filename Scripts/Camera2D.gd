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
		offset.y = -80
		return
	if !playerDead:
		position.y = lerp(position.y, %Player.position.y, 0.3)
		offset.y = lerp(offset.y, -250.0, 0.01)


func _on_player_died():
	playerDead = true
	pass # Replace with function body.
