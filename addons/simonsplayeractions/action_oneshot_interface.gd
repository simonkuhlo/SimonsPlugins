extends ActionResource
class_name ActionOneshot

func _cast():
	pass

func _setup_signal_connections():
	self._node_instance.state.ready_state.physics_processing.connect(_on_ready_processing)
	self._node_instance.state.preparing_state.state_entered.connect(_on_preparing_state_entered)
	self._node_instance.state.preparing_state.state_exited.connect(_on_preparing_state_exited)
	self._node_instance.state.casting_state.state_entered.connect(_on_casting_state_entered)
	self._node_instance.state.cooldown_state.state_entered.connect(_on_cooldown_state_entered)
	self._node_instance.state.cooldown_state.state_exited.connect(_on_cooldown_state_exited)
	self._node_instance.prepare_timer.timeout.connect(_on_prepare_timer_timeout)
	self._node_instance.cooldown_timer.timeout.connect(_on_cooldown_timer_timeout)

func _on_ready_processing(delta):
	#TODO Check costs
	if Input.is_action_just_pressed(self.current_slot.trigger):
		self._node_instance.state.travel(self._node_instance.state.preparing_state)

func _on_preparing_state_entered():
	self._node_instance.prepare_timer.start(self.prepare_time)

func _on_preparing_state_exited():
	self._node_instance.prepare_timer.stop()

func _on_prepare_timer_timeout():
	if self._node_instance.state.current_state == self._node_instance.state.preparing_state:
		self._node_instance.state.travel(self._node_instance.state.casting_state)

func _on_casting_state_entered():
	#TODO apply costs
	_cast()
	self._node_instance.state.travel(self._node_instance.state.cooldown_state)

func _on_cooldown_state_entered():
	self._node_instance.cooldown_timer.start(self.cooldown_time)

func _on_cooldown_timer_timeout():
	if self._node_instance.state.current_state == self._node_instance.state.cooldown_state:
		self._node_instance.state.travel(self._node_instance.state.ready_state)

func _on_cooldown_state_exited():
	self._node_instance.cooldown_timer.stop()
