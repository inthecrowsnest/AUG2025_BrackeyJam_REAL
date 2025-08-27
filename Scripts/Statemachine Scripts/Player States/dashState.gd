extends PlayerState

@onready var moveState = $"../Move"
@onready var idleState = $"../Idle"
@onready var timer: Timer = $"../../Timer"
@onready var delay_timer: Timer = $"../../DelayTimer"


const DASH_Speed = 500
var start = true

func enter():
	super()
	var input_direction = Input.get_vector("left", "right", "up", "down")
	parent.velocity = input_direction * DASH_Speed
	
	
func process_input(delta) -> State:
	super(delta)
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if start:
		timer.start()
	if input_direction == Vector2.ZERO:
		return idleState
	else:
		return moveState
	return null
	
func exit():
	super()

func _on_timer_timeout() -> State:
	delay_timer.start()
	start = false
	return moveState


func _on_delay_timer_timeout() -> void:
	start = true
