extends RigidBody2D


export (int) var velocity = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("animation")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.x -= velocity
	print("position:",self.position.x,",",self.position.y)
	

