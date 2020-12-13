extends Node2D

export var path = "res://"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"





func _on_Area2D_body_entered(body):
	get_tree().change_scene(path)
