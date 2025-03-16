@tool
extends Resource
class_name ObtainableResourcesHolder

@export var held_resources:Array[ObtainableResource]

func get_resource_by_type(type:ObtainableResourceType) -> ObtainableResource:
	for resource in held_resources:
		if resource.type == type:
			return resource
	return

func apply_cost(cost:ObtainableResourceCost) -> bool:
	var resource = get_resource_by_type(cost.type)
	if !resource:
		return false
	if !resource.has_amount(cost.amount):
		return false
	return resource.consume(cost.amount)

func apply_costs(costs:Array[ObtainableResourceCost]) -> bool:
	for cost in costs:
		if !apply_cost(cost):
			return false
	return true
