extends Sprite2D
class_name NPCSpriteController

@export var animation: AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("Idle")
