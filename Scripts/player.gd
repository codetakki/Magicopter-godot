extends CharacterBody2D

@onready var screensize = get_viewport_rect().size
@onready var mainGame = get_node("/root/MainGame")

var speed = 700.0
var initSpeed = 700.0
var direction = 1.0

var dead = false
signal died 

func _ready():
	position.x = screensize.x/2
	
func _input(event):
	if event.is_action_pressed("switchdirection"):
		direction = direction *-1
	
var time = 0.0
func _physics_process(delta, ):
	time += delta
	var overlapping_objects = %HitBox.get_overlapping_bodies()
	if overlapping_objects.size() > 0:
		damage()
	if mainGame.isMainMenu():
		velocity = Vector2(0, 200 * sin(1 * time))
	elif dead:
		velocity = Vector2(lerp(velocity.x, 0.0, 0.03), lerp(velocity.y, 700.0, .06))
	else:
		velocity = Vector2(lerp(velocity.x, direction * speed, .05), -200)
	
	if mainGame.playing():
		rotation = atan2(velocity.normalized().y, velocity.normalized().x) + 1.570796  	
	move_and_slide()
	position.x = wrapf(position.x, 0, screensize.x)

	

func damage():
	if dead:
		return
		
	dead = true
	%DeathSfx.play()
	died.emit()

