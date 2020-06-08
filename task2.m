function [] = task2()

% Had to translate it as well to the rooftop plane because of how KITTI has
% it done. Saving the resultant image as kitti.png
wireframe = task1();
R = [-1 0 0; 0 0 -1; 0 -1 0];
t = [0.25*(wireframe(1,11) + wireframe(1,12) + wireframe(1,13) + wireframe(1,14)); 0.25*(wireframe(2,11) + wireframe(2,12) + wireframe(2,13) + wireframe(2,14)); 0.25*(wireframe(3,11) + wireframe(3,12) + wireframe(3,13) + wireframe(3,14))];

wireframe_hc = [wireframe; ones(1,14)];
T = [R t];

transformed_coords = T * wireframe_hc;
visualizeWireframe3D(transformed_coords);