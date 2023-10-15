extends Node2D
class_name GameController

####################### Node References #######################

@onready var player: Player = get_node("CharacterBody2D")
@onready var ryan: NPCRyan = get_node("Ryan")
@onready var carol: NPCSpriteController = get_node("Carol")

@onready var canvas: CanvasModulate = get_node("Dark")

func _process(_delta):
	if(player):
		var color: Color = canvas.get_color()
		print(player.position.x)
		print(color)
		
