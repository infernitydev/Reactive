class_name ReactiveArray
extends Reactive

var value: Array : set = _set_value

## Create a ReactiveArray from elements.
static func of_elements(...args: Array) -> ReactiveArray:
	return new(args)

## Create a ReactiveArray from elements with a pre-set owner.
static func of_elements_with_owner(initial_owner: Reactive, ...args: Array) -> ReactiveArray:
	return new(args, initial_owner)

func _set_value(new_value: Array):
	value = new_value
	value_changed.emit(self)
	return value

func _init(initial_value: Array, initial_owner: Reactive = null) -> void:
	super._init(initial_owner)
	value = initial_value

func get_at(index: int) -> Variant:
	return value[index]

func set_at(index: int, new_value: Variant) -> void:
	value[index] = new_value
	value_changed.emit(self)

func append(other: Variant) -> void:
	value.append(other)
	value_changed.emit(self)

func append_array(array: Array) -> void:
	value.append_array(array)
	value_changed.emit(self)

func assign(array: Array) -> void:
	value.assign(array)
	value_changed.emit(self)

func clear() -> void:
	value.clear()
	value_changed.emit(self)

func erase(val: Variant) -> void:
	value.erase(val)
	value_changed.emit(self)

func insert(position: int, val: Variant) -> void:
	value.insert(position, val)
	value_changed.emit(self)

func pop_at(index: int) -> Variant:
	var tmp = value.pop_at(index)
	value_changed.emit(self)
	return tmp

func pop_back() -> Variant:
	var tmp = value.pop_back()
	value_changed.emit(self)
	return tmp

func pop_front() -> Variant:
	var tmp = value.pop_front()
	value_changed.emit(self)
	return tmp

func remove_at(index: int) -> void:
	value.remove_at(index)
	value_changed.emit(self)

func shuffle() -> void:
	value.shuffle()
	value_changed.emit(self)

func sort() -> void:
	value.sort()
	value_changed.emit(self)

func sort_custom(sort_method: Callable) -> void:
	value.sort_custom(sort_method)
	value_changed.emit(self)
