function coordinates = parameterCoordinates(cars, nodes, roads)
  numberOfNodes = size(nodes,1);
  startingPoints = [nodes(roads(:,1)), nodes(roads(:,1) + numberOfNodes)];
  endPoints = [nodes(roads(:,2)), nodes(roads(:,2) + numberOfNodes)];
  directionVectors =  endPoints - startingPoints;
  roadLengths = calculateRoadLength(nodes, roads);
  coordinates = startingPoints(cars(:,2),:) + cars(:,1)./roadLengths(cars(:,2)) .* directionVectors(cars(:,2),:);
end
