class_name Location extends Node2D


@onready var tile_map : Node2D = get_node(^"TileMap")
@onready var player : CharacterBody2D = get_tree().current_scene.get_node(^"Player")

func _ready() -> void:
	update_camera()
	
func update_camera() -> void:
	var camera : Camera2D = get_tree().current_scene.get_node(^"Player/Camera2D")
	var rect : Rect2 = tile_map.layer_floor.get_used_rect()
	
	camera.limit_left   = int(rect.position.x * 16)
	camera.limit_right  = int(rect.size.x * 16)
	camera.limit_top    = int(rect.position.y * 16)
	camera.limit_bottom = int(rect.size.y * 16)
	
func _physics_process(_delta: float) -> void:
	var player_tile : Vector2i = tile_map.layer_roofs.local_to_map(player.global_position)
		
	if player_tile in tile_map.roof_tiles:
		tile_map.layer_roofs.modulate = tile_map.layer_roofs.modulate.lerp(Color(1, 1, 1, 0), 0.2)
	else:
		tile_map.layer_roofs.modulate = tile_map.layer_roofs.modulate.lerp(Color.WHITE, 0.2)
