class_name ItemData

extends Resource

@export var sprite: CompressedTexture2D
@export var itemName: String
# below are some examples of things an item can have - make sure to add these
# to the player in the obtain_item() function.
@export var addedHealth: float = 0
@export var addedDamage: float = 0
@export var dashDelayMultiplier: float = 1.0
@export var attackSpeedMultiplier: float = 1.0
@export var chanceToDodge: float = 0.0
