function cars = updateCarPositions(cars, nodes, roads, carsAtIntersection)
  global positionIndex;
  global roadIndex;
  global maxVelocityIndex;
  global currentVelocityIndex;
  global maxAccelerationIndex;
  global visionIndex;
  global nextRoadIndex;
  roadLengths = calculateRoadLength(nodes, roads);
  cars(carsAtIntersection, roadIndex) = cars(carsAtIntersection,nextRoadIndex);
  cars(carsAtIntersection, positionIndex) = 0;
  if cars(:,1) < roadLengths(cars(:,2))
    cars(:,positionIndex) = cars(:,positionIndex) + cars(:,currentVelocityIndex);
  end
  
end
