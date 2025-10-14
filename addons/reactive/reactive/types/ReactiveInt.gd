class_name ReactiveInt
extends Reactive

var value: int : set = _set_value

func _set_value(new_value: int) -> int:
	value = new_value
	value_changed.emit(self)
	return value

func _init(initial_value: int, initial_owner: Reactive = null) -> void:
	super._init(initial_owner)
	value = initial_value
