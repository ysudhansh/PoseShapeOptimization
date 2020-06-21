function writeToOptimizerInput(seq, frm, id)

numViews = 1;
numPts = 14;
numObs = 14;
K = [721.53,0,609.55;0,721.53,172.85;0,0,1];
avgCarLength = 3.8600;
avgCarWidth = 1.6362;
avgCarHeight = 1.5208;
B = mobili(seq, frm, id);
carCenters = B(:,4:6)';
[wireframe, def_vectors] = approxAlignWireframe(seq, frm, id);
observation_wts = keypointWeights(seq, frm, id);
[wkps, keypoints_collection] = keypointLocalizations(seq, frm, id);
lambda = [0.250000 0.270000 0.010000 -0.080000 -0.050000];

for i=1:size(frm,2)
   
    fileID = fopen("ceres/inputPoseEst.txt","w");
    fprintf(fileID, "%d %d %d\n", [numViews, numPts, numObs]);
    fprintf(fileID, "%f %f %f\n", carCenters(:,i)');
    fprintf(fileID, "%f %f %f\n", [avgCarHeight, avgCarWidth, avgCarLength]);
    fprintf(fileID, "%f %f %f %f %f %f %f %f %f\n", reshape(K',[1 9]));
    fprintf(fileID, "%f %f\n", keypoints_collection(2*i-1:2*i,:)');
    fprintf(fileID, "%f\n", observation_wts(:,i));
    fprintf(fileID, "%f %f %f\n", wireframe(3*i-2:3*i,:)');
    fprintf(fileID, "%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f\n", def_vectors(5*i-4:5*i, :));
    fprintf(fileID, "%f %f %f %f %f\n", lambda);
    fclose(fileID);
    
end

end