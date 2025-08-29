extends Timer

@export var label: Label
@export var dungeonTime: int = 60
@export var timerPaused: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#init frameRenderer
	Frametimer.frame_rendered.connect(_custom_process)
	Frametimer.frame_rendered.connect(update_label_text)
	
	self.wait_time = dungeonTime
	timerPaused = false

func _custom_process(delta):
	if not timerPaused:
		#print("processing time ", delta )
		print(Engine.time_scale)
		if Engine.time_scale < 1: #double speed
			print("time scale 0.5")
			self.wait_time -= delta * 2
			
		if Engine.time_scale > 1: #half speed
			print("time scale 2")
			self.wait_time -= delta * 0.5

		if Engine.time_scale == 1: #normal speed 
			self.wait_time -= delta
	
	if self.wait_time == 0:
		print("GAME OVER")
		
	if self.time_left <= 10:
		label.modulate = Color8(255, 0, 0)
	else:
		label.modulate = Color8(0, 0, 0)
		
	
	var min = floor(self.wait_time / 60.0)
	var sec = self.wait_time - (min * 60)
	label.text = "%02d : %02d" % [min, sec]

func update_label_text(delta):
	if self.time_left <= 10:
		label.modulate = Color8(255, 0, 0)
	else:
		label.modulate = Color8(0, 0, 0)
		
	
	var min = floor(self.wait_time / 60.0)
	var sec = self.wait_time - (min * 60)
	label.text = "%02d : %02d" % [min, sec]
