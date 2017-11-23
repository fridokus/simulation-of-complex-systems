function cars = updateCars(cars, nodes, roads)
  global positionIndex;
  global roadIndex;
  global maxVelocityIndex;
  global currentVelocityIndex;
  global maxAccelerationIndex;
  global maxDeacelerationIndex;
  global visionIndex;
  global nextRoadIndex;

  cars = sortrows(cars, [2 1], 'descend');
  roadLengths = calculateRoadLength(nodes, roads);

  acceleration = updateAcceleration(cars, nodes, roads);
  cars(:, currentVelocityIndex) = updateVelocities(cars, acceleration);
  carsAtIntersection = intersection(cars, roadLengths)
  cars = updateCarPositions(cars, nodes, roads, carsAtIntersection);

end
