extends Node2D

@export var roomClear: bool = false
@export var doors: TileMapLayer
@export var camera: Camera2D

# just making sure no funny business
func _ready() -> void:
	doors.visible = true
	doors.collision_enabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if roomClear:
		doors.collision_enabled = false
		doors.visible = false


func _on_cam_change_area_body_entered(body: CharacterBody2D) -> void:
	if body.collision_layer == 1: #just making sure enemies don't freak with it
		camera.make_current()


func _on_lever_lever_switched(switchedOn: bool) -> void:
	if switchedOn:
		roomClear = true
