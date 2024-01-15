extends Node


func _input(event : InputEvent):
	if (event.is_action_pressed("ui_cancel")):
		var currentValue : bool = get_tree().paused
		get_tree().paused = !currentValue;
		if (get_tree().paused):
			AudioServer.get_bus_effect(0, 0).set_cutoff(1000)
			#AudioServer.get_bus_effect(0, 2).set_cutoff(100)
			#AudioServer.get_bus_effect(0, 1).set_damping(0.5)
			#AudioServer.get_bus_effect(0, 1).set_wet(0.5)
		else:
			AudioServer.get_bus_effect(0, 0).set_cutoff(10)
			#AudioServer.get_bus_effect(0, 2).set_cutoff(2000)
			#AudioServer.get_bus_effect(0, 1).set_damping(0)
			#AudioServer.get_bus_effect(0, 1).set_wet(0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
