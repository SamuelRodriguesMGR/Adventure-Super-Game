extends Node2D

@onready var layer_floor : TileMapLayer = $LayerFloor
@onready var layer_roads : TileMapLayer = $LayerRoads
@onready var layer_grass : TileMapLayer = $LayerGrass
@onready var layer_objects : TileMapLayer = $LayerObjects
@onready var layer_roofs : TileMapLayer = $LayerRoofs

var roof_tiles : Array[Vector2i]

func _ready() -> void:
	for tile in layer_roofs.get_used_cells():
		roof_tiles.append(tile + layer_floor.local_to_map(global_position))
