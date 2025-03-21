@tool
extends Resource
class_name ObtainableResourcesHolder

@export var held_resources:Array[ObtainableResource]

func regen_resources(delta:float):
	for resource in held_resources:
		if resource.regen_per_second:
			resource.regenerate(delta)

func get_resource_by_type(type:ObtainableResourceType) -> ObtainableResource:
	for resource in held_resources:
		if resource.type == type:
			return resource
	return

func check_costs(costs:Array[ObtainableResourceCost]):
	for cost in costs:
		if !cost:
			continue
		var resource = get_resource_by_type(cost.type)
		if !resource.has_amount(cost.amount):
			return false
	return true

func apply_cost(cost:ObtainableResourceCost) -> bool:
	var resource = get_resource_by_type(cost.type)
	if !resource:
		return false
	if !resource.has_amount(cost.amount):
		return false
	return resource.consume(cost.amount)

func apply_costs(costs:Array[ObtainableResourceCost]) -> bool:
	if !check_costs(costs):
		return false
	for cost in costs:
		if !apply_cost(cost):
			return false
	return true
