function acceleration = updateAcceleration(cars, nodes, roads)
  % Returns the acceleration of each car calculated from the other cars and
  % distance to intersection
  
  global currentVelocityIndex;
  global maxVelocityIndex;
  global maxDeaccelerationIndex;
  
  accelerationCollision = checkCollision(cars, nodes, roads);
  accelerationIntersection = checkCollisionAtIntersection(cars, roads, nodes);
  acceleration = min(accelerationIntersection, accelerationCollision);
  %tooFastIndices = find(cars((cars(:,currentVelocityIndex) >= cars(:, maxVelocityIndex))));
  %acceleration(tooFastIndices) = -cars(tooFastIndices, maxDeaccelerationIndex);
end