class_name PlayerState extends State

@export var animation_name: String

var parent: Player

func enter():
	#parent.animations.play(animation_name)
	pass
	
func exit():
	pass

func process_input(event) -> State:
	return null
	
func process_frame(delta: float) -> State:
	return null

func process_physics(delta:float) -> State:
	return null
