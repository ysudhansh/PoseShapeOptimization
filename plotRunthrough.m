function plotRunthrough(seq, frm, id)

data = importdata("result_KP.txt");
tracklets_data = tracklets(seq, frm, id);
K = [721.53,0,609.55;0,721.53,172.85;0,0,1];
approx_aligned_wireframe_collection = approxAlignWireframe(seq, frm, id);
pose_optimized_wireframe_collection = poseOptimizer(seq, frm, id);
shape_optimized_wireframe_collection = shapeOptimizer(seq, frm, id);
reprojection_errors = [];
viewpoint_errors = [];

for i=1:size(data,1)
    keypoints = reshape(data(i,:), [3 14]);
    keypoints(1,:) = keypoints(1,:) * abs(tracklets_data(i,4) - tracklets_data(i,6))/64;
    keypoints(2,:) = keypoints(2,:) * abs(tracklets_data(i,5) - tracklets_data(i,7))/64;
    keypoints(1:2,:) = keypoints(1:2,:) + [tracklets_data(i,4); tracklets_data(i,5)];
    
    approx_aligned_wf = approx_aligned_wireframe_collection(3*i-2:3*i,:);
    approx_proj_wf = K * approx_aligned_wf;
    approx_wf_img = [approx_proj_wf(1,:) ./ approx_proj_wf(3,:); approx_proj_wf(2,:) ./ approx_proj_wf(3,:)];
    length_vec = approx_aligned_wf(:,1) - approx_aligned_wf(:,3);
    approx_azimuth = acos(dot(length_vec, [0;0;1]) / norm(length_vec));
    
    pose_opt_wf = pose_optimized_wireframe_collection(3*i-2:3*i,:);
    pose_opt_proj_wf = K * pose_opt_wf;
    pose_opt_wf_img = [pose_opt_proj_wf(1,:) ./ pose_opt_proj_wf(3,:); pose_opt_proj_wf(2,:) ./ pose_opt_proj_wf(3,:)];
    length_vec = pose_opt_wf(:,1) - pose_opt_wf(:,3);
    pose_azimuth = acos(dot(length_vec, [0;0;1]) / norm(length_vec));
    
    shape_opt_wf = shape_optimized_wireframe_collection(3*i-2:3*i,:);
    shape_opt_proj_wf = K * shape_opt_wf;
    shape_opt_wf_img = [shape_opt_proj_wf(1,:) ./ shape_opt_proj_wf(3,:); shape_opt_proj_wf(2,:) ./ shape_opt_proj_wf(3,:)];
    length_vec = shape_opt_wf(:,1) - shape_opt_wf(:,3);
    shape_azimuth = acos(dot(length_vec, [0;0;1]) / norm(length_vec));

    errors = [sum(sum(abs(approx_wf_img - keypoints(1:2,:)))); sum(sum(abs(pose_opt_wf_img - keypoints(1:2,:)))); sum(sum(abs(shape_opt_wf_img - keypoints(1:2,:))))];
    reprojection_errors = [reprojection_errors, errors];
    
    if tracklets_data(i,8) + pi/2 >= 0
        errors = [approx_azimuth; pose_azimuth; shape_azimuth] - rad2deg(tracklets_data(i,8) + pi/2);
    else
        errors = [approx_azimuth; pose_azimuth; shape_azimuth] - (360 + rad2deg(tracklets_data(i,8) + pi/2));
    end
%     azimuths = [approx_azimuth; pose_azimuth; shape_azimuth]
%     errors = abs([approx_azimuth; pose_azimuth; shape_azimuth] - rad2deg(tracklets_data(i,8) + pi/2))
    viewpoint_errors = [viewpoint_errors, errors];
    
    img = "left_colour_imgs/" + string(tracklets_data(i,1)) + "_" + string(tracklets_data(i,2)) + ".png";
    figure;
    
    subplot(2,2,1); 
    title("Keypoints");
    imshow(img); 
    hold on;
    scatter(keypoints(1,:), keypoints(2,:), 100, "filled");
    
    subplot(2,2,2);
    visualizeWireframe2D(img, approx_wf_img);
    
    subplot(2,2,3);
    visualizeWireframe2D(img, pose_opt_wf_img);
    
    subplot(2,2,4);
    visualizeWireframe2D(img, shape_opt_wf_img);
    
%     pause(2);
    
end

figure;
subplot(2,1,1); 
bar(1:6, reprojection_errors(1,:));
title("Reprojection Errors Before Pose Optimization");
xlabel("Vehicles (seq\_frm\_id)");
ylabel("Error Values");
subplot(2,1,2); 
bar(1:6, viewpoint_errors(1,:));
title("Viewpoint Errors Before Pose Optimization");
xlabel("Vehicles (seq\_frm\_id)");
ylabel("Error Values (in degrees)");

figure;
subplot(2,1,1);
bar(1:6, reprojection_errors(2,:));
title("Reprojection Errors After Pose Optimization");
xlabel("Vehicles (seq\_frm\_id)");
ylabel("Error Values");
subplot(2,1,2); 
bar(1:6, viewpoint_errors(2,:));
title("Viewpoint Errors After Pose Optimization");
xlabel("Vehicles (seq\_frm\_id)");
ylabel("Error Values (in degrees)");

figure;
subplot(2,1,1);
bar(1:6, reprojection_errors(3,:));
title("Reprojection Errors After Shape Optimization");
xlabel("Vehicles (seq\_frm\_id)");
ylabel("Error Values");
subplot(2,1,2); 
bar(1:6, viewpoint_errors(3,:));
title("Viewpoint Errors After Shape Optimization");
xlabel("Vehicles (seq\_frm\_id)");
ylabel("Error Values (in degrees)");

end