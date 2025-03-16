extends Node
class_name ActionStateMachine

var ready_state:ActionState = ActionState.new()
var preparing_state:ActionState = ActionState.new()
var casting_state:ActionState = ActionState.new()
var cooldown_state:ActionState = ActionState.new()
var missing_resource_state:ActionState = ActionState.new()
var blocked_state:ActionState = ActionState.new()

var current_state:ActionState = ready_state:
	set(new_state):
		current_state.state_exited.emit()
		current_state = new_state
		current_state.state_entered.emit()

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_processing.emit(delta)

func travel(to:ActionState):
	current_state = to
