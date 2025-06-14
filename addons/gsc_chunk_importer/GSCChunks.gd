@tool
extends EditorImportPlugin
class_name GSCChunks_Setup

#################################################
func _get_importer_name():
	return "gsc"
	
func _get_visible_name():
	return "TTGames GameScene"
	
func _get_recognized_extensions():
	return ["gsc"]
	
func _get_priority():
	return 1.0
	
func _get_import_order():
	return 0
	
func _get_save_extension():
	return "tscn"

func _get_resource_type():
	return "PackedScene"
	
enum Presets { DEFAULT }

func _get_preset_count():
	return Presets.size()
	
func _get_preset_name(preset):
	match preset:
		Presets.DEFAULT:
			return "Default"
		_:
			return "Unknown"
			
func _get_import_options(_path : String, preset_index : int):
	#add_import_option("material_path_pattern", "res://materials/{texture_name}_material.tres")
	match preset_index:
		Presets.DEFAULT:
			return [{
				"name" : "material_path_pattern",
				"default_value" : "res://materials/{texture_name}_material.tres"
			},
			{
				"name" : "texture_material_rename",
				"default_value" : { "texture_name1" : "res://material/texture_name1_material.tres" }
			}]
		_:
			return []


	
func _get_option_visibility(_option, _options, _unknown_dictionary):
	return true
	
##################################
#propertys
##################################
	
func _import(source_file : String, save_path : String, options, r_platform_variants, r_gen_files):
	var material_path_pattern : String = options["material_path_pattern"]
	var file := FileAccess.open(source_file, FileAccess.READ)
	
	if (!file):
		var error := FileAccess.get_open_error()
		print("Failed to open %s: %d" % [source_file, error])
		return error
		
	file.seek(0)
	var myScript1 = preload("res://addons/gsc_chunk_importer/prim_mesh/primary_mesh.gd")
	var test = myScript1.new()
	test._primary_mesh_(file, source_file)
	test.root_node.name = source_file.get_file().get_basename()
	file.seek(0)
	
	var packed_scene := PackedScene.new()
	
	if (packed_scene.pack(test.root_node)):
		print("Failed to pack scene.")
		return
	print("Saving to %s.%s" % [save_path, _get_save_extension()])
	return ResourceSaver.save(packed_scene, "%s.%s" % [save_path, _get_save_extension()])
