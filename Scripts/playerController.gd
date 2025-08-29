class_name Player extends Controller

@onready var state_machine = $StateMachine
@onready var animator = $AnimationPlayer
@onready var anim_tree = $AnimationTree
@onready var sprite = $Sprite
@onready var delay_timer: Timer = $DelayTimer
@onready var healthBar: ProgressBar = $healthBar

var canDash = true

var maxHealth: float = 100
var health: float = 100

var facingDirection: Vector2 = Vector2(0, 1.0)

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	move_and_slide()
	healthBar.set_value(health)
	
	if health <= 0:
		die()

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
	
func take_damage(damage:int):
	print(health)
	print("taken damage")
	health -= damage
	if health < 0: health = 0
	healthBar.set_value(health)
	healthBar.max_value = healthBar.max_value
	
func die():
	get_tree().reload_current_scene()


func _on_delay_timer_timeout() -> void:
	canDash = true
