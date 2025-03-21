extends Label

@export var slot_to_watch:ActionSlot

func _physics_process(delta: float) -> void:
	if !slot_to_watch:
		return
	if !slot_to_watch.current_action:
		return
	text = "Current State: " + str(slot_to_watch.current_action._node_instance.state.current_state.name)
