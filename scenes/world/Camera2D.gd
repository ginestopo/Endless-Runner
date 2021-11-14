extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var shake_amount = 1.0
export (int) var shake_duration : int = 50
var shake_duration_aux : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(shake_duration_aux > 0):
		_camera_shake()
		shake_duration_aux -= 1
	else:
		self.set_offset(Vector2(0,0))

func _camera_shake():
	self.set_offset(Vector2( \
	rand_range(-1.0,1.0) * shake_amount, \
	rand_range(-1.0,1.0) * shake_amount ) )


func _on_Gun_shot():
	shake_duration_aux = shake_duration
