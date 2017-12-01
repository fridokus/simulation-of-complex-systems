function acceleration = detectIntersection(cars, roads, nodes)
  % Adjusts the acceleration so that the velocity isn't larger than
  % maxVelociyInIntersection when turning.
  
  global positionIndex;
  global currentVelocityIndex;
  global roadIndex;
  global maxAccelerationIndex;
  global maxDeaccelerationIndex;
  global maxVelocityInIntersection;
  
  nbrOfCars = size(cars, 1); 
  acceleration = cars(:,maxAccelerationIndex);
  safetyDistanceToIntersection = 0.0;

  for iCar=1:nbrOfCars
    car = cars(iCar,:);
    position = car(positionIndex);
    velocity = car(currentVelocityIndex);
    maxDeacceleration = car(maxDeaccelerationIndex);
    road = car(roadIndex);
    startNode = roads(road, 1);
    endNode = roads(road, 2);
    lengthOfRoad = norm(nodes(startNode,:) - nodes(endNode,:));
    stopDistance = lengthOfRoad - position - safetyDistanceToIntersection;
    stopTime = (maxVelocityInIntersection - velocity)/maxDeacceleration; %makes sure that it doesn't exceed max deacc
    
    maxAcceleration = 2*(stopDistance - (velocity * stopTime))/stopTime^2;
    if maxAcceleration > car(maxAccelerationIndex)
      maxAcceleration =  car(maxAccelerationIndex);
    elseif maxAcceleration < maxDeacceleration
      maxAcceleration = maxDeacceleration;
    end
    acceleration(iCar) = maxAcceleration;
  end
    
end



