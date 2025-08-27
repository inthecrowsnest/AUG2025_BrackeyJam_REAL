class_name Player extends CharacterBody2D

@onready var state_machine = $StateMachine
@onready var animator = $AnimationPlayer
@onready var anim_tree = $AnimationTree
@onready var sprite = $Sprite

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

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
