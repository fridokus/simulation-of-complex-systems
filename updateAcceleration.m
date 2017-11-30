function acceleration = updateAcceleration(cars, nodes, roads)
  global currentVelocityIndex;
  global maxVelocityIndex;
  global maxDeaccelerationIndex;
  
  accelerationIntersection = detectIntersection(cars, roads, nodes);
  accelerationCollision = checkCollision(cars);
  acceleration = min(accelerationCollision, accelerationIntersection);
  %tooFastIndices = find(cars((cars(:,currentVelocityIndex) >= cars(:, maxVelocityIndex))));
  %acceleration(tooFastIndices) = -cars(tooFastIndices, maxDeaccelerationIndex);
end