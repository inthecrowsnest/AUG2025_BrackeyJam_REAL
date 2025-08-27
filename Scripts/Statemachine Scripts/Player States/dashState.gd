extends PlayerState

@onready var moveState = $"../Move"
@onready var idleState = $"../Idle"
@onready var timer: Timer = $"../../Timer"


const DASH_Speed = 500
const DASH_DURATION = 0.2

func enter():
	super()
	var input_direction = Input.get_vector("left", "right", "up", "down")
	parent.velocity = input_direction * DASH_Speed
	
func process_input(delta) -> State:
	super(delta)
	var input_direction = Input.get_vector("left", "right", "up", "down")
	timer.start()
	if input_direction == Vector2.ZERO:
		return idleState
	return null
	
func exit():
	super()

func _on_timer_timeout() -> State:
	return moveState
