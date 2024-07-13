extends Node2D

var borders = Rect2(1, 1, 28, 21)

@onready var tile_map = $TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	generate_level()

func generate_level():
	var walker = Walker.new(Vector2(19, 11), borders)
	var map = walker.walk(200)
	walker.queue_free()
	var cells = []
	for location in map:
		cells.append(location)
	tile_map.set_cells_terrain_connect(0, cells, 0, -1)
