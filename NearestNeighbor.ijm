// Kota Miura
// 20180730 The first version
// This macro assumes that there is already measured values for "X" and "Y" in the Results table. 

function returnDistance2D(x1, y1,  x2, y2){
    dist2D = pow( (pow((x1-x2), 2) + pow((y1-y2), 2)  ), 0.5);
    return dist2D;
}

rownum = nResults;
minIDA = newArray(rownum);
minDistA = newArray(rownum);

for (j = 0; j < rownum; j++){
  thisx = getResult("X", j);
  thisy = getResult("Y", j); 
  counter = 0;
  minIndex = 0;
  mindist = 10000000;
  for (i = 0; i < rownum; i++){
    if (i != j){
        thatx = getResult("X", i);
        thaty = getResult("Y", i);
        dist = returnDistance2D(thisx, thisy,  thatx, thaty);
        if (dist < mindist) {
            mindist = dist;
            minIndex = i;
        }
    } 
  }
  minIDA[j] = minIndex;
  minDistA[j] = mindist;
}
for (i = 0; i < rownum; i++) 
    print("dot ", i, " --> dot ", minIDA[i], " (dist = ", minDistA[i]);
