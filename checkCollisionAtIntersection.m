function acceleration = checkCollisionAtIntersection(cars, roads, nodes)
  %
  global roadIndex;
  global currentVelocityIndex;
  global positionIndex;
  global maxAccelerationIndex;
  
  nbrOfRoads = size(roads, 1);
  nbrOfNodes = size(roads, 1);
  nbrOfCars = size(cars, 1);
  checkedNodes = zeros(1, nbrOfNodes);
  roadLengths = calculateRoadLength(nodes, roads);
  velocities = cars(:,currentVelocityIndex);
  positions = cars(:,positionIndex);
  maxAccelerations = cars(:,maxAccelerationIndex);
  maxVelocityInIntersection = 5;
  
  timeUntilIntersection = (maxVelocityInIntersection - velocities)./maxAccelerations;
  acceleration = min(maxAccelerations,  
  cars(:,maxAccelerationIndex);
  
  currentNode = 1;
  currentRoads = cars(:,roadIndex);
  while sum(checkedNodes == 0) > 0
    connectingRoads = find(roads(:,2) == currentNode);
    carsOnConnectingRoads = ismember(currentRoads, connectingRoads);
    iCarsOnConnectingRoads = find(carsOnConnectingRoads);

    carsOnRoads = cars(iCarsOnConnectingRoads,:);
    distanceDifference = roadLengths(carsOnRoads(:,roadIndex)) - positions(iCarsOnConnectingRoads);
    iCloseCars = find(distanceDifference < 10);
    if length(iCloseCars) > 1
      disp("Intersection chaos")
      roadLengths(carsOnRoads(iCloseCars,roadIndex));
      distanceDiff = roadLengths(carsOnRoads(iCloseCars,roadIndex)) - positions(iCloseCars);
      timeUntilIntersection = (maxVelocityInIntersection - velocities(iCloseCars))./acceleration(iCloseCars);
      %distanceDiff./velocities(iCloseCars);%remake
      [sortedTime, prioritation] = sort(timeUntilIntersection, 'ascend');
      orderOfCarsToIntersection = iCloseCars(prioritation);
      nbrOfCloseCars = length(orderOfCarsToIntersection);
      time = linspace(sortedTime(1), sortedTime(1)+((nbrOfCloseCars-1) * 2), nbrOfCloseCars)';
      acceleration(orderOfCarsToIntersection) = 2*(distanceDiff - velocities(iCloseCars).*time)./time;
      clc;
    end
    checkedNodes(currentNode) = 1;
    currentNode = currentNode + 1;
  end
  
  
end