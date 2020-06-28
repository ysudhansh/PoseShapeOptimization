function W = keypointWeightsShape(seq, frm, id)

[w, wkps, wkpl] = keypointWeights(seq, frm, id);
W = 0.3 * wkps + 0.7 * wkpl;

end