@tool
extends EditorPlugin

var rcm := ReactiveCreationMenu.new()

func _enable_plugin() -> void:
	pass


func _disable_plugin() -> void:
	pass


func _enter_tree() -> void:
	add_context_menu_plugin(EditorContextMenuPlugin.CONTEXT_SLOT_FILESYSTEM_CREATE, rcm)


func _exit_tree() -> void:
	remove_context_menu_plugin(rcm)
