class_name PlayerState extends State

@export var animation_name: String

var parent: Player


func enter():
	parent.anim_tree.get("parameters/StateMachine/playback").travel(animation_name)
	parent.anim_tree.set("parameters/StateMachine/" + animation_name+ "/blend_position", parent.facingDirection)
	
func exit():
	pass

func process_input(event) -> State:
	return null
	
func process_frame(delta: float) -> State:
	return null

func process_physics(delta:float) -> State:
	return null
