function coordinates = parameterCoordinates(cars, nodes, roads)
  startingPoints = nodes(roads(:,1),:);
  endPoints = nodes(roads(:,2),:);

  directionVectors =  endPoints - startingPoints;
  roadLengths = calculateRoadLength(nodes, roads);
 
  coordinates = startingPoints + cars(:,1)./roadLengths(cars(:,2)) .* directionVectors(cars(:,2),:);
end
