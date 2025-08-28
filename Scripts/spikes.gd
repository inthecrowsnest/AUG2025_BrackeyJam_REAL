extends Node2D

@export var animation: AnimatedSprite2D
@export var timer: Timer

var state: int = 0

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	animation.set_frame_and_progress(state, 0)	

#when collided with a body (player or enemy)
func _on_hurtbox_body_entered(body: Node2D) -> void:
	pass # call damage function on body 

#incremenet state
func _on_timer_timeout() -> void:
	print("timeout")
	if state < 3:
		state += 1
	elif state == 3:
		state = 0

# to prevent enemies dying b4 player enters
func _on_player_enter(body: Node2D) -> void:
	print("timer started")
	timer.start()
	
