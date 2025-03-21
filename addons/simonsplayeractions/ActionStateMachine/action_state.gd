extends Node
class_name ActionState

signal state_entered
signal physics_processing(delta:float)
signal state_exited

func _init(new_name:StringName) -> void:
	name = new_name
