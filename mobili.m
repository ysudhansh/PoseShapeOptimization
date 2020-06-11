function B = mobili(seq, frm, id)

K = [721.53,0,609.55;0,721.53,172.85;0,0,1];
avgCarHeight = 1.5208;
h = avgCarHeight;
n = [0; -1; 0];
seq = [ 2,10,  4,  8, 2, 9]; %Sequences
frm = [98, 1,197,126,90,42]; %Frames
id  = [ 1, 0, 20, 12, 1, 1]; %CarID's
[tracklets_data, ground_truth] = tracklets(seq, frm, id);
B = [];
for i=1:size(tracklets_data,1)
    b = [(tracklets_data(i,4) + tracklets_data(i,6))/2; (tracklets_data(i,5) + tracklets_data(i,7))/2; 1];
    op = (-h * inv(K) * b) ./ (n' * inv(K) * b);
    B = [B; tracklets_data(i,1) tracklets_data(i,2) tracklets_data(i,3) op'];
end

abs(ground_truth - B)

end

