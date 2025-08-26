class_name PlayerHurtBox extends HurtBox

@onready var hurtState = $"../StateMachine/Hurt"
@onready var stateMachine = $"../StateMachine"
var hit_source: Node2D

func _ready() -> void:
	super()
	
func on_area_entered(hit_box: HitBox) -> void:
	if hit_box == null: return
	super(hit_box)
	# TODO change this to hitbox.owner later
	hit_source = hit_box
	stateMachine.change_state(hurtState)
