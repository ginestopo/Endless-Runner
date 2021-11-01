extends Node2D


export(String, FILE, ".tscn") var next_scene : String
var timer_finished : bool = false
var video_finished : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$VideoPlayer.play()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(timer_finished and video_finished):
		get_tree().change_scene(next_scene)


func _on_VideoPlayer_finished():
	video_finished = true
	$Timer.start()
	$fader_controller.play("fade_out")


func _on_Timer_timeout():
	timer_finished = true
