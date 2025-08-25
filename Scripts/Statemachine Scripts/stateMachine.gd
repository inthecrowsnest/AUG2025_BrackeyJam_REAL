class_name StateMachine extends Node

@export 
var starting_state: State

var state: State

func init(parent: Player):
	for child in get_children():
		child.parent = parent
		
	# Initialize default state
	change_state(starting_state)

func change_state(new_state: State):
	if state:
		state.exit()

	state = new_state
	state.enter()
	
# Pass through functions for the Player to call,
# handling state changes as needed.
func process_physics(delta: float) -> void:
	var new_state = state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent) -> void:
	var new_state = state.process_input(event)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = state.process_frame(delta)
	if new_state:
		change_state(new_state)
