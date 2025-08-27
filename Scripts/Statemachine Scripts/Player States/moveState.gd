extends PlayerState

@onready var idleState = $"../Idle"
@onready var attackState = $"../Attack"
@export var moveSpeed: float

var input_direction: Vector2

func enter():
	super()
	
func exit():
	super()

func process_input(event) -> State:
	super(event)
	
	if event.is_action_pressed("attack"):
		return attackState
	
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
		parent.sprite.flip_h = false
	if new_dir < 0:
		parent.sprite.flip_h = true
	
