extends Sprite2D

@export var animation: AnimationPlayer
@export var player: Player

func animate(direction : Vector2) -> void:
	verify_position(direction)
	
	if(player.interacting):
		interaction_behavior()
	else:
		horizontal_behavior(direction)

func verify_position(direction : Vector2) -> void:
	if(direction.x > 0):
		# player.transform.x.x = 1
#		player.jump_direction = -1
		flip_h = false
	elif(direction.x < 0):
		# player.transform.x.x = -1
#		player.jump_direction = 1
		flip_h = true

func interaction_behavior() -> void:
	pass

func horizontal_behavior(direction : Vector2) -> void:
	if(player.is_running):
		#set_scale(Vector2(1.1,1))
		pass
	
	if(direction.x != 0 || direction.y != 0):
		if(player.is_running):
			animation.play("run")
		else:
			animation.play("walk")
	else:
		animation.play("idle")
