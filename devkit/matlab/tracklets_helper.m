function tracklets_op = tracklets_helper(seq, frm, id)

label_dir = "~/rrc/PoseShapeOptimization/training/label_02";
tracklets_op = [];
% size(seq)
for i=1:size(seq,2)
    seq_idx = seq(i);
    frm_idx = frm(i)+1;
    carID = id(i);
%     cd ~/rrc/PoseShapeOptimization/;
%     break;
    global_tracklets_set = readLabels(label_dir, seq_idx);
%     size(global_tracklets_set{frm_idx})
    for j=1:size(global_tracklets_set{frm_idx},2)
        if global_tracklets_set{frm_idx}(j).id == carID
            bbox_x1 = global_tracklets_set{frm_idx}(j).x1;
            bbox_y1 = global_tracklets_set{frm_idx}(j).y1;
            bbox_x2 = global_tracklets_set{frm_idx}(j).x2;
            bbox_y2 = global_tracklets_set{frm_idx}(j).y2;
            ry = global_tracklets_set{frm_idx}(j).ry;
            tracklets_op = [tracklets_op; seq_idx, frm_idx, carID, bbox_x1, bbox_y1, bbox_x2, bbox_y2, ry];
            break
        end
    end
    
end

% pwd
cd ~/rrc/PoseShapeOptimization/;

end