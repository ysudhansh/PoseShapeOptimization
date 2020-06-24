function writeToOptimizerInput(seq, frm, id)

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
observation_wts = keypointWeights(seq, frm, id);
[wkps, keypoints_collection] = keypointLocalizations(seq, frm, id);
lambda = [0.250000 0.270000 0.010000 -0.080000 -0.050000];
[old_wireframe, old_def_vectors] = initialTransformations();

for i=1:size(frm,2)
   
%     fileID = fopen("ceres/ceres_input_singleViewPoseAdjuster.txt","w");
%     fprintf(fileID, "%d %d %d\n", [numViews, numPts, numObs]);
%     fprintf(fileID, "%f %f %f\n", [carCenters(i,1), carCenters(i,2), carCenters(i,3)]);
%     fprintf(fileID, "%f %f %f\n", [avgCarHeight, avgCarWidth, avgCarLength]);
%     fprintf(fileID, "%f %f %f %f %f %f %f %f %f\n", reshape(K',[1 9]));
%     fprintf(fileID, "%f %f\n", keypoints_collection(2*i-1:2*i,:));
% %     for j=1:2
% %         fprintf(fileID, "%f %f\n", keypoints_collection(2*(i-1) + j,:));
% %     end
%     fprintf(fileID, "%f\n", observation_wts(:,i));  
%     fprintf(fileID, "%f %f %f\n", wireframe(3*i-2:3*i,:));
% %     for j=1:3
% %         fprintf(fileID, "%f %f %f\n", wireframe(3*(i-1) + j,:));
% %     end
%     for j=1:5
%        fprintf(fileID, "%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f\n", def_vectors(5*(i-1) + j, :)); 
%     end
%     fprintf(fileID, "%f %f %f %f %f\n", lambda);
%     fclose(fileID);
    commands = "cd ceres; ./singleViewPoseAdjuster; cd -";
    status = system(commands);
    data = importdata("ceres/ceres_output_singleViewPoseAdjuster.txt");
    R = data(1:9);
    T = data(10:12);
    R = reshape(R, [3 3]);
    new_wireframe = (R * old_wireframe) + T;
    proj_wireframe = K * new_wireframe;
    wireframe_img = [proj_wireframe(1,:) ./ proj_wireframe(3,:); proj_wireframe(2,:) ./ proj_wireframe(3,:)];
    figure;
    visualizeWireframe2D("left_colour_imgs/" + string(B(i,1)) + "_" + string(B(i,2)) + ".png", wireframe_img);
    pause(2);
    break;
end

end