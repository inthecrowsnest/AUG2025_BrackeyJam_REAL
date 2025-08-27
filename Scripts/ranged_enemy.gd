extends CharacterBody2D

var speed = 10000

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var timer: Timer = $Timer

var target_found = false
var flee = false
@export var goal: Node = null

func _ready() -> void:
	navigation_agent_2d.target_position = goal.global_position
	timer.start()

func _physics_process(delta: float) -> void:
	if !navigation_agent_2d.is_target_reached():
		var next_path_position = navigation_agent_2d.get_next_path_position()
		var nav_point_direction = to_local(next_path_position).normalized()
		if !target_found and !flee:
			velocity = nav_point_direction * speed * delta
		elif !target_found and flee:
			velocity = -nav_point_direction * speed * delta
		elif target_found and !flee:
			velocity = Vector2.ZERO
		elif target_found and flee:
			velocity = -nav_point_direction * speed * delta
		
		move_and_slide()


func _on_timer_timeout() -> void:
	if navigation_agent_2d.target_position != goal.global_position:
		navigation_agent_2d.target_position = goal.global_position
	timer.start()


func seek(target: Vector2) -> void:
	var direction = (navigation_agent_2d.target_position - global_position).normalized()
	rotation = direction.angle()


func _on_area_2d_body_entered(body: Node2D) -> void:
	target_found = true
	print("found")





func _on_flee_range_body_entered(body: Node2D) -> void:
	flee = true


func _on_attack_range_body_exited(body: Node2D) -> void:
	target_found = false
	flee = false
