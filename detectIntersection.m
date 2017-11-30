function acceleration = detectIntersection(cars, roads, nodes)
  global positionIndex;
  %global currentVelocityIndex;
  global roadIndex;
  global maxAccelerationIndex;
  global timeStep;
  
  nbrOfCars = size(cars, 1); 
  acceleration = zeros(nbrOfCars, 1);
  acceleration(1) = cars(1, maxAccelerationIndex);

  for iCar=1:nbrOfCars
    car = cars(iCar,:);
    position = car(positionIndex);
    road = car(roadIndex);
    lengthOfRoad = sqrt(nodes(road,1)^2 + nodes(road, 2)^2);
    stopDistance = lengthOfRoad - position;
    
    maxAcceleration = (2 * stopDistance)/timeStep^2;
    acceleration(iCar) = maxAcceleration;
  end
  
  if sum(acceleration < 0) < 0
    disp(sum(acceleration < 0))
  end
    
end



