extends PlayerState

@onready var idleState = $"../Idle"
@onready var attackState = $"../Attack"
@onready var dashState = $"../Dash"
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
	elif event.is_action_pressed("dash"):
		return dashState
	
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	input_direction = Input.get_vector("left", "right", "up", "down")
	
	if input_direction == Vector2.ZERO:
		return idleState
	
	_change_directions(Vector2(round(input_direction.x), round(input_direction.y)))
	#_change_directions(input_direction)
		
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
		
