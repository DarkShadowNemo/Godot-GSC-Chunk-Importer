@tool
extends EditorImportPlugin
class_name GSCChunks_Setup

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
	
	file.seek(0)
	
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
	
	while 1:
		var Chunk = file.get_32()
		if Chunk == int(1233872):
			var TextureHeader = file.get_32()
			var TextureSize = file.get_32()
			var TextureCount = file.get_32()
			var TextureUnk = file.get_32()
			if TextureSize == int(16):
				pass
			elif TextureSize:
				for i in range(TextureCount):
					var size = file.get_16()
					var TextureType = file.get_16()
		elif Chunk == int(808473421):
			var MaterialSize = file.get_32()
			var MaterialCount = file.get_32()
			var MaterialUnk01 = file.get_32()
			for i in range(MaterialCount):
				var materialIDIndex = file.get_8()
				var materialIDIndex2 = file.get_8()
				var materialIDIndex3 = file.get_8()
				var materialIDIndex4 = file.get_8()
				var materialIDIndex5 = file.get_8()
				var materialIDIndex6 = file.get_8()
				var materialIDIndex7 = file.get_8()
				var materialIDIndex8 = file.get_8()
				var materialIDIndex9 = file.get_8()
				var materialIDIndex10 = file.get_8()
				var materialIDIndex11 = file.get_8()
				var materialIDIndex12 = file.get_8()
				var materialIDIndex13 = file.get_8()
				var materialIDIndex14 = file.get_8()
				var materialIDIndex15 = file.get_8()
				var materialIDIndex16 = file.get_8()
				var materialIDIndex17 = file.get_8()
				var materialIDIndex18 = file.get_8()
				var materialIDIndex19 = file.get_8()
				var materialIDIndex20 = file.get_8()
				var materialIDIndex21 = file.get_8()
				var materialIDIndex22 = file.get_8()
				var materialIDIndex23 = file.get_8()
				var materialIDIndex24 = file.get_8()
				var materialIDIndex25 = file.get_8()
				var materialIDIndex26 = file.get_8()
				var materialIDIndex27 = file.get_8()
				var materialIDIndex28 = file.get_8()
				var materialIDIndex29 = file.get_8()
				var materialIDIndex30 = file.get_8()
				var materialIDIndex31 = file.get_8()
				var materialIDIndex32 = file.get_8()
				var materialIDIndex33 = file.get_8()
				var materialIDIndex34 = file.get_8()
				var materialIDIndex35 = file.get_8()
				var materialIDIndex36 = file.get_8()
				var materialIDIndex37 = file.get_8()
				var materialIDIndex38 = file.get_8()
				var materialIDIndex39 = file.get_8()
				var materialIDIndex40 = file.get_8()
				var materialIDIndex41 = file.get_8()
				var materialIDIndex42 = file.get_8()
				var materialIDIndex43 = file.get_8()
				var materialIDIndex44 = file.get_8()
				var materialIDIndex45 = file.get_8()
				var materialIDIndex46 = file.get_8()
				var materialIDIndex47 = file.get_8()
				var materialIDIndex48 = file.get_8()
				var materialIDIndex49 = file.get_8()
				var materialIDIndex50 = file.get_8()
				var materialIDIndex51 = file.get_8()
				var materialIDIndex52 = file.get_8()
				var materialIDIndex53 = file.get_8()
				var materialIDIndex54 = file.get_8()
				var materialIDIndex55 = file.get_8()
				var materialIDIndex56 = file.get_8()
				var materialIDIndex57 = file.get_8()
				var materialIDIndex58 = file.get_8()
				var materialIDIndex59 = file.get_8()
				var materialIDIndex60 = file.get_8()
				var materialIDIndex61 = file.get_8()
				var materialIDIndex62 = file.get_8()
				var materialIDIndex63 = file.get_8()
				var materialIDIndex64 = file.get_8()
				var materialIDIndex65 = file.get_8()
				var materialIDIndex66 = file.get_8()
				var materialIDIndex67 = file.get_8()
				var materialIDIndex68 = file.get_8()
				var materialIDIndex69 = file.get_8()
				var materialIDIndex70 = file.get_8()
				var materialIDIndex71 = file.get_8()
				var materialIDIndex72 = file.get_8()
				var materialIDIndex73 = file.get_8()
				var materialIDIndex74 = file.get_8()
				var materialIDIndex75 = file.get_8()
				var materialIDIndex76 = file.get_8()
				var materialIDIndex77 = file.get_8()
				var materialIDIndex78 = file.get_8()
				var materialIDIndex79 = file.get_8()
				var materialIDIndex80 = file.get_8()
				var materialIDIndex81 = file.get_8()
				var materialIDIndex82 = file.get_8()
				var materialIDIndex83 = file.get_8()
				var materialIDIndex84 = file.get_8()
				var materialIDIndex85 = file.get_8()
				var materialIDIndex86 = file.get_8()
				var materialIDIndex87 = file.get_8()
				var materialIDIndex88 = file.get_8()
				var materialIDIndex89 = file.get_8()
				var materialIDIndex90 = file.get_8()
				var materialIDIndex91 = file.get_8()
				var materialIDIndex92 = file.get_8()
				var materialIDIndex93 = file.get_8()
				var materialIDIndex94 = file.get_8()
				var materialIDIndex95 = file.get_8()
				var materialIDIndex96 = file.get_8()
				var materialIDIndex97 = file.get_8()
				var materialIDIndex98 = file.get_8()
				var materialIDIndex99 = file.get_8()
				var materialIDIndex100 = file.get_8()
				var materialIDIndex101 = file.get_8()
				var materialIDIndex102 = file.get_8()
				var materialIDIndex103 = file.get_8()
				var materialIDIndex104 = file.get_8()
				var brightRed = file.get_float()
				var brightGreen = file.get_float()
				var brightBlue = file.get_float()
				var brightAlpha = file.get_float()
				var materialIDIndex105 = file.get_8()
				var materialIDIndex106 = file.get_8()
				var materialIDIndex107 = file.get_8()
				var materialIDIndex108 = file.get_8()
				var materialIDIndex109 = file.get_8()
				var materialIDIndex110 = file.get_8()
				var materialIDIndex111 = file.get_8()
				var materialIDIndex112 = file.get_8()
				var materialIDIndex113 = file.get_8()
				var materialIDIndex114 = file.get_8()
				var materialIDIndex115 = file.get_8()
				var materialIDIndex116 = file.get_8()
				var materialIDIndex117 = file.get_8()
				var materialIDIndex118 = file.get_8()
				var materialIDIndex119 = file.get_8()
				var materialIDIndex120 = file.get_8()
				var materialIDIndex121 = file.get_8()
				var materialIDIndex122 = file.get_8()
				var materialIDIndex123 = file.get_8()
				var materialIDIndex124 = file.get_8() # 30
				var materialIDIndex125 = file.get_8()
				var materialIDIndex126 = file.get_8()
				var materialIDIndex127 = file.get_8()
				var materialIDIndex128 = file.get_8()
				var materialIDIndex129 = file.get_8()
				var materialIDIndex130 = file.get_8()
				var materialIDIndex131 = file.get_8()
				var materialIDIndex132 = file.get_8()
				var materialIDIndex133 = file.get_8()
				var materialIDIndex134 = file.get_8()
				var materialIDIndex135 = file.get_8()
				var materialIDIndex136 = file.get_8()
				var materialIDIndex137 = file.get_8()
				var materialIDIndex138 = file.get_8()
				var materialIDIndex139 = file.get_8()
				var materialIDIndex140 = file.get_8()
				var materialIDIndex141 = file.get_8()
				var materialIDIndex142 = file.get_8()
				var materialIDIndex143 = file.get_8()
				var materialIDIndex144 = file.get_8()
				
				var materialIDIndex145 = file.get_8()
				var materialIDIndex146 = file.get_8()
				var materialIDIndex147 = file.get_8()
				var materialIDIndex148 = file.get_8()
				var materialIDIndex149 = file.get_8()
				var materialIDIndex150 = file.get_8()
				var materialIDIndex151 = file.get_8()
				var materialIDIndex152 = file.get_8()
				var materialIDIndex153 = file.get_8()
				var materialIDIndex154 = file.get_8()
				var materialIDIndex155 = file.get_8()
				var materialIDIndex156 = file.get_8()
				var materialIDIndex157 = file.get_8()
				var materialIDIndex158 = file.get_8()
				var materialIDIndex159 = file.get_8()
				var materialIDIndex160 = file.get_8()
				
				var materialIDIndex161 = file.get_8()
				var materialIDIndex162 = file.get_8()
				var materialIDIndex163 = file.get_8()
				var materialIDIndex164 = file.get_8()
				var materialIDIndex165 = file.get_8()
				var materialIDIndex166 = file.get_8()
				var materialIDIndex167 = file.get_8()
				var materialIDIndex168 = file.get_8()
				var materialIDIndex169 = file.get_8()
				var materialIDIndex170 = file.get_8()
				var materialIDIndex171 = file.get_8()
				var materialIDIndex172 = file.get_8()
				var materialIDIndex173 = file.get_8()
				var materialIDIndex174 = file.get_8()
				var materialIDIndex175 = file.get_8()
				var materialIDIndex176 = file.get_8()
				var materialIDIndex177 = file.get_8()
				var materialIDIndex178 = file.get_8()
				var materialIDIndex179 = file.get_8()
				var materialIDIndex180 = file.get_8()
				var materialIDIndex181 = file.get_8()
				var materialIDIndex182 = file.get_8()
				var materialIDIndex183 = file.get_8()
				var materialIDIndex184 = file.get_8()
				var materialIDIndex185 = file.get_8()
				var materialIDIndex186 = file.get_8()
				var materialIDIndex187 = file.get_8()
				var materialIDIndex188 = file.get_8()
				var materialIDIndex189 = file.get_8()
				var materialIDIndex190 = file.get_8()
				var materialIDIndex191 = file.get_8()
				var materialIDIndex192 = file.get_8()
				
				var materialIDIndex193 = file.get_8()
				var materialIDIndex194 = file.get_8()
				var materialIDIndex195 = file.get_8()
				var materialIDIndex196 = file.get_8()
				var materialIDIndex197 = file.get_8()
				var materialIDIndex198 = file.get_8()
				var materialIDIndex199 = file.get_8()
				var materialIDIndex200 = file.get_8()
				
				var materialIDIndex201 = file.get_8()
				var materialIDIndex202 = file.get_8()
				var materialIDIndex203 = file.get_8()
				var materialIDIndex204 = file.get_8()
				var materialIDIndex205 = file.get_8()
				var materialIDIndex206 = file.get_8()
				var materialIDIndex207 = file.get_8()
				var materialIDIndex208 = file.get_8()
				var materialIDIndex209 = file.get_8()
				var materialIDIndex210 = file.get_8()
				var materialIDIndex211 = file.get_8()
				var materialIDIndex212 = file.get_8()
				var materialIDIndex213 = file.get_8()
				var materialIDIndex214 = file.get_8()
				var materialIDIndex215 = file.get_8()
				var materialIDIndex216 = file.get_8()
				var materialIDIndex217 = file.get_8()
				var materialIDIndex218 = file.get_8()
				var materialIDIndex219 = file.get_8()
				var materialIDIndex220 = file.get_8()
				var materialIDIndex221 = file.get_8()
				var materialIDIndex222 = file.get_8()
				var materialIDIndex223 = file.get_8()
				var materialIDIndex224 = file.get_8()
				var materialIDIndex225 = file.get_8()
				var materialIDIndex226 = file.get_8()
				var materialIDIndex227 = file.get_8()
				var materialIDIndex228 = file.get_8()
				var materialIDIndex229 = file.get_8()
				var materialIDIndex230 = file.get_8()
				var materialIDIndex231 = file.get_8()
				var materialIDIndex232 = file.get_8()
				var materialIDIndex233 = file.get_8()
				var materialIDIndex234 = file.get_8()
				var materialIDIndex235 = file.get_8()
				var materialIDIndex236 = file.get_8()
				var materialIDIndex237 = file.get_8()
				var materialIDIndex238 = file.get_8()
				var materialIDIndex239 = file.get_8()
				var materialIDIndex240 = file.get_8()
				var materialIDIndex241 = file.get_8()
				var materialIDIndex242 = file.get_8()
				var materialIDIndex243 = file.get_8()
				var materialIDIndex244 = file.get_8()
				var materialIDIndex245 = file.get_8()
				var materialIDIndex246 = file.get_8()
				var materialIDIndex247 = file.get_8()
				var materialIDIndex248 = file.get_8()
				var materialIDIndex249 = file.get_8()
				var materialIDIndex250 = file.get_8()
				var materialIDIndex251 = file.get_8()
				var materialIDIndex252 = file.get_8()
				var materialIDIndex253 = file.get_8()
				var materialIDIndex254 = file.get_8()
				var materialIDIndex255 = file.get_8()
				var materialIDIndex256 = file.get_8()
				var materialIDIndex257 = file.get_8()
				var materialIDIndex258 = file.get_8()
				var materialIDIndex259 = file.get_8()
				var materialIDIndex260 = file.get_8()
				var materialIDIndex261 = file.get_8()
				var materialIDIndex262 = file.get_8()
				var materialIDIndex263 = file.get_8()
				var materialIDIndex264 = file.get_8()
				var materialIDIndex265 = file.get_8()
				var materialIDIndex266 = file.get_8()
				var materialIDIndex267 = file.get_8()
				var materialIDIndex268 = file.get_8()
				var materialIDIndex269 = file.get_8()
				var materialIDIndex270 = file.get_8()
				var materialIDIndex271 = file.get_8()
				var materialIDIndex272 = file.get_8()
				var materialFlag = file.get_32()
				var unknown1 = file.get_32()
				var unknown2 = file.get_32()
				var unknown3 = file.get_32()
				var unknown4 = file.get_32()
				var unknown5 = file.get_32()
				var materialIDIndexSomething = file.get_32()
				var unknown6 = file.get_32()
				var unknown7 = file.get_32()
				var redByte1 = file.get_8()
				var greenByte1 = file.get_8()
				var BlueByte1 = file.get_8()
				var alphaByte1 = file.get_8()
				var redByte2 = file.get_8()
				var greenByte2 = file.get_8()
				var BlueByte2 = file.get_8()
				var alphaByte2 = file.get_8()
				var redByte3 = file.get_8()
				var greenByte3 = file.get_8()
				var BlueByte3 = file.get_8()
				var alphaByte3 = file.get_8()
				var unknown8 = file.get_32()
				var materialflag2 = file.get_32()
				var unknown9 = file.get_32()
				var unknown10 = file.get_32()
				var unknown11 = file.get_32()
				var unknown12 =  file.get_32()
				var unknown13 =  file.get_32()
				var Spec = file.get_float()
				var materialflag3 = file.get_32()
				var unknown14 =  file.get_32()
				var unknown15 =  file.get_32()
				var unknown16 =  file.get_32()
				var diffuseRed = file.get_float()
				var diffuseGreen = file.get_float()
				var diffuseBlue = file.get_float()
				var unknown17 =  file.get_32()
				var unknown18 =  file.get_32()
				var unknown19 =  file.get_32()
				var unknown20 =  file.get_32()
				var roughness = file.get_float()
				var unkFloat = file.get_float()
				var TextureID = file.get_32()
				var MaterialID = file.get_32()
				var unknown21 = file.get_32()
				
				var unknown22 = file.get_32()
				var unknown23 = file.get_32()
				var unknown24 = file.get_32()
				var unknown25 = file.get_32()
				var unknown26 = file.get_32()
				var unknown27 = file.get_32()
				var unknown28 = file.get_32()
				var unknown29 = file.get_32()
		#elif Chunk == int(810173007):
			#var ObjectSize = file.get_32()
			#var ObjectCount = file.get_32()
			#var ObjectUnknown = file.get_32()
			##var UnknownOffset = file.get_buffer(int(24)) # 1 2 3 4 5 6 7
			#for i in range(ObjectCount):
				#pass"""
		elif Chunk == int(16777475):
			var unk01 = file.get_8()
			var unk02 = file.get_8()
			var vertexCount = file.get_8()
			var unk03 = file.get_8()
			#var vertices : PackedVector3Array
			#vertices.resize(vertexCount)
			#var faces = [[0,1,2]]
			var surf_tool : SurfaceTool
			var vertices : PackedVector3Array
			vertices.resize(vertexCount)
			surf_tool = SurfaceTool.new()
			surf_tool.begin(Mesh.PRIMITIVE_TRIANGLE_STRIP)
			for i in range(vertexCount):
				#vertices[i] = Vector3(file.get_float(),file.get_float(),file.get_float())
				#var nz = file.get_float()
				var vx = file.get_float()
				var vy = file.get_float()
				var vz = file.get_float()
				var nz = file.get_float()
				surf_tool.add_vertex(Vector3(vx,vy,vz))
			array_mesh = surf_tool.commit(array_mesh)
		#elif Chunk == int(1112099905):
			#var ActivateALIB = Animation.new()
			#var ALIBSize = file.get_32()
			#break
			
		elif Chunk == int(1396985410):
			var BNDS_Size = file.get_32()
			var BNDS_Ver = file.get_32()
			var BNDS_Count = file.get_32()
			if BNDS_Size == int(16):
				pass
			elif BNDS_Size:
				
				var BNDS_Unk01 = file.get_32()
				var BNDS_Unk02 = file.get_32()
				for i in range(BNDS_Count):
					var bnds_splinex = file.get_float()
					var bnds_spliney = file.get_float()
					var bnds_splinez = file.get_float()
					
					var BNDS_unk_01 = file.get_float()
					var BNDS_unk_02 = file.get_float()
					var BNDS_unk_03 = file.get_float()
					var BNDS_unk_04 = file.get_float()
					var BNDS_unk_05 = file.get_float()
					var BNDS_unk_06 = file.get_float()
					var BNDS_unk_07 = file.get_float()
					var BNDS_unk_08 = file.get_float()
					var BNDS_unk_09 = file.get_float()
					BNDS3DPath.add_point(Vector3(bnds_splinex,bnds_spliney,bnds_splinez))
				
		elif Chunk == int(810832723):
			var SplineSetSize = file.get_32()
			var SplineCount = file.get_32()
			var SplineCount2 = file.get_32()
			if SplineSetSize == int(16):
				pass
			elif SplineSetSize:
				var SplineUnk = file.get_32()
				var SST0E2 = file.get_32()
				var SSEUnk = file.get_32()
				for i in range(SST0E2):
					var splineX = file.get_float()
					var splineY = file.get_float()
					var splineZ = file.get_float()
					path3d___.add_point(Vector3(splineX,splineY,splineZ))
					
			break
	
	
	var path3d_Follow := PathFollow3D.new()
	path3d_Follow.name = "Follow Spline Set"
	root_node.add_child(path3d_Follow)
	path3d_Follow.reparent(path3d_)
	path3d_Follow.owner = root_node
	
	var BNDS_Follow := PathFollow3D.new()
	BNDS_Follow.name = "Follow Bounds"
	root_node.add_child(BNDS_Follow)
	BNDS_Follow.reparent(Bpath3d_)
	BNDS_Follow.owner = root_node
	
	mesh_instance.mesh = array_mesh
	mesh_instance.name = "Objects"
	root_node.add_child(mesh_instance)
	mesh_instance.owner = root_node
	
	var AnimationPlayerNode3D_ := AnimationPlayer.new()
	AnimationPlayerNode3D_.name = "Animation Library"
	root_node.add_child(AnimationPlayerNode3D_)
	AnimationPlayerNode3D_.owner = root_node
	var packed_scene := PackedScene.new();
	
	if (packed_scene.pack(root_node)):
		print("Failed to pack scene.")
		return
	print("Saving to %s.%s" % [save_path, _get_save_extension()])
	return ResourceSaver.save(packed_scene, "%s.%s" % [save_path, _get_save_extension()])
