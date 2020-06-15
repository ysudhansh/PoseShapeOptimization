function [new_wireframe, new_def_vectors] = rotateWireframe(seq, frm, id)

K = [721.53,0,609.55;0,721.53,172.85;0,0,1];
[old_wireframe, old_def_vectors] = task2();
tracklets_data = tracklets(seq, frm, id);
ry = tracklets_data(:,8);
phi = rad2deg(ry) + 270 + 10*rand(size(ry));
B = mobili(seq, frm, id);
T = B(:,4:6)';
for i=1:size(phi,1)
%     R = [cos(phi(i)), sin(phi(i)), 0; -sin(phi(i)), cos(phi(i)), 0; 0, 0, 1]';
%     old_wireframe_hc = [old_wireframe; ones(1,size(old_wireframe,2))];
    new_wireframe_hc = K * roty(phi(i)) * rotx(90) * [eye(3), T(:,i)] * old_wireframe_hc;
    new_wireframe = [new_wireframe_hc(1,:) ./ new_wireframe_hc(3,:); new_wireframe_hc(2,:) ./ new_wireframe_hc(3,:)];
    new_def_vectors = zeros(size(old_def_vectors));
    for j = 1:size(old_def_vectors,1)
        in = reshape(old_def_vectors(j,:),3,14);
        out = R * in;
        new_def_vectors(j,:) = reshape(out,size(old_def_vectors(j,:)));
    end
    
    figure;
%     imshow("left_colour_imgs/" + string(tracklets_data(i,1)) + "_" + string(tracklets_data(i,2)) + ".png");
%     hold on;
%     visualizeWireframe3D(wireframe_img);
    visualizeWireframe2D("left_colour_imgs/" + string(tracklets_data(i,1)) + "_" + string(tracklets_data(i,2)) + ".png", new_wireframe);
    pause(2);
end