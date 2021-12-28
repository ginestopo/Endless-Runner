extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var flyer = load("res://scenes/enemy/flyer.tscn")
var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func spawn():
	for i in range(0,2):
		var instance = flyer.instance()
		add_child(instance)
		instance.position.x = self.position.x
	
		rng.randomize()
		instance.position.y = self.position.y + rng.randf_range(0, 198)
		#print("created instance!")

func _on_Timer_timeout():
	if randi()%2 >= 1:
		spawn()
