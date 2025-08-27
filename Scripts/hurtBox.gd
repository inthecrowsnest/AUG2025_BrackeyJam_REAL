class_name HurtBox extends Area2D

func _ready() -> void:
	self.collision_layer = 0
	self.collision_mask = 2
	self.area_entered.connect(on_area_entered)
	
func on_area_entered(hit_box: HitBox) -> void:
	if hit_box == null: return
	# TODO Deal damage
	print("damage dealt")
