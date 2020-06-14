function new_wireframe = rotateWireframe(seq, frm, id)

old_wireframe = task2();
tracklets_data = tracklets(seq, frm, id);
ry = tracklets_data(:,8);
phi = ry + 3*pi/2;
for i=1:size(phi,1)
    R = [cos(phi(i)), 0, sin(phi(i)); 0 1 0; -sin(phi(i)), 0, cos(phi(i))]';
    new_wireframe = R * old_wireframe;
    figure;
    subplot(1,2,1); visualizeWireframe3D(new_wireframe);
    subplot(1,2,2); imshow("left_colour_imgs/" + string(tracklets_data(i,1)) + "_" + string(tracklets_data(i,2)) + ".png");
    pause(5);
end