extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func loadTheNextLevel():
	get_parent().get_parent().loadNextLevel()


func _on_next_level_teleport_body_entered(body):
	print("ffff")
	if body.name == "CharacterBody2D":
		loadTheNextLevel()


func _on_event_timer_timeout():
	pass # Replace with function body.
