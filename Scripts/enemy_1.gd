extends CharacterBody2D

#@export var player: Node2D

#var direction = [Vector2(0, -1), Vector2(1, -1), Vector2(1, 0), Vector2(1, 1), Vector2(0, 1), Vector2(-1, 1), Vector2(-1, 0), Vector2(-1, -1)]
var desired_vel = 0
var max_steer_force = 10

var speed = 10000

@export var goal: Node = null

func _ready() -> void:
	$NavigationAgent2D.target_position = goal.global_position
	$Timer.start()

func _physics_process(delta: float) -> void:
	if !$NavigationAgent2D.is_target_reached():
		var nav_point_direction = to_local($NavigationAgent2D.get_next_path_position()).normalized()
		velocity = nav_point_direction * speed * delta
		velocity = velocity + (seek(goal.global_position) * delta)
		move_and_slide()


func _on_timer_timeout() -> void:
	if $NavigationAgent2D.target_position != goal.global_position:
		$NavigationAgent2D.target_position = goal.global_position
	$Timer.start()


func seek(target: Vector2) -> Vector2:
	var desired_velocity = (target - global_position).normalized() * speed
	
	var steering = (desired_velocity - velocity).limit_length(max_steer_force)
	return steering
