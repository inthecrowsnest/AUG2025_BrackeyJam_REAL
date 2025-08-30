extends EnemyState

@onready var chasingState = $"../Chasing"
@onready var idleState = $"../Idle"

var is_anim_finished: bool

func enter():
	super()
	parent.velocity = Vector2.ZERO
	is_anim_finished = false
	parent.animation_tree.animation_finished.connect(func(_anim): is_anim_finished = true)
	parent.animation_tree.set("parameters/TimeScale/scale", parent.attackSpeed)

func exit():
	super()

func process_input(event) -> State:
	super(event)
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	if is_anim_finished:
		return chasingState
	#elif is_anim_finished:
		#return idleState
	
	return null

func process_physics(delta:float) -> State:
	super(delta)
	return null

func _on_hit_box_body_entered(body: Player) -> void:
	body.take_damage(10)
	
