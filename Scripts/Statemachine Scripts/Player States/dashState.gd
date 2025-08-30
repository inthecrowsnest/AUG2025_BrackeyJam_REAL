extends PlayerState

@onready var moveState = $"../Move"
@onready var idleState = $"../Idle"
@onready var timer: Timer = $"../../Timer"


var isAnimationFinished: bool

const DASH_Speed = 500



func enter():
	super()
	parent.velocity = parent.facingDirection * DASH_Speed
	parent.canDash = false
	timer.start()
	isAnimationFinished = false
	parent.invincible = true
	parent.delay_timer.wait_time *= parent.dashDelay
	
	
func process_input(delta) -> State:
	super(delta)
	return null

func process_frame(delta) -> State:
	super(delta)
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if input_direction == Vector2.ZERO and isAnimationFinished:
		return idleState
	elif isAnimationFinished:
		return moveState
	return null

func exit():
	super()
	parent.delay_timer.start() 
	parent.label.show()
	parent.invincible = false

func _on_timer_timeout() -> void:
	isAnimationFinished = true
	
