function acceleration = updateAcceleration(cars, nodes, roads)
  global currentVelocityIndex;
  global maxVelocityIndex;
  global maxDeaccelerationIndex;
  
  %accelerationIntersection = detectIntersection(cars, roads, nodes);
  accelerationCollision = checkCollision(cars);
  accelerationCollisionIntersection = checkCollisionAtIntersection(cars, roads, nodes);
  acceleration = min(accelerationCollisionIntersection, accelerationCollision);
  %tooFastIndices = find(cars((cars(:,currentVelocityIndex) >= cars(:, maxVelocityIndex))));
  %acceleration(tooFastIndices) = -cars(tooFastIndices, maxDeaccelerationIndex);
end