extends Node2D
class_name GameController

####################### Node References #######################

@onready var player: Player = get_node("CharacterBody2D")
@onready var ryan: NPCRyan = get_node("Ryan")
@onready var carol: NPCSpriteController = get_node("Carol")

@onready var canvas: CanvasModulate = get_node("Dark")
@onready var baseColor: Color = get_node("Dark").get_color()
@onready var currColor: Color = get_node("Dark").get_color()
@onready var brightnessAnimation: AnimationPlayer = get_node("Dark/AnimationPlayer")

@onready var ryan_text: RichTextLabel = get_node("Ryan/Ryan_text")
@onready var carol_text: RichTextLabel = get_node("Carol/Carol_text")
@onready var stem_text: RichTextLabel = get_node("Carol/Stem_text")

@onready var stam_tile_map: TileMap = get_node("LevelSet/Obstacle")
@onready var axe_icon: TextureRect = get_node("CharacterBody2D/HUD2/Control/Axe")
@onready var bruxa_icon: Label = get_node("CharacterBody2D/HUD2/Control/bruxa")

@onready var axe: Sprite2D = get_node("Axe")

####################### Local variables #######################

var can_lower_brightness: bool = true
var xPosMin: float = 0
var xPosMax: float = 460

var countTimer: bool = false
var maxTimer : float = 6
var timer : float = 6

var player_has_axe: bool = false
var the_whitching_time: bool = false

####################### Base functions #######################

func _process(delta):
	if(player):
		low_brightness()
	
	if(countTimer):
		restore_brightness(delta)

####################### Brightness functions #######################

func low_brightness() -> void:
	if(can_lower_brightness):
		if(xPosMin < xPosMax && player.position.x > xPosMin):
			xPosMin = player.position.x
		elif(xPosMin >= xPosMax):
			can_lower_brightness = false
		
		currColor = baseColor.darkened(xPosMin/xPosMax)
		canvas.set_color(currColor)

func restore_brightness(delta) -> void:
	if(timer > 0):
		timer -= delta
		
		currColor = baseColor.darkened(timer/maxTimer)
		canvas.set_color(currColor)
	else:
		countTimer = false

####################### dialogue functions #######################

func show_stem_dialogue() -> void:
	stem_text.set_visible(true)
	bruxa_icon.set_visible(true)
	
func show_break_stem_dialogue() -> void:
	bruxa_icon.set_visible(true)

func show_ryan_dialogue() -> void:
	ryan_text.set_visible(true)
	
func show_carol_dialogue() -> void:
	carol_text.set_visible(true)

####################### HUD functions #######################
func show_axe_icon() -> void:
	axe_icon.set_visible(true)
	axe.queue_free()
