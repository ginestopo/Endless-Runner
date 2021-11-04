extends Node2D


var _Platform := preload("res://scenes/world/platform.tscn")

var _start_time := OS.get_ticks_msec()

var rng = RandomNumberGenerator.new()


func _process(_delta: float) -> void:
# warning-ignore:integer_division
	$UI/Score.text = str((OS.get_ticks_msec() - _start_time) / 1_000)


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()


func _on_death_barrier_body_entered(body: Node) -> void:
	if body.name == "Dog":
		body.queue_free()
		$UI/Restart.show()
		set_process(false)


func _on_platform_timer_timeout() -> void:
	var p := _Platform.instance()
	
	$Platforms.add_child(p)
	rng.randomize()
	#random x size for each block 
	p.scale.x = rng.randf_range(0.5,1.0)
	print(p.scale.x)
	p.position.x = 720
	p.position.y = randi() % 135 + 68

