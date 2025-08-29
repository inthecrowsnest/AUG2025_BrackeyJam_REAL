class_name MeleeEnemy extends EnemyController

@onready var state_machine = $StateMachine
@onready var animator = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var sprite = $Sprite
@onready var healthBar = $healthBar
@export var goal: Node = null
var facingDirection = Vector2(0.0, 1.0)

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


func _on_hit_box_body_entered(body: Player) -> void:
	body.take_damage(10)
