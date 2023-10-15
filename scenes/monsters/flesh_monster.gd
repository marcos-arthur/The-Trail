extends Sprite2D

@onready var game_controller: GameController
@onready var player: CharacterBody2D = $"../CharacterBody2D"

@onready var animation: AnimationPlayer = get_node("AnimationPlayer")

var released: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animation.play("thing")
