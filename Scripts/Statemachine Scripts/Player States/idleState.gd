extends PlayerState

@export var moveState: State

func enter():
	parent.velocity = Vector2.ZERO
	
func exit():
	pass

func process_input(event) -> State:
	if event.is_action_pressed("move"):
		return moveState
	return null
	
func process_frame(delta: float) -> State:
	return null

func process_physics(delta:float) -> State:
	return null
