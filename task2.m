function [transformed_coords, transformed_deformation_vectors] = task2()

wireframe = task1();
R = [-1 0 0; 0 0 -1; 0 -1 0]'; % World frame (world coordinate system) to camera frame (camera coordinate system)
% R = [1 0 0; 0 0 -1; 0 1 0];
% t = [0.25*(wireframe(1,11) + wireframe(1,12) + wireframe(1,13) + wireframe(1,14)); 0.25*(wireframe(2,11) + wireframe(2,12) + wireframe(2,13) + wireframe(2,14)); 0.25*(wireframe(3,11) + wireframe(3,12) + wireframe(3,13) + wireframe(3,14))];
t = [0; 0; 0];

wireframe_hc = [wireframe; ones(1,14)];
T = [R t];

transformed_coords = T * wireframe_hc;
% visualizeWireframe3D(transformed_coords);

% Rotating deformation vectors
deformation_vectors = importdata("vectors.txt");
transformed_deformation_vectors = zeros(size(deformation_vectors));
for i = 1:size(deformation_vectors,1)
    in = reshape(deformation_vectors(i,:),3,14);
    out = R * in;
    transformed_deformation_vectors(i,:) = reshape(out,size(deformation_vectors(i,:)));
end

end
