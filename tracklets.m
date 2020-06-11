function tracklets = tracklets(seq, frm, id)

parms = [seq; frm; id];
cd ~/rrc/PoseShapeOptimization/devkit/matlab/;
tracklets = tracklets_helper(parms(1,:), parms(2,:), parms(3,:));

end