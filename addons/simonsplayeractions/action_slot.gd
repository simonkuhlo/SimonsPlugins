extends Node
class_name ActionSlot

@export var current_action:ActionResource:
	set(new_action):
		if current_action:
			current_action.current_slot = null
		if new_action:
			new_action.current_slot = self     
		current_action = new_action

@export var trigger:StringName
@export var owning_entity:GameEntity
