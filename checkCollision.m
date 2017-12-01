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
    firstCar = cars(iCar,:);
    secondCar = cars(iCar - 1,:); % second car in front of first car
    secondCarUpcomingPosition = secondCar(positionIndex) + secondCar(currentVelocityIndex) * timeStep;
    
    if firstCar(roadIndex) == secondCar(roadIndex)
      firstCarUpcomingPosition = firstCar(positionIndex) + firstCar(currentVelocityIndex) * timeStep;
      maxAcceleration = 2*(secondCarUpcomingPosition - firstCarUpcomingPosition - safetyDistanceBetweenCars)/timeStep^2;
      if maxAcceleration > secondCar(maxAccelerationIndex)
        maxAcceleration = secondCar(maxAccelerationIndex);
      end
      acceleration(iCar) = maxAcceleration;
%     elseif secondCarUpcomingPosition > roadLengths(secondCar(roadIndex))
%       % Check car in upcoming road if turning
%       iCarsOnUpcomingRoad = find(secondCar(roadIndex) == cars(:,roadIndex));
%       if ~isempty(iCarsOnUpcomingRoad)
%         secondCarUpcomingPosition = secondCarUpcomingPosition - roadLengths(secondCar(roadIndex))
%         firstCar = cars(iCarsOnUpcomingRoad(end),:);
%         firstCarUpcomingPosition = firstCar(positionIndex) + firstCar(currentVelocityIndex) * timeStep;
%         maxAcceleration = 2*(firstCarUpcomingPosition - secondCarUpcomingPosition - safetyDistanceBetweenCars)/timeStep^2;
%         if maxAcceleration > secondCar(maxAccelerationIndex)
%           maxAcceleration = secondCar(maxAccelerationIndex);
%         elseif maxAcceleration < secondCar(maxDeaccelerationIndex)
%           maxAcceleration = secondCar(maxDeaccelerationIndex);
%         end
%         acceleration(iCar) = maxAcceleration;
%       end
%     else 
%       % Check car on next road, even if not close.
%       iCarsOnUpcomingRoad = find(secondCar(roadIndex) == cars(:,roadIndex));
%       if ~isempty(iCarsOnUpcomingRoad)
%         firstCar = cars(iCarsOnUpcomingRoad(end),:);
%         firstCarUpcomingPosition = firstCar(positionIndex) + firstCar(currentVelocityIndex) * timeStep;
%         maxAcceleration = 2*(firstCarUpcomingPosition - (roadLengths(secondCar(roadIndex)) - secondCarUpcomingPosition) - safetyDistanceBetweenCars)/timeStep^2;
%         if maxAcceleration > secondCar(maxAccelerationIndex)
%           maxAcceleration = secondCar(maxAccelerationIndex);
%         elseif maxAcceleration < secondCar(maxDeaccelerationIndex)
%          maxAcceleration = secondCar(maxDeaccelerationIndex);
%         end
%         acceleration(iCar) = maxAcceleration;
%       end
    end
  end
end