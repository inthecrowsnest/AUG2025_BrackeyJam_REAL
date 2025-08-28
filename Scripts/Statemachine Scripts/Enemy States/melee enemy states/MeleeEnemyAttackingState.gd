extends EnemyState

@onready var chasingState = $"../Chasing"
@onready var idleState = $"../Idle"

var is_anim_finished: bool

func enter():
	super()
	parent.velocity = Vector2.ZERO
	is_anim_finished = false
	parent.animation_tree.connect("animation_finished", func(_anim): is_anim_finished = true)
	
func exit():
	super()

func process_input(event) -> State:
	super(event)
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	if is_anim_finished:
		return chasingState
	#elif is_anim_finished:
		#return idleState
	
	return null

func process_physics(delta:float) -> State:
	super(delta)
	return null
