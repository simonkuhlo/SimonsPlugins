extends Resource
class_name EntityStat

signal base_value_changed(from:float, to:float)
signal current_value_changed(from:float, to:float)

@export var min_value:float = 0
@export var max_value:float = 100
@export var base_value:float = 0:
	set(new_value):
		new_value = clampf(new_value, min_value, max_value)
		current_value += new_value - base_value
		base_value = new_value

var current_value:float = base_value:
	set(new_value):
		new_value = clampf(new_value, min_value, max_value)
		current_value = new_value
