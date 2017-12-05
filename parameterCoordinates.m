function coordinates = parameterCoordinates(cars, nodes, roads)
  global positionIndex
  global roadIndex
  numberOfNodes = size(nodes,positionIndex);
  startingPoints = [nodes(roads(:,positionIndex)), nodes(roads(:,positionIndex) + numberOfNodes)];
  endPoints = [nodes(roads(:,roadIndex)), nodes(roads(:,roadIndex) + numberOfNodes)];
  directionVectors =  endPoints - startingPoints;
  roadLengths = calculateRoadLength(nodes, roads);
  cars(:,roadIndex)
  cars(:,positionIndex)
  coordinates = startingPoints(cars(:,roadIndex),:) + cars(:,positionIndex)./roadLengths(cars(:,roadIndex)) .* directionVectors(cars(:,roadIndex),:);
end
