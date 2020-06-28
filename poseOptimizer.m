function [wireframe_collection, def_vectors_collection, rotation_collection, translation_collection] = poseOptimizer(seq, frm, id)

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
wireframe_collection = [];
% def_vectors_collection = def_vectors;
def_vectors_collection = [];
rotation_collection = [];
translation_collection = [];
wf_img_collection = [];

for i=1:size(frm,2)
   
    fileID = fopen("ceres/ceres_input_singleViewPoseAdjuster.txt","w");
    fprintf(fileID, "%d %d %d\n", [numViews, numPts, numObs]);
    fprintf(fileID, "%f %f %f\n", [carCenters(i,1), carCenters(i,2), carCenters(i,3)]);
    fprintf(fileID, "%f %f %f\n", [avgCarHeight, avgCarWidth, avgCarLength]);
    fprintf(fileID, "%f %f %f %f %f %f %f %f %f\n", reshape(K',[1 9]));
    fprintf(fileID, "%f %f\n", keypoints_collection(2*i-1:2*i,:));
    fprintf(fileID, "%f\n", observation_wts(:,i));  
    fprintf(fileID, "%f %f %f\n", wireframe(3*i-2:3*i,:));
    for j=1:5
       fprintf(fileID, "%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f\n", def_vectors(5*(i-1) + j, :)); 
    end
    fprintf(fileID, "%f %f %f %f %f\n", lambda);
    fclose(fileID);
    commands = "cd ceres; ./singleViewPoseAdjuster; cd -";
    system(commands);
    data = importdata("ceres/ceres_output_singleViewPoseAdjuster.txt");
    r = data(1:9);
    T = data(10:12);
    R = reshape(r, [3 3]);
    rotation_collection = [rotation_collection, r];
    translation_collection = [translation_collection, T];
    pose_opt_wireframe = (R * wireframe(3*i-2:3*i,:)) + T;
%     system("cp ceres/ceres_input_singleViewPoseAdjuster.txt ceres/ceres_input_singleViewShapeAdjuster.txt");
%     f = fopen("ceres/ceres_input_singleViewShapeAdjuster.txt","a");
%     fprintf(f, "%f\n", r);
%     fprintf(f, "%f\n", T);
%     fclose(f);
%     commands = "cd ceres; ./singleViewShapeAdjuster; cd -";
%     system(commands);
%     shape_opt_wireframe = importdata("ceres/ceres_output_singleViewShapeAdjuster.txt")';
%     wireframe_collection = [wireframe_collection; pose_opt_wireframe];
%     old_def_vectors = def_vectors(5*i-4:5*i,:);
%     new_def_vectors = zeros(size(old_def_vectors));
%     for j = 1:size(old_def_vectors,1)
%         in = reshape(old_def_vectors(j,:),3,14);
%         out = 1 * in;
%         new_def_vectors(j,:) = reshape(out,size(old_def_vectors(j,:)));
%     end
%     def_vectors_collection = [def_vectors_collection; new_def_vectors];
    wireframe_collection = [wireframe_collection; pose_opt_wireframe];
%     proj_wireframe = K * pose_opt_wireframe;
%     pose_opt_wireframe_img = [proj_wireframe(1,:) ./ proj_wireframe(3,:); proj_wireframe(2,:) ./ proj_wireframe(3,:)];
%     proj_wireframe = K * shape_opt_wireframe;
%     shape_opt_wireframe_img = [proj_wireframe(1,:) ./ proj_wireframe(3,:); proj_wireframe(2,:) ./ proj_wireframe(3,:)];
%     figure;
%     subplot(2,1,1);
%     visualizeWireframe2D("left_colour_imgs/" + string(B(i,1)) + "_" + string(B(i,2)) + ".png", pose_opt_wireframe_img);
%     subplot(2,1,2);
%     visualizeWireframe2D("left_colour_imgs/" + string(B(i,1)) + "_" + string(B(i,2)) + ".png", shape_opt_wireframe_img);
%     pause(2);

end

end