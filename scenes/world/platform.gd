extends Node2D


export(int, -1000, 0) var speed := 200
export (PackedScene) var spiderEnemy
export (int) var upper_limit  #upper limit of number of tiles in series
export (int) var lower_limit  #lower limit of number of tiles in series
 
var rng = RandomNumberGenerator.new() #used for random number of tiles


func _physics_process(delta: float) -> void:
	position.x -= speed * delta


func _on_visibility_notifier_2d_screen_exited() -> void:
	queue_free()


func _ready():
	
	if randi()%2 >= 1:
		var spiderInstance = spiderEnemy.instance()
		add_child(spiderInstance)
	
	#placing tiles to form random platforms
	rng.randomize()
	var number_of_tiles = rng.randi_range(lower_limit,upper_limit)
	print(number_of_tiles)
	$TileMap.set_cell(16,8,$TileMap.tile_set.find_tile_by_name("rock_tile"))


