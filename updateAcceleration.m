function acceleration = updateAcceleration(cars, nodes, roads)
  global currentVelocityIndex;
  global maxVelocityIndex;
  global maxDeaccelerationIndex;
  acceleration = checkCollision(cars);
  tooFastIndices = find(cars((cars(:,currentVelocityIndex) >= cars(:, maxVelocityIndex))));
  acceleration(tooFastIndices) = -cars(tooFastIndices, maxDeaccelerationIndex);
end