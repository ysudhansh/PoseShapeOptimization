function w = keypointWeights(seq, frm, id)

tracklets_data = tracklets(seq, frm, id);
kp_lookup = importdata("kpLookup_azimuth.mat");
kp_lookup = kp_lookup';
ry = tracklets_data(:,size(tracklets_data,2));
azimuth = rad2deg(ry + pi/2);
wkps = keypointLocalizations(seq, frm, id);
wkpl = [];
for i=1:size(azimuth,1)
    if (floor(azimuth(i)) >= 1)
        wkpl = [wkpl, kp_lookup(:,floor(azimuth(i))) ./ sum(kp_lookup(:, floor(azimuth(i))))];
    else
        wkpl = [wkpl, kp_lookup(:,360 + floor(azimuth(i))) ./ sum(kp_lookup(:, 360 + floor(azimuth(i))))];
    end
end

w = 0.3 * wkps + 0.7 * wkpl;

end