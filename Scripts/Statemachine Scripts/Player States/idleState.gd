extends PlayerState

@onready var moveState = $"../Move"
@onready var attackState = $"../Attack"
@onready var dash = $"../Dash"


func enter():
	super()
	parent.velocity = Vector2.ZERO
	
func exit():
	super()

func process_input(event) -> State:
	super(event)
	if event.is_action_pressed("attack"):
		return attackState
	if event.is_action_pressed("dash"):
		return dash
	
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	if Input.get_vector("left", "right", "up", "down") != Vector2.ZERO:
		return moveState
	
	
	return null

func process_physics(delta:float) -> State:
	super(delta)
	return null
