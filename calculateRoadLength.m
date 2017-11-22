function hypotenuse = calculateRoadLength(nodes, roads)
  numberOfNodes = size(nodes,1);
  xLength = nodes(roads(:,1)) - nodes(roads(:,2));
  ylength = nodes(roads(:,1) + numberOfNodes) - nodes(roads(:,2) + numberOfNodes);
  hypotenuse = hypot(xLength, ylength);
end
