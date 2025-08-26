extends PlayerState

@onready var hurt_box: Area2D = $"../../HurtBox"
@onready var moveState = $"../Move"
@onready var idleState = $"../Idle"

@export var knockback_force: float

var is_anim_finished: bool

func enter():
	super()
	parent.velocity = Vector2.ZERO
	is_anim_finished = false
	parent.animations.connect("animation_finished", func(): is_anim_finished = true)
	knock_back()
	
func exit():
	super()

func process_input(event) -> State:
	super(event)
	if is_anim_finished and event.is_action_pressed("move"):
		return moveState
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	if is_anim_finished:
		return idleState
	return null

func process_physics(delta:float) -> State:
	super(delta)
	return null

func knock_back() -> void:
	var push_direction = parent.global_position - hurt_box.hit_source.global_position
	parent.velocity = push_direction.normalized() * knockback_force
	
