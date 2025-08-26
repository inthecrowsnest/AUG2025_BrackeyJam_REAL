extends PlayerState

@export var idleState: State
@export var moveSpeed: float

var input_direction: Vector2

func enter():
	super()
	input_direction = Input.get_vector("left", "right", "up", "down")
	_check_if_should_flip(round(input_direction.x))
	
func exit():
	super()

func process_input(event) -> State:
	super(event)
	if event.is_action_pressed("slow_time"):
		Engine.time_scale -= 0.05
	elif event.is_action_pressed("speed_up_time"):
		Engine.time_scale += 0.05
	
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	input_direction = Input.get_vector("left", "right", "up", "down")
	
	_check_if_should_flip(round(input_direction.x))
	
	if input_direction == Vector2.ZERO:
		return idleState
		
	return null

func process_physics(delta:float) -> State:
	super(delta)
	parent.velocity = input_direction * moveSpeed
	return null
	
func _check_if_should_flip(new_dir: int) -> void:
	if new_dir > 0:
		parent.animations.flip_h = false
	if new_dir < 0:
		parent.animations.flip_h = true
	
