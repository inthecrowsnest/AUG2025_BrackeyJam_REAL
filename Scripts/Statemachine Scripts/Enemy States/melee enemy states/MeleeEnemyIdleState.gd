extends EnemyState

@onready var chaseState = $"../Chasing"
@onready var attackState = $"../Attacking"

func enter():
	super()
	parent.velocity = Vector2.ZERO
	
func exit():
	super()

func process_input(event) -> State:
	super(event)
	
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	if parent.velocity != Vector2.ZERO:
		return chaseState
	
	return null

func process_physics(delta:float) -> State:
	super(delta)
	return null
