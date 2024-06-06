@tool
extends EditorImportPlugin
class_name PRIMARY_MESH_1

var root_node := Node3D.new()


func _primary_mesh_(file : FileAccess, source_file : String):
	file.seek(0)
	root_node.name = source_file.get_file().get_basename()
	var mesh_instance := MeshInstance3D.new()
	var array_mesh : ArrayMesh = null
	while 1:
		var Chunk = file.get_32()
		if Chunk == int(16777475):
			var unk01 = file.get_8()
			var unk02 = file.get_8()
			var vertexCount = file.get_8()
			var flags1 = file.get_8()
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
			
			if flags1 == int(108):
				
			
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
				elif vertexCount ==int(11):
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
					var fa111111111___=-11
					var fb111111111___=-10
					var fc111111111___=-9
					for j in range(1):
						var vx51 = file.get_float()
						var vy51 = file.get_float()
						var vz51 = file.get_float()
						var type4aaf = file.get_8()
						var value1 = file.get_8()
						var normalZ = file.get_16()
						var vx52 = file.get_float()
						var vy52 = file.get_float()
						var vz52 = file.get_float()
						var type4aag = file.get_8()
						var value12a = file.get_8()
						var normalZa = file.get_16()
						var vx53 = file.get_float()
						var vy53 = file.get_float()
						var vz53 = file.get_float()
						var type4aah = file.get_8()
						var value1b = file.get_8()
						var normalZb = file.get_16()
						var vx54 = file.get_float()
						var vy54 = file.get_float()
						var vz54 = file.get_float()
						var type4aai = file.get_8()
						var value1c = file.get_8()
						var normalZc = file.get_16()
						var vx55 = file.get_float()
						var vy55 = file.get_float()
						var vz55 = file.get_float()
						var type4aaj = file.get_8()
						var value1d = file.get_8()
						var normalZd = file.get_16()
						var vx56 = file.get_float()
						var vy56 = file.get_float()
						var vz56 = file.get_float()
						var type4aak = file.get_8()
						var value1q = file.get_8()
						var normalZq = file.get_16()
						var vx57 = file.get_float()
						var vy57 = file.get_float()
						var vz57 = file.get_float()
						var type4aal = file.get_8()
						var value1ad = file.get_8()
						var normalZad = file.get_16()
						var vx58 = file.get_float()
						var vy58 = file.get_float()
						var vz58 = file.get_float()
						var type4aam = file.get_8()
						var value1al = file.get_8()
						var normalZal = file.get_16()
						var vx59 = file.get_float()
						var vy59 = file.get_float()
						var vz59 = file.get_float()
						var type4aan = file.get_8()
						var value1au = file.get_8()
						var normalZau = file.get_16()
						var vx60 = file.get_float()
						var vy60 = file.get_float()
						var vz60 = file.get_float()
						var type4aao = file.get_8()
						var value1ae = file.get_8()
						var normalZae = file.get_16()
						var vx61 = file.get_float()
						var vy61 = file.get_float()
						var vz61 = file.get_float()
						var type4aap = file.get_8()
						var value1ap = file.get_8()
						var normalZap = file.get_16()
						fa1111+=1*11
						fb1111+=1*11
						fc1111+=1*11
						fa1111_+=1*11
						fb1111_+=1*11
						fc1111_+=1*11
						fa1111__+=1*11
						fb1111__+=1*11
						fc1111__+=1*11
						fa1111___+=1*11
						fb1111___+=1*11
						fc1111___+=1*11
						fa11111___+=1*11
						fb11111___+=1*11
						fc11111___+=1*11
						fa111111___+=1*11
						fb111111___+=1*11
						fc111111___+=1*11
						fa1111111___+=1*11
						fb1111111___+=1*11
						fc1111111___+=1*11
						fa11111111___+=1*11
						fb11111111___+=1*11
						fc11111111___+=1*11
						fa111111111___+=1*11
						fb111111111___+=1*11
						fc111111111___+=1*11
						if type4aaf == int(1):
							if type4aag == int(1):
								if type4aah == int(0):
									if type4aai == int(0):
										if type4aaj == int(0):
											if type4aak == int(0):
												if type4aal == int(0):
													if type4aam == int(0):
														if type4aan == int(0):
															if type4aao == int(0):
																if type4aap == int(0):
																	surf_tool.add_vertex(Vector3(vx51,vy51,vz51))
																	surf_tool.add_vertex(Vector3(vx52,vy52,vz52))
																	surf_tool.add_vertex(Vector3(vx53,vy53,vz53))
																	surf_tool.add_vertex(Vector3(vx54,vy54,vz54))
																	surf_tool.add_vertex(Vector3(vx55,vy55,vz55))
																	surf_tool.add_vertex(Vector3(vx56,vy56,vz56))
																	surf_tool.add_vertex(Vector3(vx57,vy57,vz57))
																	surf_tool.add_vertex(Vector3(vx58,vy58,vz58))
																	surf_tool.add_vertex(Vector3(vx59,vy59,vz59))
																	surf_tool.add_vertex(Vector3(vx60,vy60,vz60))
																	surf_tool.add_vertex(Vector3(vx61,vy61,vz61))
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
																	surf_tool.add_index(fa111111111___)
																	surf_tool.add_index(fb111111111___)
																	surf_tool.add_index(fc111111111___)
				
				
				elif vertexCount ==int(12):
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
					var fa111111111___=-11
					var fb111111111___=-10
					var fc111111111___=-9
					var fa1111111111___=-12
					var fb1111111111___=-11
					var fc1111111111___=-10
					for j in range(1):
						var vx62 = file.get_float()
						var vy62 = file.get_float()
						var vz62 = file.get_float()
						var type4aaq = file.get_8()
						var value1 = file.get_8()
						var normalZ = file.get_16()
						var vx63 = file.get_float()
						var vy63 = file.get_float()
						var vz63 = file.get_float()
						var type4aar = file.get_8()
						var value12a = file.get_8()
						var normalZa = file.get_16()
						var vx64 = file.get_float()
						var vy64 = file.get_float()
						var vz64 = file.get_float()
						var type4aas = file.get_8()
						var value1b = file.get_8()
						var normalZb = file.get_16()
						var vx65 = file.get_float()
						var vy65 = file.get_float()
						var vz65 = file.get_float()
						var type4aat = file.get_8()
						var value1c = file.get_8()
						var normalZc = file.get_16()
						var vx66 = file.get_float()
						var vy66 = file.get_float()
						var vz66 = file.get_float()
						var type4aau = file.get_8()
						var value1d = file.get_8()
						var normalZd = file.get_16()
						var vx67 = file.get_float()
						var vy67 = file.get_float()
						var vz67 = file.get_float()
						var type4aav = file.get_8()
						var value1q = file.get_8()
						var normalZq = file.get_16()
						var vx68 = file.get_float()
						var vy68 = file.get_float()
						var vz68 = file.get_float()
						var type4aaw = file.get_8()
						var value1ad = file.get_8()
						var normalZad = file.get_16()
						var vx69 = file.get_float()
						var vy69 = file.get_float()
						var vz69 = file.get_float()
						var type4aax = file.get_8()
						var value1al = file.get_8()
						var normalZal = file.get_16()
						var vx70 = file.get_float()
						var vy70 = file.get_float()
						var vz70 = file.get_float()
						var type4aay = file.get_8()
						var value1au = file.get_8()
						var normalZau = file.get_16()
						var vx71 = file.get_float()
						var vy71 = file.get_float()
						var vz71 = file.get_float()
						var type4aaz = file.get_8()
						var value1ae = file.get_8()
						var normalZae = file.get_16()
						var vx72 = file.get_float()
						var vy72 = file.get_float()
						var vz72 = file.get_float()
						var type4aaaa = file.get_8()
						var value1ap = file.get_8()
						var normalZap = file.get_16()
						var vx73 = file.get_float()
						var vy73 = file.get_float()
						var vz73 = file.get_float()
						var type4aaab = file.get_8()
						var value1ab = file.get_8()
						var normalZab = file.get_16()
						fa1111+=1*12
						fb1111+=1*12
						fc1111+=1*12
						fa1111_+=1*12
						fb1111_+=1*12
						fc1111_+=1*12
						fa1111__+=1*12
						fb1111__+=1*12
						fc1111__+=1*12
						fa1111___+=1*12
						fb1111___+=1*12
						fc1111___+=1*12
						fa11111___+=1*12
						fb11111___+=1*12
						fc11111___+=1*12
						fa111111___+=1*12
						fb111111___+=1*12
						fc111111___+=1*12
						fa1111111___+=1*12
						fb1111111___+=1*12
						fc1111111___+=1*12
						fa11111111___+=1*12
						fb11111111___+=1*12
						fc11111111___+=1*12
						fa111111111___+=1*12
						fb111111111___+=1*12
						fc111111111___+=1*12
						fa1111111111___+=1*12
						fb1111111111___+=1*12
						fc1111111111___+=1*12
						if type4aaq == int(1):
							if type4aar == int(1):
								if type4aas == int(0):
									if type4aat == int(0):
										if type4aau == int(0):
											if type4aav == int(0):
												if type4aaw == int(0):
													if type4aax == int(0):
														if type4aay == int(0):
															if type4aaz == int(0):
																if type4aaaa == int(0):
																	if type4aaab == int(0):
																		surf_tool.add_vertex(Vector3(vx62,vy62,vz62))
																		surf_tool.add_vertex(Vector3(vx63,vy63,vz63))
																		surf_tool.add_vertex(Vector3(vx64,vy64,vz64))
																		surf_tool.add_vertex(Vector3(vx65,vy65,vz65))
																		surf_tool.add_vertex(Vector3(vx66,vy66,vz66))
																		surf_tool.add_vertex(Vector3(vx67,vy67,vz67))
																		surf_tool.add_vertex(Vector3(vx68,vy68,vz68))
																		surf_tool.add_vertex(Vector3(vx69,vy69,vz69))
																		surf_tool.add_vertex(Vector3(vx70,vy70,vz70))
																		surf_tool.add_vertex(Vector3(vx71,vy71,vz71))
																		surf_tool.add_vertex(Vector3(vx72,vy72,vz72))
																		surf_tool.add_vertex(Vector3(vx73,vy73,vz73))
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
																		surf_tool.add_index(fa111111111___)
																		surf_tool.add_index(fb111111111___)
																		surf_tool.add_index(fc111111111___)
																		surf_tool.add_index(fa1111111111___)
																		surf_tool.add_index(fb1111111111___)
																		surf_tool.add_index(fc1111111111___)
				elif vertexCount ==int(13):
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
					var fa111111111___=-11
					var fb111111111___=-10
					var fc111111111___=-9
					var fa1111111111___=-12
					var fb1111111111___=-11
					var fc1111111111___=-10
					var fa11111111111___=-13
					var fb11111111111___=-12
					var fc11111111111___=-11
					for j in range(1):
						var vx74 = file.get_float()
						var vy74 = file.get_float()
						var vz74 = file.get_float()
						var type4aaac = file.get_8()
						var value1 = file.get_8()
						var normalZ = file.get_16()
						var vx75 = file.get_float()
						var vy75 = file.get_float()
						var vz75 = file.get_float()
						var type4aaad = file.get_8()
						var value12a = file.get_8()
						var normalZa = file.get_16()
						var vx76 = file.get_float()
						var vy76 = file.get_float()
						var vz76 = file.get_float()
						var type4aaae = file.get_8()
						var value1b = file.get_8()
						var normalZb = file.get_16()
						var vx77 = file.get_float()
						var vy77 = file.get_float()
						var vz77 = file.get_float()
						var type4aaaf = file.get_8()
						var value1c = file.get_8()
						var normalZc = file.get_16()
						var vx78 = file.get_float()
						var vy78 = file.get_float()
						var vz78 = file.get_float()
						var type4aaag = file.get_8()
						var value1d = file.get_8()
						var normalZd = file.get_16()
						var vx79 = file.get_float()
						var vy79 = file.get_float()
						var vz79 = file.get_float()
						var type4aaah = file.get_8()
						var value1q = file.get_8()
						var normalZq = file.get_16()
						var vx80 = file.get_float()
						var vy80 = file.get_float()
						var vz80 = file.get_float()
						var type4aaai = file.get_8()
						var value1ad = file.get_8()
						var normalZad = file.get_16()
						var vx81 = file.get_float()
						var vy81 = file.get_float()
						var vz81 = file.get_float()
						var type4aaaj = file.get_8()
						var value1al = file.get_8()
						var normalZal = file.get_16()
						var vx82 = file.get_float()
						var vy82 = file.get_float()
						var vz82 = file.get_float()
						var type4aaak = file.get_8()
						var value1au = file.get_8()
						var normalZau = file.get_16()
						var vx83 = file.get_float()
						var vy83 = file.get_float()
						var vz83 = file.get_float()
						var type4aaal = file.get_8()
						var value1ae = file.get_8()
						var normalZae = file.get_16()
						var vx84 = file.get_float()
						var vy84 = file.get_float()
						var vz84 = file.get_float()
						var type4aaam = file.get_8()
						var value1ap = file.get_8()
						var normalZap = file.get_16()
						var vx85 = file.get_float()
						var vy85 = file.get_float()
						var vz85 = file.get_float()
						var type4aaan = file.get_8()
						var value1ab = file.get_8()
						var normalZab = file.get_16()
						var vx86 = file.get_float()
						var vy86 = file.get_float()
						var vz86 = file.get_float()
						var type4aaao = file.get_8()
						var value1ao = file.get_8()
						var normalZao = file.get_16()
						fa1111+=1*13
						fb1111+=1*13
						fc1111+=1*13
						fa1111_+=1*13
						fb1111_+=1*13
						fc1111_+=1*13
						fa1111__+=1*13
						fb1111__+=1*13
						fc1111__+=1*13
						fa1111___+=1*13
						fb1111___+=1*13
						fc1111___+=1*13
						fa11111___+=1*13
						fb11111___+=1*13
						fc11111___+=1*13
						fa111111___+=1*13
						fb111111___+=1*13
						fc111111___+=1*13
						fa1111111___+=1*13
						fb1111111___+=1*13
						fc1111111___+=1*13
						fa11111111___+=1*13
						fb11111111___+=1*13
						fc11111111___+=1*13
						fa111111111___+=1*13
						fb111111111___+=1*13
						fc111111111___+=1*13
						fa1111111111___+=1*13
						fb1111111111___+=1*13
						fc1111111111___+=1*13
						fa11111111111___+=1*13
						fb11111111111___+=1*13
						fc11111111111___+=1*13
						if type4aaac == int(1):
							if type4aaad == int(1):
								if type4aaae == int(0):
									if type4aaaf == int(0):
										if type4aaag == int(0):
											if type4aaah == int(0):
												if type4aaai == int(0):
													if type4aaaj == int(0):
														if type4aaak == int(0):
															if type4aaal == int(0):
																if type4aaam == int(0):
																	if type4aaan == int(0):
																		if type4aaao == int(0):
																			surf_tool.add_vertex(Vector3(vx74,vy74,vz74))
																			surf_tool.add_vertex(Vector3(vx75,vy75,vz75))
																			surf_tool.add_vertex(Vector3(vx76,vy76,vz76))
																			surf_tool.add_vertex(Vector3(vx77,vy77,vz77))
																			surf_tool.add_vertex(Vector3(vx78,vy78,vz78))
																			surf_tool.add_vertex(Vector3(vx79,vy79,vz79))
																			surf_tool.add_vertex(Vector3(vx80,vy80,vz80))
																			surf_tool.add_vertex(Vector3(vx81,vy81,vz81))
																			surf_tool.add_vertex(Vector3(vx82,vy82,vz82))
																			surf_tool.add_vertex(Vector3(vx83,vy83,vz83))
																			surf_tool.add_vertex(Vector3(vx84,vy84,vz84))
																			surf_tool.add_vertex(Vector3(vx85,vy85,vz85))
																			surf_tool.add_vertex(Vector3(vx86,vy86,vz86))
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
																			surf_tool.add_index(fa111111111___)
																			surf_tool.add_index(fb111111111___)
																			surf_tool.add_index(fc111111111___)
																			surf_tool.add_index(fa1111111111___)
																			surf_tool.add_index(fb1111111111___)
																			surf_tool.add_index(fc1111111111___)
																			surf_tool.add_index(fa11111111111___)
																			surf_tool.add_index(fb11111111111___)
																			surf_tool.add_index(fc11111111111___)
				elif vertexCount ==int(14):
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
					var fa111111111___=-11
					var fb111111111___=-10
					var fc111111111___=-9
					var fa1111111111___=-12
					var fb1111111111___=-11
					var fc1111111111___=-10
					var fa11111111111___=-13
					var fb11111111111___=-12
					var fc11111111111___=-11
					var fa111111111111___=-14
					var fb111111111111___=-13
					var fc111111111111___=-12
					for j in range(1):
						var vx87 = file.get_float()
						var vy87 = file.get_float()
						var vz87 = file.get_float()
						var type4aaap = file.get_8()
						var value1 = file.get_8()
						var normalZ = file.get_16()
						var vx88 = file.get_float()
						var vy88 = file.get_float()
						var vz88 = file.get_float()
						var type4aaaq = file.get_8()
						var value12a = file.get_8()
						var normalZa = file.get_16()
						var vx89 = file.get_float()
						var vy89 = file.get_float()
						var vz89 = file.get_float()
						var type4aaar = file.get_8()
						var value1b = file.get_8()
						var normalZb = file.get_16()
						var vx90 = file.get_float()
						var vy90 = file.get_float()
						var vz90 = file.get_float()
						var type4aaas = file.get_8()
						var value1c = file.get_8()
						var normalZc = file.get_16()
						var vx91 = file.get_float()
						var vy91 = file.get_float()
						var vz91 = file.get_float()
						var type4aaat = file.get_8()
						var value1d = file.get_8()
						var normalZd = file.get_16()
						var vx92 = file.get_float()
						var vy92 = file.get_float()
						var vz92 = file.get_float()
						var type4aaau = file.get_8()
						var value1q = file.get_8()
						var normalZq = file.get_16()
						var vx93 = file.get_float()
						var vy93 = file.get_float()
						var vz93 = file.get_float()
						var type4aaav = file.get_8()
						var value1ad = file.get_8()
						var normalZad = file.get_16()
						var vx94 = file.get_float()
						var vy94 = file.get_float()
						var vz94 = file.get_float()
						var type4aaaw = file.get_8()
						var value1al = file.get_8()
						var normalZal = file.get_16()
						var vx95 = file.get_float()
						var vy95 = file.get_float()
						var vz95 = file.get_float()
						var type4aaax = file.get_8()
						var value1au = file.get_8()
						var normalZau = file.get_16()
						var vx96 = file.get_float()
						var vy96 = file.get_float()
						var vz96 = file.get_float()
						var type4aaay = file.get_8()
						var value1ae = file.get_8()
						var normalZae = file.get_16()
						var vx97 = file.get_float()
						var vy97 = file.get_float()
						var vz97 = file.get_float()
						var type4aaaz = file.get_8()
						var value1ap = file.get_8()
						var normalZap = file.get_16()
						var vx98 = file.get_float()
						var vy98 = file.get_float()
						var vz98 = file.get_float()
						var type4aaaaa = file.get_8()
						var value1ab = file.get_8()
						var normalZab = file.get_16()
						var vx99 = file.get_float()
						var vy99 = file.get_float()
						var vz99 = file.get_float()
						var type4aaaab = file.get_8()
						var value1ao = file.get_8()
						var normalZao = file.get_16()
						var vx100 = file.get_float()
						var vy100 = file.get_float()
						var vz100 = file.get_float()
						var type4aaaac = file.get_8()
						var value1app = file.get_8()
						var normalZapp = file.get_16()
						fa1111+=1*14
						fb1111+=1*14
						fc1111+=1*14
						
						fa1111_+=1*14
						fb1111_+=1*14
						fc1111_+=1*14
						
						fa1111__+=1*14
						fb1111__+=1*14
						fc1111__+=1*14
						
						fa1111___+=1*14
						fb1111___+=1*14
						fc1111___+=1*14
						
						fa11111___+=1*14
						fb11111___+=1*14
						fc11111___+=1*14
						
						fa111111___+=1*14
						fb111111___+=1*14
						fc111111___+=1*14
						
						fa1111111___+=1*14
						fb1111111___+=1*14
						fc1111111___+=1*14
						
						fa11111111___+=1*14
						fb11111111___+=1*14
						fc11111111___+=1*14
						
						fa111111111___+=1*14
						fb111111111___+=1*14
						fc111111111___+=1*14
						
						fa1111111111___+=1*14
						fb1111111111___+=1*14
						fc1111111111___+=1*14
						
						fa11111111111___+=1*14
						fb11111111111___+=1*14
						fc11111111111___+=1*14
						
						fa111111111111___+=1*14
						fb111111111111___+=1*14
						fc111111111111___+=1*14
						if type4aaap == int(1):
							if type4aaaq == int(1):
								if type4aaar == int(0):
									if type4aaas == int(0):
										if type4aaat == int(0):
											if type4aaau == int(0):
												if type4aaav == int(0):
													if type4aaaw == int(0):
														if type4aaax == int(0):
															if type4aaay == int(0):
																if type4aaaz == int(0):
																	if type4aaaaa == int(0):
																		if type4aaaab == int(0):
																			if type4aaaac == int(0):
																				surf_tool.add_vertex(Vector3(vx87,vy87,vz87))
																				surf_tool.add_vertex(Vector3(vx88,vy88,vz88))
																				surf_tool.add_vertex(Vector3(vx89,vy89,vz89))
																				surf_tool.add_vertex(Vector3(vx90,vy90,vz90))
																				surf_tool.add_vertex(Vector3(vx91,vy91,vz91))
																				surf_tool.add_vertex(Vector3(vx92,vy92,vz92))
																				surf_tool.add_vertex(Vector3(vx93,vy93,vz93))
																				surf_tool.add_vertex(Vector3(vx94,vy94,vz94))
																				surf_tool.add_vertex(Vector3(vx95,vy95,vz95))
																				surf_tool.add_vertex(Vector3(vx96,vy96,vz96))
																				surf_tool.add_vertex(Vector3(vx97,vy97,vz97))
																				surf_tool.add_vertex(Vector3(vx98,vy98,vz98))
																				surf_tool.add_vertex(Vector3(vx99,vy99,vz99))
																				surf_tool.add_vertex(Vector3(vx100,vy100,vz100))
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
																				
																				surf_tool.add_index(fa111111111___)
																				surf_tool.add_index(fb111111111___)
																				surf_tool.add_index(fc111111111___)
																				
																				surf_tool.add_index(fa1111111111___)
																				surf_tool.add_index(fb1111111111___)
																				surf_tool.add_index(fc1111111111___)
																				
																				surf_tool.add_index(fa11111111111___)
																				surf_tool.add_index(fb11111111111___)
																				surf_tool.add_index(fc11111111111___)
																				
																				surf_tool.add_index(fa111111111111___)
																				surf_tool.add_index(fb111111111111___)
																				surf_tool.add_index(fc111111111111___)
				elif vertexCount ==int(15):
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
					var fa111111111___=-11
					var fb111111111___=-10
					var fc111111111___=-9
					var fa1111111111___=-12
					var fb1111111111___=-11
					var fc1111111111___=-10
					var fa11111111111___=-13
					var fb11111111111___=-12
					var fc11111111111___=-11
					var fa111111111111___=-14
					var fb111111111111___=-13
					var fc111111111111___=-12
					var fa1111111111111___=-15
					var fb1111111111111___=-14
					var fc1111111111111___=-13
					for j in range(1):
						var vx101 = file.get_float()
						var vy101 = file.get_float()
						var vz101 = file.get_float()
						var type4aaaad = file.get_8()
						var value1 = file.get_8()
						var normalZ = file.get_16()
						var vx102 = file.get_float()
						var vy102 = file.get_float()
						var vz102 = file.get_float()
						var type4aaaab = file.get_8()
						var value12a = file.get_8()
						var normalZa = file.get_16()
						var vx103 = file.get_float()
						var vy103 = file.get_float()
						var vz103 = file.get_float()
						var type4aaaac = file.get_8()
						var value1b = file.get_8()
						var normalZb = file.get_16()
						var vx104 = file.get_float()
						var vy104 = file.get_float()
						var vz104 = file.get_float()
						var type4aaaad_ = file.get_8()
						var value1c = file.get_8()
						var normalZc = file.get_16()
						var vx105 = file.get_float()
						var vy105 = file.get_float()
						var vz105 = file.get_float()
						var type4aaaae = file.get_8()
						var value1d = file.get_8()
						var normalZd = file.get_16()
						var vx106 = file.get_float()
						var vy106 = file.get_float()
						var vz106 = file.get_float()
						var type4aaaaf = file.get_8()
						var value1q = file.get_8()
						var normalZq = file.get_16()
						var vx107 = file.get_float()
						var vy107 = file.get_float()
						var vz107 = file.get_float()
						var type4aaaag = file.get_8()
						var value1ad = file.get_8()
						var normalZad = file.get_16()
						var vx108 = file.get_float()
						var vy108 = file.get_float()
						var vz108 = file.get_float()
						var type4aaaah = file.get_8()
						var value1al = file.get_8()
						var normalZal = file.get_16()
						var vx109 = file.get_float()
						var vy109 = file.get_float()
						var vz109 = file.get_float()
						var type4aaaai = file.get_8()
						var value1au = file.get_8()
						var normalZau = file.get_16()
						var vx110 = file.get_float()
						var vy110 = file.get_float()
						var vz110 = file.get_float()
						var type4aaaaj = file.get_8()
						var value1ae = file.get_8()
						var normalZae = file.get_16()
						var vx111 = file.get_float()
						var vy111 = file.get_float()
						var vz111 = file.get_float()
						var type4aaaak = file.get_8()
						var value1ap = file.get_8()
						var normalZap = file.get_16()
						var vx112 = file.get_float()
						var vy112 = file.get_float()
						var vz112 = file.get_float()
						var type4aaaaal = file.get_8()
						var value1ab = file.get_8()
						var normalZab = file.get_16()
						var vx113 = file.get_float()
						var vy113 = file.get_float()
						var vz113 = file.get_float()
						var type4aaaaam = file.get_8()
						var value1ao = file.get_8()
						var normalZao = file.get_16()
						var vx114 = file.get_float()
						var vy114 = file.get_float()
						var vz114 = file.get_float()
						var type4aaaaan = file.get_8()
						var value1app = file.get_8()
						var normalZapp = file.get_16()
						var vx115 = file.get_float()
						var vy115 = file.get_float()
						var vz115 = file.get_float()
						var type4aaaaao = file.get_8()
						var value1appp = file.get_8()
						var normalZappp = file.get_16()
						fa1111+=1*15
						fb1111+=1*15
						fc1111+=1*15
						fa1111_+=1*15
						fb1111_+=1*15
						fc1111_+=1*15
						fa1111__+=1*15
						fb1111__+=1*15
						fc1111__+=1*15
						fa1111___+=1*15
						fb1111___+=1*15
						fc1111___+=1*15
						
						fa11111___+=1*15
						fb11111___+=1*15
						fc11111___+=1*15
						fa111111___+=1*15
						fb111111___+=1*15
						fc111111___+=1*15
						fa1111111___+=1*15
						fb1111111___+=1*15
						fc1111111___+=1*15
						fa11111111___+=1*15
						fb11111111___+=1*15
						fc11111111___+=1*15
						fa111111111___+=1*15
						fb111111111___+=1*15
						fc111111111___+=1*15
						fa1111111111___+=1*15
						fb1111111111___+=1*15
						fc1111111111___+=1*15
						fa11111111111___+=1*15
						fb11111111111___+=1*15
						fc11111111111___+=1*15
						fa111111111111___+=1*15
						fb111111111111___+=1*15
						fc111111111111___+=1*15
						fa1111111111111___+=1*15
						fb1111111111111___+=1*15
						fc1111111111111___+=1*15
						if type4aaaad == int(1):
							if type4aaaab == int(1):
								if type4aaaac == int(0):
									if type4aaaad_ == int(0):
										if type4aaaae == int(0):
											if type4aaaaf == int(0):
												if type4aaaag == int(0):
													if type4aaaah == int(0):
														if type4aaaai == int(0):
															if type4aaaaj == int(0):
																if type4aaaak == int(0):
																	if type4aaaaal == int(0):
																		if type4aaaaam == int(0):
																			if type4aaaaan == int(0):
																				if type4aaaaao == int(0):
																					surf_tool.add_vertex(Vector3(vx101,vy101,vz101))
																					surf_tool.add_vertex(Vector3(vx102,vy102,vz102))
																					surf_tool.add_vertex(Vector3(vx103,vy103,vz103))
																					surf_tool.add_vertex(Vector3(vx104,vy104,vz104))
																					surf_tool.add_vertex(Vector3(vx105,vy105,vz105))
																					surf_tool.add_vertex(Vector3(vx106,vy106,vz106))
																					surf_tool.add_vertex(Vector3(vx107,vy107,vz107))
																					surf_tool.add_vertex(Vector3(vx108,vy108,vz108))
																					surf_tool.add_vertex(Vector3(vx109,vy109,vz109))
																					surf_tool.add_vertex(Vector3(vx110,vy110,vz110))
																					surf_tool.add_vertex(Vector3(vx111,vy111,vz111))
																					surf_tool.add_vertex(Vector3(vx112,vy112,vz112))
																					surf_tool.add_vertex(Vector3(vx113,vy113,vz113))
																					surf_tool.add_vertex(Vector3(vx114,vy114,vz114))
																					surf_tool.add_vertex(Vector3(vx115,vy115,vz115))
																					
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
																					
																					surf_tool.add_index(fa111111111___)
																					surf_tool.add_index(fb111111111___)
																					surf_tool.add_index(fc111111111___)
																					
																					surf_tool.add_index(fa1111111111___)
																					surf_tool.add_index(fb1111111111___)
																					surf_tool.add_index(fc1111111111___)
																					
																					surf_tool.add_index(fa11111111111___)
																					surf_tool.add_index(fb11111111111___)
																					surf_tool.add_index(fc11111111111___)
																					
																					surf_tool.add_index(fa111111111111___)
																					surf_tool.add_index(fb111111111111___)
																					surf_tool.add_index(fc111111111111___)
																					
																					surf_tool.add_index(fa1111111111111___)
																					surf_tool.add_index(fb1111111111111___)
																					surf_tool.add_index(fc1111111111111___)
																					
																					
				elif vertexCount ==int(16):
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
					var fa111111111___=-11
					var fb111111111___=-10
					var fc111111111___=-9
					var fa1111111111___=-12
					var fb1111111111___=-11
					var fc1111111111___=-10
					var fa11111111111___=-13
					var fb11111111111___=-12
					var fc11111111111___=-11
					var fa111111111111___=-14
					var fb111111111111___=-13
					var fc111111111111___=-12
					var fa1111111111111___=-15
					var fb1111111111111___=-14
					var fc1111111111111___=-13
					var fa11111111111111___=-16
					var fb11111111111111___=-15
					var fc11111111111111___=-14
					for j in range(1):
						var vx116 = file.get_float()
						var vy116 = file.get_float()
						var vz116 = file.get_float()
						var type4aaaad = file.get_8()
						var value1 = file.get_8()
						var normalZ = file.get_16()
						var vx117 = file.get_float()
						var vy117 = file.get_float()
						var vz117 = file.get_float()
						var type4aaaab = file.get_8()
						var value12a = file.get_8()
						var normalZa = file.get_16()
						var vx118 = file.get_float()
						var vy118 = file.get_float()
						var vz118 = file.get_float()
						var type4aaaac = file.get_8()
						var value1b = file.get_8()
						var normalZb = file.get_16()
						var vx119 = file.get_float()
						var vy119 = file.get_float()
						var vz119 = file.get_float()
						var type4aaaad_ = file.get_8()
						var value1c = file.get_8()
						var normalZc = file.get_16()
						var vx120 = file.get_float()
						var vy120 = file.get_float()
						var vz120 = file.get_float()
						var type4aaaae = file.get_8()
						var value1d = file.get_8()
						var normalZd = file.get_16()
						var vx121 = file.get_float()
						var vy121 = file.get_float()
						var vz121 = file.get_float()
						var type4aaaaf = file.get_8()
						var value1q = file.get_8()
						var normalZq = file.get_16()
						var vx122 = file.get_float()
						var vy122 = file.get_float()
						var vz122 = file.get_float()
						var type4aaaag = file.get_8()
						var value1ad = file.get_8()
						var normalZad = file.get_16()
						var vx123 = file.get_float()
						var vy123 = file.get_float()
						var vz123 = file.get_float()
						var type4aaaah = file.get_8()
						var value1al = file.get_8()
						var normalZal = file.get_16()
						var vx124 = file.get_float()
						var vy124 = file.get_float()
						var vz124 = file.get_float()
						var type4aaaai = file.get_8()
						var value1au = file.get_8()
						var normalZau = file.get_16()
						var vx125 = file.get_float()
						var vy125 = file.get_float()
						var vz125 = file.get_float()
						var type4aaaaj = file.get_8()
						var value1ae = file.get_8()
						var normalZae = file.get_16()
						var vx126 = file.get_float()
						var vy126 = file.get_float()
						var vz126 = file.get_float()
						var type4aaaak = file.get_8()
						var value1ap = file.get_8()
						var normalZap = file.get_16()
						var vx127 = file.get_float()
						var vy127 = file.get_float()
						var vz127 = file.get_float()
						var type4aaaaal = file.get_8()
						var value1ab = file.get_8()
						var normalZab = file.get_16()
						var vx128 = file.get_float()
						var vy128 = file.get_float()
						var vz128 = file.get_float()
						var type4aaaaam = file.get_8()
						var value1ao = file.get_8()
						var normalZao = file.get_16()
						var vx129 = file.get_float()
						var vy129 = file.get_float()
						var vz129 = file.get_float()
						var type4aaaaan = file.get_8()
						var value1app = file.get_8()
						var normalZapp = file.get_16()
						var vx130 = file.get_float()
						var vy130 = file.get_float()
						var vz130 = file.get_float()
						var type4aaaaao = file.get_8()
						var value1appp = file.get_8()
						var normalZappp = file.get_16()
						var vx131 = file.get_float()
						var vy131 = file.get_float()
						var vz131 = file.get_float()
						var type4aaaaap = file.get_8()
						var value1apppp = file.get_8()
						var normalZapppp = file.get_16()
					
						fa1111+=1*16
						fb1111+=1*16
						fc1111+=1*16
						fa1111_+=1*16
						fb1111_+=1*16
						fc1111_+=1*16
						fa1111__+=1*16
						fb1111__+=1*16
						fc1111__+=1*16
						fa1111___+=1*16
						fb1111___+=1*16
						fc1111___+=1*16	
						fa11111___+=1*16
						fb11111___+=1*16
						fc11111___+=1*16
						fa111111___+=1*16
						fb111111___+=1*16
						fc111111___+=1*16
						fa1111111___+=1*16
						fb1111111___+=1*16
						fc1111111___+=1*16
						fa11111111___+=1*16
						fb11111111___+=1*16
						fc11111111___+=1*16
						fa111111111___+=1*16
						fb111111111___+=1*16
						fc111111111___+=1*16
						fa1111111111___+=1*16
						fb1111111111___+=1*16
						fc1111111111___+=1*16
						fa11111111111___+=1*16
						fb11111111111___+=1*16
						fc11111111111___+=1*16
						fa111111111111___+=1*16
						fb111111111111___+=1*16
						fc111111111111___+=1*16
						fa1111111111111___+=1*16
						fb1111111111111___+=1*16
						fc1111111111111___+=1*16
						fa11111111111111___+=1*16
						fb11111111111111___+=1*16
						fc11111111111111___+=1*16
						
						if type4aaaad == int(1):
							if type4aaaab == int(1):
								if type4aaaac == int(0):
									if type4aaaad_ == int(0):
										if type4aaaae == int(0):
											if type4aaaaf == int(0):
												if type4aaaag == int(0):
													if type4aaaah == int(0):
														if type4aaaai == int(0):
															if type4aaaaj == int(0):
																if type4aaaak == int(0):
																	if type4aaaaal == int(0):
																		if type4aaaaam == int(0):
																			if type4aaaaan == int(0):
																				if type4aaaaao == int(0):
																					if type4aaaaap == int(0):
																						surf_tool.add_vertex(Vector3(vx116,vy116,vz116))
																						surf_tool.add_vertex(Vector3(vx117,vy117,vz117))
																						surf_tool.add_vertex(Vector3(vx118,vy118,vz118))
																						surf_tool.add_vertex(Vector3(vx119,vy119,vz119))
																						surf_tool.add_vertex(Vector3(vx120,vy120,vz120))
																						surf_tool.add_vertex(Vector3(vx121,vy121,vz121))
																						surf_tool.add_vertex(Vector3(vx122,vy122,vz122))
																						surf_tool.add_vertex(Vector3(vx123,vy123,vz123))
																						surf_tool.add_vertex(Vector3(vx124,vy124,vz124))
																						surf_tool.add_vertex(Vector3(vx125,vy125,vz125))
																						surf_tool.add_vertex(Vector3(vx126,vy126,vz126))
																						surf_tool.add_vertex(Vector3(vx127,vy127,vz127))
																						surf_tool.add_vertex(Vector3(vx128,vy128,vz128))
																						surf_tool.add_vertex(Vector3(vx129,vy129,vz129))
																						surf_tool.add_vertex(Vector3(vx130,vy130,vz130))
																						surf_tool.add_vertex(Vector3(vx131,vy131,vz131))
																						
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
																						
																						surf_tool.add_index(fa111111111___)
																						surf_tool.add_index(fb111111111___)
																						surf_tool.add_index(fc111111111___)
																						
																						surf_tool.add_index(fa1111111111___)
																						surf_tool.add_index(fb1111111111___)
																						surf_tool.add_index(fc1111111111___)
																						
																						surf_tool.add_index(fa11111111111___)
																						surf_tool.add_index(fb11111111111___)
																						surf_tool.add_index(fc11111111111___)
																						
																						surf_tool.add_index(fa111111111111___)
																						surf_tool.add_index(fb111111111111___)
																						surf_tool.add_index(fc111111111111___)
																						
																						surf_tool.add_index(fa1111111111111___)
																						surf_tool.add_index(fb1111111111111___)
																						surf_tool.add_index(fc1111111111111___)
																						
																						surf_tool.add_index(fa11111111111111___)
																						surf_tool.add_index(fb11111111111111___)
																						surf_tool.add_index(fc11111111111111___)
				elif vertexCount ==int(17):
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
					var fa111111111___=-11
					var fb111111111___=-10
					var fc111111111___=-9
					var fa1111111111___=-12
					var fb1111111111___=-11
					var fc1111111111___=-10
					var fa11111111111___=-13
					var fb11111111111___=-12
					var fc11111111111___=-11
					var fa111111111111___=-14
					var fb111111111111___=-13
					var fc111111111111___=-12
					var fa1111111111111___=-15
					var fb1111111111111___=-14
					var fc1111111111111___=-13
					var fa11111111111111___=-16
					var fb11111111111111___=-15
					var fc11111111111111___=-14
					var fa111111111111111___=-17
					var fb111111111111111___=-16
					var fc111111111111111___=-15
					for j in range(1):
						var vx132 = file.get_float()
						var vy132 = file.get_float()
						var vz132 = file.get_float()
						var type4aaaaq = file.get_8()
						var value1 = file.get_8()
						var normalZ = file.get_16()
						var vx133 = file.get_float()
						var vy133 = file.get_float()
						var vz133 = file.get_float()
						var type4aaaar = file.get_8()
						var value12a = file.get_8()
						var normalZa = file.get_16()
						var vx134 = file.get_float()
						var vy134 = file.get_float()
						var vz134 = file.get_float()
						var type4aaaas = file.get_8()
						var value1b = file.get_8()
						var normalZb = file.get_16()
						var vx135 = file.get_float()
						var vy135 = file.get_float()
						var vz135 = file.get_float()
						var type4aaaat_ = file.get_8()
						var value1c = file.get_8()
						var normalZc = file.get_16()
						var vx136 = file.get_float()
						var vy136 = file.get_float()
						var vz136 = file.get_float()
						var type4aaaau = file.get_8()
						var value1d = file.get_8()
						var normalZd = file.get_16()
						var vx137 = file.get_float()
						var vy137 = file.get_float()
						var vz137 = file.get_float()
						var type4aaaav = file.get_8()
						var value1q = file.get_8()
						var normalZq = file.get_16()
						var vx138 = file.get_float()
						var vy138 = file.get_float()
						var vz138 = file.get_float()
						var type4aaaaw = file.get_8()
						var value1ad = file.get_8()
						var normalZad = file.get_16()
						var vx139 = file.get_float()
						var vy139 = file.get_float()
						var vz139 = file.get_float()
						var type4aaaax = file.get_8()
						var value1al = file.get_8()
						var normalZal = file.get_16()
						var vx140 = file.get_float()
						var vy140 = file.get_float()
						var vz140 = file.get_float()
						var type4aaaay = file.get_8()
						var value1au = file.get_8()
						var normalZau = file.get_16()
						var vx141 = file.get_float()
						var vy141 = file.get_float()
						var vz141 = file.get_float()
						var type4aaaaz = file.get_8()
						var value1ae = file.get_8()
						var normalZae = file.get_16()
						var vx142 = file.get_float()
						var vy142 = file.get_float()
						var vz142 = file.get_float()
						var type4aaaaaa = file.get_8()
						var value1ap = file.get_8()
						var normalZap = file.get_16()
						var vx143 = file.get_float()
						var vy143 = file.get_float()
						var vz143 = file.get_float()
						var type4aaaaaab = file.get_8()
						var value1ab = file.get_8()
						var normalZab = file.get_16()
						var vx144 = file.get_float()
						var vy144 = file.get_float()
						var vz144 = file.get_float()
						var type4aaaaaac = file.get_8()
						var value1ao = file.get_8()
						var normalZao = file.get_16()
						var vx145 = file.get_float()
						var vy145 = file.get_float()
						var vz145 = file.get_float()
						var type4aaaaaad = file.get_8()
						var value1app = file.get_8()
						var normalZapp = file.get_16()
						var vx146 = file.get_float()
						var vy146 = file.get_float()
						var vz146 = file.get_float()
						var type4aaaaaae = file.get_8()
						var value1appp = file.get_8()
						var normalZappp = file.get_16()
						var vx147 = file.get_float()
						var vy147 = file.get_float()
						var vz147 = file.get_float()
						var type4aaaaaaf = file.get_8()
						var value1apppp = file.get_8()
						var normalZapppp = file.get_16()
						var vx148 = file.get_float()
						var vy148 = file.get_float()
						var vz148 = file.get_float()
						var type4aaaaaag = file.get_8()
						var value1appppp = file.get_8()
						var normalZappppp = file.get_16()
						fa1111+=1*17
						fb1111+=1*17
						fc1111+=1*17
						fa1111_+=1*17
						fb1111_+=1*17
						fc1111_+=1*17
						fa1111__+=1*17
						fb1111__+=1*17
						fc1111__+=1*17
						fa1111___+=1*17
						fb1111___+=1*17
						fc1111___+=1*17	
						fa11111___+=1*17
						fb11111___+=1*17
						fc11111___+=1*17
						fa111111___+=1*17
						fb111111___+=1*17
						fc111111___+=1*17
						fa1111111___+=1*17
						fb1111111___+=1*17
						fc1111111___+=1*17
						fa11111111___+=1*17
						fb11111111___+=1*17
						fc11111111___+=1*17
						fa111111111___+=1*17
						fb111111111___+=1*17
						fc111111111___+=1*17
						fa1111111111___+=1*17
						fb1111111111___+=1*17
						fc1111111111___+=1*17
						fa11111111111___+=1*17
						fb11111111111___+=1*17
						fc11111111111___+=1*17
						fa111111111111___+=1*17
						fb111111111111___+=1*17
						fc111111111111___+=1*17
						fa1111111111111___+=1*17
						fb1111111111111___+=1*17
						fc1111111111111___+=1*17
						fa11111111111111___+=1*17
						fb11111111111111___+=1*17
						fc11111111111111___+=1*17
						fa111111111111111___+=1*17
						fb111111111111111___+=1*17
						fc111111111111111___+=1*17
						if type4aaaaq == int(1):
							if type4aaaar == int(1):
								if type4aaaas == int(0):
									if type4aaaat_ == int(0):
										if type4aaaau == int(0):
											if type4aaaav == int(0):
												if type4aaaaw == int(0):
													if type4aaaax == int(0):
														if type4aaaay == int(0):
															if type4aaaaz == int(0):
																if type4aaaaaa == int(0):
																	if type4aaaaaab == int(0):
																		if type4aaaaaac == int(0):
																			if type4aaaaaad == int(0):
																				if type4aaaaaae == int(0):
																					if type4aaaaaaf == int(0):
																						if type4aaaaaag == int(0):
																							surf_tool.add_vertex(Vector3(vx132,vy132,vz132))
																							surf_tool.add_vertex(Vector3(vx133,vy133,vz133))
																							surf_tool.add_vertex(Vector3(vx134,vy134,vz134))
																							surf_tool.add_vertex(Vector3(vx135,vy135,vz135))
																							surf_tool.add_vertex(Vector3(vx136,vy136,vz136))
																							surf_tool.add_vertex(Vector3(vx137,vy137,vz137))
																							surf_tool.add_vertex(Vector3(vx138,vy138,vz138))
																							surf_tool.add_vertex(Vector3(vx139,vy139,vz139))
																							surf_tool.add_vertex(Vector3(vx140,vy140,vz140))
																							surf_tool.add_vertex(Vector3(vx141,vy141,vz141))
																							surf_tool.add_vertex(Vector3(vx142,vy142,vz142))
																							surf_tool.add_vertex(Vector3(vx143,vy143,vz143))
																							surf_tool.add_vertex(Vector3(vx144,vy144,vz144))
																							surf_tool.add_vertex(Vector3(vx145,vy145,vz145))
																							surf_tool.add_vertex(Vector3(vx146,vy146,vz146))
																							surf_tool.add_vertex(Vector3(vx147,vy147,vz147))
																							surf_tool.add_vertex(Vector3(vx148,vy148,vz148))
																							
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
																							surf_tool.add_index(fa111111111___)
																							surf_tool.add_index(fb111111111___)
																							surf_tool.add_index(fc111111111___)
																							surf_tool.add_index(fa1111111111___)
																							surf_tool.add_index(fb1111111111___)
																							surf_tool.add_index(fc1111111111___)
																							surf_tool.add_index(fa11111111111___)
																							surf_tool.add_index(fb11111111111___)
																							surf_tool.add_index(fc11111111111___)
																							surf_tool.add_index(fa111111111111___)
																							surf_tool.add_index(fb111111111111___)
																							surf_tool.add_index(fc111111111111___)
																							surf_tool.add_index(fa1111111111111___)
																							surf_tool.add_index(fb1111111111111___)
																							surf_tool.add_index(fc1111111111111___)
																							surf_tool.add_index(fa11111111111111___)
																							surf_tool.add_index(fb11111111111111___)
																							surf_tool.add_index(fc11111111111111___)
																							surf_tool.add_index(fa111111111111111___)
																							surf_tool.add_index(fb111111111111111___)
																							surf_tool.add_index(fc111111111111111___)
				elif vertexCount == int(18):
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
					var fa111111111___=-11
					var fb111111111___=-10
					var fc111111111___=-9
					var fa1111111111___=-12
					var fb1111111111___=-11
					var fc1111111111___=-10
					var fa11111111111___=-13
					var fb11111111111___=-12
					var fc11111111111___=-11
					var fa111111111111___=-14
					var fb111111111111___=-13
					var fc111111111111___=-12
					var fa1111111111111___=-15
					var fb1111111111111___=-14
					var fc1111111111111___=-13
					var fa11111111111111___=-16
					var fb11111111111111___=-15
					var fc11111111111111___=-14
					var fa111111111111111___=-17
					var fb111111111111111___=-16
					var fc111111111111111___=-15
					var fa1111111111111111___=-18
					var fb1111111111111111___=-17
					var fc1111111111111111___=-16
					for j in range(1):
						var vx149 = file.get_float()
						var vy149 = file.get_float()
						var vz149 = file.get_float()
						var type4aaaag1 = file.get_8()
						var value1 = file.get_8()
						var normalZ = file.get_16()
						var vx150 = file.get_float()
						var vy150 = file.get_float()
						var vz150 = file.get_float()
						var type4aaaar1 = file.get_8()
						var value12a = file.get_8()
						var normalZa = file.get_16()
						var vx151 = file.get_float()
						var vy151 = file.get_float()
						var vz151 = file.get_float()
						var type4aaaas1 = file.get_8()
						var value1b = file.get_8()
						var normalZb = file.get_16()
						var vx152 = file.get_float()
						var vy152 = file.get_float()
						var vz152 = file.get_float()
						var type4aaaat1_ = file.get_8()
						var value1c = file.get_8()
						var normalZc = file.get_16()
						var vx153 = file.get_float()
						var vy153 = file.get_float()
						var vz153 = file.get_float()
						var type4aaaau1 = file.get_8()
						var value1d = file.get_8()
						var normalZd = file.get_16()
						var vx154 = file.get_float()
						var vy154 = file.get_float()
						var vz154 = file.get_float()
						var type4aaaav1 = file.get_8()
						var value1q = file.get_8()
						var normalZq = file.get_16()
						var vx155 = file.get_float()
						var vy155 = file.get_float()
						var vz155 = file.get_float()
						var type4aaaaw1 = file.get_8()
						var value1ad = file.get_8()
						var normalZad = file.get_16()
						var vx156 = file.get_float()
						var vy156 = file.get_float()
						var vz156 = file.get_float()
						var type4aaaax1 = file.get_8()
						var value1al = file.get_8()
						var normalZal = file.get_16()
						var vx157 = file.get_float()
						var vy157 = file.get_float()
						var vz157 = file.get_float()
						var type4aaaay1 = file.get_8()
						var value1au = file.get_8()
						var normalZau = file.get_16()
						var vx158 = file.get_float()
						var vy158 = file.get_float()
						var vz158 = file.get_float()
						var type4aaaaz1 = file.get_8()
						var value1ae = file.get_8()
						var normalZae = file.get_16()
						var vx159 = file.get_float()
						var vy159 = file.get_float()
						var vz159 = file.get_float()
						var type4aaaaaa1 = file.get_8()
						var value1ap = file.get_8()
						var normalZap = file.get_16()
						var vx160 = file.get_float()
						var vy160 = file.get_float()
						var vz160 = file.get_float()
						var type4aaaaaab1 = file.get_8()
						var value1ab = file.get_8()
						var normalZab = file.get_16()
						var vx161 = file.get_float()
						var vy161 = file.get_float()
						var vz161 = file.get_float()
						var type4aaaaaac1 = file.get_8()
						var value1ao = file.get_8()
						var normalZao = file.get_16()
						var vx162 = file.get_float()
						var vy162 = file.get_float()
						var vz162 = file.get_float()
						var type4aaaaaad1 = file.get_8()
						var value1app = file.get_8()
						var normalZapp = file.get_16()
						var vx163 = file.get_float()
						var vy163 = file.get_float()
						var vz163 = file.get_float()
						var type4aaaaaae1 = file.get_8()
						var value1appp = file.get_8()
						var normalZappp = file.get_16()
						var vx164 = file.get_float()
						var vy164 = file.get_float()
						var vz164 = file.get_float()
						var type4aaaaaaf1 = file.get_8()
						var value1apppp = file.get_8()
						var normalZapppp = file.get_16()
						var vx165 = file.get_float()
						var vy165 = file.get_float()
						var vz165 = file.get_float()
						var type4aaaaaag1 = file.get_8()
						var value1appppp = file.get_8()
						var normalZappppp = file.get_16()
						var vx166 = file.get_float()
						var vy166 = file.get_float()
						var vz166 = file.get_float()
						var type4aaaaaag1_ = file.get_8()
						var value1appppp_ = file.get_8()
						var normalZappppp_ = file.get_16()
						fa1111+=1*18
						fb1111+=1*18
						fc1111+=1*18
						fa1111_+=1*18
						fb1111_+=1*18
						fc1111_+=1*18
						fa1111__+=1*18
						fb1111__+=1*18
						fc1111__+=1*18
						fa1111___+=1*18
						fb1111___+=1*18
						fc1111___+=1*18	
						fa11111___+=1*18
						fb11111___+=1*18
						fc11111___+=1*18
						fa111111___+=1*18
						fb111111___+=1*18
						fc111111___+=1*18
						fa1111111___+=1*18
						fb1111111___+=1*18
						fc1111111___+=1*18
						fa11111111___+=1*18
						fb11111111___+=1*18
						fc11111111___+=1*18
						fa111111111___+=1*18
						fb111111111___+=1*18
						fc111111111___+=1*18
						fa1111111111___+=1*18
						fb1111111111___+=1*18
						fc1111111111___+=1*18
						fa11111111111___+=1*18
						fb11111111111___+=1*18
						fc11111111111___+=1*18
						fa111111111111___+=1*18
						fb111111111111___+=1*18
						fc111111111111___+=1*18
						fa1111111111111___+=1*18
						fb1111111111111___+=1*18
						fc1111111111111___+=1*18
						fa11111111111111___+=1*18
						fb11111111111111___+=1*18
						fc11111111111111___+=1*18
						fa111111111111111___+=1*18
						fb111111111111111___+=1*18
						fc111111111111111___+=1*18
						fa1111111111111111___+=1*18
						fb1111111111111111___+=1*18
						fc1111111111111111___+=1*18
						if type4aaaag1 == int(1):
							if type4aaaar1 == int(1):
								if type4aaaas1 == int(0):
									if type4aaaat1_ == int(0):
										if type4aaaau1 == int(0):
											if type4aaaav1 == int(0):
												if type4aaaaw1 == int(0):
													if type4aaaax1 == int(0):
														if type4aaaay1 == int(0):
															if type4aaaaz1 == int(0):
																if type4aaaaaa1 == int(0):
																	if type4aaaaaab1 == int(0):
																		if type4aaaaaac1 == int(0):
																			if type4aaaaaad1 == int(0):
																				if type4aaaaaae1 == int(0):
																					if type4aaaaaaf1 == int(0):
																						if type4aaaaaag1 == int(0):
																							if type4aaaaaag1_ == int(0):
																								surf_tool.add_vertex(Vector3(vx149,vy149,vz149))
																								surf_tool.add_vertex(Vector3(vx150,vy150,vz150))
																								surf_tool.add_vertex(Vector3(vx151,vy151,vz151))
																								surf_tool.add_vertex(Vector3(vx152,vy152,vz152))
																								surf_tool.add_vertex(Vector3(vx153,vy153,vz153))
																								surf_tool.add_vertex(Vector3(vx154,vy154,vz154))
																								surf_tool.add_vertex(Vector3(vx155,vy155,vz155))
																								surf_tool.add_vertex(Vector3(vx156,vy156,vz156))
																								surf_tool.add_vertex(Vector3(vx157,vy157,vz157))
																								surf_tool.add_vertex(Vector3(vx158,vy158,vz158))
																								surf_tool.add_vertex(Vector3(vx159,vy159,vz159))
																								surf_tool.add_vertex(Vector3(vx160,vy160,vz160))
																								surf_tool.add_vertex(Vector3(vx161,vy161,vz161))
																								surf_tool.add_vertex(Vector3(vx162,vy162,vz162))
																								surf_tool.add_vertex(Vector3(vx163,vy163,vz163))
																								surf_tool.add_vertex(Vector3(vx164,vy164,vz164))
																								surf_tool.add_vertex(Vector3(vx165,vy165,vz165))
																								surf_tool.add_vertex(Vector3(vx166,vy166,vz166))
																								
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
																								surf_tool.add_index(fa111111111___)
																								surf_tool.add_index(fb111111111___)
																								surf_tool.add_index(fc111111111___)
																								surf_tool.add_index(fa1111111111___)
																								surf_tool.add_index(fb1111111111___)
																								surf_tool.add_index(fc1111111111___)
																								surf_tool.add_index(fa11111111111___)
																								surf_tool.add_index(fb11111111111___)
																								surf_tool.add_index(fc11111111111___)
																								surf_tool.add_index(fa111111111111___)
																								surf_tool.add_index(fb111111111111___)
																								surf_tool.add_index(fc111111111111___)
																								surf_tool.add_index(fa1111111111111___)
																								surf_tool.add_index(fb1111111111111___)
																								surf_tool.add_index(fc1111111111111___)
																								surf_tool.add_index(fa11111111111111___)
																								surf_tool.add_index(fb11111111111111___)
																								surf_tool.add_index(fc11111111111111___)
																								surf_tool.add_index(fa111111111111111___)
																								surf_tool.add_index(fb111111111111111___)
																								surf_tool.add_index(fc111111111111111___)
																								surf_tool.add_index(fa1111111111111111___)
																								surf_tool.add_index(fb1111111111111111___)
																								surf_tool.add_index(fc1111111111111111___)
				elif vertexCount == int(19):
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
					var fa111111111___=-11
					var fb111111111___=-10
					var fc111111111___=-9
					var fa1111111111___=-12
					var fb1111111111___=-11
					var fc1111111111___=-10
					var fa11111111111___=-13
					var fb11111111111___=-12
					var fc11111111111___=-11
					var fa111111111111___=-14
					var fb111111111111___=-13
					var fc111111111111___=-12
					var fa1111111111111___=-15
					var fb1111111111111___=-14
					var fc1111111111111___=-13
					var fa11111111111111___=-16
					var fb11111111111111___=-15
					var fc11111111111111___=-14
					var fa111111111111111___=-17
					var fb111111111111111___=-16
					var fc111111111111111___=-15
					var fa1111111111111111___=-18
					var fb1111111111111111___=-17
					var fc1111111111111111___=-16
					var fa11111111111111111___=-19
					var fb11111111111111111___=-18
					var fc11111111111111111___=-17
					for j in range(1):
						var vx167 = file.get_float()
						var vy167 = file.get_float()
						var vz167 = file.get_float()
						var type4aaaaaah1_ = file.get_8()
						var value1 = file.get_8()
						var normalZ = file.get_16()
						var vx168 = file.get_float()
						var vy168 = file.get_float()
						var vz168 = file.get_float()
						var typeaaaaaai1_ = file.get_8()
						var value12a = file.get_8()
						var normalZa = file.get_16()
						var vx169 = file.get_float()
						var vy169 = file.get_float()
						var vz169 = file.get_float()
						var typeaaaaaaj1_ = file.get_8()
						var value1b = file.get_8()
						var normalZb = file.get_16()
						var vx170 = file.get_float()
						var vy170 = file.get_float()
						var vz170 = file.get_float()
						var typeaaaaaak1_ = file.get_8()
						var value1c = file.get_8()
						var normalZc = file.get_16()
						var vx171 = file.get_float()
						var vy171 = file.get_float()
						var vz171 = file.get_float()
						var typeaaaaaal1_ = file.get_8()
						var value1d = file.get_8()
						var normalZd = file.get_16()
						var vx172 = file.get_float()
						var vy172 = file.get_float()
						var vz172 = file.get_float()
						var typeaaaaaam1_ = file.get_8()
						var value1q = file.get_8()
						var normalZq = file.get_16()
						var vx173 = file.get_float()
						var vy173 = file.get_float()
						var vz173 = file.get_float()
						var typeaaaaaan1_ = file.get_8()
						var value1ad = file.get_8()
						var normalZad = file.get_16()
						var vx174 = file.get_float()
						var vy174 = file.get_float()
						var vz174 = file.get_float()
						var typeaaaaaao1_ = file.get_8()
						var value1al = file.get_8()
						var normalZal = file.get_16()
						var vx175 = file.get_float()
						var vy175 = file.get_float()
						var vz175 = file.get_float()
						var typeaaaaaap1_ = file.get_8()
						var value1au = file.get_8()
						var normalZau = file.get_16()
						var vx176 = file.get_float()
						var vy176 = file.get_float()
						var vz176 = file.get_float()
						var typeaaaaaaq1_ = file.get_8()
						var value1ae = file.get_8()
						var normalZae = file.get_16()
						var vx177 = file.get_float()
						var vy177 = file.get_float()
						var vz177 = file.get_float()
						var typeaaaaaar1_ = file.get_8()
						var value1ap = file.get_8()
						var normalZap = file.get_16()
						var vx178 = file.get_float()
						var vy178 = file.get_float()
						var vz178 = file.get_float()
						var typeaaaaaas1_ = file.get_8()
						var value1ab = file.get_8()
						var normalZab = file.get_16()
						var vx179 = file.get_float()
						var vy179 = file.get_float()
						var vz179 = file.get_float()
						var typeaaaaaat1_ = file.get_8()
						var value1ao = file.get_8()
						var normalZao = file.get_16()
						var vx180 = file.get_float()
						var vy180 = file.get_float()
						var vz180 = file.get_float()
						var typeaaaaaau1_ = file.get_8()
						var value1app = file.get_8()
						var normalZapp = file.get_16()
						var vx181 = file.get_float()
						var vy181 = file.get_float()
						var vz181 = file.get_float()
						var typeaaaaaav1_ = file.get_8()
						var value1appp = file.get_8()
						var normalZappp = file.get_16()
						var vx182 = file.get_float()
						var vy182 = file.get_float()
						var vz182 = file.get_float()
						var typeaaaaaaw1_ = file.get_8()
						var value1apppp = file.get_8()
						var normalZapppp = file.get_16()
						var vx183 = file.get_float()
						var vy183 = file.get_float()
						var vz183 = file.get_float()
						var typeaaaaaax1_ = file.get_8()
						var value1appppp = file.get_8()
						var normalZappppp = file.get_16()
						var vx184 = file.get_float()
						var vy184 = file.get_float()
						var vz184 = file.get_float()
						var typeaaaaaay1_ = file.get_8()
						var value1appppp_ = file.get_8()
						var normalZappppp_ = file.get_16()
						var vx185 = file.get_float()
						var vy185 = file.get_float()
						var vz185 = file.get_float()
						var typeaaaaaaz1_ = file.get_8()
						var value1appppzp_ = file.get_8()
						var normalZappppzp_ = file.get_16()
					
						fa1111+=1*19
						fb1111+=1*19
						fc1111+=1*19
						fa1111_+=1*19
						fb1111_+=1*19
						fc1111_+=1*19
						fa1111__+=1*19
						fb1111__+=1*19
						fc1111__+=1*19
						fa1111___+=1*19
						fb1111___+=1*19
						fc1111___+=1*19	
						fa11111___+=1*19
						fb11111___+=1*19
						fc11111___+=1*19
						fa111111___+=1*19
						fb111111___+=1*19
						fc111111___+=1*19
						fa1111111___+=1*19
						fb1111111___+=1*19
						fc1111111___+=1*19
						fa11111111___+=1*19
						fb11111111___+=1*19
						fc11111111___+=1*19
						fa111111111___+=1*19
						fb111111111___+=1*19
						fc111111111___+=1*19
						fa1111111111___+=1*19
						fb1111111111___+=1*19
						fc1111111111___+=1*19
						fa11111111111___+=1*19
						fb11111111111___+=1*19
						fc11111111111___+=1*19
						fa111111111111___+=1*19
						fb111111111111___+=1*19
						fc111111111111___+=1*19
						fa1111111111111___+=1*19
						fb1111111111111___+=1*19
						fc1111111111111___+=1*19
						fa11111111111111___+=1*19
						fb11111111111111___+=1*19
						fc11111111111111___+=1*19
						fa111111111111111___+=1*19
						fb111111111111111___+=1*19
						fc111111111111111___+=1*19
						fa1111111111111111___+=1*19
						fb1111111111111111___+=1*19
						fc1111111111111111___+=1*19
						fa11111111111111111___+=1*19
						fb11111111111111111___+=1*19
						fc11111111111111111___+=1*19
						if type4aaaaaah1_ == int(1):
							if typeaaaaaai1_ == int(1):
								if typeaaaaaaj1_ == int(0):
									if typeaaaaaak1_ == int(0):
										if typeaaaaaal1_ == int(0):
											if typeaaaaaam1_ == int(0):
												if typeaaaaaan1_ == int(0):
													if typeaaaaaao1_ == int(0):
														if typeaaaaaap1_ == int(0):
															if typeaaaaaaq1_ == int(0):
																if typeaaaaaar1_ == int(0):
																	if typeaaaaaas1_ == int(0):
																		if typeaaaaaat1_ == int(0):
																			if typeaaaaaau1_ == int(0):
																				if typeaaaaaav1_ == int(0):
																					if typeaaaaaaw1_ == int(0):
																						if typeaaaaaax1_ == int(0):
																							if typeaaaaaay1_ == int(0):
																								if typeaaaaaaz1_ == int(0):
																									surf_tool.add_vertex(Vector3(vx167,vy167,vz167))
																									surf_tool.add_vertex(Vector3(vx168,vy168,vz168))
																									surf_tool.add_vertex(Vector3(vx169,vy169,vz169))
																									surf_tool.add_vertex(Vector3(vx170,vy170,vz170))
																									surf_tool.add_vertex(Vector3(vx171,vy171,vz171))
																									surf_tool.add_vertex(Vector3(vx172,vy172,vz172))
																									surf_tool.add_vertex(Vector3(vx173,vy173,vz173))
																									surf_tool.add_vertex(Vector3(vx174,vy174,vz174))
																									surf_tool.add_vertex(Vector3(vx175,vy175,vz175))
																									surf_tool.add_vertex(Vector3(vx176,vy176,vz176))
																									surf_tool.add_vertex(Vector3(vx177,vy177,vz177))
																									surf_tool.add_vertex(Vector3(vx178,vy178,vz178))
																									surf_tool.add_vertex(Vector3(vx179,vy179,vz179))
																									surf_tool.add_vertex(Vector3(vx180,vy180,vz180))
																									surf_tool.add_vertex(Vector3(vx181,vy181,vz181))
																									surf_tool.add_vertex(Vector3(vx182,vy182,vz182))
																									surf_tool.add_vertex(Vector3(vx183,vy183,vz183))
																									surf_tool.add_vertex(Vector3(vx184,vy184,vz184))
																									surf_tool.add_vertex(Vector3(vx185,vy185,vz185))
																									
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
																									surf_tool.add_index(fa111111111___)
																									surf_tool.add_index(fb111111111___)
																									surf_tool.add_index(fc111111111___)
																									surf_tool.add_index(fa1111111111___)
																									surf_tool.add_index(fb1111111111___)
																									surf_tool.add_index(fc1111111111___)
																									surf_tool.add_index(fa11111111111___)
																									surf_tool.add_index(fb11111111111___)
																									surf_tool.add_index(fc11111111111___)
																									surf_tool.add_index(fa111111111111___)
																									surf_tool.add_index(fb111111111111___)
																									surf_tool.add_index(fc111111111111___)
																									surf_tool.add_index(fa1111111111111___)
																									surf_tool.add_index(fb1111111111111___)
																									surf_tool.add_index(fc1111111111111___)
																									surf_tool.add_index(fa11111111111111___)
																									surf_tool.add_index(fb11111111111111___)
																									surf_tool.add_index(fc11111111111111___)
																									surf_tool.add_index(fa111111111111111___)
																									surf_tool.add_index(fb111111111111111___)
																									surf_tool.add_index(fc111111111111111___)
																									surf_tool.add_index(fa1111111111111111___)
																									surf_tool.add_index(fb1111111111111111___)
																									surf_tool.add_index(fc1111111111111111___)
																									surf_tool.add_index(fa11111111111111111___)
																									surf_tool.add_index(fb11111111111111111___)
																									surf_tool.add_index(fc11111111111111111___)
				elif vertexCount == int(20):
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
					var fa111111111___=-11
					var fb111111111___=-10
					var fc111111111___=-9
					var fa1111111111___=-12
					var fb1111111111___=-11
					var fc1111111111___=-10
					var fa11111111111___=-13
					var fb11111111111___=-12
					var fc11111111111___=-11
					var fa111111111111___=-14
					var fb111111111111___=-13
					var fc111111111111___=-12
					var fa1111111111111___=-15
					var fb1111111111111___=-14
					var fc1111111111111___=-13
					var fa11111111111111___=-16
					var fb11111111111111___=-15
					var fc11111111111111___=-14
					var fa111111111111111___=-17
					var fb111111111111111___=-16
					var fc111111111111111___=-15
					var fa1111111111111111___=-18
					var fb1111111111111111___=-17
					var fc1111111111111111___=-16
					var fa11111111111111111___=-19
					var fb11111111111111111___=-18
					var fc11111111111111111___=-17
					var fa111111111111111111___=-20
					var fb111111111111111111___=-19
					var fc111111111111111111___=-18
					for j in range(1):
						var vx186 = file.get_float()
						var vy186 = file.get_float()
						var vz186 = file.get_float()
						var type4aaaaaah1_1 = file.get_8()
						var value1 = file.get_8()
						var normalZ = file.get_16()
						var vx187 = file.get_float()
						var vy187 = file.get_float()
						var vz187 = file.get_float()
						var typeaaaaaai1_1 = file.get_8()
						var value12a = file.get_8()
						var normalZa = file.get_16()
						var vx188 = file.get_float()
						var vy188 = file.get_float()
						var vz188 = file.get_float()
						var typeaaaaaaj1_1 = file.get_8()
						var value1b = file.get_8()
						var normalZb = file.get_16()
						var vx189 = file.get_float()
						var vy189 = file.get_float()
						var vz189 = file.get_float()
						var typeaaaaaak1_1 = file.get_8()
						var value1c = file.get_8()
						var normalZc = file.get_16()
						var vx190 = file.get_float()
						var vy190 = file.get_float()
						var vz190 = file.get_float()
						var typeaaaaaal1_1 = file.get_8()
						var value1d = file.get_8()
						var normalZd = file.get_16()
						var vx191 = file.get_float()
						var vy191 = file.get_float()
						var vz191 = file.get_float()
						var typeaaaaaam1_1 = file.get_8()
						var value1q = file.get_8()
						var normalZq = file.get_16()
						var vx192 = file.get_float()
						var vy192 = file.get_float()
						var vz192 = file.get_float()
						var typeaaaaaan1_1 = file.get_8()
						var value1ad = file.get_8()
						var normalZad = file.get_16()
						var vx193 = file.get_float()
						var vy193 = file.get_float()
						var vz193 = file.get_float()
						var typeaaaaaao1_1 = file.get_8()
						var value1al = file.get_8()
						var normalZal = file.get_16()
						var vx194 = file.get_float()
						var vy194 = file.get_float()
						var vz194 = file.get_float()
						var typeaaaaaap1_1 = file.get_8()
						var value1au = file.get_8()
						var normalZau = file.get_16()
						var vx195 = file.get_float()
						var vy195 = file.get_float()
						var vz195 = file.get_float()
						var typeaaaaaaq1_1 = file.get_8()
						var value1ae = file.get_8()
						var normalZae = file.get_16()
						var vx196 = file.get_float()
						var vy196 = file.get_float()
						var vz196 = file.get_float()
						var typeaaaaaar1_1 = file.get_8()
						var value1ap = file.get_8()
						var normalZap = file.get_16()
						var vx197 = file.get_float()
						var vy197 = file.get_float()
						var vz197 = file.get_float()
						var typeaaaaaas1_1 = file.get_8()
						var value1ab = file.get_8()
						var normalZab = file.get_16()
						var vx198 = file.get_float()
						var vy198 = file.get_float()
						var vz198 = file.get_float()
						var typeaaaaaat1_1 = file.get_8()
						var value1ao = file.get_8()
						var normalZao = file.get_16()
						var vx199 = file.get_float()
						var vy199 = file.get_float()
						var vz199 = file.get_float()
						var typeaaaaaau1_1 = file.get_8()
						var value1app = file.get_8()
						var normalZapp = file.get_16()
						var vx200 = file.get_float()
						var vy200 = file.get_float()
						var vz200 = file.get_float()
						var typeaaaaaav1_1 = file.get_8()
						var value1appp = file.get_8()
						var normalZappp = file.get_16()
						var vx201 = file.get_float()
						var vy201 = file.get_float()
						var vz201 = file.get_float()
						var typeaaaaaaw1_1 = file.get_8()
						var value1apppp = file.get_8()
						var normalZapppp = file.get_16()
						var vx202 = file.get_float()
						var vy202 = file.get_float()
						var vz202 = file.get_float()
						var typeaaaaaax1_1 = file.get_8()
						var value1appppp = file.get_8()
						var normalZappppp = file.get_16()
						var vx203 = file.get_float()
						var vy203 = file.get_float()
						var vz203 = file.get_float()
						var typeaaaaaay1_1 = file.get_8()
						var value1appppp_ = file.get_8()
						var normalZappppp_ = file.get_16()
						var vx204 = file.get_float()
						var vy204 = file.get_float()
						var vz204 = file.get_float()
						var typeaaaaaaz1_1 = file.get_8()
						var value1appppzp_ = file.get_8()
						var normalZappppzp_ = file.get_16()
						var vx205 = file.get_float()
						var vy205 = file.get_float()
						var vz205 = file.get_float()
						var typeaaaaaaz1_2 = file.get_8()
						var value1appppzp_2 = file.get_8()
						var normalZappppzp_2 = file.get_16()
						fa1111+=1*20
						fb1111+=1*20
						fc1111+=1*20
						fa1111_+=1*20
						fb1111_+=1*20
						fc1111_+=1*20
						fa1111__+=1*20
						fb1111__+=1*20
						fc1111__+=1*20
						fa1111___+=1*20
						fb1111___+=1*20
						fc1111___+=1*20
						fa11111___+=1*20
						fb11111___+=1*20
						fc11111___+=1*20
						fa111111___+=1*20
						fb111111___+=1*20
						fc111111___+=1*20
						fa1111111___+=1*20
						fb1111111___+=1*20
						fc1111111___+=1*20
						fa11111111___+=1*20
						fb11111111___+=1*20
						fc11111111___+=1*20
						fa111111111___+=1*20
						fb111111111___+=1*20
						fc111111111___+=1*20
						fa1111111111___+=1*20
						fb1111111111___+=1*20
						fc1111111111___+=1*20
						fa11111111111___+=1*20
						fb11111111111___+=1*20
						fc11111111111___+=1*20
						fa111111111111___+=1*20
						fb111111111111___+=1*20
						fc111111111111___+=1*20
						fa1111111111111___+=1*20
						fb1111111111111___+=1*20
						fc1111111111111___+=1*20
						fa11111111111111___+=1*20
						fb11111111111111___+=1*20
						fc11111111111111___+=1*20
						fa111111111111111___+=1*20
						fb111111111111111___+=1*20
						fc111111111111111___+=1*20
						fa1111111111111111___+=1*20
						fb1111111111111111___+=1*20
						fc1111111111111111___+=1*20
						fa11111111111111111___+=1*20
						fb11111111111111111___+=1*20
						fc11111111111111111___+=1*20
						fa111111111111111111___+=1*20
						fb111111111111111111___+=1*20
						fc111111111111111111___+=1*20
						if type4aaaaaah1_1 == int(1):
							if typeaaaaaai1_1 == int(1):
								if typeaaaaaaj1_1 == int(0):
									if typeaaaaaak1_1 == int(0):
										if typeaaaaaal1_1 == int(0):
											if typeaaaaaam1_1 == int(0):
												if typeaaaaaan1_1 == int(0):
													if typeaaaaaao1_1 == int(0):
														if typeaaaaaap1_1 == int(0):
															if typeaaaaaaq1_1 == int(0):
																if typeaaaaaar1_1 == int(0):
																	if typeaaaaaas1_1 == int(0):
																		if typeaaaaaat1_1 == int(0):
																			if typeaaaaaau1_1 == int(0):
																				if typeaaaaaav1_1 == int(0):
																					if typeaaaaaaw1_1 == int(0):
																						if typeaaaaaax1_1 == int(0):
																							if typeaaaaaay1_1 == int(0):
																								if typeaaaaaaz1_1 == int(0):
																									if typeaaaaaaz1_2 == int(0):
																										surf_tool.add_vertex(Vector3(vx186,vy186,vz186))
																										surf_tool.add_vertex(Vector3(vx187,vy187,vz187))
																										surf_tool.add_vertex(Vector3(vx188,vy188,vz188))
																										surf_tool.add_vertex(Vector3(vx189,vy189,vz189))
																										surf_tool.add_vertex(Vector3(vx190,vy190,vz190))
																										surf_tool.add_vertex(Vector3(vx191,vy191,vz191))
																										surf_tool.add_vertex(Vector3(vx192,vy192,vz192))
																										surf_tool.add_vertex(Vector3(vx193,vy193,vz193))
																										surf_tool.add_vertex(Vector3(vx194,vy194,vz194))
																										surf_tool.add_vertex(Vector3(vx195,vy195,vz195))
																										surf_tool.add_vertex(Vector3(vx196,vy196,vz196))
																										surf_tool.add_vertex(Vector3(vx197,vy197,vz197))
																										surf_tool.add_vertex(Vector3(vx198,vy198,vz198))
																										surf_tool.add_vertex(Vector3(vx199,vy199,vz199))
																										surf_tool.add_vertex(Vector3(vx200,vy200,vz200))
																										surf_tool.add_vertex(Vector3(vx201,vy201,vz201))
																										surf_tool.add_vertex(Vector3(vx202,vy202,vz202))
																										surf_tool.add_vertex(Vector3(vx203,vy203,vz203))
																										surf_tool.add_vertex(Vector3(vx204,vy204,vz204))
																										surf_tool.add_vertex(Vector3(vx205,vy205,vz205))
																										
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
																										surf_tool.add_index(fa111111111___)
																										surf_tool.add_index(fb111111111___)
																										surf_tool.add_index(fc111111111___)
																										surf_tool.add_index(fa1111111111___)
																										surf_tool.add_index(fb1111111111___)
																										surf_tool.add_index(fc1111111111___)
																										surf_tool.add_index(fa11111111111___)
																										surf_tool.add_index(fb11111111111___)
																										surf_tool.add_index(fc11111111111___)
																										surf_tool.add_index(fa111111111111___)
																										surf_tool.add_index(fb111111111111___)
																										surf_tool.add_index(fc111111111111___)
																										surf_tool.add_index(fa1111111111111___)
																										surf_tool.add_index(fb1111111111111___)
																										surf_tool.add_index(fc1111111111111___)
																										surf_tool.add_index(fa11111111111111___)
																										surf_tool.add_index(fb11111111111111___)
																										surf_tool.add_index(fc11111111111111___)
																										surf_tool.add_index(fa111111111111111___)
																										surf_tool.add_index(fb111111111111111___)
																										surf_tool.add_index(fc111111111111111___)
																										surf_tool.add_index(fa1111111111111111___)
																										surf_tool.add_index(fb1111111111111111___)
																										surf_tool.add_index(fc1111111111111111___)
																										surf_tool.add_index(fa11111111111111111___)
																										surf_tool.add_index(fb11111111111111111___)
																										surf_tool.add_index(fc11111111111111111___)
																										surf_tool.add_index(fa111111111111111111___)
																										surf_tool.add_index(fb111111111111111111___)
																										surf_tool.add_index(fc111111111111111111___)
				
				elif vertexCount == int(21):
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
					var fa111111111___=-11
					var fb111111111___=-10
					var fc111111111___=-9
					var fa1111111111___=-12
					var fb1111111111___=-11
					var fc1111111111___=-10
					var fa11111111111___=-13
					var fb11111111111___=-12
					var fc11111111111___=-11
					var fa111111111111___=-14
					var fb111111111111___=-13
					var fc111111111111___=-12
					var fa1111111111111___=-15
					var fb1111111111111___=-14
					var fc1111111111111___=-13
					var fa11111111111111___=-16
					var fb11111111111111___=-15
					var fc11111111111111___=-14
					var fa111111111111111___=-17
					var fb111111111111111___=-16
					var fc111111111111111___=-15
					var fa1111111111111111___=-18
					var fb1111111111111111___=-17
					var fc1111111111111111___=-16
					var fa11111111111111111___=-19
					var fb11111111111111111___=-18
					var fc11111111111111111___=-17
					var fa111111111111111111___=-20
					var fb111111111111111111___=-19
					var fc111111111111111111___=-18
					var fa111111111111111111___1=-21
					var fb111111111111111111___1=-20
					var fc111111111111111111___1=-19
					
					for j in range(1):
						var vx206 = file.get_float()
						var vy206 = file.get_float()
						var vz206 = file.get_float()
						var type4aaaaaah1_12 = file.get_8()
						var value1 = file.get_8()
						var normalZ = file.get_16()
						var vx207 = file.get_float()
						var vy207 = file.get_float()
						var vz207 = file.get_float()
						var typeaaaaaai1_12 = file.get_8()
						var value12a = file.get_8()
						var normalZa = file.get_16()
						var vx208 = file.get_float()
						var vy208 = file.get_float()
						var vz208 = file.get_float()
						var typeaaaaaaj1_12 = file.get_8()
						var value1b = file.get_8()
						var normalZb = file.get_16()
						var vx209 = file.get_float()
						var vy209 = file.get_float()
						var vz209 = file.get_float()
						var typeaaaaaak1_12 = file.get_8()
						var value1c = file.get_8()
						var normalZc = file.get_16()
						var vx210 = file.get_float()
						var vy210 = file.get_float()
						var vz210 = file.get_float()
						var typeaaaaaal1_12 = file.get_8()
						var value1d = file.get_8()
						var normalZd = file.get_16()
						var vx211 = file.get_float()
						var vy211 = file.get_float()
						var vz211 = file.get_float()
						var typeaaaaaam1_12 = file.get_8()
						var value1q = file.get_8()
						var normalZq = file.get_16()
						var vx212 = file.get_float()
						var vy212 = file.get_float()
						var vz212 = file.get_float()
						var typeaaaaaan1_12 = file.get_8()
						var value1ad = file.get_8()
						var normalZad = file.get_16()
						var vx213 = file.get_float()
						var vy213 = file.get_float()
						var vz213 = file.get_float()
						var typeaaaaaao1_12 = file.get_8()
						var value1al = file.get_8()
						var normalZal = file.get_16()
						var vx214 = file.get_float()
						var vy214 = file.get_float()
						var vz214 = file.get_float()
						var typeaaaaaap1_12 = file.get_8()
						var value1au = file.get_8()
						var normalZau = file.get_16()
						var vx215 = file.get_float()
						var vy215 = file.get_float()
						var vz215 = file.get_float()
						var typeaaaaaaq1_12 = file.get_8()
						var value1ae = file.get_8()
						var normalZae = file.get_16()
						var vx216 = file.get_float()
						var vy216 = file.get_float()
						var vz216 = file.get_float()
						var typeaaaaaar1_12 = file.get_8()
						var value1ap = file.get_8()
						var normalZap = file.get_16()
						var vx217 = file.get_float()
						var vy217 = file.get_float()
						var vz217 = file.get_float()
						var typeaaaaaas1_12 = file.get_8()
						var value1ab = file.get_8()
						var normalZab = file.get_16()
						var vx218 = file.get_float()
						var vy218 = file.get_float()
						var vz218 = file.get_float()
						var typeaaaaaat1_12 = file.get_8()
						var value1ao = file.get_8()
						var normalZao = file.get_16()
						var vx219 = file.get_float()
						var vy219 = file.get_float()
						var vz219 = file.get_float()
						var typeaaaaaau1_12 = file.get_8()
						var value1app = file.get_8()
						var normalZapp = file.get_16()
						var vx220 = file.get_float()
						var vy220 = file.get_float()
						var vz220 = file.get_float()
						var typeaaaaaav1_12 = file.get_8()
						var value1appp = file.get_8()
						var normalZappp = file.get_16()
						var vx221 = file.get_float()
						var vy221 = file.get_float()
						var vz221 = file.get_float()
						var typeaaaaaaw1_12 = file.get_8()
						var value1apppp = file.get_8()
						var normalZapppp = file.get_16()
						var vx222 = file.get_float()
						var vy222 = file.get_float()
						var vz222 = file.get_float()
						var typeaaaaaax1_12 = file.get_8()
						var value1appppp = file.get_8()
						var normalZappppp = file.get_16()
						var vx223 = file.get_float()
						var vy223 = file.get_float()
						var vz223 = file.get_float()
						var typeaaaaaay1_12 = file.get_8()
						var value1appppp_ = file.get_8()
						var normalZappppp_ = file.get_16()
						var vx224 = file.get_float()
						var vy224 = file.get_float()
						var vz224 = file.get_float()
						var typeaaaaaaz1_12 = file.get_8()
						var value1appppzp_ = file.get_8()
						var normalZappppzp_ = file.get_16()
						var vx225 = file.get_float()
						var vy225 = file.get_float()
						var vz225 = file.get_float()
						var typeaaaaaaz1_22 = file.get_8()
						var value1appppzp_2 = file.get_8()
						var normalZappppzp_2 = file.get_16()
						var vx226 = file.get_float()
						var vy226 = file.get_float()
						var vz226 = file.get_float()
						var typeaaaaaaz1_22_ = file.get_8()
						var value1appppzp_2_ = file.get_8()
						var normalZappppzp_2_ = file.get_16()
						fa1111+=1*21
						fb1111+=1*21
						fc1111+=1*21
						fa1111_+=1*21
						fb1111_+=1*21
						fc1111_+=1*21
						fa1111__+=1*21
						fb1111__+=1*21
						fc1111__+=1*21
						fa1111___+=1*21
						fb1111___+=1*21
						fc1111___+=1*21
						fa11111___+=1*21
						fb11111___+=1*21
						fc11111___+=1*21
						fa111111___+=1*21
						fb111111___+=1*21
						fc111111___+=1*21
						fa1111111___+=1*21
						fb1111111___+=1*21
						fc1111111___+=1*21
						fa11111111___+=1*21
						fb11111111___+=1*21
						fc11111111___+=1*21
						fa111111111___+=1*21
						fb111111111___+=1*21
						fc111111111___+=1*21
						fa1111111111___+=1*21
						fb1111111111___+=1*21
						fc1111111111___+=1*21
						fa11111111111___+=1*21
						fb11111111111___+=1*21
						fc11111111111___+=1*21
						fa111111111111___+=1*21
						fb111111111111___+=1*21
						fc111111111111___+=1*21
						fa1111111111111___+=1*21
						fb1111111111111___+=1*21
						fc1111111111111___+=1*21
						fa11111111111111___+=1*21
						fb11111111111111___+=1*21
						fc11111111111111___+=1*21
						fa111111111111111___+=1*21
						fb111111111111111___+=1*21
						fc111111111111111___+=1*21
						fa1111111111111111___+=1*21
						fb1111111111111111___+=1*21
						fc1111111111111111___+=1*21
						fa11111111111111111___+=1*21
						fb11111111111111111___+=1*21
						fc11111111111111111___+=1*21
						fa111111111111111111___+=1*21
						fb111111111111111111___+=1*21
						fc111111111111111111___+=1*21
						fa111111111111111111___1+=1*21
						fb111111111111111111___1+=1*21
						fc111111111111111111___1+=1*21
						if type4aaaaaah1_12 == int(1):
							if typeaaaaaai1_12 == int(1):
								if typeaaaaaaj1_12 == int(0):
									if typeaaaaaak1_12 == int(0):
										if typeaaaaaal1_12 == int(0):
											if typeaaaaaam1_12 == int(0):
												if typeaaaaaan1_12 == int(0):
													if typeaaaaaao1_12 == int(0):
														if typeaaaaaap1_12 == int(0):
															if typeaaaaaaq1_12 == int(0):
																if typeaaaaaar1_12 == int(0):
																	if typeaaaaaas1_12 == int(0):
																		if typeaaaaaat1_12 == int(0):
																			if typeaaaaaau1_12 == int(0):
																				if typeaaaaaav1_12 == int(0):
																					if typeaaaaaaw1_12 == int(0):
																						if typeaaaaaax1_12 == int(0):
																							if typeaaaaaay1_12 == int(0):
																								if typeaaaaaaz1_12 == int(0):
																									if typeaaaaaaz1_22 == int(0):
																										if typeaaaaaaz1_22_ == int(0):
																											surf_tool.add_vertex(Vector3(vx206,vy206,vz206))
																											surf_tool.add_vertex(Vector3(vx207,vy207,vz207))
																											surf_tool.add_vertex(Vector3(vx208,vy208,vz208))
																											surf_tool.add_vertex(Vector3(vx209,vy209,vz209))
																											surf_tool.add_vertex(Vector3(vx210,vy210,vz210))
																											surf_tool.add_vertex(Vector3(vx211,vy211,vz211))
																											surf_tool.add_vertex(Vector3(vx212,vy212,vz212))
																											surf_tool.add_vertex(Vector3(vx213,vy213,vz213))
																											surf_tool.add_vertex(Vector3(vx214,vy214,vz214))
																											surf_tool.add_vertex(Vector3(vx215,vy215,vz215))
																											surf_tool.add_vertex(Vector3(vx216,vy216,vz216))
																											surf_tool.add_vertex(Vector3(vx217,vy217,vz217))
																											surf_tool.add_vertex(Vector3(vx218,vy218,vz218))
																											surf_tool.add_vertex(Vector3(vx219,vy219,vz219))
																											surf_tool.add_vertex(Vector3(vx220,vy220,vz220))
																											surf_tool.add_vertex(Vector3(vx221,vy221,vz221))
																											surf_tool.add_vertex(Vector3(vx222,vy222,vz222))
																											surf_tool.add_vertex(Vector3(vx223,vy223,vz223))
																											surf_tool.add_vertex(Vector3(vx224,vy224,vz224))
																											surf_tool.add_vertex(Vector3(vx225,vy225,vz225))
																											surf_tool.add_vertex(Vector3(vx226,vy226,vz226))
																											
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
																											surf_tool.add_index(fa111111111___)
																											surf_tool.add_index(fb111111111___)
																											surf_tool.add_index(fc111111111___)
																											surf_tool.add_index(fa1111111111___)
																											surf_tool.add_index(fb1111111111___)
																											surf_tool.add_index(fc1111111111___)
																											surf_tool.add_index(fa11111111111___)
																											surf_tool.add_index(fb11111111111___)
																											surf_tool.add_index(fc11111111111___)
																											surf_tool.add_index(fa111111111111___)
																											surf_tool.add_index(fb111111111111___)
																											surf_tool.add_index(fc111111111111___)
																											surf_tool.add_index(fa1111111111111___)
																											surf_tool.add_index(fb1111111111111___)
																											surf_tool.add_index(fc1111111111111___)
																											surf_tool.add_index(fa11111111111111___)
																											surf_tool.add_index(fb11111111111111___)
																											surf_tool.add_index(fc11111111111111___)
																											surf_tool.add_index(fa111111111111111___)
																											surf_tool.add_index(fb111111111111111___)
																											surf_tool.add_index(fc111111111111111___)
																											surf_tool.add_index(fa1111111111111111___)
																											surf_tool.add_index(fb1111111111111111___)
																											surf_tool.add_index(fc1111111111111111___)
																											surf_tool.add_index(fa11111111111111111___)
																											surf_tool.add_index(fb11111111111111111___)
																											surf_tool.add_index(fc11111111111111111___)
																											surf_tool.add_index(fa111111111111111111___)
																											surf_tool.add_index(fb111111111111111111___)
																											surf_tool.add_index(fc111111111111111111___)
																											surf_tool.add_index(fa111111111111111111___1)
																											surf_tool.add_index(fb111111111111111111___1)
																											surf_tool.add_index(fc111111111111111111___1)
				elif vertexCount == int(22):
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
					var fa111111111___=-11
					var fb111111111___=-10
					var fc111111111___=-9
					var fa1111111111___=-12
					var fb1111111111___=-11
					var fc1111111111___=-10
					var fa11111111111___=-13
					var fb11111111111___=-12
					var fc11111111111___=-11
					var fa111111111111___=-14
					var fb111111111111___=-13
					var fc111111111111___=-12
					var fa1111111111111___=-15
					var fb1111111111111___=-14
					var fc1111111111111___=-13
					var fa11111111111111___=-16
					var fb11111111111111___=-15
					var fc11111111111111___=-14
					var fa111111111111111___=-17
					var fb111111111111111___=-16
					var fc111111111111111___=-15
					var fa1111111111111111___=-18
					var fb1111111111111111___=-17
					var fc1111111111111111___=-16
					var fa11111111111111111___=-19
					var fb11111111111111111___=-18
					var fc11111111111111111___=-17
					var fa111111111111111111___=-20
					var fb111111111111111111___=-19
					var fc111111111111111111___=-18
					var fa111111111111111111___1=-21
					var fb111111111111111111___1=-20
					var fc111111111111111111___1=-19
					var fa111111111111111111___11=-22
					var fb111111111111111111___11=-21
					var fc111111111111111111___11=-20
					for j in range(1):
						var vx227 = file.get_float()
						var vy227 = file.get_float()
						var vz227 = file.get_float()
						var type4aaaaaah1_123 = file.get_8()
						var value1 = file.get_8()
						var normalZ = file.get_16()
						var vx228 = file.get_float()
						var vy228 = file.get_float()
						var vz228 = file.get_float()
						var typeaaaaaai1_123 = file.get_8()
						var value12a = file.get_8()
						var normalZa = file.get_16()
						var vx229 = file.get_float()
						var vy229 = file.get_float()
						var vz229 = file.get_float()
						var typeaaaaaaj1_123 = file.get_8()
						var value1b = file.get_8()
						var normalZb = file.get_16()
						var vx230 = file.get_float()
						var vy230 = file.get_float()
						var vz230 = file.get_float()
						var typeaaaaaak1_123 = file.get_8()
						var value1c = file.get_8()
						var normalZc = file.get_16()
						var vx231 = file.get_float()
						var vy231 = file.get_float()
						var vz231 = file.get_float()
						var typeaaaaaal1_123 = file.get_8()
						var value1d = file.get_8()
						var normalZd = file.get_16()
						var vx232 = file.get_float()
						var vy232 = file.get_float()
						var vz232 = file.get_float()
						var typeaaaaaam1_123 = file.get_8()
						var value1q = file.get_8()
						var normalZq = file.get_16()
						var vx233 = file.get_float()
						var vy233 = file.get_float()
						var vz233 = file.get_float()
						var typeaaaaaan1_123 = file.get_8()
						var value1ad = file.get_8()
						var normalZad = file.get_16()
						var vx234 = file.get_float()
						var vy234 = file.get_float()
						var vz234 = file.get_float()
						var typeaaaaaao1_123 = file.get_8()
						var value1al = file.get_8()
						var normalZal = file.get_16()
						var vx235 = file.get_float()
						var vy235 = file.get_float()
						var vz235 = file.get_float()
						var typeaaaaaap1_123 = file.get_8()
						var value1au = file.get_8()
						var normalZau = file.get_16()
						var vx236 = file.get_float()
						var vy236 = file.get_float()
						var vz236 = file.get_float()
						var typeaaaaaaq1_123 = file.get_8()
						var value1ae = file.get_8()
						var normalZae = file.get_16()
						var vx237 = file.get_float()
						var vy237 = file.get_float()
						var vz237 = file.get_float()
						var typeaaaaaar1_123 = file.get_8()
						var value1ap = file.get_8()
						var normalZap = file.get_16()
						var vx238 = file.get_float()
						var vy238 = file.get_float()
						var vz238 = file.get_float()
						var typeaaaaaas1_123 = file.get_8()
						var value1ab = file.get_8()
						var normalZab = file.get_16()
						var vx239 = file.get_float()
						var vy239 = file.get_float()
						var vz239 = file.get_float()
						var typeaaaaaat1_123 = file.get_8()
						var value1ao = file.get_8()
						var normalZao = file.get_16()
						var vx240 = file.get_float()
						var vy240 = file.get_float()
						var vz240 = file.get_float()
						var typeaaaaaau1_123 = file.get_8()
						var value1app = file.get_8()
						var normalZapp = file.get_16()
						var vx241 = file.get_float()
						var vy241 = file.get_float()
						var vz241 = file.get_float()
						var typeaaaaaav1_123 = file.get_8()
						var value1appp = file.get_8()
						var normalZappp = file.get_16()
						var vx242 = file.get_float()
						var vy242 = file.get_float()
						var vz242 = file.get_float()
						var typeaaaaaaw1_123 = file.get_8()
						var value1apppp = file.get_8()
						var normalZapppp = file.get_16()
						var vx243 = file.get_float()
						var vy243 = file.get_float()
						var vz243 = file.get_float()
						var typeaaaaaax1_123 = file.get_8()
						var value1appppp = file.get_8()
						var normalZappppp = file.get_16()
						var vx244 = file.get_float()
						var vy244 = file.get_float()
						var vz244 = file.get_float()
						var typeaaaaaay1_123 = file.get_8()
						var value1appppp_ = file.get_8()
						var normalZappppp_ = file.get_16()
						var vx245 = file.get_float()
						var vy245 = file.get_float()
						var vz245 = file.get_float()
						var typeaaaaaaz1_123 = file.get_8()
						var value1appppzp_ = file.get_8()
						var normalZappppzp_ = file.get_16()
						var vx246 = file.get_float()
						var vy246 = file.get_float()
						var vz246 = file.get_float()
						var typeaaaaaaz1_223 = file.get_8()
						var value1appppzp_2 = file.get_8()
						var normalZappppzp_2 = file.get_16()
						var vx247 = file.get_float()
						var vy247 = file.get_float()
						var vz247 = file.get_float()
						var typeaaaaaaz1_223_ = file.get_8()
						var value1appppzp_2_ = file.get_8()
						var normalZappppzp_2_ = file.get_16()
						var vx248 = file.get_float()
						var vy248 = file.get_float()
						var vz248 = file.get_float()
						var typeaaaaaaz1_223_1 = file.get_8()
						var value1appppzp_2_1 = file.get_8()
						var normalZappppzp_2_1 = file.get_16()
						fa1111+=1*22
						fb1111+=1*22
						fc1111+=1*22
						fa1111_+=1*22
						fb1111_+=1*22
						fc1111_+=1*22
						fa1111__+=1*22
						fb1111__+=1*22
						fc1111__+=1*22
						fa1111___+=1*22
						fb1111___+=1*22
						fc1111___+=1*22
						fa11111___+=1*22
						fb11111___+=1*22
						fc11111___+=1*22
						fa111111___+=1*22
						fb111111___+=1*22
						fc111111___+=1*22
						fa1111111___+=1*22
						fb1111111___+=1*22
						fc1111111___+=1*22
						fa11111111___+=1*22
						fb11111111___+=1*22
						fc11111111___+=1*22
						fa111111111___+=1*22
						fb111111111___+=1*22
						fc111111111___+=1*22
						fa1111111111___+=1*22
						fb1111111111___+=1*22
						fc1111111111___+=1*22
						fa11111111111___+=1*22
						fb11111111111___+=1*22
						fc11111111111___+=1*22
						fa111111111111___+=1*22
						fb111111111111___+=1*22
						fc111111111111___+=1*22
						fa1111111111111___+=1*22
						fb1111111111111___+=1*22
						fc1111111111111___+=1*22
						fa11111111111111___+=1*22
						fb11111111111111___+=1*22
						fc11111111111111___+=1*22
						fa111111111111111___+=1*22
						fb111111111111111___+=1*22
						fc111111111111111___+=1*22
						fa1111111111111111___+=1*22
						fb1111111111111111___+=1*22
						fc1111111111111111___+=1*22
						fa11111111111111111___+=1*22
						fb11111111111111111___+=1*22
						fc11111111111111111___+=1*22
						fa111111111111111111___+=1*22
						fb111111111111111111___+=1*22
						fc111111111111111111___+=1*22
						fa111111111111111111___1+=1*22
						fb111111111111111111___1+=1*22
						fc111111111111111111___1+=1*22
						fa111111111111111111___11+=1*22
						fb111111111111111111___11+=1*22
						fc111111111111111111___11+=1*22
						if type4aaaaaah1_123 == int(1):
							if typeaaaaaai1_123 == int(1):
								if typeaaaaaaj1_123 == int(0):
									if typeaaaaaak1_123 == int(0):
										if typeaaaaaal1_123 == int(0):
											if typeaaaaaam1_123 == int(0):
												if typeaaaaaan1_123 == int(0):
													if typeaaaaaao1_123 == int(0):
														if typeaaaaaap1_123 == int(0):
															if typeaaaaaaq1_123 == int(0):
																if typeaaaaaar1_123 == int(0):
																	if typeaaaaaas1_123 == int(0):
																		if typeaaaaaat1_123 == int(0):
																			if typeaaaaaau1_123 == int(0):
																				if typeaaaaaav1_123 == int(0):
																					if typeaaaaaaw1_123 == int(0):
																						if typeaaaaaax1_123 == int(0):
																							if typeaaaaaay1_123 == int(0):
																								if typeaaaaaaz1_123 == int(0):
																									if typeaaaaaaz1_223 == int(0):
																										if typeaaaaaaz1_223_ == int(0):
																											if typeaaaaaaz1_223_1 == int(0):
																												surf_tool.add_vertex(Vector3(vx227,vy227,vz227))
																												surf_tool.add_vertex(Vector3(vx228,vy228,vz228))
																												surf_tool.add_vertex(Vector3(vx229,vy229,vz229))
																												surf_tool.add_vertex(Vector3(vx230,vy230,vz230))
																												surf_tool.add_vertex(Vector3(vx231,vy231,vz231))
																												surf_tool.add_vertex(Vector3(vx232,vy232,vz232))
																												surf_tool.add_vertex(Vector3(vx233,vy233,vz233))
																												surf_tool.add_vertex(Vector3(vx234,vy234,vz234))
																												surf_tool.add_vertex(Vector3(vx235,vy235,vz235))
																												surf_tool.add_vertex(Vector3(vx236,vy236,vz236))
																												surf_tool.add_vertex(Vector3(vx237,vy237,vz237))
																												surf_tool.add_vertex(Vector3(vx238,vy238,vz238))
																												surf_tool.add_vertex(Vector3(vx239,vy239,vz239))
																												surf_tool.add_vertex(Vector3(vx240,vy240,vz240))
																												surf_tool.add_vertex(Vector3(vx241,vy241,vz241))
																												surf_tool.add_vertex(Vector3(vx242,vy242,vz242))
																												surf_tool.add_vertex(Vector3(vx243,vy243,vz243))
																												surf_tool.add_vertex(Vector3(vx244,vy244,vz244))
																												surf_tool.add_vertex(Vector3(vx245,vy245,vz245))
																												surf_tool.add_vertex(Vector3(vx246,vy246,vz246))
																												surf_tool.add_vertex(Vector3(vx247,vy247,vz247))
																												surf_tool.add_vertex(Vector3(vx248,vy248,vz248))
																												
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
																												
																												surf_tool.add_index(fa111111111___)
																												surf_tool.add_index(fb111111111___)
																												surf_tool.add_index(fc111111111___)
																												
																												surf_tool.add_index(fa1111111111___)
																												surf_tool.add_index(fb1111111111___)
																												surf_tool.add_index(fc1111111111___)
																												
																												surf_tool.add_index(fa11111111111___)
																												surf_tool.add_index(fb11111111111___)
																												surf_tool.add_index(fc11111111111___)
																												
																												surf_tool.add_index(fa111111111111___)
																												surf_tool.add_index(fb111111111111___)
																												surf_tool.add_index(fc111111111111___)
																												
																												surf_tool.add_index(fa1111111111111___)
																												surf_tool.add_index(fb1111111111111___)
																												surf_tool.add_index(fc1111111111111___)
																												
																												surf_tool.add_index(fa11111111111111___)
																												surf_tool.add_index(fb11111111111111___)
																												surf_tool.add_index(fc11111111111111___)
																												
																												surf_tool.add_index(fa111111111111111___)
																												surf_tool.add_index(fb111111111111111___)
																												surf_tool.add_index(fc111111111111111___)
																												
																												surf_tool.add_index(fa1111111111111111___)
																												surf_tool.add_index(fb1111111111111111___)
																												surf_tool.add_index(fc1111111111111111___)
																												
																												surf_tool.add_index(fa11111111111111111___)
																												surf_tool.add_index(fb11111111111111111___)
																												surf_tool.add_index(fc11111111111111111___)
																												
																												surf_tool.add_index(fa111111111111111111___)
																												surf_tool.add_index(fb111111111111111111___)
																												surf_tool.add_index(fc111111111111111111___)
																												
																												surf_tool.add_index(fa111111111111111111___1)
																												surf_tool.add_index(fb111111111111111111___1)
																												surf_tool.add_index(fc111111111111111111___1)
																												
																												surf_tool.add_index(fa111111111111111111___11)
																												surf_tool.add_index(fb111111111111111111___11)
																												surf_tool.add_index(fc111111111111111111___11)
				elif vertexCount == int(23):
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
					var fa111111111___=-11
					var fb111111111___=-10
					var fc111111111___=-9
					var fa1111111111___=-12
					var fb1111111111___=-11
					var fc1111111111___=-10
					var fa11111111111___=-13
					var fb11111111111___=-12
					var fc11111111111___=-11
					var fa111111111111___=-14
					var fb111111111111___=-13
					var fc111111111111___=-12
					var fa1111111111111___=-15
					var fb1111111111111___=-14
					var fc1111111111111___=-13
					var fa11111111111111___=-16
					var fb11111111111111___=-15
					var fc11111111111111___=-14
					var fa111111111111111___=-17
					var fb111111111111111___=-16
					var fc111111111111111___=-15
					var fa1111111111111111___=-18
					var fb1111111111111111___=-17
					var fc1111111111111111___=-16
					var fa11111111111111111___=-19
					var fb11111111111111111___=-18
					var fc11111111111111111___=-17
					var fa111111111111111111___=-20
					var fb111111111111111111___=-19
					var fc111111111111111111___=-18
					var fa111111111111111111___1=-21
					var fb111111111111111111___1=-20
					var fc111111111111111111___1=-19
					var fa111111111111111111___11=-22
					var fb111111111111111111___11=-21
					var fc111111111111111111___11=-20
					var fa111111111111111111___111=-23
					var fb111111111111111111___111=-22
					var fc111111111111111111___111=-21
					for j in range(1):
						var vx249 = file.get_float()
						var vy249 = file.get_float()
						var vz249 = file.get_float()
						var type4aaaaaah1_1234 = file.get_8()
						var value1 = file.get_8()
						var normalZ = file.get_16()
						var vx250 = file.get_float()
						var vy250 = file.get_float()
						var vz250 = file.get_float()
						var typeaaaaaai1_1234 = file.get_8()
						var value12a = file.get_8()
						var normalZa = file.get_16()
						var vx251 = file.get_float()
						var vy251 = file.get_float()
						var vz251 = file.get_float()
						var typeaaaaaaj1_1234 = file.get_8()
						var value1b = file.get_8()
						var normalZb = file.get_16()
						var vx252 = file.get_float()
						var vy252 = file.get_float()
						var vz252 = file.get_float()
						var typeaaaaaak1_1234 = file.get_8()
						var value1c = file.get_8()
						var normalZc = file.get_16()
						var vx253 = file.get_float()
						var vy253 = file.get_float()
						var vz253 = file.get_float()
						var typeaaaaaal1_1234 = file.get_8()
						var value1d = file.get_8()
						var normalZd = file.get_16()
						var vx254 = file.get_float()
						var vy254 = file.get_float()
						var vz254 = file.get_float()
						var typeaaaaaam1_1234 = file.get_8()
						var value1q = file.get_8()
						var normalZq = file.get_16()
						var vx255 = file.get_float()
						var vy255 = file.get_float()
						var vz255 = file.get_float()
						var typeaaaaaan1_1234 = file.get_8()
						var value1ad = file.get_8()
						var normalZad = file.get_16()
						var vx256 = file.get_float()
						var vy256 = file.get_float()
						var vz256 = file.get_float()
						var typeaaaaaao1_1234 = file.get_8()
						var value1al = file.get_8()
						var normalZal = file.get_16()
						var vx257 = file.get_float()
						var vy257 = file.get_float()
						var vz257 = file.get_float()
						var typeaaaaaap1_1234 = file.get_8()
						var value1au = file.get_8()
						var normalZau = file.get_16()
						var vx258 = file.get_float()
						var vy258 = file.get_float()
						var vz258 = file.get_float()
						var typeaaaaaaq1_1234 = file.get_8()
						var value1ae = file.get_8()
						var normalZae = file.get_16()
						var vx259 = file.get_float()
						var vy259 = file.get_float()
						var vz259 = file.get_float()
						var typeaaaaaar1_1234 = file.get_8()
						var value1ap = file.get_8()
						var normalZap = file.get_16()
						var vx260 = file.get_float()
						var vy260 = file.get_float()
						var vz260 = file.get_float()
						var typeaaaaaas1_1234 = file.get_8()
						var value1ab = file.get_8()
						var normalZab = file.get_16()
						var vx261 = file.get_float()
						var vy261 = file.get_float()
						var vz261 = file.get_float()
						var typeaaaaaat1_1234 = file.get_8()
						var value1ao = file.get_8()
						var normalZao = file.get_16()
						var vx262 = file.get_float()
						var vy262 = file.get_float()
						var vz262 = file.get_float()
						var typeaaaaaau1_1234 = file.get_8()
						var value1app = file.get_8()
						var normalZapp = file.get_16()
						var vx263 = file.get_float()
						var vy263 = file.get_float()
						var vz263 = file.get_float()
						var typeaaaaaav1_1234 = file.get_8()
						var value1appp = file.get_8()
						var normalZappp = file.get_16()
						var vx264 = file.get_float()
						var vy264 = file.get_float()
						var vz264 = file.get_float()
						var typeaaaaaaw1_1234 = file.get_8()
						var value1apppp = file.get_8()
						var normalZapppp = file.get_16()
						var vx265 = file.get_float()
						var vy265 = file.get_float()
						var vz265 = file.get_float()
						var typeaaaaaax1_1234 = file.get_8()
						var value1appppp = file.get_8()
						var normalZappppp = file.get_16()
						var vx266 = file.get_float()
						var vy266 = file.get_float()
						var vz266 = file.get_float()
						var typeaaaaaay1_1234 = file.get_8()
						var value1appppp_ = file.get_8()
						var normalZappppp_ = file.get_16()
						var vx267 = file.get_float()
						var vy267 = file.get_float()
						var vz267 = file.get_float()
						var typeaaaaaaz1_1234 = file.get_8()
						var value1appppzp_ = file.get_8()
						var normalZappppzp_ = file.get_16()
						var vx268 = file.get_float()
						var vy268 = file.get_float()
						var vz268 = file.get_float()
						var typeaaaaaaz1_2234 = file.get_8()
						var value1appppzp_2 = file.get_8()
						var normalZappppzp_2 = file.get_16()
						var vx269 = file.get_float()
						var vy269 = file.get_float()
						var vz269 = file.get_float()
						var typeaaaaaaz1_223_4 = file.get_8()
						var value1appppzp_2_ = file.get_8()
						var normalZappppzp_2_ = file.get_16()
						var vx270 = file.get_float()
						var vy270 = file.get_float()
						var vz270 = file.get_float()
						var typeaaaaaaz1_223_14 = file.get_8()
						var value1appppzp_2_1 = file.get_8()
						var normalZappppzp_2_1 = file.get_16()
						var vx271 = file.get_float()
						var vy271 = file.get_float()
						var vz271 = file.get_float()
						var typeaaaaaaz1_223_114 = file.get_8()
						var value1appppzp_2_11 = file.get_8()
						var normalZappppzp_2_11 = file.get_16()
						fa1111+=1*23
						fb1111+=1*23
						fc1111+=1*23
						fa1111_+=1*23
						fb1111_+=1*23
						fc1111_+=1*23
						fa1111__+=1*23
						fb1111__+=1*23
						fc1111__+=1*23
						fa1111___+=1*23
						fb1111___+=1*23
						fc1111___+=1*23
						fa11111___+=1*23
						fb11111___+=1*23
						fc11111___+=1*23
						fa111111___+=1*23
						fb111111___+=1*23
						fc111111___+=1*23
						fa1111111___+=1*23
						fb1111111___+=1*23
						fc1111111___+=1*23
						fa11111111___+=1*23
						fb11111111___+=1*23
						fc11111111___+=1*23
						fa111111111___+=1*23
						fb111111111___+=1*23
						fc111111111___+=1*23
						fa1111111111___+=1*23
						fb1111111111___+=1*23
						fc1111111111___+=1*23
						fa11111111111___+=1*23
						fb11111111111___+=1*23
						fc11111111111___+=1*23
						fa111111111111___+=1*23
						fb111111111111___+=1*23
						fc111111111111___+=1*23
						fa1111111111111___+=1*23
						fb1111111111111___+=1*23
						fc1111111111111___+=1*23
						fa11111111111111___+=1*23
						fb11111111111111___+=1*23
						fc11111111111111___+=1*23
						fa111111111111111___+=1*23
						fb111111111111111___+=1*23
						fc111111111111111___+=1*23
						fa1111111111111111___+=1*23
						fb1111111111111111___+=1*23
						fc1111111111111111___+=1*23
						fa11111111111111111___+=1*23
						fb11111111111111111___+=1*23
						fc11111111111111111___+=1*23
						fa111111111111111111___+=1*23
						fb111111111111111111___+=1*23
						fc111111111111111111___+=1*23
						fa111111111111111111___1+=1*23
						fb111111111111111111___1+=1*23
						fc111111111111111111___1+=1*23
						fa111111111111111111___11+=1*23
						fb111111111111111111___11+=1*23
						fc111111111111111111___11+=1*23
						fa111111111111111111___111+=1*23
						fb111111111111111111___111+=1*23
						fc111111111111111111___111+=1*23
						if type4aaaaaah1_1234 == int(1):
							if typeaaaaaai1_1234 == int(1):
								if typeaaaaaaj1_1234 == int(0):
									if typeaaaaaak1_1234 == int(0):
										if typeaaaaaal1_1234 == int(0):
											if typeaaaaaam1_1234 == int(0):
												if typeaaaaaan1_1234 == int(0):
													if typeaaaaaao1_1234 == int(0):
														if typeaaaaaap1_1234 == int(0):
															if typeaaaaaaq1_1234 == int(0):
																if typeaaaaaar1_1234 == int(0):
																	if typeaaaaaas1_1234 == int(0):
																		if typeaaaaaat1_1234 == int(0):
																			if typeaaaaaau1_1234 == int(0):
																				if typeaaaaaav1_1234 == int(0):
																					if typeaaaaaaw1_1234 == int(0):
																						if typeaaaaaax1_1234 == int(0):
																							if typeaaaaaay1_1234 == int(0):
																								if typeaaaaaaz1_1234 == int(0):
																									if typeaaaaaaz1_2234 == int(0):
																										if typeaaaaaaz1_223_4 == int(0):
																											if typeaaaaaaz1_223_14 == int(0):
																												surf_tool.add_vertex(Vector3(vx249,vy249,vz249))
																												surf_tool.add_vertex(Vector3(vx250,vy250,vz250))
																												surf_tool.add_vertex(Vector3(vx251,vy251,vz251))
																												surf_tool.add_vertex(Vector3(vx252,vy252,vz252))
																												surf_tool.add_vertex(Vector3(vx253,vy253,vz253))
																												surf_tool.add_vertex(Vector3(vx254,vy254,vz254))
																												surf_tool.add_vertex(Vector3(vx255,vy255,vz255))
																												surf_tool.add_vertex(Vector3(vx256,vy256,vz256))
																												surf_tool.add_vertex(Vector3(vx257,vy257,vz257))
																												surf_tool.add_vertex(Vector3(vx258,vy258,vz258))
																												surf_tool.add_vertex(Vector3(vx259,vy259,vz259))
																												surf_tool.add_vertex(Vector3(vx260,vy260,vz260))
																												surf_tool.add_vertex(Vector3(vx261,vy261,vz261))
																												surf_tool.add_vertex(Vector3(vx262,vy262,vz262))
																												surf_tool.add_vertex(Vector3(vx263,vy263,vz263))
																												surf_tool.add_vertex(Vector3(vx264,vy264,vz264))
																												surf_tool.add_vertex(Vector3(vx265,vy265,vz265))
																												surf_tool.add_vertex(Vector3(vx266,vy266,vz266))
																												surf_tool.add_vertex(Vector3(vx267,vy267,vz267))
																												surf_tool.add_vertex(Vector3(vx268,vy268,vz268))
																												surf_tool.add_vertex(Vector3(vx269,vy269,vz269))
																												surf_tool.add_vertex(Vector3(vx270,vy270,vz270))
																												surf_tool.add_vertex(Vector3(vx271,vy271,vz271))
																												
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
																												
																												surf_tool.add_index(fa111111111___)
																												surf_tool.add_index(fb111111111___)
																												surf_tool.add_index(fc111111111___)
																												
																												surf_tool.add_index(fa1111111111___)
																												surf_tool.add_index(fb1111111111___)
																												surf_tool.add_index(fc1111111111___)
																												
																												surf_tool.add_index(fa11111111111___)
																												surf_tool.add_index(fb11111111111___)
																												surf_tool.add_index(fc11111111111___)
																												
																												surf_tool.add_index(fa111111111111___)
																												surf_tool.add_index(fb111111111111___)
																												surf_tool.add_index(fc111111111111___)
																												
																												surf_tool.add_index(fa1111111111111___)
																												surf_tool.add_index(fb1111111111111___)
																												surf_tool.add_index(fc1111111111111___)
																												
																												surf_tool.add_index(fa11111111111111___)
																												surf_tool.add_index(fb11111111111111___)
																												surf_tool.add_index(fc11111111111111___)
																												
																												surf_tool.add_index(fa111111111111111___)
																												surf_tool.add_index(fb111111111111111___)
																												surf_tool.add_index(fc111111111111111___)
																												
																												surf_tool.add_index(fa1111111111111111___)
																												surf_tool.add_index(fb1111111111111111___)
																												surf_tool.add_index(fc1111111111111111___)
																												
																												surf_tool.add_index(fa11111111111111111___)
																												surf_tool.add_index(fb11111111111111111___)
																												surf_tool.add_index(fc11111111111111111___)
																												
																												surf_tool.add_index(fa111111111111111111___)
																												surf_tool.add_index(fb111111111111111111___)
																												surf_tool.add_index(fc111111111111111111___)
																												
																												surf_tool.add_index(fa111111111111111111___1)
																												surf_tool.add_index(fb111111111111111111___1)
																												surf_tool.add_index(fc111111111111111111___1)
																												
																												surf_tool.add_index(fa111111111111111111___11)
																												surf_tool.add_index(fb111111111111111111___11)
																												surf_tool.add_index(fc111111111111111111___11)
																												
																												surf_tool.add_index(fa111111111111111111___111)
																												surf_tool.add_index(fb111111111111111111___111)
																												surf_tool.add_index(fc111111111111111111___111)
																												
																												surf_tool.add_index(fa111111111111111111___111)
																												surf_tool.add_index(fb111111111111111111___111)
																												surf_tool.add_index(fc111111111111111111___111)
				elif vertexCount == int(24):
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
					var fa111111111___=-11
					var fb111111111___=-10
					var fc111111111___=-9
					var fa1111111111___=-12
					var fb1111111111___=-11
					var fc1111111111___=-10
					var fa11111111111___=-13
					var fb11111111111___=-12
					var fc11111111111___=-11
					var fa111111111111___=-14
					var fb111111111111___=-13
					var fc111111111111___=-12
					var fa1111111111111___=-15
					var fb1111111111111___=-14
					var fc1111111111111___=-13
					var fa11111111111111___=-16
					var fb11111111111111___=-15
					var fc11111111111111___=-14
					var fa111111111111111___=-17
					var fb111111111111111___=-16
					var fc111111111111111___=-15
					var fa1111111111111111___=-18
					var fb1111111111111111___=-17
					var fc1111111111111111___=-16
					var fa11111111111111111___=-19
					var fb11111111111111111___=-18
					var fc11111111111111111___=-17
					var fa111111111111111111___=-20
					var fb111111111111111111___=-19
					var fc111111111111111111___=-18
					var fa111111111111111111___1=-21
					var fb111111111111111111___1=-20
					var fc111111111111111111___1=-19
					var fa111111111111111111___11=-22
					var fb111111111111111111___11=-21
					var fc111111111111111111___11=-20
					var fa111111111111111111___111=-23
					var fb111111111111111111___111=-22
					var fc111111111111111111___111=-21
					var fa111111111111111111___1111=-24
					var fb111111111111111111___1111=-23
					var fc111111111111111111___1111=-22
					
					for j in range(1):
						var vx272 = file.get_float()
						var vy272 = file.get_float()
						var vz272 = file.get_float()
						var type4aaaaaah1_12345 = file.get_8()
						var value1 = file.get_8()
						var normalZ = file.get_16()
						var vx273 = file.get_float()
						var vy273 = file.get_float()
						var vz273 = file.get_float()
						var typeaaaaaai1_12345 = file.get_8()
						var value12a = file.get_8()
						var normalZa = file.get_16()
						var vx274 = file.get_float()
						var vy274 = file.get_float()
						var vz274 = file.get_float()
						var typeaaaaaaj1_12345 = file.get_8()
						var value1b = file.get_8()
						var normalZb = file.get_16()
						var vx275 = file.get_float()
						var vy275 = file.get_float()
						var vz275 = file.get_float()
						var typeaaaaaak1_12345 = file.get_8()
						var value1c = file.get_8()
						var normalZc = file.get_16()
						var vx276 = file.get_float()
						var vy276 = file.get_float()
						var vz276 = file.get_float()
						var typeaaaaaal1_12345 = file.get_8()
						var value1d = file.get_8()
						var normalZd = file.get_16()
						var vx277 = file.get_float()
						var vy277 = file.get_float()
						var vz277 = file.get_float()
						var typeaaaaaam1_12345 = file.get_8()
						var value1q = file.get_8()
						var normalZq = file.get_16()
						var vx278 = file.get_float()
						var vy278 = file.get_float()
						var vz278 = file.get_float()
						var typeaaaaaan1_12345 = file.get_8()
						var value1ad = file.get_8()
						var normalZad = file.get_16()
						var vx279 = file.get_float()
						var vy279 = file.get_float()
						var vz279 = file.get_float()
						var typeaaaaaao1_12345 = file.get_8()
						var value1al = file.get_8()
						var normalZal = file.get_16()
						var vx280 = file.get_float()
						var vy280 = file.get_float()
						var vz280 = file.get_float()
						var typeaaaaaap1_12345 = file.get_8()
						var value1au = file.get_8()
						var normalZau = file.get_16()
						var vx281 = file.get_float()
						var vy281 = file.get_float()
						var vz281 = file.get_float()
						var typeaaaaaaq1_12345 = file.get_8()
						var value1ae = file.get_8()
						var normalZae = file.get_16()
						var vx282 = file.get_float()
						var vy282 = file.get_float()
						var vz282 = file.get_float()
						var typeaaaaaar1_12345 = file.get_8()
						var value1ap = file.get_8()
						var normalZap = file.get_16()
						var vx283 = file.get_float()
						var vy283 = file.get_float()
						var vz283 = file.get_float()
						var typeaaaaaas1_12345 = file.get_8()
						var value1ab = file.get_8()
						var normalZab = file.get_16()
						var vx284 = file.get_float()
						var vy284 = file.get_float()
						var vz284 = file.get_float()
						var typeaaaaaat1_12345 = file.get_8()
						var value1ao = file.get_8()
						var normalZao = file.get_16()
						var vx285 = file.get_float()
						var vy285 = file.get_float()
						var vz285 = file.get_float()
						var typeaaaaaau1_12345 = file.get_8()
						var value1app = file.get_8()
						var normalZapp = file.get_16()
						var vx286 = file.get_float()
						var vy286 = file.get_float()
						var vz286 = file.get_float()
						var typeaaaaaav1_12345 = file.get_8()
						var value1appp = file.get_8()
						var normalZappp = file.get_16()
						var vx287 = file.get_float()
						var vy287 = file.get_float()
						var vz287 = file.get_float()
						var typeaaaaaaw1_12345 = file.get_8()
						var value1apppp = file.get_8()
						var normalZapppp = file.get_16()
						var vx288 = file.get_float()
						var vy288 = file.get_float()
						var vz288 = file.get_float()
						var typeaaaaaax1_12345 = file.get_8()
						var value1appppp = file.get_8()
						var normalZappppp = file.get_16()
						var vx289 = file.get_float()
						var vy289 = file.get_float()
						var vz289 = file.get_float()
						var typeaaaaaay1_12345 = file.get_8()
						var value1appppp_ = file.get_8()
						var normalZappppp_ = file.get_16()
						var vx290 = file.get_float()
						var vy290 = file.get_float()
						var vz290 = file.get_float()
						var typeaaaaaaz1_12345 = file.get_8()
						var value1appppzp_ = file.get_8()
						var normalZappppzp_ = file.get_16()
						var vx291 = file.get_float()
						var vy291 = file.get_float()
						var vz291 = file.get_float()
						var typeaaaaaaz1_22345 = file.get_8()
						var value1appppzp_2 = file.get_8()
						var normalZappppzp_2 = file.get_16()
						var vx292 = file.get_float()
						var vy292 = file.get_float()
						var vz292 = file.get_float()
						var typeaaaaaaz1_223_45 = file.get_8()
						var value1appppzp_2_ = file.get_8()
						var normalZappppzp_2_ = file.get_16()
						var vx293 = file.get_float()
						var vy293 = file.get_float()
						var vz293 = file.get_float()
						var typeaaaaaaz1_223_145 = file.get_8()
						var value1appppzp_2_1 = file.get_8()
						var normalZappppzp_2_1 = file.get_16()
						var vx294 = file.get_float()
						var vy294 = file.get_float()
						var vz294 = file.get_float()
						var typeaaaaaaz1_223_1145 = file.get_8()
						var value1appppzp_2_11 = file.get_8()
						var normalZappppzp_2_11 = file.get_16()
						var vx295 = file.get_float()
						var vy295 = file.get_float()
						var vz295 = file.get_float()
						var typeaaaaaaz1_223_1145_ = file.get_8()
						var value1appppzp_2_11_ = file.get_8()
						var normalZappppzp_2_11_ = file.get_16()
						fa1111+=1*24
						fb1111+=1*24
						fc1111+=1*24
						fa1111_+=1*24
						fb1111_+=1*24
						fc1111_+=1*24
						fa1111__+=1*24
						fb1111__+=1*24
						fc1111__+=1*24
						fa1111___+=1*24
						fb1111___+=1*24
						fc1111___+=1*24
						fa11111___+=1*24
						fb11111___+=1*24
						fc11111___+=1*24
						fa111111___+=1*24
						fb111111___+=1*24
						fc111111___+=1*24
						fa1111111___+=1*24
						fb1111111___+=1*24
						fc1111111___+=1*24
						fa11111111___+=1*24
						fb11111111___+=1*24
						fc11111111___+=1*24
						fa111111111___+=1*24
						fb111111111___+=1*24
						fc111111111___+=1*24
						fa1111111111___+=1*24
						fb1111111111___+=1*24
						fc1111111111___+=1*24
						fa11111111111___+=1*24
						fb11111111111___+=1*24
						fc11111111111___+=1*24
						fa111111111111___+=1*24
						fb111111111111___+=1*24
						fc111111111111___+=1*24
						fa1111111111111___+=1*24
						fb1111111111111___+=1*24
						fc1111111111111___+=1*24
						fa11111111111111___+=1*24
						fb11111111111111___+=1*24
						fc11111111111111___+=1*24
						fa111111111111111___+=1*24
						fb111111111111111___+=1*24
						fc111111111111111___+=1*24
						fa1111111111111111___+=1*24
						fb1111111111111111___+=1*24
						fc1111111111111111___+=1*24
						fa11111111111111111___+=1*24
						fb11111111111111111___+=1*24
						fc11111111111111111___+=1*24
						fa111111111111111111___+=1*24
						fb111111111111111111___+=1*24
						fc111111111111111111___+=1*24
						fa111111111111111111___1+=1*24
						fb111111111111111111___1+=1*24
						fc111111111111111111___1+=1*24
						fa111111111111111111___11+=1*24
						fb111111111111111111___11+=1*24
						fc111111111111111111___11+=1*24
						fa111111111111111111___111+=1*24
						fb111111111111111111___111+=1*24
						fc111111111111111111___111+=1*24
						fa111111111111111111___1111+=1*24
						fb111111111111111111___1111+=1*24
						fc111111111111111111___1111+=1*24
						if type4aaaaaah1_12345 == int(1):
							if typeaaaaaai1_12345 == int(1):
								if typeaaaaaaj1_12345 == int(0):
									if typeaaaaaak1_12345 == int(0):
										if typeaaaaaal1_12345 == int(0):
											if typeaaaaaam1_12345 == int(0):
												if typeaaaaaan1_12345 == int(0):
													if typeaaaaaao1_12345 == int(0):
														if typeaaaaaap1_12345 == int(0):
															if typeaaaaaaq1_12345 == int(0):
																if typeaaaaaar1_12345 == int(0):
																	if typeaaaaaas1_12345 == int(0):
																		if typeaaaaaat1_12345 == int(0):
																			if typeaaaaaau1_12345 == int(0):
																				if typeaaaaaav1_12345 == int(0):
																					if typeaaaaaaw1_12345 == int(0):
																						if typeaaaaaax1_12345 == int(0):
																							if typeaaaaaay1_12345 == int(0):
																								if typeaaaaaaz1_12345 == int(0):
																									if typeaaaaaaz1_22345 == int(0):
																										if typeaaaaaaz1_223_45 == int(0):
																											if typeaaaaaaz1_223_145 == int(0):
																												if typeaaaaaaz1_223_1145_ == int(0):
																													surf_tool.add_vertex(Vector3(vx272,vy272,vz272))
																													surf_tool.add_vertex(Vector3(vx273,vy273,vz273))
																													surf_tool.add_vertex(Vector3(vx274,vy274,vz274))
																													surf_tool.add_vertex(Vector3(vx275,vy275,vz275))
																													surf_tool.add_vertex(Vector3(vx276,vy276,vz276))
																													surf_tool.add_vertex(Vector3(vx277,vy277,vz277))
																													surf_tool.add_vertex(Vector3(vx278,vy278,vz278))
																													surf_tool.add_vertex(Vector3(vx279,vy279,vz279))
																													surf_tool.add_vertex(Vector3(vx280,vy280,vz280))
																													surf_tool.add_vertex(Vector3(vx281,vy281,vz281))
																													surf_tool.add_vertex(Vector3(vx282,vy282,vz282))
																													surf_tool.add_vertex(Vector3(vx283,vy283,vz283))
																													surf_tool.add_vertex(Vector3(vx284,vy284,vz284))
																													surf_tool.add_vertex(Vector3(vx285,vy285,vz285))
																													surf_tool.add_vertex(Vector3(vx286,vy286,vz286))
																													surf_tool.add_vertex(Vector3(vx287,vy287,vz287))
																													surf_tool.add_vertex(Vector3(vx288,vy288,vz288))
																													surf_tool.add_vertex(Vector3(vx289,vy289,vz289))
																													surf_tool.add_vertex(Vector3(vx290,vy290,vz290))
																													surf_tool.add_vertex(Vector3(vx291,vy291,vz291))
																													surf_tool.add_vertex(Vector3(vx292,vy292,vz292))
																													surf_tool.add_vertex(Vector3(vx293,vy293,vz293))
																													surf_tool.add_vertex(Vector3(vx294,vy294,vz294))
																													surf_tool.add_vertex(Vector3(vx295,vy295,vz295))
																													
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
																													
																													surf_tool.add_index(fa111111111___)
																													surf_tool.add_index(fb111111111___)
																													surf_tool.add_index(fc111111111___)
																													
																													surf_tool.add_index(fa1111111111___)
																													surf_tool.add_index(fb1111111111___)
																													surf_tool.add_index(fc1111111111___)
																													
																													surf_tool.add_index(fa11111111111___)
																													surf_tool.add_index(fb11111111111___)
																													surf_tool.add_index(fc11111111111___)
																													
																													surf_tool.add_index(fa111111111111___)
																													surf_tool.add_index(fb111111111111___)
																													surf_tool.add_index(fc111111111111___)
																													
																													surf_tool.add_index(fa1111111111111___)
																													surf_tool.add_index(fb1111111111111___)
																													surf_tool.add_index(fc1111111111111___)
																													
																													surf_tool.add_index(fa11111111111111___)
																													surf_tool.add_index(fb11111111111111___)
																													surf_tool.add_index(fc11111111111111___)
																													
																													surf_tool.add_index(fa111111111111111___)
																													surf_tool.add_index(fb111111111111111___)
																													surf_tool.add_index(fc111111111111111___)
																													
																													surf_tool.add_index(fa1111111111111111___)
																													surf_tool.add_index(fb1111111111111111___)
																													surf_tool.add_index(fc1111111111111111___)
																													
																													surf_tool.add_index(fa11111111111111111___)
																													surf_tool.add_index(fb11111111111111111___)
																													surf_tool.add_index(fc11111111111111111___)
																													
																													surf_tool.add_index(fa111111111111111111___)
																													surf_tool.add_index(fb111111111111111111___)
																													surf_tool.add_index(fc111111111111111111___)
																													
																													surf_tool.add_index(fa111111111111111111___1)
																													surf_tool.add_index(fb111111111111111111___1)
																													surf_tool.add_index(fc111111111111111111___1)
																													
																													surf_tool.add_index(fa111111111111111111___11)
																													surf_tool.add_index(fb111111111111111111___11)
																													surf_tool.add_index(fc111111111111111111___11)
																													
																													surf_tool.add_index(fa111111111111111111___111)
																													surf_tool.add_index(fb111111111111111111___111)
																													surf_tool.add_index(fc111111111111111111___111)
																													
																													surf_tool.add_index(fa111111111111111111___111)
																													surf_tool.add_index(fb111111111111111111___111)
																													surf_tool.add_index(fc111111111111111111___111)
																													
																													surf_tool.add_index(fa111111111111111111___1111)
																													surf_tool.add_index(fb111111111111111111___1111)
																													surf_tool.add_index(fc111111111111111111___1111)
				elif vertexCount == int(25):
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
					var fa111111111___=-11
					var fb111111111___=-10
					var fc111111111___=-9
					var fa1111111111___=-12
					var fb1111111111___=-11
					var fc1111111111___=-10
					var fa11111111111___=-13
					var fb11111111111___=-12
					var fc11111111111___=-11
					var fa111111111111___=-14
					var fb111111111111___=-13
					var fc111111111111___=-12
					var fa1111111111111___=-15
					var fb1111111111111___=-14
					var fc1111111111111___=-13
					var fa11111111111111___=-16
					var fb11111111111111___=-15
					var fc11111111111111___=-14
					var fa111111111111111___=-17
					var fb111111111111111___=-16
					var fc111111111111111___=-15
					var fa1111111111111111___=-18
					var fb1111111111111111___=-17
					var fc1111111111111111___=-16
					var fa11111111111111111___=-19
					var fb11111111111111111___=-18
					var fc11111111111111111___=-17
					var fa111111111111111111___=-20
					var fb111111111111111111___=-19
					var fc111111111111111111___=-18
					var fa111111111111111111___1=-21
					var fb111111111111111111___1=-20
					var fc111111111111111111___1=-19
					var fa111111111111111111___11=-22
					var fb111111111111111111___11=-21
					var fc111111111111111111___11=-20
					var fa111111111111111111___111=-23
					var fb111111111111111111___111=-22
					var fc111111111111111111___111=-21
					var fa111111111111111111___1111=-24
					var fb111111111111111111___1111=-23
					var fc111111111111111111___1111=-22
					var fa111111111111111111___11111=-25
					var fb111111111111111111___11111=-24
					var fc111111111111111111___11111=-23
					for j in range(1):
						var vx296 = file.get_float()
						var vy296 = file.get_float()
						var vz296 = file.get_float()
						var type4aaaaaah1_123456 = file.get_8()
						var value1 = file.get_8()
						var normalZ = file.get_16()
						var vx297 = file.get_float()
						var vy297 = file.get_float()
						var vz297 = file.get_float()
						var typeaaaaaai1_123456 = file.get_8()
						var value12a = file.get_8()
						var normalZa = file.get_16()
						var vx298 = file.get_float()
						var vy298 = file.get_float()
						var vz298 = file.get_float()
						var typeaaaaaaj1_123456 = file.get_8()
						var value1b = file.get_8()
						var normalZb = file.get_16()
						var vx299 = file.get_float()
						var vy299 = file.get_float()
						var vz299 = file.get_float()
						var typeaaaaaak1_123456 = file.get_8()
						var value1c = file.get_8()
						var normalZc = file.get_16()
						var vx300 = file.get_float()
						var vy300 = file.get_float()
						var vz300 = file.get_float()
						var typeaaaaaal1_123456 = file.get_8()
						var value1d = file.get_8()
						var normalZd = file.get_16()
						var vx301 = file.get_float()
						var vy301 = file.get_float()
						var vz301 = file.get_float()
						var typeaaaaaam1_123456 = file.get_8()
						var value1q = file.get_8()
						var normalZq = file.get_16()
						var vx302 = file.get_float()
						var vy302 = file.get_float()
						var vz302 = file.get_float()
						var typeaaaaaan1_123456 = file.get_8()
						var value1ad = file.get_8()
						var normalZad = file.get_16()
						var vx303 = file.get_float()
						var vy303 = file.get_float()
						var vz303 = file.get_float()
						var typeaaaaaao1_123456 = file.get_8()
						var value1al = file.get_8()
						var normalZal = file.get_16()
						var vx304 = file.get_float()
						var vy304 = file.get_float()
						var vz304 = file.get_float()
						var typeaaaaaap1_123456 = file.get_8()
						var value1au = file.get_8()
						var normalZau = file.get_16()
						var vx305 = file.get_float()
						var vy305 = file.get_float()
						var vz305 = file.get_float()
						var typeaaaaaaq1_123456 = file.get_8()
						var value1ae = file.get_8()
						var normalZae = file.get_16()
						var vx306 = file.get_float()
						var vy306 = file.get_float()
						var vz306 = file.get_float()
						var typeaaaaaar1_123456 = file.get_8()
						var value1ap = file.get_8()
						var normalZap = file.get_16()
						var vx307 = file.get_float()
						var vy307 = file.get_float()
						var vz307 = file.get_float()
						var typeaaaaaas1_123456 = file.get_8()
						var value1ab = file.get_8()
						var normalZab = file.get_16()
						var vx308 = file.get_float()
						var vy308 = file.get_float()
						var vz308 = file.get_float()
						var typeaaaaaat1_123456 = file.get_8()
						var value1ao = file.get_8()
						var normalZao = file.get_16()
						var vx309 = file.get_float()
						var vy309 = file.get_float()
						var vz309 = file.get_float()
						var typeaaaaaau1_123456 = file.get_8()
						var value1app = file.get_8()
						var normalZapp = file.get_16()
						var vx310 = file.get_float()
						var vy310 = file.get_float()
						var vz310 = file.get_float()
						var typeaaaaaav1_123456 = file.get_8()
						var value1appp = file.get_8()
						var normalZappp = file.get_16()
						var vx311 = file.get_float()
						var vy311 = file.get_float()
						var vz311 = file.get_float()
						var typeaaaaaaw1_123456 = file.get_8()
						var value1apppp = file.get_8()
						var normalZapppp = file.get_16()
						var vx312 = file.get_float()
						var vy312 = file.get_float()
						var vz312 = file.get_float()
						var typeaaaaaax1_123456 = file.get_8()
						var value1appppp = file.get_8()
						var normalZappppp = file.get_16()
						var vx313 = file.get_float()
						var vy313 = file.get_float()
						var vz313 = file.get_float()
						var typeaaaaaay1_123456 = file.get_8()
						var value1appppp_ = file.get_8()
						var normalZappppp_ = file.get_16()
						var vx314 = file.get_float()
						var vy314 = file.get_float()
						var vz314 = file.get_float()
						var typeaaaaaaz1_123456 = file.get_8()
						var value1appppzp_ = file.get_8()
						var normalZappppzp_ = file.get_16()
						var vx315 = file.get_float()
						var vy315 = file.get_float()
						var vz315 = file.get_float()
						var typeaaaaaaz1_223456 = file.get_8()
						var value1appppzp_2 = file.get_8()
						var normalZappppzp_2 = file.get_16()
						var vx316 = file.get_float()
						var vy316 = file.get_float()
						var vz316 = file.get_float()
						var typeaaaaaaz1_223_456 = file.get_8()
						var value1appppzp_2_ = file.get_8()
						var normalZappppzp_2_ = file.get_16()
						var vx317 = file.get_float()
						var vy317 = file.get_float()
						var vz317 = file.get_float()
						var typeaaaaaaz1_223_1456 = file.get_8()
						var value1appppzp_2_1 = file.get_8()
						var normalZappppzp_2_1 = file.get_16()
						var vx318 = file.get_float()
						var vy318 = file.get_float()
						var vz318 = file.get_float()
						var typeaaaaaaz1_223_11456 = file.get_8()
						var value1appppzp_2_11 = file.get_8()
						var normalZappppzp_2_11 = file.get_16()
						var vx319 = file.get_float()
						var vy319 = file.get_float()
						var vz319 = file.get_float()
						var typeaaaaaaz1_223_11456_ = file.get_8()
						var value1appppzp_2_11_ = file.get_8()
						var normalZappppzp_2_11_ = file.get_16()
						var vx320 = file.get_float()
						var vy320 = file.get_float()
						var vz320 = file.get_float()
						var typeaaaaaaz1_223_11456__ = file.get_8()
						var value1appppzp_2_11__ = file.get_8()
						var normalZappppzp_2_11__ = file.get_16()
						fa1111+=1*25
						fb1111+=1*25
						fc1111+=1*25
						fa1111_+=1*25
						fb1111_+=1*25
						fc1111_+=1*25
						fa1111__+=1*25
						fb1111__+=1*25
						fc1111__+=1*25
						fa1111___+=1*25
						fb1111___+=1*25
						fc1111___+=1*25
						fa11111___+=1*25
						fb11111___+=1*25
						fc11111___+=1*25
						fa111111___+=1*25
						fb111111___+=1*25
						fc111111___+=1*25
						fa1111111___+=1*25
						fb1111111___+=1*25
						fc1111111___+=1*25
						fa11111111___+=1*25
						fb11111111___+=1*25
						fc11111111___+=1*25
						fa111111111___+=1*25
						fb111111111___+=1*25
						fc111111111___+=1*25
						fa1111111111___+=1*25
						fb1111111111___+=1*25
						fc1111111111___+=1*25
						fa11111111111___+=1*25
						fb11111111111___+=1*25
						fc11111111111___+=1*25
						fa111111111111___+=1*25
						fb111111111111___+=1*25
						fc111111111111___+=1*25
						fa1111111111111___+=1*25
						fb1111111111111___+=1*25
						fc1111111111111___+=1*25
						fa11111111111111___+=1*25
						fb11111111111111___+=1*25
						fc11111111111111___+=1*25
						fa111111111111111___+=1*25
						fb111111111111111___+=1*25
						fc111111111111111___+=1*25
						fa1111111111111111___+=1*25
						fb1111111111111111___+=1*25
						fc1111111111111111___+=1*25
						fa11111111111111111___+=1*25
						fb11111111111111111___+=1*25
						fc11111111111111111___+=1*25
						fa111111111111111111___+=1*25
						fb111111111111111111___+=1*25
						fc111111111111111111___+=1*25
						fa111111111111111111___1+=1*25
						fb111111111111111111___1+=1*25
						fc111111111111111111___1+=1*25
						fa111111111111111111___11+=1*25
						fb111111111111111111___11+=1*25
						fc111111111111111111___11+=1*25
						fa111111111111111111___111+=1*25
						fb111111111111111111___111+=1*25
						fc111111111111111111___111+=1*25
						fa111111111111111111___1111+=1*25
						fb111111111111111111___1111+=1*25
						fc111111111111111111___1111+=1*25
						fa111111111111111111___11111+=1*25
						fb111111111111111111___11111+=1*25
						fc111111111111111111___11111+=1*25
						if type4aaaaaah1_123456 == int(1):
							if typeaaaaaai1_123456 == int(1):
								if typeaaaaaaj1_123456 == int(0):
									if typeaaaaaak1_123456 == int(0):
										if typeaaaaaal1_123456 == int(0):
											if typeaaaaaam1_123456 == int(0):
												if typeaaaaaan1_123456 == int(0):
													if typeaaaaaao1_123456 == int(0):
														if typeaaaaaap1_123456 == int(0):
															if typeaaaaaaq1_123456 == int(0):
																if typeaaaaaar1_123456 == int(0):
																	if typeaaaaaas1_123456 == int(0):
																		if typeaaaaaat1_123456 == int(0):
																			if typeaaaaaau1_123456 == int(0):
																				if typeaaaaaav1_123456 == int(0):
																					if typeaaaaaaw1_123456 == int(0):
																						if typeaaaaaax1_123456 == int(0):
																							if typeaaaaaay1_123456 == int(0):
																								if typeaaaaaaz1_123456 == int(0):
																									if typeaaaaaaz1_223456 == int(0):
																										if typeaaaaaaz1_223_456 == int(0):
																											if typeaaaaaaz1_223_1456 == int(0):
																												if typeaaaaaaz1_223_11456_ == int(0):
																													if typeaaaaaaz1_223_11456__ == int(0):
																														surf_tool.add_vertex(Vector3(vx296,vy296,vz296))
																														surf_tool.add_vertex(Vector3(vx297,vy297,vz297))
																														surf_tool.add_vertex(Vector3(vx298,vy298,vz298))
																														surf_tool.add_vertex(Vector3(vx299,vy299,vz299))
																														surf_tool.add_vertex(Vector3(vx300,vy300,vz300))
																														surf_tool.add_vertex(Vector3(vx301,vy301,vz301))
																														surf_tool.add_vertex(Vector3(vx302,vy302,vz302))
																														surf_tool.add_vertex(Vector3(vx303,vy303,vz303))
																														surf_tool.add_vertex(Vector3(vx304,vy304,vz304))
																														surf_tool.add_vertex(Vector3(vx305,vy305,vz305))
																														surf_tool.add_vertex(Vector3(vx306,vy306,vz306))
																														surf_tool.add_vertex(Vector3(vx307,vy307,vz307))
																														surf_tool.add_vertex(Vector3(vx308,vy308,vz308))
																														surf_tool.add_vertex(Vector3(vx309,vy309,vz309))
																														surf_tool.add_vertex(Vector3(vx310,vy310,vz310))
																														surf_tool.add_vertex(Vector3(vx311,vy311,vz311))
																														surf_tool.add_vertex(Vector3(vx312,vy312,vz312))
																														surf_tool.add_vertex(Vector3(vx313,vy313,vz313))
																														surf_tool.add_vertex(Vector3(vx314,vy314,vz314))
																														surf_tool.add_vertex(Vector3(vx315,vy315,vz315))
																														surf_tool.add_vertex(Vector3(vx316,vy316,vz316))
																														surf_tool.add_vertex(Vector3(vx317,vy317,vz317))
																														surf_tool.add_vertex(Vector3(vx318,vy318,vz318))
																														surf_tool.add_vertex(Vector3(vx319,vy319,vz319))
																														surf_tool.add_vertex(Vector3(vx320,vy320,vz320))
																														
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
																														
																														surf_tool.add_index(fa111111111___)
																														surf_tool.add_index(fb111111111___)
																														surf_tool.add_index(fc111111111___)
																														
																														surf_tool.add_index(fa1111111111___)
																														surf_tool.add_index(fb1111111111___)
																														surf_tool.add_index(fc1111111111___)
																														
																														surf_tool.add_index(fa11111111111___)
																														surf_tool.add_index(fb11111111111___)
																														surf_tool.add_index(fc11111111111___)
																														
																														surf_tool.add_index(fa111111111111___)
																														surf_tool.add_index(fb111111111111___)
																														surf_tool.add_index(fc111111111111___)
																														
																														surf_tool.add_index(fa1111111111111___)
																														surf_tool.add_index(fb1111111111111___)
																														surf_tool.add_index(fc1111111111111___)
																														
																														surf_tool.add_index(fa11111111111111___)
																														surf_tool.add_index(fb11111111111111___)
																														surf_tool.add_index(fc11111111111111___)
																														
																														surf_tool.add_index(fa111111111111111___)
																														surf_tool.add_index(fb111111111111111___)
																														surf_tool.add_index(fc111111111111111___)
																														
																														surf_tool.add_index(fa1111111111111111___)
																														surf_tool.add_index(fb1111111111111111___)
																														surf_tool.add_index(fc1111111111111111___)
																														
																														surf_tool.add_index(fa11111111111111111___)
																														surf_tool.add_index(fb11111111111111111___)
																														surf_tool.add_index(fc11111111111111111___)
																														
																														surf_tool.add_index(fa111111111111111111___)
																														surf_tool.add_index(fb111111111111111111___)
																														surf_tool.add_index(fc111111111111111111___)
																														
																														surf_tool.add_index(fa111111111111111111___1)
																														surf_tool.add_index(fb111111111111111111___1)
																														surf_tool.add_index(fc111111111111111111___1)
																														
																														surf_tool.add_index(fa111111111111111111___11)
																														surf_tool.add_index(fb111111111111111111___11)
																														surf_tool.add_index(fc111111111111111111___11)
																														
																														surf_tool.add_index(fa111111111111111111___111)
																														surf_tool.add_index(fb111111111111111111___111)
																														surf_tool.add_index(fc111111111111111111___111)
																														
																														surf_tool.add_index(fa111111111111111111___111)
																														surf_tool.add_index(fb111111111111111111___111)
																														surf_tool.add_index(fc111111111111111111___111)
																														
																														surf_tool.add_index(fa111111111111111111___1111)
																														surf_tool.add_index(fb111111111111111111___1111)
																														surf_tool.add_index(fc111111111111111111___1111)
																														
																														surf_tool.add_index(fa111111111111111111___11111)
																														surf_tool.add_index(fb111111111111111111___11111)
																														surf_tool.add_index(fc111111111111111111___11111)
																														
				
				elif vertexCount == int(26):
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
					var fa111111111___=-11
					var fb111111111___=-10
					var fc111111111___=-9
					var fa1111111111___=-12
					var fb1111111111___=-11
					var fc1111111111___=-10
					var fa11111111111___=-13
					var fb11111111111___=-12
					var fc11111111111___=-11
					var fa111111111111___=-14
					var fb111111111111___=-13
					var fc111111111111___=-12
					var fa1111111111111___=-15
					var fb1111111111111___=-14
					var fc1111111111111___=-13
					var fa11111111111111___=-16
					var fb11111111111111___=-15
					var fc11111111111111___=-14
					var fa111111111111111___=-17
					var fb111111111111111___=-16
					var fc111111111111111___=-15
					var fa1111111111111111___=-18
					var fb1111111111111111___=-17
					var fc1111111111111111___=-16
					var fa11111111111111111___=-19
					var fb11111111111111111___=-18
					var fc11111111111111111___=-17
					var fa111111111111111111___=-20
					var fb111111111111111111___=-19
					var fc111111111111111111___=-18
					var fa111111111111111111___1=-21
					var fb111111111111111111___1=-20
					var fc111111111111111111___1=-19
					var fa111111111111111111___11=-22
					var fb111111111111111111___11=-21
					var fc111111111111111111___11=-20
					var fa111111111111111111___111=-23
					var fb111111111111111111___111=-22
					var fc111111111111111111___111=-21
					var fa111111111111111111___1111=-24
					var fb111111111111111111___1111=-23
					var fc111111111111111111___1111=-22
					var fa111111111111111111___11111=-25
					var fb111111111111111111___11111=-24
					var fc111111111111111111___11111=-23
					var fa111111111111111111___111111=-26
					var fb111111111111111111___111111=-25
					var fc111111111111111111___111111=-24
			array_mesh = surf_tool.commit(array_mesh)
		#elif Chunk == int(1112099905):
			#var ActivateALIB = Animation.new()
			#var ALIBSize = file.get_32()
			#break
			
		elif Chunk == int(810832723):
			break
			
	mesh_instance.mesh = array_mesh
	mesh_instance.name = "GSC primary"
	root_node.add_child(mesh_instance)
	mesh_instance.owner = root_node
