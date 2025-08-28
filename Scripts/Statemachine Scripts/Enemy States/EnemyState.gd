class_name EnemyState extends State

var parent: EnemyController

@export var animation_name: String

func enter():
	print(animation_name)
	parent.animation_tree.get("parameters/playback").travel(animation_name)
	parent.animation_tree.set("parameters/" + animation_name+ "/blend_position", parent.facingDirection)
	
func exit():
	pass

func process_input(event) -> State:
	return null
	
func process_frame(delta: float) -> State:
	return null

func process_physics(delta:float) -> State:
	return null
