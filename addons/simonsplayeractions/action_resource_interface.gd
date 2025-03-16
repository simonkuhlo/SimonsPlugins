extends Resource
class_name ActionResource

@export var cooldown_time:float = 0:
	set(new_time):
		cooldown_time = new_time

@export var prepare_time:float = 0:
	set(new_time):
		prepare_time = new_time

@export var casting_costs:Array = []

var _node_instance:ActionNode = ActionNode.new():
	set(new_node_instance):
		_node_instance.queue_free()
		_node_instance = new_node_instance
		_setup_signal_connections()

var current_slot:ActionSlot:
	set(new_slot):
		if current_slot:
			current_slot.remove_child(_node_instance)
		if new_slot:
			new_slot.add_child(_node_instance)
		current_slot = new_slot

func _init():
	_setup_signal_connections()

func _setup_signal_connections():
	pass
