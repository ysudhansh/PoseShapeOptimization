function shapeOptimizer(seq, frm, id)

numViews = 1;
numPts = 14;
numObs = 14;
K = [721.53,0,609.55;0,721.53,172.85;0,0,1];
avgCarLength = 3.8600;
avgCarWidth = 1.6362;
avgCarHeight = 1.5208;
B = mobili(seq, frm, id);
carCenters = B(:,4:6);
[wireframe, def_vectors] = approxAlignWireframe(seq, frm, id);
[wireframe_temp, def_vectors_temp, rotation_collection, translation_collection] = poseOptimizer(seq, frm, id);
observation_wts = keypointWeightsShape(seq, frm, id);
[wkps, keypoints_collection] = keypointLocalizations(seq, frm, id);
lambda = [0.250000 0.270000 0.010000 -0.080000 -0.050000];
% wireframe_collection = [];
% def_vectors_collection = [];

for i=1:size(frm,2)
    system("cp ceres/ceres_input_singleViewPoseAdjuster.txt ceres/ceres_input_singleViewShapeAdjuster.txt");
    fileID = fopen("ceres/ceres_input_singleViewShapeAdjuster.txt","a");
%     fprintf(fileID, "%d %d %d\n", [numViews, numPts, numObs]);
%     fprintf(fileID, "%f %f %f\n", [carCenters(i,1), carCenters(i,2), carCenters(i,3)]);
%     fprintf(fileID, "%f %f %f\n", [avgCarHeight, avgCarWidth, avgCarLength]);
%     fprintf(fileID, "%f %f %f %f %f %f %f %f %f\n", reshape(K',[1 9]));
%     fprintf(fileID, "%f %f\n", keypoints_collection(2*i-1:2*i,:));
%     fprintf(fileID, "%f\n", observation_wts(:,i));  
%     fprintf(fileID, "%f %f %f\n", wireframe(3*i-2:3*i,:));
%     for j=1:5
%        fprintf(fileID, "%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f\n", def_vectors(5*(i-1) + j, :)); 
%     end
%     fprintf(fileID, "%f %f %f %f %f\n", lambda);
%     fprintf(fileID, "%f %f %f %f %f %f %f %f %f\n", reshape(rotation_collection(3*i-2:3*i,:)',[1 9]));
%     fprintf(fileID, "%f %f %f\n", rotation_collection(3*i-2:3*i,:)');
    fprintf(fileID, "%f\n", rotation_collection(:,i));
    fprintf(fileID, "%f\n", translation_collection(:,i));
    fclose(fileID);
    commands = "cd ceres; ./singleViewShapeAdjuster; cd -";
    system(commands);
    new_wireframe = importdata("ceres/ceres_output_singleViewShapeAdjuster.txt")';
%     new_wireframe = rot * wireframe(3*i-2:3*i,:) + translation_collection(:,i) + T;
%     wireframe_collection = [wireframe_collection; new_wireframe];
%     old_def_vectors = def_vectors(5*i-4:5*i,:);
%     new_def_vectors = zeros(size(old_def_vectors));
%     for j = 1:size(old_def_vectors,1)
%         in = reshape(old_def_vectors(j,:),3,14);
%         out = 1 * in;
%         new_def_vectors(j,:) = reshape(out,size(old_def_vectors(j,:)));
%     end
%     def_vectors_collection = [def_vectors_collection; new_def_vectors];
    proj_wireframe = K * new_wireframe;
    wireframe_img = [proj_wireframe(1,:) ./ proj_wireframe(3,:); proj_wireframe(2,:) ./ proj_wireframe(3,:)];
    figure;
    visualizeWireframe2D("left_colour_imgs/" + string(B(i,1)) + "_" + string(B(i,2)) + ".png", wireframe_img);
    pause(3);
%     break;
end

end