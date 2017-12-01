function acceleration = checkCollision(cars, nodes, roads)
  % Adjusts the acceleration depending on how fast the car in front drives
  global positionIndex;
  global currentVelocityIndex;
  global roadIndex;
  global maxAccelerationIndex;
  global timeStep;
  global maxDeaccelerationIndex;
  global nextRoadIndex;
  
  nbrOfCars = size(cars, 1);  
  acceleration = cars(:,maxAccelerationIndex);
  roadLengths = calculateRoadLength(nodes, roads);
  safetyDistanceBetweenCars = 6;
  
  for iCar=2:nbrOfCars
    firstCar = cars(iCar,:); % second furthest on road
    secondCar = cars(iCar - 1,:); % furthest on road
    firstCarUpcomingPosition = firstCar(positionIndex) + firstCar(currentVelocityIndex) * timeStep;
    
    if firstCar(roadIndex) == secondCar(roadIndex)
      % adjust acceleration to car in front of you on same road
      secondCarUpcomingPosition = secondCar(positionIndex) + secondCar(currentVelocityIndex) * timeStep;
      maxAcceleration = 2*(secondCarUpcomingPosition - firstCarUpcomingPosition - safetyDistanceBetweenCars)/timeStep^2;
      if maxAcceleration > firstCar(maxAccelerationIndex)
        maxAcceleration = firstCar(maxAccelerationIndex);
      end
      acceleration(iCar) = maxAcceleration;
    else
      % If you're first on you're road
      iCarsOnUpcomingRoad = find(firstCar(nextRoadIndex) == cars(:,roadIndex));
      if ~isempty(iCarsOnUpcomingRoad)
        firstCarUpcomingPosition = roadLengths(firstCar(roadIndex)) - firstCarUpcomingPosition;
        secondCar = cars(iCarsOnUpcomingRoad(end),:);
        secondCarUpcomingPosition = secondCar(positionIndex) + secondCar(currentVelocityIndex) * timeStep;
        maxAcceleration = 2*(firstCarUpcomingPosition + secondCarUpcomingPosition - safetyDistanceBetweenCars)/timeStep^2;
        if maxAcceleration > firstCar(maxAccelerationIndex)
          maxAcceleration = firstCar(maxAccelerationIndex);
%         elseif maxAcceleration < first(maxDeaccelerationIndex)
%           maxAcceleration = first(maxDeaccelerationIndex);
        end
        acceleration(iCar) = maxAcceleration;
     end
    end
  end
end