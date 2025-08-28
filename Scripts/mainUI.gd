extends Control

@export var pause: AnimatedSprite2D
@export var speed: AnimatedSprite2D
@export var play: AnimatedSprite2D

@export var health1: AnimatedSprite2D
@export var health2: AnimatedSprite2D
@export var health3: AnimatedSprite2D

@export var windScale: int = 5
@export var windIncTime: float = 0.5

@onready var pause_menu = $CanvasLayer/PauseMenu

var paused: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pause_menu.hide()
	speed.set_frame_and_progress(1, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause_menu_def()
		
	#print(Engine.time_scale)
	
	
		
	if Input.is_action_just_pressed("half"):
		scale_time(Engine.time_scale, 0.5)
		speed.set_frame_and_progress(0, 0)
		
	if Input.is_action_just_pressed("normal"):
		scale_time(Engine.time_scale, 1)
		speed.set_frame_and_progress(1, 0)
		
	if Input.is_action_just_pressed("double"):
		scale_time(Engine.time_scale, 2)
		speed.set_frame_and_progress(2, 0)
		
func pause_menu_def() -> void:
	if paused:
		pause.set_frame_and_progress(0, 0) #not paused
		play.set_frame_and_progress(1, 0)
			
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause.set_frame_and_progress(1, 0) #paused
		play.set_frame_and_progress(0, 0)
			
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = not paused

func _on_pause_menu_unpause() -> void:
	pause_menu_def()
	
func scale_time(start: float, end: float):
	if start == end:
		return

	var inc = (end - start) / windScale 
	
	for i in range(windScale):
		Engine.time_scale += inc
		await get_tree().create_timer(windIncTime).timeout
	
