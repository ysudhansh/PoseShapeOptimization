function W = keypointWeightsShape(seq, frm, id)

[w, wkps, wkpl] = keypointWeights(seq, frm, id);
W = 0.1 * wkps + 0.9 * wkpl;

end