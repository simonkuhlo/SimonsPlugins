@tool
extends Resource
class_name ObtainableResource

## Emitted when current_value reaches the max_value
signal max_value_reached
## Emitted when current_value reaches the min_value
signal min_value_reached
## Emitted when current_value changes
signal value_changed

@export var type:ObtainableResourceType:
	set(new_type):
		if !new_type:
			push_error("No ObtainableResourceType set!")
		type = new_type

@export var min_value:float = 0:
	set(new_value):
		if new_value > min_value:
			push_error("min_value must be smaller than max_value")
			return
		min_value = new_value
@export var max_value:float = 10:
	set(new_value):
		if new_value < min_value:
			push_error("max_value must be bigger than min_value")
			return
		max_value = new_value
@export var default_value:float = 1:
	set(new_value):
		if new_value >= max_value:
			default_value = max_value
			max_value_reached.emit()
		if new_value <= min_value:
			default_value = min_value
			min_value_reached.emit()
		default_value = new_value
		value_changed.emit()
@export var regen_per_second:float = 0
var current_value:float = default_value:
	set(new_value):
		current_value = round(clampf(new_value, min_value, max_value)*100) / 100
		if current_value == max_value:
			max_value_reached.emit()
		if new_value == min_value:
			min_value_reached.emit()
		value_changed.emit()

func regenerate(delta):
	if current_value < max_value:
		current_value += regen_per_second * delta

## Tries to substract a given amount from the current amount. Returns true if successful.
func consume(amount:float) -> bool:
	if current_value - amount < min_value:
		return false
	current_value -= amount
	return true

## Returns true if the Resource currently has the given amount or more
func has_amount(amount:float) -> bool:
	if current_value - amount < min_value:
		return false
	return true
