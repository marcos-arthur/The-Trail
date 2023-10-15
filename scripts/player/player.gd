extends CharacterBody2D
class_name Player

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

####################### Export #######################

@export var game_controller: GameController

@export var walk_speed: float = 75
@export var run_speed: float = 100

####################### Onready #######################

@onready var player_sprite: Sprite2D = get_node("Sprite2D")
@onready var bubble_text_HUD: HUDInteraction = get_node("InteractionComponents/HUD")

@onready var all_interactions: Array[InteractionArea] = []

####################### Local variables #######################

var can_interact: bool = true
var interaction_in_range: bool = false
var interacting: bool = false

var is_running: bool = true
var can_track_input: bool = true

####################### Base functions #######################

func _ready():
	bubble_text_HUD.set_visible(false)
	update_interactions()

func _physics_process(_delta):
	movement()
	player_sprite.animate(velocity)
		
	interact()
	
	move_and_slide()

####################### Movement functions #######################

func movement():
	var speed: float
	if(Input.is_action_pressed("sprint")):
		speed = run_speed
		is_running = true
	else:
		speed = walk_speed
		is_running = false
	
	# Get the input direction and handle the movement/deceleration.
	var directionX = Input.get_axis("move_left", "move_right")
	var directionY = Input.get_axis("move_up", "move_down")
	
	if(!can_track_input):
		velocity.x = 0
		velocity.y = 0
		return
		
	if directionX:
		velocity.x = directionX * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	if directionY:
		velocity.y = directionY * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

####################### Interaction functions #######################

func interact() -> void:
	if(Input.is_action_just_pressed("Interact")):
		execute_interactions()

func _on_area_2d_area_entered(area):
	all_interactions.insert(0, area)
	update_interactions()

func _on_area_2d_area_exited(area):
	all_interactions.erase(area)
	update_interactions()

func update_interactions():
	if(all_interactions && can_interact):
		bubble_text_HUD.set_visible(true)
		bubble_text_HUD.text = all_interactions[0].interact_text
		bubble_text_HUD.key = all_interactions[0].interact_key
	else:
		bubble_text_HUD.set_visible(false)

func execute_interactions():
	if(all_interactions):
		var cur_interactions: InteractionArea = all_interactions[0]
		match cur_interactions.interact_text:
			"Ler":
				bubble_text_HUD.text = "Lendo"
				print("Abrir caixa de texto")
		
		match cur_interactions.interaction_type:
			"default":
				pass
			"speak_carol_jumpscare":
				if(game_controller != null):
					if(game_controller.carol != null):
						game_controller.carol.NPCController.hang()
				
