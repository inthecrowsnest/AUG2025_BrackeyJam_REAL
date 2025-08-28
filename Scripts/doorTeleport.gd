extends Node2D

enum dir {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

@export var TP_distance: int = 64
@export var direction: dir


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if body.collision_layer == 1:
		
		if direction == 3: #moving right
			body.position.x += TP_distance
		elif direction == 2: #moving left
			body.position.x -= TP_distance
		elif direction == 1: #moving up??
			body.position.y += TP_distance
		elif direction == 0: #moving down
			body.position.y -= TP_distance
		
		body.velocity = Vector2i(0,0)
