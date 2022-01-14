extends Node2D


export(int, -1000, 0) var speed := 200
export (PackedScene) var spiderEnemy
export (int) var upper_limit  #upper limit of number of tiles in series
export (int) var lower_limit  #lower limit of number of tiles in series
 
var rng = RandomNumberGenerator.new() #used for random number of tiles


func _physics_process(delta: float) -> void:
	position.x -= speed * delta
	

func _ready():
	
	if randi()%2 >= 1:
		var spiderInstance = spiderEnemy.instance()
		add_child(spiderInstance)
	
	#placing tiles to form random platforms
	rng.randomize()
	var number_of_tiles = rng.randi_range(lower_limit,upper_limit)
	var height = 4
	
	for i in range(1,number_of_tiles):
		if(i<(int(number_of_tiles/2))):
			$TileMap.set_cell(-i,0,$TileMap.tile_set.find_tile_by_name("rock_tile"))
			#this loops makes the platform filled "not floating"
			for j in range(1,height):
				if(randi() % 2 == 0):
					$TileMap.set_cell(-i,j,$TileMap.tile_set.find_tile_by_name("rock_tile"))
		else:
			$TileMap.set_cell(i-int(number_of_tiles/2),0,$TileMap.tile_set.find_tile_by_name("rock_tile"))
			#this loops makes the platform filled "not floating"
			for j in range(1,height):
				if(randi() % 2 == 0):
					$TileMap.set_cell(i-int(number_of_tiles/2),j,$TileMap.tile_set.find_tile_by_name("rock_tile"))
	

func _on_tile_screen_exited():
	queue_free()
