class_name PlayerState extends State

var controller: PlayerController
var data: PlayerData

func _init(cont: PlayerController, d: PlayerData):
	controller = cont
	data = d
