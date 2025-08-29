extends Node

signal frame_rendered(delta)

var _lastFrame: float = 0.0

	
func _enter_tree() -> void:
	_lastFrame = Time.get_unix_time_from_system()
	
	RenderingServer.frame_post_draw.connect(_on_frame_post_draw)
	
	
func _on_frame_post_draw() -> void:
	
	var now: float = Time.get_unix_time_from_system()
	var delta: float = (now - _lastFrame)
	_lastFrame = now
	
	frame_rendered.emit(delta)
	
func exit_tree() -> void:
	if RenderingServer.frame_post_draw.is_connected(_on_frame_post_draw):
		RenderingServer.frame_post_draw.disconnect(_on_frame_post_draw)	
