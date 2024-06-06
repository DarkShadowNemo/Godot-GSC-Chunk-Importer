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


class GSCNU20:
	var NU20 : String
	var NU20Size : int
	var NU20CountorVersion : int
	var NU20Padding : int
	func read_NU20(file : FileAccess):
		file.seek(0)
		NU20 = file.get_buffer(4).get_string_from_ascii()
		NU20Size = file.get_32()
		NU20CountorVersion = file.get_32()
		NU20Padding = file.get_32()

class GSCNamedtable:
	var nameHeader : String
	var nameSize : int
	var nameSizeTwo : int
	var namePadding : int
	var nameTBL : String
	func read_namedtable(file : FileAccess):
		nameHeader = file.get_buffer(4).get_string_from_ascii()
		nameSize = file.get_32()
		if int(nameSize) == 16:
			nameSizeTwo = file.get_32()
			namePadding = file.get_32()
		elif int(nameSize):
			nameSizeTwo = file.get_32()
			for i in range(nameSizeTwo):
				nameTBL = file.get_buffer(nameSizeTwo).get_string_from_utf8()

class GSCTexture:
	var TextureHeader : String
	var TextureSize : int
	var TextureCount : int
	var TextureUnk : int
	var Size : int
	var type : int
	var g_pallete = []
	var is_pallete = false
	func read_textureSet(file : FileAccess):
		TextureHeader = file.get_buffer(4).get_string_from_ascii()
		TextureSize = file.get_32()
		TextureCount = file.get_32()
		TextureUnk = file.get_32()
		Size = file.get_16()
		type = file.get_16()
		if is_pallete == true:
			if Size == 0x8008:
				return 16
			if Size == 0x8080:
				return 256
			return Size - 0x8000 << 4
		
			
		#"""if TextureHeader == String("TST0"):
			#pass"""
class GSCMaterial:
	var MaterialHeader : String
	var MaterialSize : int
	var MaterialCount : int
	var MaterialUnk : int
	
class GSCMaterialData:
	var BrightRed : float
	var BrightGreen : float
	var BrightBlue : float
	var BrightAlpha : float
	var MaterialFlag : int
	var URed1 : int
	var UGreen1 : int
	var UBlue1 : int
	var UAlpha1 : int
	var URed2 : int
	var UGreen2 : int
	var UBlue2 : int
	var UAlpha2 : int
	var URed3 : int
	var UGreen3 : int
	var UBlue3 : int
	var UAlpha3 : int
	
class GSCMesh:
	var ObjectHeader : String
	var ObjectSize : int
	var ObjectCount : int
	var ObjectUnk : int

class GSCMeshData:
	var type : int # usually 1 or 2
	var GeometryUnk : int
	var GeometryCount : int
	var VertexCount : int
	var VertexX : float
	var VertexY : float
	var VertexZ : float
	var NormalZ : float #travellers tales only used the normal z axis not x and y axis
	
class GSCMeshDataTwo:
	var type : int # usually 1 or 2
	var GeometryUnk : int
	var GeometryCount : int
	var VertexCount : int
	var VertexX : int
	var VertexY : int
	var VertexZ : int
	var NormalZ : int
	
class GSCMeshDataThree:
	var type : int # usually 1 or 2
	var GeometryUnk : int
	var GeometryCount : int
	var VertexCount : int
	var VertexX : float
	var VertexY : float
	var VertexZ : float
	var NormalZ : float
	
class GSCUVData:
	pass

class GSCINST:
	#INSTANCE
	var INSTHeader : String
	var INSTSize : int
	var INSTCount : int
	var INSTUnk : int
	
class GSCINSTANCE_Data:
	var InstancesScaleX : float
	var InstancesScaleY : float
	var InstancesScaleZ : float
	var InstancePositionX : float
	var InstancePositionY : float
	var InstancePositionZ : float
	var InstanceHideAndUnHide : float
	
