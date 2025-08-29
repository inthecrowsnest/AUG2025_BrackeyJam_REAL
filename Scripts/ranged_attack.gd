extends CharacterBody2D

var pos:Vector2
var rota: Vector2
var dir : Vector2
var speed = 10000
#var playerController = preload("res://Scripts/Statemachine Scripts/Player States/hurtState.gd")


func _ready() -> void:
	global_position = pos
	look_at(rota)

	
func _physics_process(delta: float) -> void:
	velocity = dir * speed * delta
	move_and_slide()

func _on_area_2d_body_entered(body: Player) -> void:
	body.take_damage(10)
	
