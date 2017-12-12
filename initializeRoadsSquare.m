
function roads = initializeRoadsSquare(nodes)
  numberOfNodes = length(nodes);
  sideLength = sqrt(numberOfNodes);
  numberOfRoads = (4*numberOfNodes) - 4*(sideLength - 2) - 8;
  roads = zeros(numberOfRoads, 3);
  k = 1;
  for  i = sideLength:sideLength:sideLength*(sideLength-2)
    for j = 2:sideLength-1
      node = j + i;
      roads(k,:) = [node node-1 30];
      roads(k+1,:) = [node node+1 30];
      roads(k+2,:) = [node node+sideLength 30];
      roads(k+3,:) = [node node-sideLength 30];
      k = k + 4;
    end
  end
  for i = 2:sideLength-1
      node = i;
      roads(k,:) = [node node-1 30];
      roads(k+1,:) = [node node+1 30];
      roads(k+2,:) = [node node+sideLength 30];
      k = k + 3;
  end

  for i = numberOfNodes-sideLength+2:numberOfNodes-1
      node = i;
      roads(k,:) = [node node-1 30];
      roads(k+1,:) = [node node+1 30];
      roads(k+2,:) = [node node-sideLength 30];
      k = k + 3;
  end

  for i = sideLength+1:sideLength:numberOfNodes-sideLength
    node = i;
    roads(k,:) = [node node-sideLength 30];
    roads(k+1,:) = [node node+sideLength 30];
    roads(k+2,:) = [node node+1 30];
    k = k + 3;

  end
  for i = 2*sideLength:sideLength:numberOfNodes-sideLength
    node = i;
    roads(k,:) = [node node-sideLength 30];
    roads(k+1,:) = [node node+sideLength 30];
    roads(k+2,:) = [node node-1 30];
    k = k + 3;
  end

  roads(k,:) = [1 2 30];
  k = k + 1;
  roads(k,:) = [1 sideLength+1 30];
  k = k + 1;
  roads(k,:) = [sideLength sideLength-1 30];
  k = k + 1;
  roads(k,:) = [sideLength 2*sideLength 30];
  k = k + 1;
  roads(k,:) = [numberOfNodes-sideLength+1 numberOfNodes-2*sideLength+1 30];
  k = k + 1;
  roads(k,:) = [numberOfNodes-sideLength+1 numberOfNodes-sideLength+2 30];
  k = k + 1;
  roads(k,:) = [numberOfNodes numberOfNodes-1 30];
  k = k + 1;
  roads(k,:) = [numberOfNodes numberOfNodes-sideLength 30];

end
