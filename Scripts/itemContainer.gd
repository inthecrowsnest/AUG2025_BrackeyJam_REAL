extends CharacterBody2D

@export var item: ItemData

func _ready() -> void:
	set_collision_mask_value(2, true)
	$Sprite2D.texture = item.sprite

func _on_area_2d_body_entered(player: Player) -> void:
	$".".queue_free()
	player.obtain_item(item)
