extends EnemyState

var bullet_path = preload("res://Scenes/ranged_attack.tscn")

@onready var chasingState = $"../Chasing"
@onready var idleState = $"../Idle"
@onready var shoot_timer: Timer = $"../../ShootTimer"
@onready var navigation_agent_2d: NavigationAgent2D = $"../../NavigationAgent2D"


var shoot = false

var is_anim_finished: bool

func enter():
	super()
	parent.velocity = Vector2.ZERO
	is_anim_finished = false
	parent.animation_tree.connect("animation_finished", func(_anim): is_anim_finished = true)
	
func exit():
	super()
	fire()

func process_input(event) -> State:
	super(event)
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	if !shoot:
		shoot=true
		shoot_timer.start()
	if is_anim_finished:
		return chasingState
	#elif is_anim_finished:
		#return idleState
	
	return null

func process_physics(delta:float) -> State:
	super(delta)
	return null

func fire():
	var next_path_position = navigation_agent_2d.get_next_path_position()
	var nav_point_direction = to_local(next_path_position).normalized()
	var bullet=bullet_path.instantiate()
	bullet.dir=nav_point_direction
	bullet.pos=$".".global_position
	bullet.rota=parent.goal.global_position
	get_parent().add_child(bullet)
	_check_if_should_flip(nav_point_direction)

func _on_shoot_timer_timeout() -> void:
	shoot=true
	fire()

func _check_if_should_flip(new_dir: Vector2) -> void:	
	parent.facingDirection = new_dir
	parent.animation_tree.set("parameters/walk/blend_position", parent.facingDirection)
