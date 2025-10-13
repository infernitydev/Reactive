class_name ReactiveFloat
extends Reactive

var value: float : set = _set_value

func _set_value(new_value: float):
	value = new_value
	value_changed.emit(self)
	return value

func _init(initial_value: float, initial_owner: Reactive = null) -> void:
	super._init(initial_owner)
	value = initial_value
