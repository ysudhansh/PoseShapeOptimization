function keypointLocalizations(seq, frm, id)

data = importdata("result_KP.txt");
tracklets_data = tracklets(seq, frm, id);
for i=1:size(data,1)
    keypoints = reshape(data(i,:), [3 14]);
    keypoints(1,:) = keypoints(1,:) * abs(tracklets_data(i,4) - tracklets_data(i,6))/64;
    keypoints(2,:) = keypoints(2,:) * abs(tracklets_data(i,5) - tracklets_data(i,7))/64;
    keypoints(1:2,:) = keypoints(1:2,:) + [tracklets_data(i,4); tracklets_data(i,5)];
    figure;
    imshow("left_colour_imgs/" + string(tracklets_data(i,1)) + "_" + string(tracklets_data(i,2)) + ".png");
    hold on;
    scatter(keypoints(1,:), keypoints(2,:), 100, "filled");
    pause(2);
%     figure;
%     imshow(string(size(data,1) - i + 1) + ".png");
%     hold on;
%     scatter(keypoints(1,:), keypoints(2,:));
%     pause(1);
end

end