extends Node2D

signal lever_switched(switchedOn: bool)

@export var switchedOn: bool = false
@export var animation: AnimatedSprite2D
var _body: CharacterBody2D
var dir: int = 1 # 1 = right, -1 = left

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.set_frame_and_progress(3, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if _body and Input.is_action_just_pressed("interact"):
		#print("pressed e")
		flip_switch()
		#print(switchedOn)

func _on_interact_box_body_entered(body: CharacterBody2D) -> void:
	#print("detect")
	if body.collision_layer == 1: # if player
		#print("detect PLAYER")
		_body = body

func _on_interact_box_body_exited(body: Node2D) -> void:
	if _body == body:
		#print("exited")
		_body = null
		
func flip_switch() -> void:
	#print("in flip")
	if dir == -1:
		#print("left2right")
		animation.play("left2Right")
	elif dir == 1:
		#print("right2left")
		animation.play("right2Left")
		
	dir = dir * -1
	switchedOn = not switchedOn
	lever_switched.emit(switchedOn)
