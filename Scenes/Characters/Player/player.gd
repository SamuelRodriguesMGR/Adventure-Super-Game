extends Character


@onready var area_interact : Area2D = get_node(^"AreaInteract")
@onready var camera : Camera2D = get_node(^"Camera2D")

func get_input():
	move_direction = Input.get_vector(&"ui_left", &"ui_right", &"ui_up", &"ui_down")
	
	if Input.is_action_just_pressed(&"ui_accept"):
		state_machine.set_state(state_machine.states.jump)
		
	if Input.is_action_just_pressed(&"ui_accept"):
		var bodies : Array[Node2D] = area_interact.get_overlapping_bodies()
		
		for body in bodies:
			if body.has_method(&"interact"):
				body.interact()
	
func _process(_delta: float) -> void:
	if move_direction.x > 0 and sprite.flip_h: 
		sprite.flip_h = false
	elif move_direction.x < 0 and not sprite.flip_h:
		sprite.flip_h = true
