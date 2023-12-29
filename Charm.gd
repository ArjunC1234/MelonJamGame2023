extends Area2D

@onready var sprite_2d = $AnimatedSprite2D
@onready var light = $PointLight2D
@onready var removeTimer = $removeCharmTimer
@export var charm_color = Color(1, 0.2, 0.2)
@export var charm_name = "red"
@export var charm_description = "Charm Description Goes Here"
@onready var animation = $AnimationPlayer

var entered = false
# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("bob")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite_2d.self_modulate = charm_color
	light.color = charm_color
	if not removeTimer.is_stopped():
		charm_color.a = removeTimer.time_left/removeTimer.wait_time
	

func _on_body_entered(body):
	if body.has_method("updateCharms") and entered == false:
		entered = true
		body.updateCharms({'name' : charm_name, 'color' : charm_color, 'description' : charm_description})
		removeTimer.start()


func _on_remove_charm_timer_timeout():
	queue_free()