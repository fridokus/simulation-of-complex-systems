function hypotenuse = calculateRoadLength(nodes, roads)
  xLength = nodes(1, 1)-nodes(2, 1);
  ylength = nodes(2, 1)-nodes(2, 2);
  hypotenuse = hypot(xLength, ylength);
end
