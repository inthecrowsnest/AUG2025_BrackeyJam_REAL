class_name HurtBox extends Area2D

func _ready() -> void:
	self.area_entered.connect(on_area_entered)
	
func on_area_entered(hit_box: Area2D) -> void:
	if hit_box == null or hit_box is not HitBox: return 
	# TODO Deal damage
	print("damage dealt")
