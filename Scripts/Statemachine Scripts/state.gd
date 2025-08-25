class_name State extends Object

# true whenever this state is currently being exited, false if not
var isExiting: bool

func enter():
	pass
	
func exit():
	isExiting = true
	
func process():
	pass
	
func physics_process():
	pass
