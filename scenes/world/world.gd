extends Node2D


var _Platform := preload("res://scenes/world/platform.tscn")

var _start_time := OS.get_ticks_msec()

var rng = RandomNumberGenerator.new()
export (int) var velocity 


func _process(_delta: float) -> void:
# warning-ignore:integer_division
	$UI/Score.text = str((OS.get_ticks_msec() - _start_time) / 1_000)
	



func _on_death_barrier_body_entered(body: Node) -> void:
	if body.name == "Dog":
		$failedStreamPlayer.play()
		body.queue_free()
		$UI/Restart.show()
		set_process(false)


func _on_platform_timer_timeout() -> void:
	var p := _Platform.instance()
	$Platforms.add_child(p)
	rng.randomize()
	p.position.x = 720
	p.position.y = randi() % 135 + 68



func _on_FreeEnemies_body_entered(body: Node) -> void:
	if body.is_in_group("enemy"):
			body.destroy()
	pass # Replace with function body.



func _on_Restart_pressed():
	get_tree().reload_current_scene()
