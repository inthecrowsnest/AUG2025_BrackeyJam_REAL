extends CharacterBody2D

@export var player: Node2D

var direction = [Vector2(0, -1), Vector2(1, -1), Vector2(1, 0), Vector2(1, 1), Vector2(0, 1), Vector2(-1, 1), Vector2(-1, 0), Vector2(-1, -1)]


var speed = 100

func _physics_process(delta: float) -> void:
	var direction = (player.position-position).normalized()
	velocity = direction * speed
	look_at(player.position)
	move_and_slide()
