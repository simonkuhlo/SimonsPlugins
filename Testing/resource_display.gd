extends Label
class_name ObtainableResourceDisplay

@export var resource_to_watch:ObtainableResource:
	set(new_resource):
		if new_resource:
			new_resource.value_changed.connect(_resource_value_changed)
		if resource_to_watch:
			resource_to_watch.value_changed.disconnect(_resource_value_changed)
		resource_to_watch = new_resource
		if resource_to_watch:
			_resource_value_changed()

func _resource_value_changed() -> void:
	if !resource_to_watch:
		return
	text = str(resource_to_watch.type.type_name) + ": " \
	+ str(round(resource_to_watch.current_value * 100) / 100) + " / " \
	+ str(resource_to_watch.max_value)
