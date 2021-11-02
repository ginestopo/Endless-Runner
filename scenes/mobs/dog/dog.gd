extends KinematicBody2D


export (int) var speed 
export (int) var gravity
export (int) var jump_force
var velocity = Vector2()
var can_jump = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed
	else:
		velocity.x = 0
		
	if Input.is_action_just_pressed("ui_up") and can_jump:
		velocity.y = -jump_force
		
	velocity.y += gravity
	
	velocity = move_and_slide(velocity)
	_mirror_sprite()
	
	
	can_jump = false
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if ("block" in collision.collider.name):
			can_jump = true
				
	
	
func _mirror_sprite():
	if(velocity.x != 0):
		$Sprite.flip_h = velocity.x < 0
