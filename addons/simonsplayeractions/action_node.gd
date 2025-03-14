extends Node
class_name ActionNode

var state:ActionStateMachine = ActionStateMachine.new()
var cooldown_timer:Timer = Timer.new()
var prepare_timer:Timer = Timer.new()

func _ready() -> void:
	add_child(state)
	add_child(cooldown_timer)
	add_child(prepare_timer)
