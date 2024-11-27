extends CharacterBody2D

@onready var screensize = get_viewport_rect().size
@onready var mainGame = get_node("/root/MainGame")
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
var speed = -200.0

func _physics_process(delta, ):
	#mainGame.find_child("AbilityToken").percent = .9
	time += delta
	#Adjust speed based on difficulty
	speed = lerp(-200, -470, mainGame.difficulty)
	var overlapping_objects = %HitBox.get_overlapping_bodies()
	
	if overlapping_objects.size() > 0:
		damage(overlapping_objects)
	if mainGame.isMainMenu():
		velocity = Vector2(0, 90 * sin(1 * time))
		velocity.y += -200
	elif dead:
		velocity = Vector2(lerp(velocity.x, 0.0, 0.03), lerp(velocity.y, 700.0, .06))
	else:
		velocity = Vector2(lerp(velocity.x, direction * (speed * 3.5), .05), speed)
	
	rotation = atan2(velocity.normalized().y, velocity.normalized().x) + 1.570796  	
	move_and_slide()
	position.x = wrapf(position.x, 0, screensize.x)
	abilityTimer += delta
	abilityTimer = clamp(abilityTimer, 0, abilityCooldown)
	mainGame.abilityToken.percent = abilityTimer/abilityCooldown
	
var abilityCooldown = 7
var abilityTimer = 10
func damage(overlapping_objects):
	var obsticle = overlapping_objects[0].get_parent()
	if (obsticle.destroyed):
		return
	if dead:
		return
	
	if (abilityTimer >= abilityCooldown):
		useAbility(overlapping_objects)
		return
	dead = true
	%DeathSfx.play()
	died.emit()
	
func useAbility(overlapping_objects):
	abilityTimer = 0
	print(overlapping_objects)
	overlapping_objects[0].get_parent().destroy()
	%AbilityExplosion.play("default")

