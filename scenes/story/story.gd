extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String, FILE, "*.tscn") var _next_scene : String

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fadein")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("ui_accept") or Input.is_action_just_released("ui_select"):
		_on_Timer_timeout()


func _on_Timer_timeout():
	var children = $frames.get_children()
	children.invert()
	for child in children:
		if child.visible:
			child.visible = false
			break
	if children[4].visible == false:
		$AnimationPlayer.play("fadeout")
	$Timer.start()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fadein":
		$Timer.start()
	else:
		get_tree().change_scene(_next_scene)

