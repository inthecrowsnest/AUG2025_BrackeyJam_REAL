class_name Enemy extends CharacterBody2D

@onready var state_machine = $StateMachine
@onready var animator = $AnimationPlayer
@onready var sprite = $Sprite
@onready var healthBar = $healthBar

var health: int = 10

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	move_and_slide()
	healthBar.value = health
	
	if health <= 0:
		die()

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
	
func die():
	$".".queue_free()
