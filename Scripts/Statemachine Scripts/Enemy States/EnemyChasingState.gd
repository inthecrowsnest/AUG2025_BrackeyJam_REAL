extends EnemyState

@onready var idleState = $"../Idle"
@onready var attackState = $"../Attacking"
@export var moveSpeed: float
@export var goal: Node = null

@onready var navigation_agent_2d: NavigationAgent2D = $"../../NavigationAgent2D"
@onready var timer: Timer = $"../../Timer"

var input_direction: Vector2

var target_found = false

func enter():
	super()
	navigation_agent_2d.target_position = goal.global_position
	timer.start()
	
func exit():
	super()

func process_input(event) -> State:
	super(event)
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	
	if target_found:
		return attackState
	
	return null


func process_physics(delta:float) -> State:
	super(delta)
	if !navigation_agent_2d.is_target_reached():
		var next_path_position = navigation_agent_2d.get_next_path_position()
		var nav_point_direction = to_local(next_path_position).normalized()
		if !target_found:
			parent.velocity = nav_point_direction * moveSpeed * delta
		else:
			parent.velocity = Vector2.ZERO
		parent.move_and_slide()
		_check_if_should_flip(nav_point_direction.x)
	return null
	
func _check_if_should_flip(new_dir: int) -> void:	
	if new_dir > 0:
		parent.sprite.flip_h = false
	if new_dir < 0:
		parent.sprite.flip_h = true


func _on_timer_timeout() -> void:
	if navigation_agent_2d.target_position != goal.global_position:
		navigation_agent_2d.target_position = goal.global_position
	timer.start()


func _on_area_2d_body_entered(body: Node2D) -> void:
	target_found = true
