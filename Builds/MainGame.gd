extends Node2D

var score = 0
var playerDead = false 
@onready var screenSize = get_viewport_rect().size 

enum gameState  {
	Playing,
	Mainmenu,
	Dead
}
var currentState = gameState.Mainmenu
signal stateChanged
func playing():
	return currentState == gameState.Playing
func isMainMenu():
	return currentState == gameState.Mainmenu
func dead():
	return currentState == gameState.Dead

func _setState(newState):
	var oldState = currentState
	currentState = newState
	stateChanged.emit(gameState.keys()[newState], oldState)
	
func _input(event):
	if !event.is_action_pressed("switchdirection"):
		return
	match currentState:
		gameState.Playing:
			pass
		gameState.Mainmenu:
			_setState(gameState.Playing)
			pass
		gameState.Dead:
			_setState(gameState.Mainmenu)
			pass
	
func spawn_obsticle():
	var new_obsticle = preload("res://Scenes/obsticle.tscn").instantiate()
	self.add_child(new_obsticle)

func add_score():
	if playerDead:
		return false
	score+=1
	%ScoreText.text = str(score)
	return true

func _on_timer_timeout():
	if !playerDead && playing():
		spawn_obsticle()

func _on_player_died():
	_setState(gameState.Dead)
	playerDead = true
