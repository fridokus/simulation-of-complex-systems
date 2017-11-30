function acceleration = updateAcceleration(cars, nodes, roads)
  global currentVelocityIndex;
  global maxVelocityIndex;
  global maxDeaccelerationIndex;
  
  accelerationCollision = checkCollision(cars);
  accelerationIntersection = detectIntersection(cars, roads, nodes);
  acceleration = min(accelerationCollision, accelerationIntersection);
  tooFastIndices = find(cars((cars(:,currentVelocityIndex) >= cars(:, maxVelocityIndex))));
  acceleration(tooFastIndices) = -cars(tooFastIndices, maxDeaccelerationIndex);
end