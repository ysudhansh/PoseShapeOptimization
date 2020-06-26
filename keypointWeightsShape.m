function W = keypointWeightsShape(seq, frm, id)

[w, wkps, wkpl] = keypointWeights(seq, frm, id);
W = 0.7 * wkps + 0.3 * wkpl;

end