function acceleration = checkCollisionAtIntersection(cars, roads, nodes)
  % Adjust the acceleration of cars so that not multiple cars drive into
  % the intersection at once
  
  global roadIndex;
  global currentVelocityIndex;
  global positionIndex;
  global maxAccelerationIndex;
  global maxVelocityInIntersection;
  global timeStep;
  
  nbrOfNodes = size(roads, 1);
  checkedNodes = zeros(1, nbrOfNodes);
  roadLengths = calculateRoadLength(nodes, roads);
  velocities = cars(:,currentVelocityIndex);
  velocities(find(velocities < 0)) = 0.5;
  positions = cars(:,positionIndex);
  
  acceleration = detectIntersection(cars, roads, nodes);
  
  currentNode = 1;
  currentRoads = cars(:,roadIndex);
  while sum(checkedNodes == 0) > 0
    connectingRoads = find(roads(:,2) == currentNode);               %check which roads are connected towards current node 
    carsOnConnectingRoads = ismember(currentRoads, connectingRoads); %check which cars are on the connecting roads
    iCarsOnConnectingRoads = find(carsOnConnectingRoads);            %index of cars that are on the connecting roads
    
    roadIndicesOfCars = cars(iCarsOnConnectingRoads,roadIndex);      % This loop makes sure that only the car closest to the intersection on each road is adjusted
    positionIndicesOfCars = cars(iCarsOnConnectingRoads, positionIndex);
    for i=1:length(connectingRoads)
      connectingRoad = connectingRoads(i);
      carsOnCurrentRoad = find(roadIndicesOfCars == connectingRoad);
      if length(carsOnCurrentRoad) > 1
        [~, index] = max(positionIndicesOfCars(carsOnCurrentRoad));
        carsOnCurrentRoad(index) = [];
        iCarsOnConnectingRoads(carsOnCurrentRoad) = [];
      end
    end
    
    carsOnRoads = cars(iCarsOnConnectingRoads,:);                    %cars on connecting roads
    distanceDifference = roadLengths(carsOnRoads(:,roadIndex)) - positions(iCarsOnConnectingRoads); %distance to intersection for all cars
    iCloseCars = find(distanceDifference < 3);                      % critical if a car is closer than 3m to intersection, should be changed to something else later on
    
    if length(iCloseCars) > 1                                        % if there are more than 1 car going towards the intersection
      distanceDiff = roadLengths(carsOnRoads(iCloseCars,roadIndex)) - positions(iCloseCars);
      timeUntilIntersection = (maxVelocityInIntersection - velocities(iCloseCars))./acceleration(iCloseCars);
      [sortedTime, prioritation] = sort(timeUntilIntersection, 'ascend');
      orderOfCarsToIntersection = iCloseCars(prioritation);          % the index of the order of when the cars will reach the intersection
      nbrOfCloseCars = length(orderOfCarsToIntersection);            % nbr of cars close to intersection that need to adjust their velocity
      time = linspace(sortedTime(1), sortedTime(1)+((nbrOfCloseCars-1) * 2), nbrOfCloseCars)';   %time interval of when the cars should reach the intersection 
      acceleration(orderOfCarsToIntersection) = 2*(distanceDiff - velocities(iCloseCars).*time)./time;  % set acceleration based on time interval
    end
    checkedNodes(currentNode) = 1;
    currentNode = currentNode + 1;
  end
  
  
end