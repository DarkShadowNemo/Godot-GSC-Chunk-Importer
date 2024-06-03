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

	var root_node := Node3D.new()
	root_node.name = source_file.get_file().get_basename() # Get the file out of the path and remove file extension
	
	var mesh_instance := MeshInstance3D.new()
	var array_mesh : ArrayMesh = null
	
	var path3d_ := Path3D.new()
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
	Bpath3d_.curve = BNDS3DPath
	
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
	
	file.seek(0)
	
	#primary
	
	while 1:
		var Chunk = file.get_32()
		if Chunk == int(16777475):
			var unk01 = file.get_8()
			var unk02 = file.get_8()
			var vertexCount = file.get_8()
			var unk03 = file.get_8()
			#var vertices : PackedVector3Array
			#vertices.resize(vertexCount)
			#var faces = [[0,1,2]]
			var surf_tool : SurfaceTool
			var vertices : PackedVector3Array
			var faces : PackedVector3Array
			vertices.resize(vertexCount)
			faces.resize(vertexCount)
			surf_tool = SurfaceTool.new()
			surf_tool.begin(Mesh.PRIMITIVE_TRIANGLES)
			
			if vertexCount ==int(3):
				
				var fa=-3
				var fb=-2
				var fc=-1
				for j in range(1):
					#vertices[i] = Vector3(file.get_float(),file.get_float(),file.get_float())
					#var nz = file.get_float()
					var vx = file.get_float()
					var vy = file.get_float()
					var vz = file.get_float()
					var type4 = file.get_8()
					var value1 = file.get_8()
					var normalZ = file.get_16()
					var vx2 = file.get_float()
					var vy2 = file.get_float()
					var vz2 = file.get_float()
					var type4a = file.get_8()
					var value12a = file.get_8()
					var normalZa = file.get_16()
					var vx3 = file.get_float()
					var vy3 = file.get_float()
					var vz3 = file.get_float()
					var type4b = file.get_8()
					var value1b = file.get_8()
					var normalZb = file.get_16()
					fa+=1*3
					fb+=1*3
					fc+=1*3
					if type4 == int(1):
						if type4a == int(1):
							if type4b == int(0):
								surf_tool.add_vertex(Vector3(vx,vy,vz))
								surf_tool.add_vertex(Vector3(vx2,vy2,vz2))
								surf_tool.add_vertex(Vector3(vx3,vy3,vz3))
								surf_tool.add_index(fa)
								surf_tool.add_index(fb)
								surf_tool.add_index(fc)
				
			elif vertexCount ==int(4):
				var fa1=-3
				var fb1=-2
				var fc1=-1
				var fa1_=-4
				var fb1_=-3
				var fc1_=-2
				for j in range(1):
							#vertices[i] = Vector3(file.get_float(),file.get_float(),file.get_float())
							#var nz = file.get_float()
					var vx4 = file.get_float()
					var vy4 = file.get_float()
					var vz4 = file.get_float()
					var type4c = file.get_8()
					var value1 = file.get_8()
					var normalZ = file.get_16()
					var vx5 = file.get_float()
					var vy5 = file.get_float()
					var vz5 = file.get_float()
					var type4d = file.get_8()
					var value12a = file.get_8()
					var normalZa = file.get_16()
					var vx6 = file.get_float()
					var vy6 = file.get_float()
					var vz6 = file.get_float()
					var type4e = file.get_8()
					var value1b = file.get_8()
					var normalZb = file.get_16()
					var vx7 = file.get_float()
					var vy7 = file.get_float()
					var vz7 = file.get_float()
					var type4f = file.get_8()
					var value1c = file.get_8()
					var normalZc = file.get_16()
					fa1+=1*4
					fb1+=1*4
					fc1+=1*4
					fa1_+=1*4
					fb1_+=1*4
					fc1_+=1*4
					if type4c == int(1):
						if type4d == int(1):
							if type4e == int(0):
								if type4f == int(0):
									surf_tool.add_vertex(Vector3(vx4,vy4,vz4))
									surf_tool.add_vertex(Vector3(vx5,vy5,vz5))
									surf_tool.add_vertex(Vector3(vx6,vy6,vz6))
									surf_tool.add_vertex(Vector3(vx7,vy7,vz7))
									surf_tool.add_index(fa1)
									surf_tool.add_index(fb1)
									surf_tool.add_index(fc1)
									surf_tool.add_index(fa1_)
									surf_tool.add_index(fb1_)
									surf_tool.add_index(fc1_)
			elif vertexCount ==int(5):
				var fa11=-3
				var fb11=-2
				var fc11=-1
				var fa11_=-4
				var fb11_=-3
				var fc11_=-2
				var fa11__=-5
				var fb11__=-4
				var fc11__=-3
				for j in range(1):
							#vertices[i] = Vector3(file.get_float(),file.get_float(),file.get_float())
							#var nz = file.get_float()
					var vx8 = file.get_float()
					var vy8 = file.get_float()
					var vz8 = file.get_float()
					var type4g = file.get_8()
					var value1 = file.get_8()
					var normalZ = file.get_16()
					var vx9 = file.get_float()
					var vy9 = file.get_float()
					var vz9 = file.get_float()
					var type4h = file.get_8()
					var value12a = file.get_8()
					var normalZa = file.get_16()
					var vx10 = file.get_float()
					var vy10 = file.get_float()
					var vz10 = file.get_float()
					var type4i = file.get_8()
					var value1b = file.get_8()
					var normalZb = file.get_16()
					var vx11 = file.get_float()
					var vy11 = file.get_float()
					var vz11 = file.get_float()
					var type4j = file.get_8()
					var value1c = file.get_8()
					var normalZc = file.get_16()
					var vx12 = file.get_float()
					var vy12 = file.get_float()
					var vz12 = file.get_float()
					var type4k = file.get_8()
					var value1d = file.get_8()
					var normalZd = file.get_16()
					fa11+=1*5
					fb11+=1*5
					fc11+=1*5
					fa11_+=1*5
					fb11_+=1*5
					fc11_+=1*5
					fa11__+=1*5
					fb11__+=1*5
					fc11__+=1*5
					if type4g == int(1):
						if type4h == int(1):
							if type4i == int(0):
								if type4j == int(0):
									if type4k == int(0):
										surf_tool.add_vertex(Vector3(vx8,vy8,vz8))
										surf_tool.add_vertex(Vector3(vx9,vy9,vz9))
										surf_tool.add_vertex(Vector3(vx10,vy10,vz10))
										surf_tool.add_vertex(Vector3(vx11,vy11,vz11))
										surf_tool.add_vertex(Vector3(vx12,vy12,vz12))
										surf_tool.add_index(fa11)
										surf_tool.add_index(fb11)
										surf_tool.add_index(fc11)
										surf_tool.add_index(fa11_)
										surf_tool.add_index(fb11_)
										surf_tool.add_index(fc11_)
										surf_tool.add_index(fa11__)
										surf_tool.add_index(fb11__)
										surf_tool.add_index(fc11__)
			
			elif vertexCount ==int(6):
				var fa111=-3
				var fb111=-2
				var fc111=-1
				var fa111_=-4
				var fb111_=-3
				var fc111_=-2
				var fa111__=-5
				var fb111__=-4
				var fc111__=-3
				var fa111___=-6
				var fb111___=-5
				var fc111___=-4
				for j in range(1):
							#vertices[i] = Vector3(file.get_float(),file.get_float(),file.get_float())
							#var nz = file.get_float()
					var vx13 = file.get_float()
					var vy13 = file.get_float()
					var vz13 = file.get_float()
					var type4l = file.get_8()
					var value1 = file.get_8()
					var normalZ = file.get_16()
					var vx14 = file.get_float()
					var vy14 = file.get_float()
					var vz14 = file.get_float()
					var type4m = file.get_8()
					var value12a = file.get_8()
					var normalZa = file.get_16()
					var vx15 = file.get_float()
					var vy15 = file.get_float()
					var vz15 = file.get_float()
					var type4n = file.get_8()
					var value1b = file.get_8()
					var normalZb = file.get_16()
					var vx16 = file.get_float()
					var vy16 = file.get_float()
					var vz16 = file.get_float()
					var type4o = file.get_8()
					var value1c = file.get_8()
					var normalZc = file.get_16()
					var vx17 = file.get_float()
					var vy17 = file.get_float()
					var vz17 = file.get_float()
					var type4p = file.get_8()
					var value1d = file.get_8()
					var normalZd = file.get_16()
					var vx18 = file.get_float()
					var vy18 = file.get_float()
					var vz18 = file.get_float()
					var type4q = file.get_8()
					var value1q = file.get_8()
					var normalZq = file.get_16()
					fa111+=1*6
					fb111+=1*6
					fc111+=1*6
					fa111_+=1*6
					fb111_+=1*6
					fc111_+=1*6
					fa111__+=1*6
					fb111__+=1*6
					fc111__+=1*6
					fa111___+=1*6
					fb111___+=1*6
					fc111___+=1*6
					if type4l == int(1):
						if type4m == int(1):
							if type4n == int(0):
								if type4o == int(0):
									if type4p == int(0):
										if type4q == int(0):
											surf_tool.add_vertex(Vector3(vx13,vy13,vz13))
											surf_tool.add_vertex(Vector3(vx14,vy14,vz14))
											surf_tool.add_vertex(Vector3(vx15,vy15,vz15))
											surf_tool.add_vertex(Vector3(vx16,vy16,vz16))
											surf_tool.add_vertex(Vector3(vx17,vy17,vz17))
											surf_tool.add_vertex(Vector3(vx18,vy18,vz18))
											surf_tool.add_index(fa111)
											surf_tool.add_index(fb111)
											surf_tool.add_index(fc111)
											surf_tool.add_index(fa111_)
											surf_tool.add_index(fb111_)
											surf_tool.add_index(fc111_)
											surf_tool.add_index(fa111__)
											surf_tool.add_index(fb111__)
											surf_tool.add_index(fc111__)
											surf_tool.add_index(fa111___)
											surf_tool.add_index(fb111___)
											surf_tool.add_index(fc111___)
			elif vertexCount ==int(7):
				var fa1111=-3
				var fb1111=-2
				var fc1111=-1
				var fa1111_=-4
				var fb1111_=-3
				var fc1111_=-2
				var fa1111__=-5
				var fb1111__=-4
				var fc1111__=-3
				var fa1111___=-6
				var fb1111___=-5
				var fc1111___=-4
				var fa11111___=-7
				var fb11111___=-6
				var fc11111___=-5
				for j in range(1):
							#vertices[i] = Vector3(file.get_float(),file.get_float(),file.get_float())
							#var nz = file.get_float()
					var vx25 = file.get_float()
					var vy25 = file.get_float()
					var vz25 = file.get_float()
					var type4x = file.get_8()
					var value1 = file.get_8()
					var normalZ = file.get_16()
					var vx26 = file.get_float()
					var vy26 = file.get_float()
					var vz26 = file.get_float()
					var type4y = file.get_8()
					var value12a = file.get_8()
					var normalZa = file.get_16()
					var vx27 = file.get_float()
					var vy27 = file.get_float()
					var vz27 = file.get_float()
					var type4z = file.get_8()
					var value1b = file.get_8()
					var normalZb = file.get_16()
					var vx28 = file.get_float()
					var vy28 = file.get_float()
					var vz28 = file.get_float()
					var type4aa = file.get_8()
					var value1c = file.get_8()
					var normalZc = file.get_16()
					var vx29 = file.get_float()
					var vy29 = file.get_float()
					var vz29 = file.get_float()
					var type4ab = file.get_8()
					var value1d = file.get_8()
					var normalZd = file.get_16()
					var vx30 = file.get_float()
					var vy30 = file.get_float()
					var vz30 = file.get_float()
					var type4ac = file.get_8()
					var value1q = file.get_8()
					var normalZq = file.get_16()
					var vx31 = file.get_float()
					var vy31 = file.get_float()
					var vz31 = file.get_float()
					var type4ad = file.get_8()
					var value1ad = file.get_8()
					var normalZad = file.get_16()
					fa1111+=1*7
					fb1111+=1*7
					fc1111+=1*7
					fa1111_+=1*7
					fb1111_+=1*7
					fc1111_+=1*7
					fa1111__+=1*7
					fb1111__+=1*7
					fc1111__+=1*7
					fa1111___+=1*7
					fb1111___+=1*7
					fc1111___+=1*7
					fa11111___+=1*7
					fb11111___+=1*7
					fc11111___+=1*7
					if type4x == int(1):
						if type4y == int(1):
							if type4z == int(0):
								if type4aa == int(0):
									if type4ab == int(0):
										if type4ac == int(0):
											if type4ad == int(0):
												surf_tool.add_vertex(Vector3(vx25,vy25,vz25))
												surf_tool.add_vertex(Vector3(vx26,vy26,vz26))
												surf_tool.add_vertex(Vector3(vx27,vy27,vz27))
												surf_tool.add_vertex(Vector3(vx28,vy28,vz28))
												surf_tool.add_vertex(Vector3(vx29,vy29,vz29))
												surf_tool.add_vertex(Vector3(vx30,vy30,vz30))
												surf_tool.add_vertex(Vector3(vx31,vy31,vz31))
												surf_tool.add_index(fa1111)
												surf_tool.add_index(fb1111)
												surf_tool.add_index(fc1111)
												surf_tool.add_index(fa1111_)
												surf_tool.add_index(fb1111_)
												surf_tool.add_index(fc1111_)
												surf_tool.add_index(fa1111__)
												surf_tool.add_index(fb1111__)
												surf_tool.add_index(fc1111__)
												surf_tool.add_index(fa1111___)
												surf_tool.add_index(fb1111___)
												surf_tool.add_index(fc1111___)
												surf_tool.add_index(fa11111___)
												surf_tool.add_index(fb11111___)
												surf_tool.add_index(fc11111___)
			elif vertexCount ==int(8):
				var fa1111=-3
				var fb1111=-2
				var fc1111=-1
				var fa1111_=-4
				var fb1111_=-3
				var fc1111_=-2
				var fa1111__=-5
				var fb1111__=-4
				var fc1111__=-3
				var fa1111___=-6
				var fb1111___=-5
				var fc1111___=-4
				var fa11111___=-7
				var fb11111___=-6
				var fc11111___=-5
				var fa111111___=-8
				var fb111111___=-7
				var fc111111___=-6
				for j in range(1):
					var vx32 = file.get_float()
					var vy32 = file.get_float()
					var vz32 = file.get_float()
					var type4ae = file.get_8()
					var value1 = file.get_8()
					var normalZ = file.get_16()
					var vx33 = file.get_float()
					var vy33 = file.get_float()
					var vz33 = file.get_float()
					var type4af = file.get_8()
					var value12a = file.get_8()
					var normalZa = file.get_16()
					var vx34 = file.get_float()
					var vy34 = file.get_float()
					var vz34 = file.get_float()
					var type4ag = file.get_8()
					var value1b = file.get_8()
					var normalZb = file.get_16()
					var vx35 = file.get_float()
					var vy35 = file.get_float()
					var vz35 = file.get_float()
					var type4ah = file.get_8()
					var value1c = file.get_8()
					var normalZc = file.get_16()
					var vx36 = file.get_float()
					var vy36 = file.get_float()
					var vz36 = file.get_float()
					var type4ai = file.get_8()
					var value1d = file.get_8()
					var normalZd = file.get_16()
					var vx37 = file.get_float()
					var vy37 = file.get_float()
					var vz37 = file.get_float()
					var type4aj = file.get_8()
					var value1q = file.get_8()
					var normalZq = file.get_16()
					var vx38 = file.get_float()
					var vy38 = file.get_float()
					var vz38 = file.get_float()
					var type4ak = file.get_8()
					var value1ad = file.get_8()
					var normalZad = file.get_16()
					var vx39 = file.get_float()
					var vy39 = file.get_float()
					var vz39 = file.get_float()
					var type4al = file.get_8()
					var value1al = file.get_8()
					var normalZal = file.get_16()
					fa1111+=1*8
					fb1111+=1*8
					fc1111+=1*8
					fa1111_+=1*8
					fb1111_+=1*8
					fc1111_+=1*8
					fa1111__+=1*8
					fb1111__+=1*8
					fc1111__+=1*8
					fa1111___+=1*8
					fb1111___+=1*8
					fc1111___+=1*8
					fa11111___+=1*8
					fb11111___+=1*8
					fc11111___+=1*8
					fa111111___+=1*8
					fb111111___+=1*8
					fc111111___+=1*8
					if type4ae == int(1):
						if type4af == int(1):
							if type4ag == int(0):
								if type4ah == int(0):
									if type4ai == int(0):
										if type4aj == int(0):
											if type4ak == int(0):
												if type4al == int(0):
													surf_tool.add_vertex(Vector3(vx32,vy32,vz32))
													surf_tool.add_vertex(Vector3(vx33,vy33,vz33))
													surf_tool.add_vertex(Vector3(vx34,vy34,vz34))
													surf_tool.add_vertex(Vector3(vx35,vy35,vz35))
													surf_tool.add_vertex(Vector3(vx36,vy36,vz36))
													surf_tool.add_vertex(Vector3(vx37,vy37,vz37))
													surf_tool.add_vertex(Vector3(vx38,vy38,vz38))
													surf_tool.add_vertex(Vector3(vx39,vy39,vz39))
													surf_tool.add_index(fa1111)
													surf_tool.add_index(fb1111)
													surf_tool.add_index(fc1111)
													surf_tool.add_index(fa1111_)
													surf_tool.add_index(fb1111_)
													surf_tool.add_index(fc1111_)
													surf_tool.add_index(fa1111__)
													surf_tool.add_index(fb1111__)
													surf_tool.add_index(fc1111__)
													surf_tool.add_index(fa1111___)
													surf_tool.add_index(fb1111___)
													surf_tool.add_index(fc1111___)
													surf_tool.add_index(fa11111___)
													surf_tool.add_index(fb11111___)
													surf_tool.add_index(fc11111___)
													surf_tool.add_index(fa111111___)
													surf_tool.add_index(fb111111___)
													surf_tool.add_index(fc111111___)
			elif vertexCount ==int(9):
				var fa1111=-3
				var fb1111=-2
				var fc1111=-1
				var fa1111_=-4
				var fb1111_=-3
				var fc1111_=-2
				var fa1111__=-5
				var fb1111__=-4
				var fc1111__=-3
				var fa1111___=-6
				var fb1111___=-5
				var fc1111___=-4
				var fa11111___=-7
				var fb11111___=-6
				var fc11111___=-5
				var fa111111___=-8
				var fb111111___=-7
				var fc111111___=-6
				var fa1111111___=-9
				var fb1111111___=-8
				var fc1111111___=-7
				for j in range(1):
					var vx40 = file.get_float()
					var vy40 = file.get_float()
					var vz40 = file.get_float()
					var type4am = file.get_8()
					var value1 = file.get_8()
					var normalZ = file.get_16()
					var vx41 = file.get_float()
					var vy41 = file.get_float()
					var vz41 = file.get_float()
					var type4an = file.get_8()
					var value12a = file.get_8()
					var normalZa = file.get_16()
					var vx42 = file.get_float()
					var vy42 = file.get_float()
					var vz42 = file.get_float()
					var type4ao = file.get_8()
					var value1b = file.get_8()
					var normalZb = file.get_16()
					var vx43 = file.get_float()
					var vy43 = file.get_float()
					var vz43 = file.get_float()
					var type4ap = file.get_8()
					var value1c = file.get_8()
					var normalZc = file.get_16()
					var vx44 = file.get_float()
					var vy44 = file.get_float()
					var vz44 = file.get_float()
					var type4aq = file.get_8()
					var value1d = file.get_8()
					var normalZd = file.get_16()
					var vx45 = file.get_float()
					var vy45 = file.get_float()
					var vz45 = file.get_float()
					var type4ar = file.get_8()
					var value1q = file.get_8()
					var normalZq = file.get_16()
					var vx46 = file.get_float()
					var vy46 = file.get_float()
					var vz46 = file.get_float()
					var type4as = file.get_8()
					var value1ad = file.get_8()
					var normalZad = file.get_16()
					var vx47 = file.get_float()
					var vy47 = file.get_float()
					var vz47 = file.get_float()
					var type4at = file.get_8()
					var value1al = file.get_8()
					var normalZal = file.get_16()
					var vx48 = file.get_float()
					var vy48 = file.get_float()
					var vz48 = file.get_float()
					var type4au = file.get_8()
					var value1au = file.get_8()
					var normalZau = file.get_16()
					fa1111+=1*9
					fb1111+=1*9
					fc1111+=1*9
					fa1111_+=1*9
					fb1111_+=1*9
					fc1111_+=1*9
					fa1111__+=1*9
					fb1111__+=1*9
					fc1111__+=1*9
					fa1111___+=1*9
					fb1111___+=1*9
					fc1111___+=1*9
					fa11111___+=1*9
					fb11111___+=1*9
					fc11111___+=1*9
					fa111111___+=1*9
					fb111111___+=1*9
					fc111111___+=1*9
					fa1111111___+=1*9
					fb1111111___+=1*9
					fc1111111___+=1*9
					if type4am == int(1):
						if type4an == int(1):
							if type4ao == int(0):
								if type4ap == int(0):
									if type4aq == int(0):
										if type4ar == int(0):
											if type4as == int(0):
												if type4at == int(0):
													if type4au == int(0):
														surf_tool.add_vertex(Vector3(vx40,vy40,vz40))
														surf_tool.add_vertex(Vector3(vx41,vy41,vz41))
														surf_tool.add_vertex(Vector3(vx42,vy42,vz42))
														surf_tool.add_vertex(Vector3(vx43,vy43,vz43))
														surf_tool.add_vertex(Vector3(vx44,vy44,vz44))
														surf_tool.add_vertex(Vector3(vx45,vy45,vz45))
														surf_tool.add_vertex(Vector3(vx46,vy46,vz46))
														surf_tool.add_vertex(Vector3(vx47,vy47,vz47))
														surf_tool.add_vertex(Vector3(vx48,vy48,vz48))
														surf_tool.add_index(fa1111)
														surf_tool.add_index(fb1111)
														surf_tool.add_index(fc1111)
														surf_tool.add_index(fa1111_)
														surf_tool.add_index(fb1111_)
														surf_tool.add_index(fc1111_)
														surf_tool.add_index(fa1111__)
														surf_tool.add_index(fb1111__)
														surf_tool.add_index(fc1111__)
														surf_tool.add_index(fa1111___)
														surf_tool.add_index(fb1111___)
														surf_tool.add_index(fc1111___)
														surf_tool.add_index(fa11111___)
														surf_tool.add_index(fb11111___)
														surf_tool.add_index(fc11111___)
														surf_tool.add_index(fa111111___)
														surf_tool.add_index(fb111111___)
														surf_tool.add_index(fc111111___)
														surf_tool.add_index(fa1111111___)
														surf_tool.add_index(fb1111111___)
														surf_tool.add_index(fc1111111___)
			elif vertexCount ==int(10):
				var fa1111=-3
				var fb1111=-2
				var fc1111=-1
				var fa1111_=-4
				var fb1111_=-3
				var fc1111_=-2
				var fa1111__=-5
				var fb1111__=-4
				var fc1111__=-3
				var fa1111___=-6
				var fb1111___=-5
				var fc1111___=-4
				var fa11111___=-7
				var fb11111___=-6
				var fc11111___=-5
				var fa111111___=-8
				var fb111111___=-7
				var fc111111___=-6
				var fa1111111___=-9
				var fb1111111___=-8
				var fc1111111___=-7
				var fa11111111___=-10
				var fb11111111___=-9
				var fc11111111___=-8
				for j in range(1):
					var vx41 = file.get_float()
					var vy41 = file.get_float()
					var vz41 = file.get_float()
					var type4av = file.get_8()
					var value1 = file.get_8()
					var normalZ = file.get_16()
					var vx42 = file.get_float()
					var vy42 = file.get_float()
					var vz42 = file.get_float()
					var type4aw = file.get_8()
					var value12a = file.get_8()
					var normalZa = file.get_16()
					var vx43 = file.get_float()
					var vy43 = file.get_float()
					var vz43 = file.get_float()
					var type4ax = file.get_8()
					var value1b = file.get_8()
					var normalZb = file.get_16()
					var vx44 = file.get_float()
					var vy44 = file.get_float()
					var vz44 = file.get_float()
					var type4ay = file.get_8()
					var value1c = file.get_8()
					var normalZc = file.get_16()
					var vx45 = file.get_float()
					var vy45 = file.get_float()
					var vz45 = file.get_float()
					var type4az = file.get_8()
					var value1d = file.get_8()
					var normalZd = file.get_16()
					var vx46 = file.get_float()
					var vy46 = file.get_float()
					var vz46 = file.get_float()
					var type4aaa = file.get_8()
					var value1q = file.get_8()
					var normalZq = file.get_16()
					var vx47 = file.get_float()
					var vy47 = file.get_float()
					var vz47 = file.get_float()
					var type4aab = file.get_8()
					var value1ad = file.get_8()
					var normalZad = file.get_16()
					var vx48 = file.get_float()
					var vy48 = file.get_float()
					var vz48 = file.get_float()
					var type4aac = file.get_8()
					var value1al = file.get_8()
					var normalZal = file.get_16()
					var vx49 = file.get_float()
					var vy49 = file.get_float()
					var vz49 = file.get_float()
					var type4aad = file.get_8()
					var value1au = file.get_8()
					var normalZau = file.get_16()
					var vx50 = file.get_float()
					var vy50 = file.get_float()
					var vz50 = file.get_float()
					var type4aae = file.get_8()
					var value1ae = file.get_8()
					var normalZae = file.get_16()
					fa1111+=1*10
					fb1111+=1*10
					fc1111+=1*10
					fa1111_+=1*10
					fb1111_+=1*10
					fc1111_+=1*10
					fa1111__+=1*10
					fb1111__+=1*10
					fc1111__+=1*10
					fa1111___+=1*10
					fb1111___+=1*10
					fc1111___+=1*10
					fa11111___+=1*10
					fb11111___+=1*10
					fc11111___+=1*10
					fa111111___+=1*10
					fb111111___+=1*10
					fc111111___+=1*10
					fa1111111___+=1*10
					fb1111111___+=1*10
					fc1111111___+=1*10
					fa11111111___+=1*10
					fb11111111___+=1*10
					fc11111111___+=1*10
					if type4av == int(1):
						if type4aw == int(1):
							if type4ax == int(0):
								if type4ay == int(0):
									if type4az == int(0):
										if type4aaa == int(0):
											if type4aab == int(0):
												if type4aac == int(0):
													if type4aad == int(0):
														if type4aae == int(0):
															surf_tool.add_vertex(Vector3(vx41,vy41,vz41))
															surf_tool.add_vertex(Vector3(vx42,vy42,vz42))
															surf_tool.add_vertex(Vector3(vx43,vy43,vz43))
															surf_tool.add_vertex(Vector3(vx44,vy44,vz44))
															surf_tool.add_vertex(Vector3(vx45,vy45,vz45))
															surf_tool.add_vertex(Vector3(vx46,vy46,vz46))
															surf_tool.add_vertex(Vector3(vx47,vy47,vz47))
															surf_tool.add_vertex(Vector3(vx48,vy48,vz48))
															surf_tool.add_vertex(Vector3(vx49,vy49,vz49))
															surf_tool.add_vertex(Vector3(vx50,vy50,vz50))
															surf_tool.add_index(fa1111)
															surf_tool.add_index(fb1111)
															surf_tool.add_index(fc1111)
															surf_tool.add_index(fa1111_)
															surf_tool.add_index(fb1111_)
															surf_tool.add_index(fc1111_)
															surf_tool.add_index(fa1111__)
															surf_tool.add_index(fb1111__)
															surf_tool.add_index(fc1111__)
															surf_tool.add_index(fa1111___)
															surf_tool.add_index(fb1111___)
															surf_tool.add_index(fc1111___)
															surf_tool.add_index(fa11111___)
															surf_tool.add_index(fb11111___)
															surf_tool.add_index(fc11111___)
															surf_tool.add_index(fa111111___)
															surf_tool.add_index(fb111111___)
															surf_tool.add_index(fc111111___)
															surf_tool.add_index(fa1111111___)
															surf_tool.add_index(fb1111111___)
															surf_tool.add_index(fc1111111___)
															surf_tool.add_index(fa11111111___)
															surf_tool.add_index(fb11111111___)
															surf_tool.add_index(fc11111111___)
			array_mesh = surf_tool.commit(array_mesh)
		#elif Chunk == int(1112099905):
			#var ActivateALIB = Animation.new()
			#var ALIBSize = file.get_32()
			#break
			
		elif Chunk == int(810832723):
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
	
	mesh_instance.mesh = array_mesh
	mesh_instance.name = "Objects"
	root_node.add_child(mesh_instance)
	mesh_instance.owner = root_node
	
	#var AnimationPlayerNode3D_ := AnimationPlayer.new()
	#AnimationPlayerNode3D_.name = "Animation Library"
	#root_node.add_child(AnimationPlayerNode3D_)
	#AnimationPlayerNode3D_.owner = root_node
	var packed_scene := PackedScene.new();
	
	if (packed_scene.pack(root_node)):
		print("Failed to pack scene.")
		return
	print("Saving to %s.%s" % [save_path, _get_save_extension()])
	return ResourceSaver.save(packed_scene, "%s.%s" % [save_path, _get_save_extension()])
