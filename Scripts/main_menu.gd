extends Control


func _ready():
	%Play.pressed.connect(play)
	%Exit.pressed.connect(quit_game)
	
func play():
	get_tree().change_scene_to_file("res://Scenes/CharacterComponents/Player.tscn")
	
func quit_game():
	get_tree().quit()
