class_name ReactiveCreationMenu
extends EditorContextMenuPlugin

const ICON = preload("../Reactive.svg")

const UI = preload("ReactiveCreateInterface.tscn")

const TEMPLATE := """class_name _CLASS_
extends Reactive

var value: _WRAPPING_ : set = _set_value

func _set_value(new_value: _WRAPPING_):
	value = new_value
	value_changed.emit(self)
	return value

func _init(initial_value: _WRAPPING_, initial_owner: Reactive = null) -> void:
	super._init(initial_owner)
	value = initial_value
"""

var ui: Window

func _popup_menu(paths):
	add_context_menu_item("Reactive...", _show_ui, ICON)

func _show_ui(arr: Array):
	ui = UI.instantiate()
	ui.close_requested.connect(_cleanup)
	EditorInterface.popup_dialog_centered(ui, Vector2i(200, 100))
	var btn := ui.get_node("%Create") as Button
	btn.pressed.connect(_create.bind(arr[0]))

func _write(path: String, content: String) -> void:
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(content)

func _create(base_path: String) -> void:
	var classname := (ui.get_node("%ClassName") as LineEdit).text
	var wrapping_class := (ui.get_node("%Wrapping") as LineEdit).text
	var script := TEMPLATE
	script = script.replace("_CLASS_", classname.to_pascal_case())\
				   .replace("_WRAPPINGCAPITALIZED_", wrapping_class.to_pascal_case())\
				   .replace("_WRAPPING_", wrapping_class)
	var path := base_path + classname.to_pascal_case() + ".gd"
	_write(path, script)
	EditorInterface.edit_resource(load(path))
	_cleanup()

func _cleanup() -> void:
	if ui != null:
		ui.queue_free()
		ui = null
