class_name StateMachine extends Object

var state: State

func _init(starting_state: State):
	self.state = starting_state

func change_state(new_state: State):
	state.exit()
	self.state = new_state
	state.enter()
