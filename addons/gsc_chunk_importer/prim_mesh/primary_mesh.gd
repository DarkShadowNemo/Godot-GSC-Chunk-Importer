@tool
extends EditorImportPlugin
class_name PRIMARY_MESH_1

var root_node = Node3D.new()


func _primary_mesh_(file : FileAccess, source_file : String):
	file.seek(0)
	
	var faces4=[]
	var faces5=[]
	var faces6=[]
	
	var flgidx = 0
	
	var taridx = 0
	
	var uvscales = 0.0000
	var vcolScales = 0.0000
	
	var vertices : PackedVector3Array
	var faces : PackedVector3Array
	var normals : PackedVector3Array
	var uvs : PackedVector2Array
	
	var immeediate_mesh_ := MeshInstance3D.new()
	
	var array_mesh : ArrayMesh = null
	
	var surf_tool : SurfaceTool
	
	surf_tool = SurfaceTool.new()
	
	
	
	
	while file.get_position() < file.get_length():
		var Chunk = file.get_32()
		if Chunk == int(16777475):
			var unk01 = file.get_8()
			var unk02 = file.get_8()
			var vertexCount = file.get_8()
			var flags1 = file.get_8()
			
			var fa=-1
			var fb=0
			var fc=1
			
			
			
			
			vertices.resize(vertexCount)
			faces.resize(vertexCount)
			normals.resize(vertexCount)
			
			
			surf_tool.begin(Mesh.PRIMITIVE_TRIANGLES)
			
			#var faces = [[0,1,2]]
			
			if flags1 == int(108):
				flgidx+=1
				
				if flgidx <= int(255):
					for j in range(vertexCount):
						#vertices[i] = Vector3(file.get_float(),file.get_float(),file.get_float())
						#var nz = file.get_float()
						var vx = file.get_float()
						var vy = file.get_float()
						var vz = file.get_float()
						var type4 = file.get_8()
						var value1 = file.get_8()
						var normalZ = file.get_16()
						
						surf_tool.add_vertex(Vector3(vx,vy,vz))
						var type5 = type4==0
						fa+=1
						fb+=1
						fc+=1
						if type5:
							faces4=j+j+type4-type4-1+fa-j-j-1
							faces5=j-j+type4-type4+1+fb-2-1
							faces6=j+type4-type4+fc-j+2-4
							var a1=faces4
							var b1=faces5
							var c1=faces6

							surf_tool.add_index(a1)
							surf_tool.add_index(b1)
							surf_tool.add_index(c1)
							surf_tool.add_index(b1)
							surf_tool.add_index(a1)
							surf_tool.add_index(c1)
											
											
						
						
				
				surf_tool.generate_normals(true)
				
			array_mesh = surf_tool.commit(array_mesh)
	
	immeediate_mesh_.mesh = array_mesh
	immeediate_mesh_.name = "gsc"
	root_node.add_child(immeediate_mesh_)
	immeediate_mesh_.owner = root_node
