extends EnemyState

@onready var idleState = $"../Idle"
@onready var attackState = $"../Attacking"
@export var moveSpeed: float


@onready var navigation_agent_2d: NavigationAgent2D = $"../../NavigationAgent2D"
@onready var timer: Timer = $"../../Timer"

var target_found = false

func enter():
	super()
	navigation_agent_2d.target_position = parent.goal.global_position
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
		_check_if_should_flip(nav_point_direction)
	return null
 

func _check_if_should_flip(new_dir: Vector2) -> void:	
	parent.facingDirection = new_dir
	parent.animation_tree.set("parameters/walk/blend_position", parent.facingDirection)


func _on_timer_timeout() -> void:
	if navigation_agent_2d.target_position != parent.goal.global_position:
		navigation_agent_2d.target_position = parent.goal.global_position
	timer.start()


func _on_area_2d_body_entered(body: Node2D) -> void:
	target_found = true



func _on_area_2d_body_exited(body: Node2D) -> void:
	target_found = false
	
