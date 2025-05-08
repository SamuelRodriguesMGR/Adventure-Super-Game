extends Node2D


@onready var player : CharacterBody2D = get_node(^"Player")
@onready var current_location : Node2D = get_child(0)

func set_current_location(location : String, pos : Vector2) -> void:
	get_node("UI").change_location()
	await get_tree().create_timer(1).timeout
	current_location.queue_free()
	
	player.global_position = pos
	var new_location : Node2D = load(location).instantiate()
	add_child(new_location)
	new_location.update_camera()
	current_location = new_location
