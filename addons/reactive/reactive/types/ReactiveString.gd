class_name ReactiveString
extends Reactive

var value: String : set = _set_value

func _set_value(new_value: String) -> String:
	value = new_value
	value_changed.emit(self)
	return value

func _init(initial_value: String, initial_owner: Reactive = null) -> void:
	super._init(initial_owner)
	value = initial_value
