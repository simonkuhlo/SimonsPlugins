extends Node
class_name ActionStateMachine

var ready_state:ActionState
var preparing_state:ActionState
var casting_state:ActionState
var cooldown_state:ActionState
var missing_resource_state:ActionState
var blocked_state:ActionState

var current_state:ActionState = ready_state:
	set(new_state):
		current_state.state_exited.emit()
		current_state = new_state
		current_state.state_entered.emit()

func _physics_process(delta: float) -> void:
	current_state.physics_processing.emit(delta)
