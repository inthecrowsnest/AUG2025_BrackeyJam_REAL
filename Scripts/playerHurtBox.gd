class_name PlayerHurtBox extends HurtBox

@onready var hurtState = $".."
@onready var stateMachine = $"../.."
var hit_source: Node2D

func _ready() -> void:
	super()
	
func on_area_entered(hit_box: Area2D) -> void:
	super(hit_box)
	if hit_box == null or hit_box is not HitBox: return 
	# TODO change this to hitbox.owner later
	hit_source = hit_box
	stateMachine.change_state(hurtState)