class GSCINID:
	var EmptyHeader : String
	var EmptySize : int
	var EmptyCount : int
	var EmptyUnk : int
	
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
	
	
	var mesh_instance := MeshInstance3D.new()
	var array_mesh : ArrayMesh = null
	
	"""var path3d_ := Path3D.new()
	path3d_.name = "Spline Set"
	root_node.add_child(path3d_)
	path3d_.owner = root_node
	
	var path3d___ := Curve3D.new()
	path3d_.curve = path3d___
	
	var Bpath3d_ := Path3D.new()
	Bpath3d_.name = "Bounds"
	root_node.add_child(Bpath3d_)
	Bpath3d_.owner = root_node
	
	var BNDS3DPath := Curve3D.new()
	Bpath3d_.curve = BNDS3DPath"""
	
	#vigenary #20
	
	#duodenary # 12
	
	#undenary
	
	#denary
	
	#nonary
	
	#octonary
	
	#septanary
	
	#senary
	
	#quinary
	
	#quaternary
	
	#tertiary
	
	file.seek(0)
	
	#secondary
	
	while 1:
		var Chunk2 = file.get_32()
		if Chunk2 == int(16777475):
			var unk01 = file.get_8()
			var unk02 = file.get_8()
			var vertexCount2 = file.get_8()
			var unk03 = file.get_8()
			#var vertices : PackedVector3Array
			#vertices.resize(vertexCount)
			#var faces = [[0,1,2]]
			var surf_tool2 : SurfaceTool
			var vertices2 : PackedVector3Array
			var faces2 : PackedVector3Array
			vertices2.resize(vertexCount2)
			faces2.resize(vertexCount2)
			surf_tool2 = SurfaceTool.new()
			surf_tool2.begin(Mesh.PRIMITIVE_TRIANGLES)
			if vertexCount2 ==int(6):
				
				var fa2=-3
				var fb2=-2
				var fc2=-1
				var fa21=-3
				var fb21=-2
				var fc21=-1
				for j in range(1):
					var vx19 = file.get_float()
					var vy19 = file.get_float()
					var vz19 = file.get_float()
					var type4r = file.get_8()
					var value1 = file.get_8()
					var normalZ = file.get_16()
					var vx20 = file.get_float()
					var vy20 = file.get_float()
					var vz20 = file.get_float()
					var type4s = file.get_8()
					var value12a = file.get_8()
					var normalZa = file.get_16()
					var vx21 = file.get_float()
					var vy21 = file.get_float()
					var vz21 = file.get_float()
					var type4t = file.get_8()
					var value1b = file.get_8()
					var normalZb = file.get_16()
					var vx22 = file.get_float()
					var vy22 = file.get_float()
					var vz22 = file.get_float()
					var type4u = file.get_8()
					var value1c = file.get_8()
					var normalZc = file.get_16()
					var vx23 = file.get_float()
					var vy23 = file.get_float()
					var vz23 = file.get_float()
					var type4v = file.get_8()
					var value1d = file.get_8()
					var normalZd = file.get_16()
					var vx24 = file.get_float()
					var vy24 = file.get_float()
					var vz24 = file.get_float()
					var type4w = file.get_8()
					var value1q = file.get_8()
					var normalZq = file.get_16()
					fa2+=1*3
					fb2+=1*3
					fc2+=1*3
					fa21+=1*6
					fb21+=1*6
					fc21+=1*6
					if type4r == int(1):
						if type4s == int(1):
							if type4t == int(0):
								if type4u == int(1):
									if type4v == int(1):
										if type4w == int(0):
											surf_tool2.add_vertex(Vector3(vx19,vy19,vz19))
											surf_tool2.add_vertex(Vector3(vx20,vy20,vz20))
											surf_tool2.add_vertex(Vector3(vx21,vy21,vz21))
											surf_tool2.add_vertex(Vector3(vx22,vy22,vz22))
											surf_tool2.add_vertex(Vector3(vx23,vy23,vz23))
											surf_tool2.add_vertex(Vector3(vx24,vy24,vz24))
											surf_tool2.add_index(fa2)
											surf_tool2.add_index(fb2)
											surf_tool2.add_index(fc2)
											surf_tool2.add_index(fa21)
											surf_tool2.add_index(fb21)
											surf_tool2.add_index(fc21)
			array_mesh = surf_tool2.commit(array_mesh)
		elif Chunk2 == int(810832723):
			break
	
	
	#var path3d_Follow := PathFollow3D.new()
	#path3d_Follow.name = "Follow Spline Set"
	#root_node.add_child(path3d_Follow)
	#path3d_Follow.reparent(path3d_)
	#path3d_Follow.owner = root_node
	
	#var BNDS_Follow := PathFollow3D.new()
	#BNDS_Follow.name = "Follow Bounds"
	#root_node.add_child(BNDS_Follow)
	#BNDS_Follow.reparent(Bpath3d_)
	#BNDS_Follow.owner = root_node
	
	#mesh_instance.mesh = array_mesh
	#mesh_instance.name = "GSC Objects"
	#test.root_node.add_child(mesh_instance)
	#mesh_instance.owner = test.root_node
	
	#var AnimationPlayerNode3D_ := AnimationPlayer.new()
	#AnimationPlayerNode3D_.name = "Animation Library"
	#root_node.add_child(AnimationPlayerNode3D_)
	#AnimationPlayerNode3D_.owner = root_node
	var packed_scene := PackedScene.new()
	
	if (packed_scene.pack(test.root_node)):
		print("Failed to pack scene.")
		return
	print("Saving to %s.%s" % [save_path, _get_save_extension()])
	return ResourceSaver.save(packed_scene, "%s.%s" % [save_path, _get_save_extension()])
