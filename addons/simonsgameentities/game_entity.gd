@tool
extends Node
class_name GameEntity


@export var resources:ObtainableResourcesHolder = ObtainableResourcesHolder.new()
@export var inventory:EntityInventory = EntityInventory.new()

#region Stats
@export_group("Stats")
@export_group("Stats/Movement")
@export var move_speed:EntityStat = EntityStat.new()
@export var jump_strength:EntityStat = EntityStat.new()
@export_group("Stats/Combat")
@export var base_damage:EntityStat = EntityStat.new()
#endregion

func _physics_process(delta: float) -> void:
	resources.regen_resources(delta)
