extends CharacterBody2D


@export var speed: int = 300
@export var dashFactor: int = 4
@export var timer: Timer

var dashing: bool = false

#sportmad12
var health: int = 50
var maxHealth = 150

@onready var healthBar  = $healthBar
#sportmad12

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	
	#sportmad12
	healthBar.set_health_bar(health, maxHealth)
	
	if health <= 0:
		die()
	#sportmad12
	
	if Input.is_action_just_pressed("dash") and not dashing:
		timer_start()

func get_input() -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	
func timer_start() -> void:
	dashing = true
	timer.start()
	speed = speed * dashFactor
	
func _on_dash_timer_timeout() -> void:
	dashing = false
	speed = speed / dashFactor
	
func take_damage(damage:int):
	health -= damage
	if health < 0: health = 0
	healthBar.change
	
func die():
	get_tree().reload_current_scene()
