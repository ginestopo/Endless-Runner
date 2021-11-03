extends Control


export(String, FILE, "*.tscn") var _next_scene : String


func _ready() -> void:
	randomize()


func _on_VideoPlayer_finished():
	$FadeController.play("fade_out")


func _on_fade_controller_animation_finished(_anim_name: String) -> void:
	get_tree().change_scene(_next_scene)
