class_name Player extends Controller

@onready var state_machine = $StateMachine
@onready var animator = $AnimationPlayer
@onready var anim_tree = $AnimationTree
@onready var sprite = $Sprite
@onready var healthBar = $healthBar
@onready var delay_timer: Timer = $DelayTimer


var canDash = true
var attackSpeed = 1

var health: int = 100

var facingDirection: Vector2 = Vector2(0, 1.0)

var items = []

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
	get_tree().reload_current_scene()


func _on_delay_timer_timeout() -> void:
	canDash = true
	
func obtain_item(item: ItemData) -> void:
	#TODO
	attackSpeed *= item.attackSpeedMultiplier
