extends PlayerState

@onready var moveState = $"../Move"
@onready var idleState = $"../Idle"

var is_anim_finished: bool

func enter():
	super()
	parent.animator.speed_scale = parent.attackSpeed
	parent.velocity = Vector2.ZERO
	is_anim_finished = false
	parent.anim_tree.animation_finished.connect(func(_anim): is_anim_finished = true)
	parent.anim_tree.set("parameters/TimeScale/scale", 2)
	
	
func exit():
	super()
	parent.anim_tree.set("parameters/TimeScale/scale", 1)
	
func process_input(event) -> State:
	super(event)
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	if is_anim_finished and Input.get_vector("left", "right", "up", "down") != Vector2.ZERO:
		return moveState
	elif is_anim_finished:
		return idleState
	
	return null

func process_physics(delta:float) -> State:
	super(delta)
	return null
