extends PlayerState

@onready var hurt_box: Area2D = $HurtBox
@onready var moveState = $"../Move"
@onready var idleState = $"../Idle"
@onready var player = "res://Scripts/player.gd"

@export var knockback_force: float

var is_anim_finished: bool

func enter():
	super()
	is_anim_finished = false
	parent.animator.connect("animation_finished", func(_anim): is_anim_finished = true)
	knock_back()
	
func exit():
	super()

func process_input(event) -> State:
	super(event)
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	player.health -= 10
	
	if is_anim_finished and Input.get_vector("left", "right", "up", "down") != Vector2.ZERO:
		return moveState
	elif is_anim_finished:
		return idleState
	
	return null

func process_physics(delta:float) -> State:
	super(delta)
	return null

func knock_back() -> void:
	var push_direction = parent.global_position - hurt_box.hit_source.global_position
	parent.velocity = push_direction.normalized() * knockback_force
