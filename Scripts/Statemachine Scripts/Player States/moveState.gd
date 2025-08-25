extends PlayerState

@export var idleState: State
@export var moveSpeed: float

var input_direction: Vector2

func enter():
	pass
	
func exit():
	pass

func process_input(event) -> State:
	if event is InputEventAction and not event.pressed and event.action == "move":
		return idleState
	
	input_direction = Input.get_vector("left", "right", "up", "down")
	
	return null
	
func process_frame(delta: float) -> State:
	return null

func process_physics(delta:float) -> State:
	parent.velocity = input_direction * moveSpeed
	return null
