extends CharacterBody2D

#@export var player: Node2D

#var direction = [Vector2(0, -1), Vector2(1, -1), Vector2(1, 0), Vector2(1, 1), Vector2(0, 1), Vector2(-1, 1), Vector2(-1, 0), Vector2(-1, -1)]
var desired_vel = 0
var max_steer_force = 10

var speed = 10000

var target_found = false

@export var goal: Node = null

func _ready() -> void:
	$NavigationAgent2D.target_position = goal.global_position
	$Timer.start()

func _physics_process(delta: float) -> void:
	if !$NavigationAgent2D.is_target_reached():
		var next_path_position = $NavigationAgent2D.get_next_path_position()
		var nav_point_direction = to_local(next_path_position).normalized()
		if !target_found:
			velocity = nav_point_direction * speed * delta
		else:
			velocity = Vector2.ZERO
		#seek(next_path_position)
		move_and_slide()


func _on_timer_timeout() -> void:
	if $NavigationAgent2D.target_position != goal.global_position:
		$NavigationAgent2D.target_position = goal.global_position
	$Timer.start()


func seek(target: Vector2) -> void:
	var direction = ($NavigationAgent2D.target_position - global_position).normalized()
	rotation = direction.angle()


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	target_found = true
	
