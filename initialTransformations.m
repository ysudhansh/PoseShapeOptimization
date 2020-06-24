function [transformed_coords, transformed_deformation_vectors] = initialTransformations()

[wireframe, deformation_vectors] = scaleWireframe();
% R = [-1 0 0; 0 0 -1; 0 -1 0]'; % World frame (world coordinate system) to camera frame (camera coordinate system)
R = rotz(180) * rotx(-90); % LOL, same as the above one only xD
transformed_coords = R * wireframe;
% visualizeWireframe3D(transformed_coords);

% Rotating deformation vectors
transformed_deformation_vectors = zeros(size(deformation_vectors));
for i = 1:size(deformation_vectors,1)
    in = reshape(deformation_vectors(i,:),3,14);
    out = R * in;
    transformed_deformation_vectors(i,:) = reshape(out,size(deformation_vectors(i,:)));
end

end
