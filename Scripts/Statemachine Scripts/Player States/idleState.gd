extends PlayerState

@export var moveState: State

func enter():
	super()
	parent.velocity = Vector2.ZERO
	
func exit():
	super()

func process_input(event) -> State:
	super(event)
	if event.is_action_pressed("move"):
		return moveState
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	return null

func process_physics(delta:float) -> State:
	super(delta)
	return null
