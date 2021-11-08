extends Control


export(String, FILE, "*.tscn") var _start: String


func _ready():
	$FadeController.play("fade_in")


func _on_TextureButton_pressed() -> void:
	get_tree().change_scene(_start)
