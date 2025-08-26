class_name PlayerHurtBox extends HurtBox

@onready var hurtState = $".."
@onready var stateMachine = $"../.."
var hit_source: Node2D

func _ready() -> void:
	super()
	
func on_area_entered(hit_box: HitBox) -> void:
	super(hit_box)
	# TODO change this to hitbox.owner later
	hit_source = hit_box
	stateMachine.change_state(hurtState)
