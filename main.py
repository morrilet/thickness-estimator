# Verify installation
import open3d as o3d; 
print(o3d.__version__)

# Python API
mesh = o3d.geometry.TriangleMesh.create_sphere(); \
mesh.compute_vertex_normals(); \
o3d.visualization.draw(mesh, raw_mode=True)
