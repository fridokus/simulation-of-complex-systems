function acceleration = detectIntersection(cars, roads, nodes)
  % 
  global positionIndex;
  global currentVelocityIndex;
  global roadIndex;
  global maxAccelerationIndex;
  global maxDeaccelerationIndex;
  
  nbrOfCars = size(cars, 1); 
  acceleration = zeros(nbrOfCars, 1);
  acceleration(1) = cars(1, maxAccelerationIndex);

  for iCar=1:nbrOfCars
    car = cars(iCar,:);
    position = car(positionIndex);
    velocity = car(currentVelocityIndex);
    maxDeacceleration = car(maxDeaccelerationIndex);
    road = car(roadIndex);
    startNode = roads(road, 1);
    endNode = roads(road, 2);
    lengthOfRoad = norm(nodes(startNode,:) - nodes(endNode,:));
    stopDistance = lengthOfRoad - position - 0.1; % 0.1 since they continue in intersection
    stopTime = - velocity/maxDeacceleration; %makes sure that it doesn't exceed max deacc
    
    maxAcceleration = 2*(stopDistance - (velocity * stopTime))/stopTime^2;
    if maxAcceleration > car(maxAccelerationIndex)
      maxAcceleration =  car(maxAccelerationIndex);
    end
    acceleration(iCar) = maxAcceleration;
  end
    
end


