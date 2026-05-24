@tool
extends EditorImportPlugin
class_name  strip_8

var root_node = Node3D.new()

const SEEK_SET := 0
const SEEK_CUR := 1
const SEEK_END := 2

func u8_to_s8(u8: int) -> int:
	u8 &= 0xFF
	if u8 & 0x80:
		return u8 - 0x100
	return u8
		
func u16_to_s16(u16: int) -> int:
	u16 &= 0xFFFF
	if u16 > 0x7FFF:
		return u16 - 0x10000
	return u16

func custom_seek(file: FileAccess, offset: int, whence: int) -> void:
	var new_pos := 0
	match whence:
		SEEK_SET:
			new_pos = offset
		SEEK_CUR:
			new_pos = file.get_position() + offset
		SEEK_END:
			new_pos = file.get_length() + offset
		_:
			push_error("Invalid whence value")
			return
	new_pos = clamp(new_pos, 0, file.get_length())
	
	file.seek(new_pos)

func _strip8_(file : FileAccess, source_file : String):
	file.seek(0)
	var type0001__s=[]
	var type0002__s=[]
	var type0003__s=[]
	while file.get_position() < file.get_length():
		var Chunk8 = file.get_32()
		if Chunk8 == int(16777475):
			custom_seek(file, 2,1)
			var vertexCount2 = file.get_8()
			var flag_2 = file.get_8()
			if flag_2 == int(108):
				if vertexCount2 == int(3):
					for i in range(1):
						var vx0001__ = file.get_float()
						var vy0001__ = file.get_float()
						var vz0001__ = file.get_float()
						var type0001__ = file.get_8()
						var value1a0001__ = file.get_8()
						var normalZ_0001__ = file.get_16()
						var vx0002__ = file.get_float()
						var vy0002__ = file.get_float()
						var vz0002__ = file.get_float()
						var type0002__ = file.get_8()
						var value1a0002__ = file.get_8()
						var normalZ_0002__ = file.get_16()
						var vx0003__ = file.get_float()
						var vy0003__ = file.get_float()
						var vz0003__ = file.get_float()
						var type0003__ = file.get_8()
						var value1a0003__ = file.get_8()
						var normalZ_0003__ = file.get_16()
						type0001__s.append(type0001__)
						type0002__s.append(type0002__)
						type0003__s.append(type0003__)
					var _01_n_offset1 = file.get_32()
					if  _01_n_offset1 == int(1694728196):
						for i in range(1):
							var _1_uvx1_0a = file.get_16()
							var _1_uvy1_0a = file.get_16()
							var _1_uvx1_0a_ = file.get_16()
							var _1_uvy1_0a_ = file.get_16()
							var _1_uvx1_0a__ = file.get_16()
							var _1_uvy1_0a__ = file.get_16()
						var _01_n_offset2 = file.get_32()
						if _01_n_offset2 == int(1845739525):
							for i in range(1):
								var _r1_0a = file.get_8()
								var _g1_0a = file.get_8()
								var _b1_0a = file.get_8()
								var _a1_0a = file.get_8()
								var _r1_0a_ = file.get_8()
								var _g1_0a_ = file.get_8()
								var _b1_0a_ = file.get_8()
								var _a1_0a_ = file.get_8()
								var _r1_0a__ = file.get_8()
								var _g1_0a__ = file.get_8()
								var _b1_0a__ = file.get_8()
								var _a1_0a__ = file.get_8()
							var _00_n_offset3 = file.get_32()
							if _00_n_offset3 == int(16777473):
								var _00_n_offset4 = file.get_32()
								if _00_n_offset4 == int(335545088):
									if type0001__s[0] == 1:
										if type0002__s[0] == 1:
											if type0003__s[0] == 0:
												pass
							
						
	file.seek(0)
