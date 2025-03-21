extends VBoxContainer


@export var entity_to_watch:GameEntity:
	set(new_entity):
		entity_to_watch = new_entity
		if entity_to_watch:
			_setup()

func _setup() -> void:
	if !entity_to_watch:
		return
	for resource in entity_to_watch.resources.held_resources:
		var display_instance = ObtainableResourceDisplay.new()
		display_instance.resource_to_watch = resource
		add_child(display_instance)
