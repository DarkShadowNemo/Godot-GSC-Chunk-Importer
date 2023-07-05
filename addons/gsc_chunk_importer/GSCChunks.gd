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

class GSCTexture:
	var TextureHeader : String
	var TextureSize : int
	var TextureCount : int
	var TextureUnk : int
	
class GSCTextureData:
	var width : int
	var height : int
	var palleteType : int

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
